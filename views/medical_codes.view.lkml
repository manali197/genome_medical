view: medical_codes {
  sql_table_name: public.medical_codes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: code_desc {
    type: string
    sql: ${TABLE}."code_desc" ;;
  }

  dimension: code_name {
    type: string
    sql: ${TABLE}."code_name" ;;
  }

  dimension: code_type {
    type: string
    sql: ${TABLE}."code_type" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, code_name]
  }
}
