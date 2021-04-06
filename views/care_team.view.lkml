view: care_team {
  sql_table_name: public.care_team ;;

  dimension_group: end {
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
    sql: ${TABLE}."end_date" ;;
  }

  dimension: patient_uuid {
    type: string
    sql: ${TABLE}."patient_uuid" ;;
  }

  dimension: provider_role {
    type: string
    sql: ${TABLE}."provider_role" ;;
  }

  dimension: provider_uuid {
    type: string
    sql: ${TABLE}."provider_uuid" ;;
  }

  dimension: receive_all_communications {
    type: yesno
    sql: ${TABLE}."receive_all_communications" ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}."start_date" ;;
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
