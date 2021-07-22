view: clinical_operations_preauths {
  derived_table: {
    sql:
      WITH cc_all AS (
        SELECT e.encounter_uuid AS encounter_uuid,
            pa.uuid AS uuid,
            coalesce(nullif(trim(initcap(concat(u.first_name, ' ', u.last_name))), ''), 'Unknown Users') as username,
            rank() over (partition by pa.id order by pah.created_at desc) as pos
        FROM encounter_details AS e
        LEFT JOIN preauthorizations AS pa ON pa.encounter_uuid = e.encounter_uuid
        LEFT JOIN preauthorizations_history AS pah ON pa.id = pah.preauthorizations_id
        LEFT JOIN users AS u ON pah.user_uuid = u.uuid
        WHERE e.encounter_type in ('visit', 'cc-intake', 'group-session') AND
          pa.dispatch_status='pa_form_sent' AND
          pah.dispatch_status ='pa_form_sent'
      )
      SELECT pa.uuid AS uuid,
        pa.encounter_uuid AS encounter_uuid,
        pa.dispatch_date dispatch_date,
        string_agg(cc.username, ',') AS pa_sending_cc,
        MIN(pah.created_at) AS date_status_changed_to_awaiting_cc_submission
      FROM encounter_details e
      JOIN preauthorizations AS pa ON e.encounter_uuid = pa.encounter_uuid
      JOIN preauthorizations_history AS pah ON  pah.preauthorizations_id = pa.id
      LEFT JOIN cc_all AS cc ON cc.encounter_uuid = pa.encounter_uuid AND cc.uuid = pa.uuid AND cc.pos = 1
      WHERE e.encounter_type in ('visit', 'cc-intake', 'group-session') AND
        pa.dispatch_status = 'pa_form_sent' AND
        pah.dispatch_status = 'waiting_to_submit' AND pah.dispatch_reason = 'awaiting_cc_submission'
      GROUP BY pa.id, pa.dispatch_date
    ;;
  }

  dimension: uuid {
    description: "Preauthorization UUID"
    type:  string
    primary_key: yes
    sql: ${TABLE}.uuid ;;
  }

  dimension: encounter_uuid {
    description: "Encounter UUID"
    type:  string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension: pa_sending_cc {
    description: "PA form sending agent"
    type:  string
    sql: ${TABLE}.pa_sending_cc ;;
  }

  dimension_group: dispatch_date {
    type: time
    drill_fields: [pa_sending_cc]
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."dispatch_date" ;;
  }

  dimension_group: date_status_changed_to_awaiting_cc_submission {
    type: time
    drill_fields: [pa_sending_cc]
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."date_status_changed_to_awaiting_cc_submission" ;;
  }

  dimension: pa_form_sent_time {
    type: number
    label: "PA form submission time (business days)"
    sql: count_business_days(${date_status_changed_to_awaiting_cc_submission_date}, ${dispatch_date_date}) ;;
  }

  measure: average_pa_form_sent_time_in_days {
    type: average
    label: "Average PA form submission time (business days)"
    filters: [pa_form_sent_time: ">=0"]
    sql: ${pa_form_sent_time} ;;
    drill_fields: [pa_sending_cc, average_pa_form_sent_time_in_days]
    value_format_name: decimal_2
  }

}
