view: referral_channels {
  sql_table_name: public.referral_channels ;;

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
