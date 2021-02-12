view: preauthorizations_history {
  sql_table_name: public.preauthorizations_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: dispatch_reason {
    type: string
    sql: ${TABLE}."dispatch_reason" ;;
  }

  dimension: dispatch_status {
    type: string
    sql: ${TABLE}."dispatch_status" ;;
  }

  dimension: preauthorizations_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."preauthorizations_id" ;;
  }

  dimension: user_uuid {
    type: string
    sql: ${TABLE}."user_uuid" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, preauthorizations.id]
  }
}
