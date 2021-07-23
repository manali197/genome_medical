view: clinical_operations_orders {
 derived_table: {
    sql:
      WITH cc_all AS (
        SELECT e.encounter_uuid AS encounter_uuid,
          gto.order_uuid AS order_uuid,
          gtoh.user_uuid AS user_uuid,
          rank() over (partition by gto.id order by gtoh.created_at desc) AS pos,
          gto.date_test_ordered AS date_test_ordered
        FROM encounter_details AS e
        LEFT JOIN gene_test_orders AS gto ON e.encounter_uuid = gto.encounter_uuid
        LEFT JOIN gene_test_orders_history AS gtoh ON gto.id=gtoh.gene_test_orders_id
        WHERE e.encounter_type in ('visit', 'cc-intake', 'group-session') AND gtoh.order_status ='sent_to_lab'
      ),
      cc_count AS (
        SELECT cc.encounter_uuid, cc.order_uuid,
          coalesce(nullif(trim(initcap(concat(u.first_name, ' ', u.last_name))), ''), 'Unknown Users') as username,
          cc.date_test_ordered, count(*) AS order_count
        FROM cc_all cc
        LEFT JOIN users u ON cc.user_uuid = u.uuid
        WHERE pos = 1
        GROUP BY cc.encounter_uuid, cc.order_uuid, username, cc.date_test_ordered
      ),
      cc_tracked_encounters AS (SELECT distinct encounter_uuid AS encounter_uuid FROM cc_all),
      orders_with_cc_info AS (
        (SELECT encounter_uuid, order_uuid, username, date_test_ordered, order_count FROM cc_count cc)
        UNION
        (SELECT e.encounter_uuid, gto.order_uuid, 'System' AS username, gto.date_test_ordered, count(*) AS order_count
          FROM encounter_details AS e
          LEFT JOIN gene_test_orders AS gto ON e.encounter_uuid = gto.encounter_uuid
          WHERE
            e.encounter_type in ('visit', 'cc-intake', 'group-session') AND
            e.encounter_uuid not in (select encounter_uuid from cc_tracked_encounters)
          GROUP BY e.encounter_uuid, gto.order_uuid, username, gto.date_test_ordered
        )
      ),
      latest_order_request_change AS (
        SELECT gene_test_orders_id, MIN(created_at) AS created_at
        FROM gene_test_orders_history
        WHERE order_status = 'requested'
        GROUP BY gene_test_orders_id
      ),
      non_null_date_test_ordered AS (
        SELECT
          e.encounter_uuid as encounter_uuid,
          gto.date_test_ordered AS date_test_ordered,
          CASE
            WHEN e.encounter_type = 'cc-intake' THEN lorc.created_at
            ELSE e.initial_cap_completed_date END AS cap_completed_date,
          e.encounter_type AS encounter_type,
          gto.order_uuid AS order_uuid
        FROM encounter_details e
        JOIN gene_test_orders AS gto ON e.encounter_uuid = gto.encounter_uuid
        JOIN latest_order_request_change lorc ON lorc.gene_test_orders_id = gto.id
        WHERE e.encounter_type in ('visit', 'cc-intake', 'group-session') AND gto.date_test_ordered is not null
      )
      SELECT dto.encounter_uuid AS encounter_uuid,
        dto.order_uuid AS order_uuid,
        dto.date_test_ordered AS date_test_ordered,
        dto.cap_completed_date AS cap_completed_date,
        dto.encounter_type AS encounter_type,
        cc.username AS order_sending_agent,
        cc.order_count AS order_count
      FROM non_null_date_test_ordered dto
      LEFT JOIN orders_with_cc_info cc ON dto.encounter_uuid = cc.encounter_uuid AND dto.order_uuid = cc.order_uuid
    ;;
  }

  dimension: order_uuid {
    description: "Order UUID"
    type: string
    primary_key: yes
    sql: ${TABLE}.order_uuid ;;
  }

  dimension: encounter_uuid {
    description: "Encounter UUID"
    type: string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension: encounter_type {
    description: "Encounter type"
    type: string
    sql: ${TABLE}.encounter_type ;;
  }

  dimension: order_sending_agent {
    description: "Order sending agent"
    type: string
    sql: ${TABLE}.order_sending_agent ;;
  }

  dimension: order_count {
    description: "Number of orders sent by agent(s)"
    type: number
    sql: ${TABLE}.order_count ;;
  }

  dimension_group: date_test_ordered {
    description: "Date that test was ordered (UTC)"
    type: time
    drill_fields: [order_sending_agent, encounter_type, encounter_uuid]
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."date_test_ordered" ;;
  }

  dimension_group: cap_completed_date {
    description: "Date that the Result CAP was completed (UTC)"
    type: time
    drill_fields: [order_sending_agent, encounter_type, encounter_uuid]
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."cap_completed_date" ;;
  }

  dimension: order_placement_time {
    type: number
    label: "Test order placement time (in business days) from date visit CAP Completed"
    sql: count_business_days(coalesce(${cap_completed_date_date}, ${date_test_ordered_date}), ${date_test_ordered_date}) ;;
  }

  measure: average_order_placement_time_in_days {
    type: average
    label: "Average test order placement time (in business days) from date visit CAP completed"
    filters: [order_placement_time: ">=0"]
    sql: ${order_placement_time} ;;
    drill_fields: [order_sending_agent, encounter_type, encounter_uuid]
    value_format_name: decimal_2
  }

  measure: count_orders {
    type: sum
    description: "Total number of orders sent by agent(s)"
    drill_fields: [order_sending_agent, encounter_type, encounter_uuid]
    sql: ${order_count} ;;
  }
}
