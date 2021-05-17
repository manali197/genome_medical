view: preauthorizations_medical_codes {
  sql_table_name: public.preauthorizations_medical_codes ;;

  dimension: medical_code_uuid {
    type: string
    sql: ${TABLE}."medical_code_uuid" ;;
  }

  dimension: preauthorization_id {
    type: number
    sql: ${TABLE}."preauthorization_id" ;;
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
