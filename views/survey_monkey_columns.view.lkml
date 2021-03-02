view: survey_monkey_columns {
  sql_table_name: public.survey_monkey_columns ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}."column_name" ;;
  }

  dimension: column_value {
    type: string
    sql: ${TABLE}."column_value" ;;
  }

  dimension: sub_header_value {
    type: string
    sql: ${TABLE}."sub_header_value" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, column_name]
  }
}
