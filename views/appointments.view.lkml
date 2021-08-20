view: appointments {
  sql_table_name: public.appointments ;;
  drill_fields: [appointment_id]

  dimension: appointment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."appointment_id" ;;
  }

  dimension_group: appointment_created_time_est {
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
    sql: ${TABLE}."appointment_created_time_est" ;;
  }

  dimension_group: appointment_date_est {
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
    sql: ${TABLE}."appointment_date_est" ;;
  }

  dimension: appointment_duration_in_minutes {
    type: number
    sql: ${TABLE}."appointment_duration_in_minutes" ;;
  }

  dimension_group: appointment_end_time_est {
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
    sql: ${TABLE}."appointment_end_time_est" ;;
  }

  dimension_group: appointment_last_modified_time_est {
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
    sql: ${TABLE}."appointment_last_modified_time_est" ;;
  }

  dimension_group: appointment_start_time_est {
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
    sql: ${TABLE}."appointment_start_time_est" ;;
  }

  dimension: appointment_status {
    type: string
    sql: ${TABLE}."appointment_status" ;;
  }

  dimension: consultation_type {
    type: string
    sql: ${TABLE}."consultation_type" ;;
  }

  dimension: duration_between_date_scheduled_and_appointment_in_days {
    type: number
    sql: ${TABLE}."duration_between_date_scheduled_and_appointment_in_days" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: partial_match {
    type: number
    sql: ${TABLE}."partial_match" ;;
  }

  dimension: partner_uuid {
    type: string
    sql: ${TABLE}."partner_uuid" ;;
  }

  dimension: patient_uuid {
    type: string
    sql: ${TABLE}."patient_uuid" ;;
  }

  dimension: provider_uuid {
    type: string
    sql: ${TABLE}."provider_uuid" ;;
  }

  dimension: specialty_requested {
    type: string
    sql: ${TABLE}."specialty_requested" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: success_match {
    type: number
    sql: ${TABLE}."success_match" ;;
  }

  measure: count {
    type: count
    drill_fields: [appointment_id]
  }
}
