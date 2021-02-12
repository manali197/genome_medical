view: preauthorizations {
  sql_table_name: public.preauthorizations ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: alternate_test_id {
    type: number
    sql: ${TABLE}."alternate_test_id" ;;
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

  dimension_group: dispatch {
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
    sql: ${TABLE}."dispatch_date" ;;
  }

  dimension: dispatch_status {
    type: string
    sql: ${TABLE}."dispatch_status" ;;
  }

  dimension: dispatch_status_reason {
    type: string
    sql: ${TABLE}."dispatch_status_reason" ;;
  }

  dimension: encounter_uuid {
    type: string
    sql: ${TABLE}."encounter_uuid" ;;
  }

  dimension: request_decision {
    type: string
    sql: ${TABLE}."request_decision" ;;
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

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, preauthorizations_history.count]
  }
}
