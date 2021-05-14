view: tickets {
  sql_table_name: public.tickets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: comments_data {
    type: string
    sql: ${TABLE}."comments_data" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: ticket_data {
    type: string
    sql: ${TABLE}."ticket_data" ;;
  }

  dimension: ticket_patient_uuids {
    type: string
    sql: ${TABLE}."ticket_patient_uuids" ;;
  }

  dimension: ticket_status_display_name {
    type: string
    description: "The state of the ticket. Allowed values are 'new', 'open', 'pending', 'hold', 'solved', or 'closed'"
    sql: ${TABLE}."ticket_status_display_name" ;;
  }

  dimension: ticket_status_id {
    type: number
    sql: ${TABLE}."ticket_status_id" ;;
  }

  dimension: ticket_type_display_name {
    type: string
    sql: ${TABLE}."ticket_type_display_name" ;;
  }

  dimension: ticket_type_id {
    type: number
    sql: ${TABLE}."ticket_type_id" ;;
  }

  dimension: ticket_user_ids {
    type: string
    sql: ${TABLE}."ticket_user_ids" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
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

  dimension: webhook_data {
    type: string
    sql: ${TABLE}."webhook_data" ;;
  }

  dimension: zendesk_ticket_id {
    type: number
    sql: ${TABLE}."zendesk_ticket_id" ;;
  }

  # Derived dimensions
  # See https://developer.zendesk.com/rest_api/docs/support/tickets

  dimension: raw_subject {
    type: string
    description: "The dynamic content placeholder, if present, or the 'subject' value, if not."
    sql: ${TABLE}."ticket_data"->'ticket'->>'raw_subject' ;;
  }

  dimension: recipient {
    type: string
    description: "The original recipient e-mail address of the ticket"
    sql: ${TABLE}."ticket_data"->'ticket'->>'recipient' ;;
  }

  dimension: satisfaction_rating {
    type: string
    description: "The satisfaction rating of the ticket, if it exists, or the state of satisfaction, 'offered' or 'unoffered'. The value is null for plan types that don't support CSAT"
    sql: ${TABLE}."ticket_data"->'ticket'->>'satisfaction_rating' ;;
  }

  dimension: satisfaction_rating_score {
    type: string
    description: "The satisfaction rating of the ticket, if it exists, or the state of satisfaction, 'offered' or 'unoffered'. The value is null for plan types that don't support CSAT"
    sql: ${TABLE}."ticket_data"->'ticket'->'satisfaction_rating'->>'score' ;;
  }

  dimension: satisfaction_rating_score_reason {
    type: string
    description: "The satisfaction rating of the ticket, if it exists, or the state of satisfaction, 'offered' or 'unoffered'. The value is null for plan types that don't support CSAT"
    sql: ${TABLE}."ticket_data"->'ticket'->'satisfaction_rating'->>'reason' ;;
  }

  dimension: satisfaction_rating_score_comment {
    type: string
    description: "The satisfaction rating of the ticket, if it exists, or the state of satisfaction, 'offered' or 'unoffered'. The value is null for plan types that don't support CSAT"
    sql: ${TABLE}."ticket_data"->'ticket'->'satisfaction_rating'->>'comment' ;;
  }

  dimension: type {
    type: string
    description: "The type of this ticket. Allowed values are 'problem', 'incident', 'question', or 'task'."
    sql: ${TABLE}."ticket_data"->'ticket'->>'type' ;;
  }

  dimension: subject {
    type: string
    description: "The value of the subject field for this ticket"
    sql: ${TABLE}."ticket_data"->'ticket'->>'subject' ;;
  }

  dimension: via_channel {
    type: string
    description: "This tells you how the ticket or event was created. Examples: 'web', 'mobile', 'rule', 'system'"
    sql: ${TABLE}."ticket_data"->'ticket'->'via'->>'channel' ;;
  }

  dimension: via_channel_source_from_name {
    type: string
    description: "This tells you who created a ticket or event"
    sql: ${TABLE}."ticket_data"->'ticket'->'via'->'source'->'from'->>'name' ;;
  }

  dimension: via_channel_source_from_address {
    type: string
    description: "This tells you which address created a ticket or event"
    sql: ${TABLE}."ticket_data"->'ticket'->'via'->'source'->'from'->>'address' ;;
  }

  dimension: url {
    type: string
    description: "The API url of this ticket"
    sql: ${TABLE}."ticket_data"->'ticket'->>'url' ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ticket_status_display_name, ticket_type_display_name]
  }
}
