view: completed_encounters {
  # TODOs:
  # 1. add the (lp.data ->> 'uuid')::uuid = c.lab_patient_uuid condition
  derived_table: {
    sql:
      WITH lp AS (
        SELECT
            lab_patients.data ->> 'first_name' AS first_name,
            lab_patients.data ->>  'last_name' AS last_name,
            lab_patients.data ->>  'email' AS patient_email,
            lab_patients.patient_uuid::text AS patient_uuid,
            lab_patients.data ->>  'state' AS patient_state,
            lab_patients.original_referral_date AS original_referral_date,
            e.date_of_service AS date_of_service,
            e.encounter_uuid AS encounter_uuid,
            e.encounter_type AS encounter_type,
            e.encounter_subtype AS encounter_subtype,
            e.consultation_type AS consultation_type,
            e.vsee_specialty AS vsee_specialty,
            e.provider_indicated_specialty AS provider_indicated_specialty,
            e.payor AS payor,
            e.units AS units,
            e.partner_uuid AS partner_uuid,
            e.visit_provider AS visit_provider,
            e.created_at AS created_at
        FROM encounter_details AS e
        LEFT JOIN (
          SELECT json_array_elements(lab_patients) AS data,
            patient_uuid AS patient_uuid,
            is_deleted AS is_deleted,
            original_referral_date AS original_referral_date
          FROM patient_encounter_summary
        ) AS lab_patients ON (lab_patients.data ->> 'uuid')::uuid = e.lab_patient_uuid
        WHERE e.encounter_type = 'lab_test_authorization' AND
        (e.order_request_status in ('approved', 'rejected')) AND
        (lab_patients.is_deleted is NULL OR lab_patients.is_deleted = false)
      ),
      nlp AS (
        SELECT
            p.patient_first_name AS first_name,
            p.patient_last_name AS last_name,
            p.patient_email AS patient_email,
            p.patient_uuid::text AS patient_uuid,
            p.patient_state::text AS patient_state,
            p.original_referral_date AS original_referral_date,
            e.date_of_service AS date_of_service,
            e.encounter_uuid AS encounter_uuid,
            CASE
              WHEN e.encounter_type = 'scp' AND e.encounter_subtype = 'partner_initiated/pre_test' THEN 'tro'
              WHEN e.encounter_type = 'scp' AND e.encounter_subtype != 'partner_initiated/pre_test' THEN 'scp'
              ELSE e.encounter_type
            END AS encounter_type,
            e.encounter_subtype AS encounter_subtype,
            e.consultation_type AS consultation_type,
            e.vsee_specialty AS vsee_specialty,
            e.provider_indicated_specialty AS provider_indicated_specialty,
            e.payor AS payor,
            e.units AS units,
            e.partner_uuid AS partner_uuid,
            e.visit_provider AS visit_provider,
            e.created_at AS created_at
        FROM encounter_details AS e
        JOIN patient_encounter_summary AS p ON p.patient_uuid = e.user_uuid
        WHERE
            ((e.encounter_type = 'visit' and e.visit_status = 'completed') OR
            (e.encounter_type = 'cc-intake' and e.visit_status = 'completed') OR
            (e.encounter_type = 'group-session' and (e.visit_status in ('webinar_attended', 'webinar_recording_viewed'))) OR
            (e.encounter_type = 'research-data') OR
            (e.encounter_type = 'scp')) AND
            (p.is_deleted is NULL OR p.is_deleted = false)
      ),
      mgr AS (
        SELECT
            to_date(m.date_of_service, 'YYYY-MM-DD HH24:MI:SS'),
            'N/A' AS patient_name,
            'N/A'  AS patient_email,
            NULL AS patient_state,
            NULL::timestamp AS original_referral_date,
            m.referral_program AS referral_program,
            'N/A' AS referral_partner,
            'Health Systems' AS referral_channel,
            m.uuid AS encounter_uuid,
            'medical-geneticist' AS encounter_type,
            'N/A' AS encounter_subtype,
            'N/A' AS consultation_type,
            'N/A' AS payor,
            (NULL)::int AS units,
            'N/A' AS requested_specialty,
            'N/A' AS provider_indicated_specialty,
            m.visit_provider AS visit_provider,
            true AS is_first_completed_encounter
        FROM mg_encounters AS m
    ),
    final AS (
      SELECT * FROM lp
      UNION
      SELECT * FROM nlp
    ),
    first_encounters AS (
      SELECT encounter_uuid,
       rank() over (PARTITION BY patient_uuid ORDER BY date_of_service asc, created_at asc) AS position
      FROM final
    ),
    final_from_db AS (
      SELECT
          final.date_of_service AS date_of_service,
          initcap(concat(final.first_name, ' ', final.last_name)) AS patient_name,
          final.patient_email AS patient_email,
          final.patient_state AS patient_state,
          final.original_referral_date AS original_referral_date,
          prt.data ->> 'display_name' AS referral_program,
          po.name AS referral_partner,
          rc.data ->> 'name'AS referral_channel,
          final.encounter_uuid AS encounter_uuid,
          final.encounter_type AS encounter_type,
          final.encounter_subtype AS encounter_subtype,
          final.consultation_type AS consultation_type,
          final.payor AS payor,
          final.units AS units,
          INITCAP(REPLACE(final.vsee_specialty, '_', ' ')) AS requested_specialty,
          INITCAP(REPLACE(final.provider_indicated_specialty, '_', ' ')) AS provider_indicated_specialty,
          INITCAP(REPLACE(final.visit_provider, '_', ' ')) AS visit_provider,
          CASE WHEN fe.encounter_uuid IS NULL THEN false ELSE true END AS is_first_completed_encounter
      FROM final
      LEFT JOIN first_encounters fe ON fe.encounter_uuid = final.encounter_uuid AND fe.position = 1
      LEFT JOIN partners AS prt ON final.partner_uuid = prt.uuid
      LEFT JOIN referral_channels AS rc ON prt.data ->> 'referral_channel_id' = rc.data ->> 'id'
      LEFT JOIN
      (
        SELECT p.data->'id' AS "id", array_to_string(array_agg(po.name), ', ') AS "name"
        FROM partners p
        JOIN partner_organizations po ON (p.data->'partner_organization_ids')::jsonb @> po.id::text::jsonb
        GROUP BY p.data->'id'
      ) AS po ON prt.data->'id' = po.id
      WHERE NOT (patient_email ILIKE '%+%test%@%') AND
      NOT (prt.data ->> 'display_name' IN ('TEST T', 'Specialty Care Pathways Demo (will be deleted)'))
    )
    SELECT * FROM final_from_db
    UNION ALL
    SELECT* FROM mgr ;;
  }

  # Dimensions (as of 2021-02-16):
  #   date_of_service, patient_name, patient_email,
  #   referral_program, referral_partner, referral_channel,
  #   encounter_uuid, encounter_type, encounter_subtype, consultation_type,
  #   payor, units, requested_specialty, provider_indicated_specialty
  dimension_group: date_of_service {
    description: "Encounter Date of Service (UTC)"
    type: time
    drill_fields: [encounter_type, referral_program]
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
    sql: ${TABLE}."date_of_service" ;;
  }

  dimension_group: current {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_year,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: CURRENT_TIMESTAMP ;;
  }

  dimension: is_before_mtd {
    # hidden: yes
    type: yesno
    sql:
    (EXTRACT(DAY FROM ${TABLE}."date_of_service") < EXTRACT(DAY FROM CURRENT_TIMESTAMP))
    OR
    (EXTRACT(DAY FROM ${TABLE}."date_of_service") = EXTRACT(DAY FROM CURRENT_TIMESTAMP) AND
    EXTRACT(HOUR FROM ${TABLE}."date_of_service") < EXTRACT(HOUR FROM CURRENT_TIMESTAMP))
    OR
    (EXTRACT(DAY FROM ${TABLE}."date_of_service") = EXTRACT(DAY FROM CURRENT_TIMESTAMP) AND
    EXTRACT(HOUR FROM ${TABLE}."date_of_service") <= EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND
    EXTRACT(MINUTE FROM ${TABLE}."date_of_service") < EXTRACT(MINUTE FROM CURRENT_TIMESTAMP)
    );;
  }

  dimension: patient_name {
    description: "Patient Name"
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: patient_email {
    description: "Patient Email"
    type: string
    sql: ${TABLE}.patient_email ;;
  }

  dimension: patient_state {
    map_layer_name: us_states
    description: "Patient State"
    type: string
    sql: ${TABLE}.patient_state ;;
  }

  dimension_group: original_referral_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week_of_year,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."original_referral_date" ;;
  }

  dimension: referral_program {
    description: "Referral Program"
    type: string
    sql: ${TABLE}.referral_program ;;
  }

  dimension: referral_partner {
    description: "Referral Partner"
    type: string
    sql: ${TABLE}.referral_partner ;;
  }

  dimension: referral_channel {
    description: "Referral Channel"
    type: string
    sql: ${TABLE}.referral_channel ;;
  }

  dimension: encounter_uuid {
    description: "Encounter UUID"
    primary_key: yes
    type: string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension: encounter_type {
    description: "Encounter Type"
    type: string
    sql: ${TABLE}.encounter_type ;;
  }

  dimension: encounter_subtype {
    description: "Encounter Subtype"
    type: string
    sql: ${TABLE}.encounter_subtype ;;
  }

  dimension: consultation_type {
    description: "Consultation Type"
    type: string
    sql: ${TABLE}.consultation_type ;;
  }

  dimension: payor {
    description: "Payor"
    type: string
    sql: ${TABLE}.payor ;;
  }

  dimension: units {
    description: "Units"
    type: string
    sql: ${TABLE}.units ;;
  }

  dimension: requested_specialty {
    description: "Requested Specialty"
    type: string
    sql: ${TABLE}.requested_specialty ;;
  }

  dimension: provider_indicated_specialty {
    description: "Provider Indicated Specialty"
    type: string
    sql: ${TABLE}.provider_indicated_specialty ;;
  }

  dimension: visit_provider {
    description: "Visit Provider"
    type: string
    sql: ${TABLE}.visit_provider ;;
  }

  dimension: is_first_completed_encounter {
    type: yesno
    description: "Whether or not this is the first completed encounter from a patient"
    sql: ${TABLE}.is_first_completed_encounter ;;
  }

  dimension_group: referral_to_completion_time {
    type: duration
    description: "Time to Schedule from Referral"
    sql_start:  ${TABLE}.date_of_service;;
    sql_end:  ${TABLE}.original_referral_date;;
  }


  dimension: is_current_month {
    type: yesno
    #hidden: yes
    sql: ${date_of_service_date} >= cast({% date_start date_filter %} as date)
      AND ${date_of_service_date} < cast({% date_end date_filter %} as date);;
  }

  dimension: is_previous_month {
    type: yesno
    #hidden: yes
    sql: ${date_of_service_date} > ((({% date_start date_filter %})::date)+ '-1 MONTH'::INTERVAL + '-1 day' ::INTERVAL)::date
      AND ${date_of_service_date} < ((({% date_end date_filter %}):: date)+ '-1 MONTH'::INTERVAL)::date ;;
  }

  dimension: count_business_day_in_current_month {
    type: number
    description: "Number of completed business days in the current month"
    sql: count_business_days(date_trunc('MONTH',now())::date, now()::date) ;;
  }

  dimension: count_business_day_in_previous_month {
    type: number
    description: "Number of completed business days in the previous month"
    sql: count_business_days(date_trunc('month', current_date - interval '1' month)::date,
            date_trunc('month', current_date)::date) ;;
  }

  dimension: count_business_day_in_dos_month {
    type: number
    description: "Number of completed business days in the given date of service month"
    sql: count_business_days(date_trunc('MONTH',${date_of_service_date})::date,
            date_trunc('month', ${date_of_service_date} + interval '1' month)::date) ;;
  }

  measure: count {
    type: count
  }

  measure: count_completed_encounters {
    type: count
    filters: [encounter_uuid: "-NULL"]
    description: "Completed Encounters Count"
    drill_fields: [encounter_type, referral_program, count_completed_encounters]
  }

  measure: count_new_patients {
    type: count
    description: "New Patients Count"
    filters: [is_first_completed_encounter: "Yes"]
    drill_fields: [patient_email, date_of_service_date, visit_provider, referral_program, referral_channel, count_new_patients]
  }

  measure: average_referral_to_completion_time_time_in_days {
    type: average
    filters: [days_referral_to_completion_time: ">=0"]
    sql: ${days_referral_to_completion_time} ;;
    drill_fields: [average_referral_to_completion_time_time_in_days]
    value_format_name: decimal_2
  }

  ## Liquid filters for date of service month ##
  filter: date_filter {
    type: date
  }

  measure: count_completed_encounters_current_month {
    type: count
    filters: [is_current_month: "yes"]
    drill_fields: [encounter_type, referral_program, count_completed_encounters]
  }

  measure: count_completed_encounters_previous_month {
    type: count
    filters: [is_previous_month: "yes"]
    drill_fields: [encounter_type, referral_program, count_completed_encounters]
  }


}
