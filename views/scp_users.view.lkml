view: scp_users {
  sql_table_name: public.scp_users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."created_at" ;;
  }

  dimension: education_survey_session_id {
    type: string
    sql: ${TABLE}."education_survey_session_id" ;;
  }

  dimension: education_survey_tree_id {
    type: string
    sql: ${TABLE}."education_survey_tree_id" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}."modified_at" ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}."partner_id" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension_group: registered {
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
    sql: ${TABLE}."registered_at" ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}."session_id" ;;
  }

  dimension: survey_data {
    type: string
    sql: ${TABLE}."survey_data" ;;
  }

  dimension: tree_id {
    type: string
    sql: ${TABLE}."tree_id" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
