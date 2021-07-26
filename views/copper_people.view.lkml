view: copper_people {
  sql_table_name: public.copper_people ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}."company_id" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."company_name" ;;
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

  measure: count_of_distinct_company_by_id {
    type: count_distinct
    drill_fields: [company_id]
  }

  measure: count_of_distinct_company_by_name {
    type: count_distinct
    drill_fields: [company_name]
  }
}
