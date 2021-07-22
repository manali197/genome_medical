view: clinical_operations_cc_orders {
 derived_table: {
    sql:
      WITH cc_all AS (
        SELECT e.encounter_uuid AS uuid,
          gtoh.user_uuid AS user_uuid,
          rank() over (partition by gto.id order by gtoh.created_at desc) AS pos,
          gto.date_test_ordered AS date_test_ordered
        FROM encounter_details
        LEFT JOIN gene_test_orders AS gto ON e.encounter_uuid = gto.encounter_uuid
        LEFT JOIN gene_test_orders_history AS gtoh ON gto.id=gtoh.gene_test_orders_id
        WHERE e.encounter_type in ('visit', 'cc-intake', 'group-session') AND gtoh.order_status ='sent_to_lab'
      ),
      cc_count AS (
        SELECT coalesce(nullif(trim(initcap(concat(u.first_name, ' ', u.last_name))), ''), 'Unknown Users') as username,
          date_test_ordered, count(*) AS occurrences
        FROM cc_all cc
        LEFT JOIN users u ON cc.user_uuid = u.uuid
        WHERE pos = 1
        GROUP BY username, date_test_ordered
      ),
      tracked_encounters AS (SELECT distinct uuid FROM cc_all)
      (SELECT username, date_test_ordered, occurrences FROM cc_count cc)
      UNION
      (SELECT 'System' AS username, gto.date_test_ordered, count(*) AS occurrences
        FROM ecnounter_details AS e
        LEFT JOIN gene_test_orders AS gto ON te.encounter_uuid = gto.encounter_uuid
        WHERE
          e.encounter_type in ('visit', 'cc-intake', 'group-session') AND
          e.encounter_uuid not in (select uuid from tracked_encounters)
      )
    ;;
  }

  dimension: username {
    description: "Order sending agent"
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: occurrences {
    description: "Number of orders sent by agent(s)"
    type: number
    sql: ${TABLE}.occurrences ;;
  }

  dimension_group: date_test_ordered {
    description: "Date Test Ordered (UTC)"
    type: time
    drill_fields: [username]
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."date_test_ordered" ;;
  }

  measure: count_orders {
    type: sum
    description: "Total number of orders sent by agent(s)"
    sql: ${occurrences} ;;
  }
}
