view: scheduling_slots {
  sql_table_name: public.scheduling_slots ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: provider_uuid {
    type: string
    sql: ${TABLE}."provider_uuid" ;;
  }

  dimension: slot_available {
    type: number
    sql: ${TABLE}."slot_available" ;;
  }

  dimension: slot_booked {
    type: number
    sql: ${TABLE}."slot_booked" ;;
  }

  dimension_group: slot_created_time_est {
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
    sql: ${TABLE}."slot_created_time_est" ;;
  }

  dimension: slot_duration_in_minutes {
    type: number
    sql: ${TABLE}."slot_duration_in_minutes" ;;
  }

  dimension_group: slot_end_time_est {
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
    sql: ${TABLE}."slot_end_time_est" ;;
  }

  dimension: slot_id {
    type: number
    sql: ${TABLE}."slot_id" ;;
  }

  dimension: slot_specialties {
    type: string
    sql: ${TABLE}."slot_specialties" ;;
  }

  dimension_group: slot_start_time_est {
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
    sql: ${TABLE}."slot_start_time_est" ;;
  }

  dimension: slot_states {
    type: string
    sql: ${TABLE}."slot_states" ;;
  }

  dimension: slot_status {
    type: number
    sql: ${TABLE}."slot_status" ;;
  }

  dimension: vsee_room {
    type: string
    sql: ${TABLE}."vsee_room" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
