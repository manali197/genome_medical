view: document_activity {
  sql_table_name: public.document_activity ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension_group: activity_timestamp {
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
    sql: ${TABLE}."activity_timestamp" ;;
  }

  dimension: activity_type_display_name {
    type: string
    sql: ${TABLE}."activity_type_display_name" ;;
  }

  dimension: activity_type_id {
    type: number
    sql: ${TABLE}."activity_type_id" ;;
  }

  dimension: activity_type_name {
    type: string
    sql: ${TABLE}."activity_type_name" ;;
  }

  dimension: communication_id {
    type: number
    sql: ${TABLE}."communication_id" ;;
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

  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }

  dimension: created_by_patient {
    type: string
    sql: ${TABLE}."created_by_patient" ;;
  }

  dimension_group: delivered {
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
    sql: ${TABLE}."delivered_at" ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}."destination" ;;
  }

  dimension: document_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_id" ;;
  }

  dimension: document_sharing_id {
    type: number
    sql: ${TABLE}."document_sharing_id" ;;
  }

  dimension_group: last_sent {
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
    sql: ${TABLE}."last_sent_at" ;;
  }

  dimension: recipient_id {
    type: number
    sql: ${TABLE}."recipient_id" ;;
  }

  dimension: recipient_type_id {
    type: number
    sql: ${TABLE}."recipient_type_id" ;;
  }

  dimension: recipient_type_name {
    type: string
    sql: ${TABLE}."recipient_type_name" ;;
  }

  dimension: share_medium_display_name {
    type: string
    sql: ${TABLE}."share_medium_display_name" ;;
  }

  dimension: share_medium_id {
    type: number
    sql: ${TABLE}."share_medium_id" ;;
  }

  dimension: share_medium_name {
    type: string
    sql: ${TABLE}."share_medium_name" ;;
  }

  dimension: shared_by {
    type: number
    sql: ${TABLE}."shared_by" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: latest_activity_timestamp {
    sql:  max(coalesce(${activity_timestamp_raw}, ${created_raw})) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      share_medium_display_name,
      recipient_type_name,
      activity_type_name,
      activity_type_display_name,
      share_medium_name,
      documents.document_subtype_display_name,
      documents.id,
      documents.document_type_name,
      documents.document_type_display_name,
      documents.file_name,
      documents.external_storage_type_name,
      documents.external_storage_type_display_name,
      documents.document_state_name,
      documents.document_state_display_name,
      documents.document_subtype_name
    ]
  }
}
