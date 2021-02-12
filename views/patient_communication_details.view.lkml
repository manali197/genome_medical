view: patient_communication_details {
  sql_table_name: public.patient_communication_details ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}."category_id" ;;
  }

  dimension: communication_category_display_name {
    type: string
    sql: ${TABLE}."communication_category_display_name" ;;
  }

  dimension: communication_category_name {
    type: string
    sql: ${TABLE}."communication_category_name" ;;
  }

  dimension: communication_id {
    type: number
    sql: ${TABLE}."communication_id" ;;
  }

  dimension: communication_medium_display_name {
    type: string
    sql: ${TABLE}."communication_medium_display_name" ;;
  }

  dimension: communication_medium_name {
    type: string
    sql: ${TABLE}."communication_medium_name" ;;
  }

  dimension: communication_medium_subtype_display_name {
    type: string
    sql: ${TABLE}."communication_medium_subtype_display_name" ;;
  }

  dimension: communication_medium_subtype_name {
    type: string
    sql: ${TABLE}."communication_medium_subtype_name" ;;
  }

  dimension: communication_sender_display_name {
    type: string
    sql: ${TABLE}."communication_sender_display_name" ;;
  }

  dimension: communication_sender_name {
    type: string
    sql: ${TABLE}."communication_sender_name" ;;
  }

  dimension: communication_status_name {
    type: string
    sql: ${TABLE}."communication_status_name" ;;
  }

  dimension: communication_topic_display_name {
    type: string
    sql: ${TABLE}."communication_topic_display_name" ;;
  }

  dimension: communication_topic_name {
    type: string
    sql: ${TABLE}."communication_topic_name" ;;
  }

  dimension: communication_topic_status_name {
    type: string
    sql: ${TABLE}."communication_topic_status_name" ;;
  }

  dimension: communication_type_display_name {
    type: string
    sql: ${TABLE}."communication_type_display_name" ;;
  }

  dimension: communication_type_name {
    type: string
    sql: ${TABLE}."communication_type_name" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."date_time" ;;
  }

  dimension: encounter_uuid {
    type: string
    sql: ${TABLE}."encounter_uuid" ;;
  }

  dimension: external_ticket_id {
    type: number
    sql: ${TABLE}."external_ticket_id" ;;
  }

  dimension: medium_id {
    type: number
    sql: ${TABLE}."medium_id" ;;
  }

  dimension: medium_subtype_id {
    type: number
    sql: ${TABLE}."medium_subtype_id" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: outcome_id {
    type: number
    sql: ${TABLE}."outcome_id" ;;
  }

  dimension: outreach_sequence_id {
    type: number
    sql: ${TABLE}."outreach_sequence_id" ;;
  }

  dimension: patient_uuid {
    type: string
    sql: ${TABLE}."patient_uuid" ;;
  }

  dimension: sender_type_id {
    type: number
    sql: ${TABLE}."sender_type_id" ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}."status_id" ;;
  }

  dimension: topic_id {
    type: number
    sql: ${TABLE}."topic_id" ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}."type_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      communication_topic_status_name,
      communication_medium_name,
      communication_medium_display_name,
      communication_category_name,
      communication_category_display_name,
      communication_sender_name,
      communication_sender_display_name,
      communication_topic_name,
      communication_topic_display_name,
      communication_medium_subtype_name,
      communication_medium_subtype_display_name,
      communication_status_name,
      communication_type_name,
      communication_type_display_name
    ]
  }
}
