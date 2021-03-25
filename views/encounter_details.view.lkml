view: encounter_details {
  sql_table_name: public.encounter_details ;;

  dimension: billing_status {
    type: string
    sql: ${TABLE}."billing_status" ;;
  }

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

  dimension: consultation_type {
    type: string
    sql: ${TABLE}."consultation_type" ;;
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

  dimension: encounter_subtype {
    type: string
    sql: ${TABLE}."encounter_subtype" ;;
  }

  dimension: encounter_type {
    type: string
    sql:
      (CASE
        WHEN ${TABLE}.encounter_type = 'scp' AND ${TABLE}.encounter_subtype = 'partner_initiated/pre_test' THEN 'tro'
        WHEN ${TABLE}.encounter_type = 'scp' AND ${TABLE}.encounter_subtype != 'partner_initiated/pre_test' THEN 'scp'
        ELSE ${TABLE}.encounter_type
      END)
     ;;
  }

  dimension: encounter_uuid {
    primary_key: yes
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

  dimension: insurance_claim_status {
    type: string
    sql: ${TABLE}."insurance_claim_status" ;;
  }

  dimension: lab {
    type: string
    sql: ${TABLE}."lab" ;;
  }

  dimension: multiple_labs {
    type: yesno
    sql: ${TABLE}."multiple_labs" ;;
  }

  dimension: order_request_status {
    type: string
    sql: ${TABLE}."order_request_status" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."order_status" ;;
  }

  dimension: pa_forms_sending_cc {
    type: string
    sql: ${TABLE}."pa_forms_sending_cc" ;;
  }

  dimension: partner_uuid {
    type: string
    sql: ${TABLE}."partner_uuid" ;;
  }

  dimension: payor {
    type: string
    sql: ${TABLE}."payor" ;;
  }

  dimension_group: preauthorization_dispatch {
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

  dimension: preauthorization_dispatch_status {
    type: string
    sql: ${TABLE}."preauthorization_dispatch_status" ;;
  }

  dimension: preauthorization_id {
    type: number
    sql: ${TABLE}."preauthorization_id" ;;
  }

  dimension: provider_indicated_specialty {
    type: string
    sql: ${TABLE}."provider_indicated_specialty" ;;
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

  dimension: state_of_visit {
    type: string
    sql: ${TABLE}."state_of_visit" ;;
  }

  dimension: test_recommended {
    type: string
    sql: ${TABLE}."test_recommended" ;;
  }

  dimension: type_of_test {
    type: string
    sql: ${TABLE}."type_of_test" ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}."units" ;;
  }

  dimension: user_uuid {
    type: string
    sql: ${TABLE}."user_uuid" ;;
  }

  dimension: visit_cap_sending_cc {
    type: string
    sql: ${TABLE}."visit_cap_sending_cc" ;;
  }

  dimension: visit_provider {
    type: string
    sql: ${TABLE}."visit_provider" ;;
  }

  dimension: visit_status {
    type: string
    sql: ${TABLE}."visit_status" ;;
  }

  dimension: vsee_specialty {
    type: string
    sql: ${TABLE}."vsee_specialty" ;;
  }

  dimension: lab_patient_uuid {
    type: string
    sql: ${TABLE}."lab_patient_uuid" ;;
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

  dimension_group: referral_to_scheduling_time {
    type: duration
    label: "Time to Schedule from Referral"
    sql_start:  ${created_raw};;
    sql_end:  ${patient_encounter_summary.original_referral_raw};;
  }

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
  dimension: is_completed_encounter {
    type: yesno
    sql: (${encounter_details.encounter_type} = 'visit' AND ${encounter_details.visit_status} = 'completed') OR
      (${encounter_details.encounter_type} = 'cc-intake' AND ${encounter_details.visit_status} = 'completed') OR
      (${encounter_details.encounter_type} = 'group-session' AND (${encounter_details.visit_status} = 'webinar_attended' OR ${encounter_details.visit_status} = 'webinar_recording_viewed')) OR
      (${encounter_details.encounter_type} = 'research-data') OR
      (${encounter_details.encounter_type} = 'scp') OR
      (${encounter_details.encounter_type} = 'lab_test_authorization' and (${encounter_details.order_request_status} in ('approved', 'rejected')));;
  }

  measure: count {
    type: count
  }

  measure: count_not_null_encounters {
    type: count
    label: "Encounters"
    filters: [created_date: "-NULL"]
    drill_fields: [encounter_type, count_not_null_encounters]
    link: {
      label: "Drill by visit status"
      url: "{{ link }}&fields=encounter_details.visit_status,encounter_details.count_not_null_encounters"
    }
    link: {
      label: "Drill by Referral Program"
      url: "{{ link }}&fields=patient_encounter_summary.referral_program,encounter_details.count_not_null_encounters"
    }
  }

  measure: completed_encounters {
    type: count
    filters: [created_date: "-NULL", is_completed_encounter: "Yes"]
    drill_fields: [encounter_uuid, date_of_service_date, visit_provider, patient_encounter_summary.referral_program]
    link: {
      label: "Break out by Encounter Type"
      url: "{{ link }}&fields=encounter_details.encounter_type,encounter_details.count_not_null_encounters"
    }
  }

  measure: count_not_null_not_blank_visit_caps {
    type: count
    label: "Visit CAP Count"
    filters: [visit_cap_sending_cc: "-EMPTY,-NULL"]
    drill_fields: [visit_cap_sending_cc,count_not_null_not_blank_visit_caps]
  }

  measure: count_not_null_not_blank_result_caps {
    type: count
    label: "Result CAP Count"
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


  measure: average_referral_to_scheduling_time_in_days {
    type: average
    filters: [days_referral_to_scheduling_time: ">=0"]
    sql: ${days_referral_to_scheduling_time} ;;
    drill_fields: [visit_status,average_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }
}
