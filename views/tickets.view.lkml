view: tickets {
  sql_table_name: public.tickets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: comments_data {
    type: string
    sql: ${TABLE}."comments_data" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: ticket_data {
    type: string
    sql: ${TABLE}."ticket_data" ;;
  }

  dimension: ticket_patient_uuids {
    type: string
    sql: ${TABLE}."ticket_patient_uuids" ;;
  }

  dimension: ticket_status_display_name {
    type: string
    sql: ${TABLE}."ticket_status_display_name" ;;
  }

  dimension: ticket_status_id {
    type: number
    sql: ${TABLE}."ticket_status_id" ;;
  }

  dimension: ticket_type_display_name {
    type: string
    sql: ${TABLE}."ticket_type_display_name" ;;
  }

  dimension: ticket_type_id {
    type: number
    sql: ${TABLE}."ticket_type_id" ;;
  }

  dimension: ticket_user_ids {
    type: string
    sql: ${TABLE}."ticket_user_ids" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: webhook_data {
    type: string
    sql: ${TABLE}."webhook_data" ;;
  }

  dimension: zendesk_ticket_id {
    type: number
    sql: ${TABLE}."zendesk_ticket_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ticket_status_display_name, ticket_type_display_name]
  }
}
