view: customer_satisfaction {
  derived_table: {
    sql:
    SELECT respondent_id, collector_id,
      date_created,
      date_modified,
      ip_address,
      email_address,
      referral_program,
      last_completed_visit_dos,
      quarter_for_appt,
      latest_visit_provider,
      num_completed_visits,
      has_multiple_visits_different_providers,
      first_name,
      last_name,
      custom_value,
      q180822923,
      q180823390,
      q180826659,
      q180810987,
      q180825910,
      q300495377,
      email, phone, provider_indicated_specialty, vsee_specialty, gc_specialty
      FROM (
        SELECT respondent_id, collector_id, date_created,
          date_modified, ip_address, email_address,
          pes.referral_program, last_completed_visit_dos,
          nullif(concat('Q',extract(Quarter from last_completed_visit_dos),' ',
              extract(year from last_completed_visit_dos)),'Q ')
              as quarter_for_appt,latest_visit_provider,
          num_completed_visits, case when has_multiple_visits_different_providers = true then 'yes'
              else 'no' end as has_multiple_visits_different_providers,
          patient_first_name as first_name, patient_last_name as last_name, custom_value,
          q180822923, q180823390, q180826659, q180810987,
          q180825910, q300495377, email, phone, u2.provider_indicated_specialty,
          u2.vsee_specialty, u2.gc_specialty as gc_specialty,
          row_number() over(partition by email_address order by date_created desc) as row_num
              FROM survey_monkey_export sme
              LEFT JOIN patient_encounter_summary pes on pes.patient_email = sme.email_address
              LEFT JOIN (
                SELECT user_uuid,
                  string_agg(distinct initcap(replace(provider_indicated_specialty,'_',' ')), ',')
                  as provider_indicated_specialty,
                  string_agg(distinct initcap(replace(vsee_specialty,'_',' ')), ',') as vsee_specialty,
                  string_agg(distinct visit_provider, ',') as gc_specialty
                FROM encounter_details
                GROUP BY user_uuid) u2 ON u2.user_uuid = pes.patient_uuid
          WHERE sme.date_modified <= now()) rp
      WHERE rp.row_num = 1
      ORDER BY rp.date_modified desc ;;
  }

  # Define your dimensions and measures here, like this:

  dimension: respondent_id {
    description: "Respondent ID"
    type: string
    sql: ${TABLE}.respondent_id ;;
  }

  dimension: collector_id {
    description: "Collector ID"
    type: string
    sql: ${TABLE}.collector_id ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${respondent_id} || '_' || ${collector_id} ;;
  }

  dimension_group: date_created {
    description: "Date Created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_created" ;;
  }

  dimension_group: date_modified {
    description: "Date Modified"
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."date_modified" ;;
  }

  dimension: ip_address {
    description: "IP Address"
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: email_address {
    description: "Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: referral_program {
    description: "Referral Program"
    type: string
    sql: ${TABLE}.referral_program ;;
  }

  dimension_group: last_completed_visit_dos {
    description: "Latest Completed Visit Date of Service"
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."last_completed_visit_dos" ;;
  }

  dimension: quarter_for_appt {
    description: "Quarter for Appointment"
    type: string
    sql: ${TABLE}.quarter_for_appt ;;
  }

  dimension: latest_visit_provider {
    description: "Latest Visit Provider"
    type: string
    sql: ${TABLE}.latest_visit_provider ;;
  }

  dimension: num_completed_visits {
    description: "# Completed Visits"
    type: number
    sql: ${TABLE}.num_completed_visits ;;
  }

  dimension: has_multiple_visits_different_providers {
    description: "Does patient have >1 completed visit with different provider? "
    type: yesno
    sql: ${TABLE}.has_multiple_visits_different_providers ;;
  }

  dimension: first_name {
    description: "First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    description: "Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: custom_value {
    description: "Custom Response"
    type: string
    sql: ${TABLE}.custom_value ;;
  }

  dimension: q180822923 {
    label: "All of my questions were answered by my genetic counselor."
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q180822923 ;;
  }

  dimension: q180823390 {
    label: "The information I learned from my genetic counseling session was valuable to me."
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q180823390 ;;
  }

  dimension: q180826659 {
    label: "I would recommend my genetic counselor to a friend or family member who needed genetic counseling."
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q180826659 ;;
  }

  dimension: q180810987 {
    label: "How likely is it that you would recommend Genome Medical to a friend or colleague?"
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q180810987 ;;
  }

  dimension: q180810987_numeric {
    label: "How likely is it that you would recommend Genome Medical to a friend or colleague?"
    description: "This is the numeric value"
    type: number
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: CASE
      WHEN ${TABLE}.q180810987 = 'Not at all likely - 0' THEN 0
      ELSE CAST(NULLIF(${TABLE}.q180810987, '') AS INTEGER)
      END ;;
  }

  dimension: q180825910 {
    label: "Additional comments or suggestions for improving our service."
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q180825910 ;;
  }

  dimension: q300495377 {
    label: "Would you be willing to tell others about your experience with Genome Medical?"
    type: string
    drill_fields: [latest_visit_provider, provider_indicated_specialty, referral_program]
    sql: ${TABLE}.q300495377 ;;
  }

  dimension: email {
    description: "Email"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: phone {
    description: "Phone"
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: provider_indicated_specialty {
    description: "Provider Indicated Specialty"
    type: string
    sql: ${TABLE}.provider_indicated_specialty ;;
  }

  dimension: vsee_specialty {
    description: "Vsee Specialty"
    type: string
    sql: ${TABLE}.vsee_specialty ;;
  }

  dimension: gc_specialty {
    description: "GC Specialty"
    type: string
    sql: ${TABLE}.gc_specialty ;;
  }
  # referral_program, last_completed_visit_dos, quarter_for_appt, latest_visit_provider,
  # num_completed_visits, has_multiple_visits_different_providers, first_name, last_name,
  # custom_value, q180822923, q180823390, q180826659, q180810987, q180825910, q300495377,
  # email, phone, provider_indicated_specialty, vsee_specialty, gc_specialty

  measure: count {
    type: count
  }
}
