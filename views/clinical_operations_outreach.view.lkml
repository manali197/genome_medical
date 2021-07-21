view: clinical_operations_outreach {
  derived_table: {
    sql: WITH outreaches_1 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            pes.created_at AS created_at,
            to_timestamp(outreaches[1]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach1,
            senders[1]::uuid AS sender1
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 1) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      outreaches_2 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[2]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach2,
            senders[2]::uuid AS sender2
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 2) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      outreaches_3 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[3]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach3,
            senders[3]::uuid AS sender3
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 3) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      outreaches_4 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[4]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach4,
            senders[4]::uuid AS sender4
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 4) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      outreaches_5 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[5]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach5,
            senders[5]::uuid AS sender5
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 5) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      outreaches_6 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[6]::text, 'YYYY-MM-DD HH24:MI:SS') AS outreach6,
            senders[6]::uuid AS sender6
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach'
          GROUP BY patient_uuid HAVING count(date_time) >= 6) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      ),
      phone_outreaches_1 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[1]::text, 'YYYY-MM-DD HH24:MI:SS') AS phone_outreach1,
            senders[1]::uuid AS phone_sender1
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach' AND AND communication_medium_subtype_name= 'phone'
          GROUP BY patient_uuid HAVING count(date_time) >= 1) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      )
      phone_outreaches_2 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[2]::text, 'YYYY-MM-DD HH24:MI:SS') AS phone_outreach2,
            senders[2]::uuid AS phone_sender2
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach' AND AND communication_medium_subtype_name= 'phone'
          GROUP BY patient_uuid HAVING count(date_time) >= 2) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      )
      phone_outreaches_3 AS (
        SELECT
            outreachs.patient_uuid AS patient_uuid,
            to_timestamp(outreaches[3]::text, 'YYYY-MM-DD HH24:MI:SS') AS phone_outreach3,
            senders[3]::uuid AS phone_sender3
        FROM (
          SELECT patient_uuid, ARRAY_AGG(date_time order by date_time) AS outreaches,
            ARRAY_AGG(sender_uuid order by date_time) AS senders
          FROM patient_communication_details pcd
          WHERE communication_type_name ='referral_outreach' AND AND communication_medium_subtype_name= 'phone'
          GROUP BY patient_uuid HAVING count(date_time) >= 3) outreachs
        JOIN patient_encounter_summary pes on pes.patient_uuid = outreachs.patient_uuid
        WHERE pes.is_deleted = 'false'
      )
      SELECT outreaches_1.patient_uuid AS patient_uuid,
        outreaches_1.outreach1,
        outreaches_2.outreach2,
        outreaches_3.outreach3,
        outreaches_4.outreach4,
        outreaches_5.outreach5,
        outreaches_6.outreach6,
        outreaches_1.sender1,
        outreaches_2.sender2,
        outreaches_3.sender3,
        outreaches_4.sender4,
        outreaches_5.sender5,
        outreaches_6.sender6,
        CONCAT(u1.first_name, ' ', u1.last_name) AS sender1_name,
        CONCAT(u2.first_name, ' ', u2.last_name) AS sender2_name,
        CONCAT(u3.first_name, ' ', u3.last_name) AS sender3_name,
        CONCAT(u4.first_name, ' ', u4.last_name) AS sender4_name,
        CONCAT(u5.first_name, ' ', u5.last_name) AS sender5_name,
        CONCAT(u6.first_name, ' ', u6.last_name) AS sender6_name,
        phone_outreaches_1.phone_outreach1,
        phone_outreaches_2.phone_outreach2,
        phone_outreaches_3.phone_outreach3
      FROM outreaches_1
      LEFT JOIN outreaches_2 ON outreaches_1.patient_uuid = outreaches_2.patient_uuid
      LEFT JOIN outreaches_3 ON outreaches_2.patient_uuid = outreaches_3.patient_uuid
      LEFT JOIN outreaches_4 ON outreaches_3.patient_uuid = outreaches_4.patient_uuid
      LEFT JOIN outreaches_5 ON outreaches_4.patient_uuid = outreaches_5.patient_uuid
      LEFT JOIN outreaches_6 ON outreaches_5.patient_uuid = outreaches_6.patient_uuid
      LEFT JOIN phone_outreaches_1 ON outreaches_1.patient_uuid = phone_outreaches_1.patient_uuid
      LEFT JOIN phone_outreaches_2 ON phone_outreaches_1.patient_uuid = phone_outreaches_2.patient_uuid
      LEFT JOIN phone_outreaches_3 ON phone_outreaches_2.patient_uuid = phone_outreaches_3.patient_uuid
      LEFT JOIN users u1 ON sender1 = u1.uuid
      LEFT JOIN users u2 ON sender2 = u2.uuid
      LEFT JOIN users u3 ON sender3 = u3.uuid
      LEFT JOIN users u4 ON sender4 = u4.uuid
      LEFT JOIN users u5 ON sender5 = u5.uuid
      LEFT JOIN users u6 ON sender6 = u6.uuid
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

  dimension_group: outreach1 {
    description: "Date of first outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach1" ;;
  }

  dimension_group: outreach2 {
    description: "Date of second outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach2" ;;
  }

  dimension_group: outreach3 {
    description: "Date of third outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach3" ;;
  }

  dimension_group: outreach4 {
    description: "Date of fourth outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach4" ;;
  }

  dimension_group: outreach5 {
    description: "Date of fifth outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach5" ;;
  }

  dimension_group: outreach6 {
    description: "Date of sixth outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."outreach6" ;;
  }

  dimension_group: phone_outreach1 {
    description: "Date of first phone outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."phone_outreach1" ;;
  }

  dimension_group: phone_outreach2 {
    description: "Date of second phone outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."phone_outreach2" ;;
  }

  dimension_group: phone_outreach3 {
    description: "Date of third phone outreach"
    type: time
    timeframes: [raw, time, date, day_of_week, week_of_year, week, month, month_name, quarter, year]
    sql: ${TABLE}."phone_outreach3" ;;
  }

  dimension: outreach_1_2_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${outreach1_date}, ${outreach2_date}) ;;
  }

  dimension: outreach_2_3_time {
    type: number
    label: "Time (in business days) between the second and third outreach"
    sql: count_business_days(${outreach2_date}, ${outreach3_date}) ;;
  }

  dimension: outreach_3_4_time {
    type: number
    label: "Time (in business days) between the third and fourth outreach"
    sql: count_business_days(${outreach3_date}, ${outreach4_date}) ;;
  }

  dimension: outreach_4_5_time {
    type: number
    label: "Time (in business days) between the fourth and fifth outreach"
    sql: count_business_days(${outreach4_date}, ${outreach5_date}) ;;
  }

  dimension: outreach_5_6_time {
    type: number
    label: "Time (in business days) between the fifth and sixth outreach"
    sql: count_business_days(${outreach5_date}, ${outreach6_date}) ;;
  }

  dimension: phone_outreach_0_1_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${created_at_date}, ${phone_outreach1_date}) ;;
  }

  dimension: phone_outreach_1_2_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${phone_outreach1_date}, ${phone_outreach2_date}) ;;
  }

  dimension: phone_outreach_0_2_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${created_at_date}, ${phone_outreach2_date}) ;;
  }

  dimension: phone_outreach_2_3_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${phone_outreach2_date}, ${phone_outreach3_date}) ;;
  }

  dimension: phone_outreach_0_3_time {
    type: number
    label: "Time (in business days) between the first and second outreach"
    sql: count_business_days(${created_at_date}, ${phone_outreach3_date}) ;;
  }

  dimension: sender1 {
    description: "UUID of the agent doing the first outreach"
    type: string
    sql: ${TABLE}.sender1 ;;
  }

  dimension: sender2 {
    description: "UUID of the agent doing the second outreach"
    type: string
    sql: ${TABLE}.sender2 ;;
  }

  dimension: sender3 {
    description: "UUID of the agent doing the third outreach"
    type: string
    sql: ${TABLE}.sender3 ;;
  }

  dimension: sender4 {
    description: "UUID of the agent doing the fourth outreach"
    type: string
    sql: ${TABLE}.sender4 ;;
  }

  dimension: sender5 {
    description: "UUID of the agent doing the fifth outreach"
    type: string
    sql: ${TABLE}.sender5 ;;
  }

  dimension: sender6 {
    description: "UUID of the agent doing the sixth outreach"
    type: string
    sql: ${TABLE}.sender6 ;;
  }

  dimension: sender1_name {
    description: "Name of the agent doing the first outreach"
    type: string
    sql: ${TABLE}.sender1_name ;;
  }

  dimension: sender2_name {
    description: "Name of the agent doing the second outreach"
    type: string
    sql: ${TABLE}.sender2_name ;;
  }

  dimension: sender3_name {
    description: "Name of the agent doing the third outreach"
    type: string
    sql: ${TABLE}.sender3_name ;;
  }

  dimension: sender4_name {
    description: "Name of the agent doing the fourth outreach"
    type: string
    sql: ${TABLE}.sender4_name ;;
  }

  dimension: sender5_name {
    description: "Name of the agent doing the fifth outreach"
    type: string
    sql: ${TABLE}.sender5_name ;;
  }

  dimension: sender6_name {
    description: "Name of the agent doing the sixth outreach"
    type: string
    sql: ${TABLE}.sender6_name ;;
  }

  dimension: sender_name_array {
    description: "Names of the agents doing the outreach"
    type: string
    sql: unnest(array_remove(array[${TABLE}.sender1_name, ${TABLE}.sender2_name, ${TABLE}.sender3_name,
      ${TABLE}.sender4_name, ${TABLE}.sender5_name, ${TABLE}.sender6_name], NULL)) ;;
  }

  dimension: sender_name_dict {
    description: "Names of the agents doing the outreach"
    type: string
    sql: (jsonb_build_object(
      ${TABLE}.sender1_name, 1, coalesce(${TABLE}.sender2_name, ''), 1, coalesce(${TABLE}.sender3_name, ''), 1,
      coalesce(${TABLE}.sender4_name, ''), 1, coalesce(${TABLE}.sender5_name, ''), 1,
      coalesce(${TABLE}.sender6_name, ''), 1) - '' - ' ')::text ;;
  }

  measure: count {
    type: count
  }

  measure: outreach_count {
    type: sum
    sql:  unnest(array_remove(array[${TABLE}.sender1_name, ${TABLE}.sender2_name, ${TABLE}.sender3_name,
      ${TABLE}.sender4_name, ${TABLE}.sender5_name, ${TABLE}.sender6_name], NULL));;
  }

  measure: average_outreach_1_2_time_in_days {
    type: average
    label: "Average time (in days) between first and second outreach"
    filters: [outreach_1_2_time: ">=0", outreach1_date: "-NULL", outreach2_date: "-NULL"]
    sql: ${outreach_1_2_time} ;;
    drill_fields: [patient_uuid, sender1_name, sender2_name, average_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_2_3_time_in_days {
    type: average
    label: "Average time (in days) between second and third outreach"
    filters: [outreach_2_3_time: ">=0", outreach2_date: "-NULL", outreach3_date: "-NULL"]
    sql: ${outreach_2_3_time} ;;
    drill_fields: [patient_uuid, sender2_name, sender3_name, average_outreach_2_3_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_3_4_time_in_days {
    type: average
    label: "Average time (in days) between third and fourth outreach"
    filters: [outreach_3_4_time: ">=0", outreach3_date: "-NULL", outreach4_date: "-NULL"]
    sql: ${outreach_3_4_time} ;;
    drill_fields: [patient_uuid, sender3_name, sender4_name, average_outreach_3_4_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_4_5_time_in_days {
    type: average
    label: "Average time (in days) between fourth and fifth outreach"
    filters: [outreach_4_5_time: ">=0", outreach4_date: "-NULL", outreach5_date: "-NULL"]
    sql: ${outreach_4_5_time} ;;
    drill_fields: [patient_uuid, sender4_name, sender5_name, average_outreach_4_5_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_outreach_5_6_time_in_days {
    type: average
    label: "Average time (in days) between fifth and sixth outreach"
    filters: [outreach_5_6_time: ">=0", outreach5_date: "-NULL", outreach6_date: "-NULL"]
    sql: ${outreach_5_6_time} ;;
    drill_fields: [patient_uuid, sender5_name, sender6_name, average_outreach_5_6_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_phone_outreach_0_1_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and first phone outreach"
    filters: [phone_outreach_0_1_time: ">=0", created_at_date: "-NULL", phone_outreach1_date: "-NULL"]
    sql: ${phone_outreach_0_1_time} ;;
    drill_fields: [patient_uuid, average_phone_outreach_0_1_time_in_days]
    value_format_name: decimal_2
  }


  measure: average_phone_outreach_1_2_time_in_days {
    type: average
    label: "Average time (in days) between first and second phone outreach"
    filters: [phone_outreach_1_2_time: ">=0", phone_outreach1_date: "-NULL", phone_outreach2_date: "-NULL"]
    sql: ${phone_outreach_1_2_time} ;;
    drill_fields: [patient_uuid, average_phone_outreach_1_2_time_in_days]
    value_format_name: decimal_2
  }


  measure: average_phone_outreach_0_2_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and second phone outreach"
    filters: [phone_outreach_0_2_time: ">=0", created_at_date: "-NULL", phone_outreach2_date: "-NULL"]
    sql: ${phone_outreach_0_2_time} ;;
    drill_fields: [patient_uuid, average_phone_outreach_0_2_time_in_days]
    value_format_name: decimal_2
  }


  measure: average_phone_outreach_2_3_time_in_days {
    type: average
    label: "Average time (in days) between second and third phone outreach"
    filters: [phone_outreach_2_3_time: ">=0", phone_outreach2_date: "-NULL", phone_outreach3_date: "-NULL"]
    sql: ${phone_outreach_2_3_time} ;;
    drill_fields: [patient_uuid, average_phone_outreach_2_3_time_in_days]
    value_format_name: decimal_2
  }


  measure: average_phone_outreach_0_3_time_in_days {
    type: average
    label: "Average time (in days) between patient creation and third phone outreach"
    filters: [phone_outreach_0_3_time: ">=0", created_at_date: "-NULL", phone_outreach3_date: "-NULL"]
    sql: ${phone_outreach_0_3_time} ;;
    drill_fields: [patient_uuid, average_phone_outreach_0_3_time_in_days]
    value_format_name: decimal_2
  }
}
