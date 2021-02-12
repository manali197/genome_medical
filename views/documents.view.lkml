view: documents {
  sql_table_name: public.documents ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension_group: accessed {
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
    sql: ${TABLE}."accessed_at" ;;
  }

  dimension: accessed_by {
    type: string
    sql: ${TABLE}."accessed_by" ;;
  }

  dimension: all_partners {
    type: yesno
    sql: ${TABLE}."all_partners" ;;
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

  dimension_group: deleted {
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
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: deleted_by {
    type: string
    sql: ${TABLE}."deleted_by" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: document_state_display_name {
    type: string
    sql: ${TABLE}."document_state_display_name" ;;
  }

  dimension: document_state_id {
    type: number
    sql: ${TABLE}."document_state_id" ;;
  }

  dimension: document_state_name {
    type: string
    sql: ${TABLE}."document_state_name" ;;
  }

  dimension: document_subtype_display_name {
    type: string
    sql: ${TABLE}."document_subtype_display_name" ;;
  }

  dimension: document_subtype_id {
    type: number
    sql: ${TABLE}."document_subtype_id" ;;
  }

  dimension: document_subtype_name {
    type: string
    sql: ${TABLE}."document_subtype_name" ;;
  }

  dimension: document_type_display_name {
    type: string
    sql: ${TABLE}."document_type_display_name" ;;
  }

  dimension: document_type_id {
    type: number
    sql: ${TABLE}."document_type_id" ;;
  }

  dimension: document_type_name {
    type: string
    sql: ${TABLE}."document_type_name" ;;
  }

  dimension: external_storage_type_display_name {
    type: string
    sql: ${TABLE}."external_storage_type_display_name" ;;
  }

  dimension: external_storage_type_id {
    type: number
    sql: ${TABLE}."external_storage_type_id" ;;
  }

  dimension: external_storage_type_name {
    type: string
    sql: ${TABLE}."external_storage_type_name" ;;
  }

  dimension: file_extension {
    type: string
    sql: ${TABLE}."file_extension" ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}."file_name" ;;
  }

  dimension: file_size {
    type: string
    sql: ${TABLE}."file_size" ;;
  }

  dimension: is_blank {
    type: yesno
    sql: ${TABLE}."is_blank" ;;
  }

  dimension: is_editable {
    type: yesno
    sql: ${TABLE}."is_editable" ;;
  }

  dimension: is_new {
    type: yesno
    sql: ${TABLE}."is_new" ;;
  }

  dimension: released_to_pp {
    type: yesno
    sql: ${TABLE}."released_to_pp" ;;
  }

  dimension: released_to_pp_id {
    type: number
    sql: ${TABLE}."released_to_pp_id" ;;
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

  dimension: updated_by {
    type: string
    sql: ${TABLE}."updated_by" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}."version" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      document_subtype_display_name,
      document_type_name,
      document_type_display_name,
      file_name,
      external_storage_type_name,
      external_storage_type_display_name,
      document_state_name,
      document_state_display_name,
      document_subtype_name,
      document_activity.count,
      document_owners.count
    ]
  }
}
