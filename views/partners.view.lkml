view: partners {
  sql_table_name: public.partners ;;

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: id {
    type: number
    sql: jsonb_extract_path(${TABLE}.data, 'id')::int ;;
  }

  dimension: name {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'name') ;;
  }

  dimension: display_name {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'display_name') ;;
  }

  dimension: partner_organization_ids {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'partner_organization_ids') ;;
  }

  dimension: referral_channel_id {
    type: number
    sql: jsonb_extract_path(${TABLE}.data, 'referral_channel_id')::int ;;
  }

  dimension: insurance_enabled {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'insurance_enabled')::bool ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}."test" ;;
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
