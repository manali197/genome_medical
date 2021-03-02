view: clinical_operations {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:
      WITH high_priority_patients AS (
        SELECT DISTINCT
            p.patient_uuid AS puuid
        FROM
            audit_trail at
            JOIN patient_encounter_summary p ON at.data ->> 'object_uuid' = p.patient_uuid::text
        WHERE
            at.data ->> 'object' = 'Patients'
            AND at.data ->> 'service_type' = 'edit'
            AND at.data -> 'changes' -> 'high_priority' ->> 'new_value' = 'true'
            AND at.data -> 'changes' -> 'high_priority' ->> 'old_value' = 'false'
      );
      order_info AS (
        SELECT
          te.encounter_uuid AS encounter_uuid,
          CASE WHEN te.encounter_type ='lab_test_authorization' THEN te.date_received_report ELSE max(gto.date_received_report) END AS date_received_report
        FROM encounter_details as te
        LEFT JOIN gene_test_orders AS gto ON  te.encounter_uuid = gto.encounter_uuid
        WHERE
            te.encounter_type in ('visit', 'group-session', 'cc-intake', 'lab_test_authorization') AND
            te.followup_cap_completed_date is not null AND
            ((te.encounter_type = 'lab_test_authorization' and te.date_received_report IS NOT NULL) OR
              (te.encounter_type != 'lab_test_authorization' and gto.date_received_report IS NOT NULL))
        GROUP BY encounter_uuid
      )
      SELECT
        p.patient_state::text AS patient_state,
        prt.data ->> 'display_name' AS referral_program,
        po.name AS referral_partner,
        rc.data ->> 'name'AS referral_channel,
        ed.encounter_type AS encounter_type,
        ed.encounter_uuid AS encounter_uuid,
        ed.created_at AS created_at,
        ed.date_of_service AS date_of_service,
        ed.initial_visit_summary_sent AS initial_visit_summary_sent,
        ed.initial_cap_completed_date AS initial_cap_completed_date,
        ed.cap_sent_to_patient AS cap_sent_to_patient,
        ed.followup_cap_completed_date AS followup_cap_completed_date,
        ed.user_uuid AS user_uuid,
        ed.date_test_ordered AS date_test_ordered,
        ed.ror_visit_status AS ror_visit_status,
        ed.ror_date_contacted AS ror_date_contacted,
        ed.order_status AS order_status,
        ed.visit_status AS visit_status,
        ed.visit_provider AS visit_provider,
        ed.date_test_recommended AS date_test_recommended,
        ed.test_recommended AS test_recommended,
        oi.date_received_report AS date_received_report,
        CASE WHEN hpp.puuid IS NULL THEN false ELSE true END AS is_high_priority
      FROM encounter_details ed
      LEFT JOIN patient_encounter_summary pes ON ed.user_uuid = pes.patient_uuid
      LEFT JOIN high_priority_patients hpp ON hpp.puuid = ed.user_uuid
      LEFT JOIN order_info oi ON oi.encounter_uuid = ed.uuid
      LEFT JOIN partners AS prt ON final.partner_uuid = prt.uuid
      LEFT JOIN referral_channels AS rc ON prt.data ->> 'referral_channel_id' = rc.data ->> 'id'
      LEFT JOIN
      (
        SELECT p.data->'id' AS "id", array_to_string(array_agg(po.name), ', ') AS "name"
        FROM partners p
        JOIN partner_organizations po ON (p.data->'partner_organization_ids')::jsonb @> po.id::text::jsonb
        GROUP BY p.data->'id'
      ) AS po ON prt.data->'id' = po.id
      WHERE pes.is_deleted = 'false'
      ;;
  }

  # Define your dimensions and measures here, like this:


  dimension: patient_state {
    map_layer_name: us_states
    description: "Patient State"
    type: string
    sql: ${TABLE}.patient_state ;;
  }

  dimension: referral_program {
    description: "Referral Program"
    type: string
    sql: ${TABLE}.referral_program ;;
  }

  dimension: referral_partner {
    description: "Referral Partner"
    type: string
    sql: ${TABLE}.referral_partner ;;
  }

  dimension: referral_channel {
    description: "Referral Channel"
    type: string
    sql: ${TABLE}.referral_channel ;;
  }

  dimension: encounter_type {
    description: "Encounter Type"
    type: string
    sql: ${TABLE}.encounter_type ;;
  }

  dimension: encounter_uuid {
    description: "Encounter UUID"
    type: string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension_group: created_at {
    description: "Encounter Creation Date (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: date_of_service {
    description: "Encounter Date of Service (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_of_service" ;;
  }

  dimension_group: initial_visit_summary_sent {
    description: "Initial Visit Summary Sent Date (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."initial_visit_summary_sent" ;;
  }

  dimension_group: initial_cap_completed_date {
    description: "Initial CAP Completed Date (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."initial_cap_completed_date" ;;
  }

  dimension_group: cap_sent_to_patient {
    description: "CAP Sent to Patient Date (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."cap_sent_to_patient" ;;
  }

  dimension_group: followup_cap_completed_date {
    description: "Followup CAP Completed Date (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."followup_cap_completed_date" ;;
  }

  dimension: user_uuid {
    description: "Patient UUID"
    type: string
    sql: ${TABLE}.user_uuid ;;
  }

  dimension_group: date_test_ordered {
    description: "Date Test Ordered (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_test_ordered" ;;
  }

  dimension: ror_visit_status {
    description: "RoR Visit Status"
    type: string
    sql: ${TABLE}.ror_visit_status ;;
  }

  dimension_group: ror_date_contacted {
    description: "RoR Date Contacted (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."ror_date_contacted" ;;
  }

  dimension_group: date_received_report {
    description: "Date Received Report (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_received_report" ;;
  }

  dimension: order_status {
    description: "Order Status"
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: visit_status {
    description: "Visit Status"
    type: string
    sql: ${TABLE}.visit_status ;;
  }

  dimension: visit_provider {
    description: "Visit Provider"
    type: string
    sql: ${TABLE}.visit_provider ;;
  }

  dimension_group: date_test_recommended {
    description: "Date Test Recommended (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_test_recommended" ;;
  }

  dimension: test_recommended {
    description: "Was Test Recommended"
    type: string
    sql: ${TABLE}.test_recommended ;;
  }

  dimension: visit_completion_time {
    type: number
    label: "Visit CAP completion time (visit encounters) from date of visit"
    sql: count_business_days(${TABLE}.date_of_service, ${TABLE}.initial_cap_completed_date) ;;
  }

  dimension: result_cap_completed_time {
    type: number
    label: "Results CAP completion time from date report was received"
    sql: count_business_days(${TABLE}.date_received_report, ${TABLE}.followup_cap_completed_date) ;;
  }

  dimension: order_request_update_time {
    type: number
    label: "OrderRequest update time"
    sql: count_business_days(${TABLE}.date_of_service, ${TABLE}.date_test_recommended) ;;
  }

  measure: count {
    type: count
  }

  measure: average_visit_completion_time_in_days {
    type: average
    label: "Average visit CAP completion time from date of visit"
    filters: [visit_completion_time: ">=0"]
    sql: ${visit_completion_time} ;;
    drill_fields: [visit_provider, average_visit_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_result_cap_completed_time_in_days {
    type: average
    label: "Average results CAP completion time from date report was received"
    filters: [result_cap_completed_time: ">=0"]
    sql: ${result_cap_completed_time} ;;
    drill_fields: [visit_provider, average_result_cap_completed_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_order_request_update_time_in_days {
    type: average
    label: "Average results CAP completion time from date report was received"
    filters: [order_request_update_time: ">=0"]
    sql: ${order_request_update_time} ;;
    drill_fields: [visit_provider, average_order_request_update_time_in_days]
    value_format_name: decimal_2
  }
}
