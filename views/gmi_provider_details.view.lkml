view: gmi_provider_details {
  sql_table_name: public.gmi_provider_details ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.name, ${TABLE}.effective) ;;
  }

  dimension: clinical_time_percentage {
    type: number
    sql: ${TABLE}."clinical_time_percentage" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: hr_status {
    type: string
    sql: ${TABLE}."hr_status" ;;
  }

  dimension: level {
    type: string
    sql: ${TABLE}."level" ;;
  }

  dimension: manager_name {
    type: string
    sql: ${TABLE}."manager_name" ;;
  }

  dimension: manager_provider_uuid {
    type: string
    sql: ${TABLE}."manager_provider_uuid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: provider_uuid {
    type: string
    sql: ${TABLE}."provider_uuid" ;;
  }

  dimension: total_hours_per_week {
    type: number
    sql: ${TABLE}."total_hours_per_week" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, manager_name]
  }
}
