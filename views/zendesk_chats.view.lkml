view: zendesk_chats {
  sql_table_name: public.zendesk_chats ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: agent_ids {
    type: string
    sql: ${TABLE}."agent_ids" ;;
  }

  dimension: agent_names {
    type: string
    sql: ${TABLE}."agent_names" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}."department_id" ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}."department_name" ;;
  }

  dimension: dropped {
    type: yesno
    sql: ${TABLE}."dropped" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."duration" ;;
  }

  dimension: missed {
    type: yesno
    sql: ${TABLE}."missed" ;;
  }

  dimension: proactive {
    type: yesno
    sql: ${TABLE}."proactive" ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}."rating" ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}."timestamp" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: unread {
    type: yesno
    sql: ${TABLE}."unread" ;;
  }

  dimension_group: update_timestamp {
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
    sql: ${TABLE}."update_timestamp" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, department_name]
  }
}
