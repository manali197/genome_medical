view: gene_test_orders_medical_codes {
  sql_table_name: public.gene_test_orders_medical_codes ;;

  dimension: gene_test_order_id {
    type: number
    sql: ${TABLE}."gene_test_order_id" ;;
  }

  dimension: medical_code_uuid {
    type: string
    sql: ${TABLE}."medical_code_uuid" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
