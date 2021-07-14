view: survey_result {
  sql_table_name: public.survey_result ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: answers {
    type: string
    sql: ${TABLE}."answers" ;;
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

  dimension: external_user_id {
    type: string
    sql: ${TABLE}."external_user_id" ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}."processed" ;;
  }

  dimension: service_account_id {
    type: number
    sql: ${TABLE}."service_account_id" ;;
  }

  dimension: survey_id {
    type: number
    sql: ${TABLE}."survey_id" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updated_at" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
