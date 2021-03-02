view: survey_monkey_export {
  sql_table_name: public.survey_monkey_export ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: collector_id {
    type: string
    sql: ${TABLE}."collector_id" ;;
  }

  dimension: custom_value {
    type: string
    sql: ${TABLE}."custom_value" ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."email_address" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}."ip_address" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: q180810987 {
    type: string
    sql: ${TABLE}."q180810987" ;;
  }

  dimension: q180822923 {
    type: string
    sql: ${TABLE}."q180822923" ;;
  }

  dimension: q180823390 {
    type: string
    sql: ${TABLE}."q180823390" ;;
  }

  dimension: q180825910 {
    type: string
    sql: ${TABLE}."q180825910" ;;
  }

  dimension: q180826659 {
    type: string
    sql: ${TABLE}."q180826659" ;;
  }

  dimension: q300495377 {
    type: string
    sql: ${TABLE}."q300495377" ;;
  }

  dimension: respondent_id {
    type: string
    sql: ${TABLE}."respondent_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, name]
  }
}
