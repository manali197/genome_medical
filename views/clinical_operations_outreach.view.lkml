view: clinical_operations_outreach {
  derived_table: {
    sql:
      WITH outreach_base AS (
        SELECT pcd.patient_uuid AS patient_uuid,
          pcd.date_time AS outreach_date,
          pcd.sender_uuid AS sender_uuid,
          rank() over (partition by pcd.patient_uuid order by pcd.date_time) AS outreach_rank,
          rank() over (partition by pcd.patient_uuid, medium_subtype_id order by pcd.date_time) AS outreach_medium_rank
        FROM patient_communication_details pcd
        WHERE pcd.communication_type_name ='referral_outreach'
      ),
      pcd_base AS (
        SELECT pcd.patient_uuid AS patient_uuid,
          pcd.communication_type_name AS communication_type_name,
          pcd.communication_medium_subtype_name AS outreach_medium,
          pcd.date_time AS outreach_date,
          pcd.sender_uuid AS sender_uuid,
          rank() over (partition by pcd.patient_uuid order by pcd.date_time) AS outreach_rank,
          rank() over (partition by pcd.patient_uuid, medium_subtype_id order by pcd.date_time) AS outreach_medium_rank
        FROM patient_communication_details pcd
        WHERE pcd.communication_type_name ='referral_outreach'
      )
      SELECT pcd.patient_uuid AS patient_uuid,
        pes.created_at AS created_at,
        pcd.outreach_medium AS outreach_medium,
        pcd.outreach_date AS outreach_date,
        o.outreach_date AS next_outreach_date,
        o1.outreach_date AS next_outreach_medium_date,
        pcd.sender_uuid AS sender_uuid,
        CONCAT(u.first_name, ' ', u.last_name) AS sender_name,
        pcd.outreach_rank,
        pcd.outreach_medium_rank,
        o.sender_uuid AS next_sender_uuid,
        CONCAT(u1.first_name, ' ', u1.last_name) AS next_sender_name
      FROM pcd_base AS pcd
      JOIN patient_encounter_summary pes on pes.patient_uuid = pcd.patient_uuid
      LEFT JOIN outreach_base o ON o.patient_uuid = pcd.patient_uuid AND o.outreach_rank = pcd.outreach_rank + 1
      LEFT JOIN outreach_base o1 ON o1.patient_uuid = pcd.patient_uuid AND o1.outreach_medium_rank = pcd.outreach_medium_rank + 1
      LEFT JOIN users u ON pcd.sender_uuid = u.uuid
      LEFT JOIN users u1 ON o.sender_uuid = u.uuid
      WHERE pcd.communication_type_name ='referral_outreach' AND pes.is_deleted = 'false'
    ;;
  }

  dimension: patient_uuid {
    description: "Patient UUID"
    type: string
    primary_key: yes
    sql: ${TABLE}.patient_uuid ;;
  }

  dimension_group: created_at {
    description: "Patient creation date"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: outreach_date {
    description: "Date of outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach_date" ;;
  }

  dimension_group: next_outreach_date {
    description: "Date of next outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."next_outreach_date" ;;
  }

  dimension_group: next_outreach_medium_date {
    description: "Date of next outreach within the same communication medium"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."next_outreach_medium_date" ;;
  }

  dimension: outreach_medium {
    type: string
    label: "Communication medium"
    sql: ${TABLE}.outreach_medium ;;
  }

  dimension: outreach_rank {
    type: string
    label: "Outreach rank"
    sql: ${TABLE}.outreach_rank ;;
  }

  dimension: sender_uuid {
    type: string
    label: "Outreach agent UUID"
    sql: ${TABLE}.sender_uuid ;;
  }

  dimension: sender_name {
    type: string
    label: "Outreach agent name"
    sql: ${TABLE}.sender_name ;;
  }

  dimension: next_sender_uuid {
    type: string
    label: "Next outreach agent UUID"
    sql: ${TABLE}.next_sender_uuid ;;
  }

  dimension: next_sender_name {
    type: string
    label: "Next outreach agent name"
    sql: ${TABLE}.next_sender_name ;;
  }

  dimension: outreach_time {
    type: number
    label: "Time (in business days) between the current and next outreach"
    sql: count_business_days(${outreach_date_date}, ${next_outreach_date_date}) ;;
  }

  dimension: outreach_medium_time {
    type: number
    label: "Time (in business days) between the current and next outreach with the same medium"
    sql: count_business_days(${outreach_date_date}, ${next_outreach_medium_date_date}) ;;
  }

  dimension: creation_outreach_time {
    type: number
    label: "Time (in business days) between the patient creation and current outreach"
    sql: count_business_days(${created_at_date}, ${outreach_date_date}) ;;
  }

  measure: count {
    type: count
  }

  measure: average_outreach_1_2_time_in_days {
    type: average
    label: "Average time (in days) between first and second outreach"
    filters: [outreach_time: ">=0", outreach_date_date: "-NULL", next_outreach_date_date: "-NULL", outreach_rank: "1"]
    sql: ${outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, next_sender_name, outreach_medium, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_2_3_time_in_days {
    type: average
    label: "Average time (in days) between second and third outreach"
    filters: [outreach_time: ">=0", outreach_date_date: "-NULL", next_outreach_date_date: "-NULL", outreach_rank: "2"]
    sql: ${outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, next_sender_name, outreach_medium, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_3_4_time_in_days {
    type: average
    label: "Average time (in days) between third and fourth outreach"
    filters: [outreach_time: ">=0", outreach_date_date: "-NULL", next_outreach_date_date: "-NULL", outreach_rank: "3"]
    sql: ${outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, next_sender_name, outreach_medium, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_4_5_time_in_days {
    type: average
    label: "Average time (in days) between fourth and fifth outreach"
    filters: [outreach_time: ">=0", outreach_date_date: "-NULL", next_outreach_date_date: "-NULL", outreach_rank: "4"]
    sql: ${outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, next_sender_name, outreach_medium, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_5_6_time_in_days {
    type: average
    label: "Average time (in days) between fifth and sixth outreach"
    filters: [outreach_time: ">=0", outreach_date_date: "-NULL", next_outreach_date_date: "-NULL", outreach_rank: "5"]
    sql: ${outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, next_sender_name, outreach_medium, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_0_1_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and first phone outreach"
    filters: [creation_outreach_time: ">=0", outreach_date_date: "-NULL", created_at_date: "-NULL",
      outreach_rank: "1", outreach_medium: "phone"]
    sql: ${creation_outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_1_2_time_in_days {
    type: average
    label: "Average time (in days) between first and second phone outreach"
    filters: [outreach_medium_time: ">=0", outreach_date_date: "-NULL", next_outreach_medium_date_date: "-NULL",
      outreach_rank: "1", outreach_medium: "phone"]
    sql: ${outreach_medium_time} ;;
    drill_fields: [patient_uuid, sender_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_0_2_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and second phone outreach"
    filters: [creation_outreach_time: ">=0", outreach_date_date: "-NULL", created_at_date: "-NULL",
      outreach_rank: "2", outreach_medium: "phone"]
    sql: ${creation_outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_2_3_time_in_days {
    type: average
    label: "Average time (in days) between second and third phone outreach"
    filters: [outreach_medium_time: ">=0", outreach_date_date: "-NULL", next_outreach_medium_date_date: "-NULL",
      outreach_rank: "2", outreach_medium: "phone"]
    sql: ${outreach_medium_time} ;;
    drill_fields: [patient_uuid, sender_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_0_3_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and third phone outreach"
    filters: [creation_outreach_time: ">=0", outreach_date_date: "-NULL", created_at_date: "-NULL",
      outreach_rank: "3", outreach_medium: "phone"]
    sql: ${creation_outreach_time} ;;
    drill_fields: [patient_uuid, sender_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }
}