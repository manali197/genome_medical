view: mg_encounters {
  sql_table_name: public.mg_encounters ;;

  dimension: date_of_service {
    type: string
    sql: ${TABLE}."date_of_service" ;;
  }

  dimension: referral_program {
    type: string
    sql: ${TABLE}."referral_program" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  dimension: visit_provider {
    type: string
    sql: ${TABLE}."visit_provider" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
