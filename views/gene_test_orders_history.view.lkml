view: gene_test_orders_history {
  sql_table_name: public.gene_test_orders_history ;;
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

  dimension: gene_test_orders_id {
    type: number
    sql: ${TABLE}."gene_test_orders_id" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."order_status" ;;
  }

  dimension: order_status_note {
    type: string
    sql: ${TABLE}."order_status_note" ;;
  }

  dimension: status_reason {
    type: string
    sql: ${TABLE}."status_reason" ;;
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
    drill_fields: [id]
  }
}
