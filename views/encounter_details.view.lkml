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

  # parameter: date_granularity {
  #   type: string
  #   allowed_value: {
  #     value: "month"
  #   }
  #   allowed_value: {
  #     value: "day"
  #   }
  # }

  dimension: dynamic_date_of_service {
    # type: string
    sql:  CASE
              WHEN
                  DATE_PART(
                  'day',
                  {% date_end date_of_service_date  %} -
                  {% date_start date_of_service_date %}
                  ) >90
              THEN ${date_of_service_month}
              WHEN
                  DATE_PART(
                  'day',
                  {% date_end date_of_service_date  %} -
                  {% date_start date_of_service_date %}
                  ) >30
              THEN ${date_of_service_week}

              ELSE cast(${date_of_service_date} as varchar)
              END ;;
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
    label: "Visit CAP Completed Date"
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
    label: "Visit CAP Sent to Patient"
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
    label: "PA Forms"
    group_label: "PA info"
    description: "This is PA forms"
    type: string
    sql: ${TABLE}."pa_forms_sending_cc" ;;
  }

  dimension: preauthorization_dispatch_status {
    group_label: "PA info"
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
    drill_fields: [followup_cap_completed_month, visit_status]
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
    hidden: yes
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
    drill_fields: [initial_cap_completed_month, visit_status]
  }

  dimension: visit_provider {
    type: string
    sql: ${TABLE}."visit_provider" ;;
  }

  dimension: visit_status {
    type: string
    sql: ${TABLE}."visit_status" ;;
  }

  dimension_group: visit_cap_completion_time {
    type: duration
    label: "Time to Complete Visit CAP"
    sql_start:  ${date_of_service_raw};;
    sql_end:  ${initial_cap_completed_raw};;
  }

  dimension_group: result_cap_completion_time {
    type: duration
    label: "Time to Complete Visit CAP"
    sql_start:  ${date_of_service_raw};;
    sql_end:  ${followup_cap_completed_raw};;
  }
  measure: count {
    type: count
  }

  measure: count_not_null_not_blank_visit_caps {
    type: count
    filters: [visit_caps_sending_cc: "-EMPTY,-NULL"]
    drill_fields: [visit_caps_sending_cc,count_not_null_not_blank_visit_caps]
  }

  measure: count_not_null_not_blank_result_caps {
    type: count
    filters: [results_cap_sending_cc: "-EMPTY,-NULL"]
    drill_fields: [results_cap_sending_cc,count_not_null_not_blank_result_caps]
  }

  measure: average_visit_cap_completion_time_in_days {
    type: average
    filters: [days_visit_cap_completion_time: ">=0"]
    sql: ${days_visit_cap_completion_time} ;;
    drill_fields: [visit_provider,average_visit_cap_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_result_cap_completion_time_in_days {
    type: average
    filters: [days_result_cap_completion_time: ">=0"]
    sql: ${days_result_cap_completion_time} ;;
    drill_fields: [results_cap_sending_cc,average_result_cap_completion_time_in_days]
    value_format_name: decimal_2
  }
}
