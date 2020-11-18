view: users {
  sql_table_name: public.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}."is_deleted" ;;
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}."is_system" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}
