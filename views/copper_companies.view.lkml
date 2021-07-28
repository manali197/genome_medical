view: copper_companies {
  sql_table_name: public.copper_companies ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}."date_created" ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}."date_modified" ;;
  }

  dimension: interaction_count {
    type: number
    sql: ${TABLE}."interaction_count" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
