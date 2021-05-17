view: encounter_medical_codes {
  sql_table_name: public.encounter_medical_codes ;;

  dimension: encounter_uuid {
    type: string
    sql: ${TABLE}."encounter_uuid" ;;
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
