view: email_events {
  sql_table_name: public.email_events ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: email_subject {
    type: string
    sql: ${TABLE}."email_subject" ;;
  }

  dimension: event_data {
    type: string
    sql: ${TABLE}."event_data" ;;
  }

  dimension_group: event {
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
    sql: ${TABLE}."event_time" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."event_type" ;;
  }

  dimension: mailgun_event_id {
    type: string
    sql: ${TABLE}."mailgun_event_id" ;;
  }

  dimension: mailgun_message_id {
    type: string
    sql: ${TABLE}."mailgun_message_id" ;;
  }

  dimension: recipient_type_id {
    type: number
    sql: ${TABLE}."recipient_type_id" ;;
  }

  dimension: recipient_type_name {
    type: string
    sql: ${TABLE}."recipient_type_name" ;;
  }

  dimension: recipient_uuid {
    type: string
    sql: ${TABLE}."recipient_uuid" ;;
  }

  dimension: to_email {
    type: string
    sql: ${TABLE}."to_email" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, recipient_type_name]
  }
}
