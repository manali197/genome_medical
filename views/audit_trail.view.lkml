view: audit_trail {
  sql_table_name: public.audit_trail ;;

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}."test" ;;
  }

  dimension: uuid {
    type: string
    primary_key: yes
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
