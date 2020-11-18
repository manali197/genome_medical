view: partners {
  sql_table_name: public.partners ;;

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: id {
    type: number
    sql: json_extract_path(${TABLE}.data, 'id')" ;;
  }

  dimension: name {
    type: string
    sql: json_extract_path(${TABLE}.data, 'name')" ;;
  }

  dimension: display_name {
    type: string
    sql: json_extract_path(${TABLE}.data, 'display_name')" ;;
  }

  dimension: partner_organization_ids {
    type: string
    sql: json_extract_path(${TABLE}.data, 'partner_organization_ids')" ;;
  }

  dimension: insurance_enabled {
    type: yesno
    sql: json_extract_path(${TABLE}.data, 'insurance_enabled')" ;;
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
