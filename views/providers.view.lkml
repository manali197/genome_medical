view: providers {
  sql_table_name: public.providers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}."address" ;;
  }

  dimension: athena_provider_id {
    type: number
    sql: ${TABLE}."athena_provider_id" ;;
  }

  dimension: athena_referring_provider_id {
    type: number
    sql: ${TABLE}."athena_referring_provider_id" ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: is_gmi_provider {
    type: yesno
    sql: ${TABLE}."is_gmi_provider" ;;
  }

  dimension: is_referring_provider {
    type: yesno
    sql: ${TABLE}."is_referring_provider" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}."middle_name" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: npi {
    type: string
    sql: ${TABLE}."npi" ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}."organization_name" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}."phones" ;;
  }

  dimension: preferred_contact_method {
    type: string
    sql: ${TABLE}."preferred_contact_method" ;;
  }

  dimension: referral_program_ids {
    type: string
    sql: ${TABLE}."referral_program_ids" ;;
  }

  dimension: specialties {
    type: string
    sql: ${TABLE}."specialties" ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}."suffix" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  dimension: vsee_provider_id {
    type: string
    sql: ${TABLE}."vsee_provider_id" ;;
  }

  dimension: vsee_room_code {
    type: string
    sql: ${TABLE}."vsee_room_code" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, organization_name, first_name, middle_name, last_name]
  }
}
