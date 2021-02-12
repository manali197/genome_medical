view: document_owners {
  sql_table_name: public.document_owners ;;
  drill_fields: [document_owner_id]

  dimension: document_owner_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."document_owner_id" ;;
  }

  dimension: document_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_id" ;;
  }

  dimension: document_owner_type_id {
    type: number
    sql: ${TABLE}."document_owner_type_id" ;;
  }

  dimension: document_owner_type_name {
    type: string
    sql: ${TABLE}."document_owner_type_name" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      document_owner_id,
      document_owner_type_name,
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
