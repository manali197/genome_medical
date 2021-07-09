view: zendesk_calls {
  sql_table_name: public.zendesk_calls ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: agent_id {
    type: number
    sql: ${TABLE}."agent_id" ;;
  }

  dimension: call_data {
    type: string
    sql: ${TABLE}."call_data" ;;
  }

  dimension: completion_status {
    type: string
    sql: ${TABLE}."completion_status" ;;
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

  dimension: customer_id {
    type: number
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."direction" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."duration" ;;
  }

  dimension: ivr_destination_group_name {
    type: string
    sql: ${TABLE}."ivr_destination_group_name" ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}."ticket_id" ;;
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

  measure: count {
    type: count
    drill_fields: [id, ivr_destination_group_name]
  }
}
