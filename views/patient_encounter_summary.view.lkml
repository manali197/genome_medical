view: patient_encounter_summary {
  sql_table_name: public.patient_encounter_summary ;;

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

  dimension: has_multiple_visits_different_providers {
    type: yesno
    sql: ${TABLE}."has_multiple_visits_different_providers"  ;;
  }

  dimension_group: initial_consent {
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
    sql: ${TABLE}."initial_consent_date" ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}."is_deleted" ;;
  }

  dimension_group: last_completed_visit_dos {
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
    sql: ${TABLE}."last_completed_visit_dos" ;;
  }

  dimension_group: last_consent {
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
    sql: ${TABLE}."last_consent_date" ;;
  }

  dimension: latest_visit_provider {
    type: string
    sql: ${TABLE}."latest_visit_provider" ;;
  }

  dimension: num_completed_visits {
    type: number
    sql: ${TABLE}."num_completed_visits" ;;
  }

  dimension_group: original_referral {
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
    sql: ${TABLE}."original_referral_date" ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}."partner_id" ;;
  }

  dimension_group: patient_dob {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."patient_dob" ;;
  }

  dimension: patient_email {
    type: string
    sql: ${TABLE}."patient_email" ;;
  }

  dimension: patient_first_name {
    type: string
    sql: ${TABLE}."patient_first_name" ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}."patient_id" ;;
  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}."patient_last_name" ;;
  }

  dimension: patient_state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}."patient_state" ;;
  }

  dimension: patient_uuid {
    primary_key: yes
    type: string
    sql: ${TABLE}."patient_uuid" ;;
  }

  dimension: referral_program {
    type: string
    sql: ${TABLE}."referral_program" ;;
    drill_fields: [encounter_details.encounter_type]
  }

  dimension: top_referral_programs {
    type: string
    sql: CASE
              WHEN ${referral_program} IN (${top_referral_programs.referral_program}) THEN ${referral_program}
              ELSE 'Other'
         END;;
  }

  measure: count {
    type: count
    drill_fields: [patient_first_name, patient_last_name]
  }

  measure: count_not_null_patients {
    type: count
    label: "New Patients"
    filters: [created_date: "-NULL"]
    drill_fields: [referral_program, count_not_null_patients]
  }
}
