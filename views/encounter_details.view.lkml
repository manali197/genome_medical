view: encounter_details {
  sql_table_name: public.encounter_details ;;

  dimension_group: cap_sent_to_patient {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."cap_sent_to_patient" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: date_of_service {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date_of_service" ;;
  }

  dimension_group: date_received_report {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date_received_report" ;;
  }

  dimension_group: date_test_ordered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date_test_ordered" ;;
  }

  dimension_group: date_test_recommended {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date_test_recommended" ;;
  }

  dimension: encounter_type {
    type: string
    sql: ${TABLE}."encounter_type" ;;
  }

  dimension: encounter_uuid {
    type: string
    sql: ${TABLE}."encounter_uuid" ;;
  }

  dimension_group: followup_cap_completed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."followup_cap_completed_date" ;;
  }

  dimension_group: initial_cap_completed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."initial_cap_completed_date" ;;
  }

  dimension_group: initial_visit_summary_sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."initial_visit_summary_sent" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."order_status" ;;
  }

  dimension: pa_forms_sending_cc {
    type: string
    sql: ${TABLE}."pa_forms_sending_cc" ;;
  }

  dimension: preauthorization_dispatch_status {
    type: string
    sql: ${TABLE}."preauthorization_dispatch_status" ;;
  }

  dimension_group: preauthorization_dispatch_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."preauthorization_dispatch_date" ;;
  }

  dimension: results_cap_sending_cc {
    type: string
    sql: ${TABLE}."results_cap_sending_cc" ;;
  }

  dimension_group: ror_date_contacted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ror_date_contacted" ;;
  }

  dimension: ror_visit_status {
    type: string
    sql: ${TABLE}."ror_visit_status" ;;
  }

  dimension: test_recommended {
    type: string
    sql: ${TABLE}."test_recommended" ;;
  }

  dimension: user_uuid {
    type: string
    sql: ${TABLE}."user_uuid" ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${user_uuid} || '_' || ${encounter_uuid} ;;
  }

  dimension: visit_caps_sending_cc {
    type: string
    sql: ${TABLE}."visit_caps_sending_cc" ;;
  }

  dimension: visit_provider {
    type: string
    sql: ${TABLE}."visit_provider" ;;
  }

  dimension: visit_status {
    type: string
    sql: ${TABLE}."visit_status" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
