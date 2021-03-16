view: referral_status {
  # TODOs
  # AS test_name,
  # AS testing_lab,
  # AS preauth_form_status,
  # AS preauth_decision,
  # AS alternate_lab,
  # AS alternate_test,
  derived_table: {
    sql: WITH referring_providers AS (
            SELECT c.patient_uuid AS patient_uuid,
                string_agg(concat_ws(' ', p.first_name, p.middle_name, p.last_name), ', ') AS provider_name
            FROM care_team AS c
            JOIN providers AS p ON c.provider_uuid = p.uuid
            JOIN patient_encounter_summary pa ON pa.patient_uuid = c.patient_uuid
            WHERE pa.is_deleted = false AND 'referring_provider' = any(c.provider_role)
            GROUP BY c.patient_uuid
        ),
        patient_outreach AS (
          SELECT patient_uuid,
            array_to_json(array_agg('date: ' || outreach.outreach_date || ', outcome: ' || coalesce(outreach.outreach_outcome, ''))) AS outreaches
          FROM (
            SELECT patient_uuid AS patient_uuid,
              date_time AS outreach_date,
              patient_communication_outcome_display_name AS outreach_outcome,
              ROW_NUMBER() OVER (PARTITION BY patient_uuid ORDER BY date_time) AS rank
            FROM patient_communication_details
          ) outreach
          WHERE rank <= 6
          GROUP BY patient_uuid
        ),
        test_orders AS (
          SELECT encounter_uuid AS encounter_uuid,
            string_agg(coalesce(nullif(status_reason, ''), order_status), ',' ORDER BY id ASC) AS order_status,
            string_agg(ordering_physician, ',' ORDER BY id ASC) AS ordering_physician,
            string_agg(gene_test_display_name, ',' ORDER BY id ASC) AS gene_test_display_name,
            string_agg(lab_display_name, ',' ORDER BY id ASC) AS lab_display_name
          FROM gene_test_orders
          GROUP BY encounter_uuid
        )
        SELECT
        coalesce(initcap(p.patient_first_name), '') AS patient_first_name,
        coalesce(initcap(p.patient_last_name), '') AS patient_last_name,
        p.patient_dob AS patient_dob,
        p.patient_email AS patient_email,
        coalesce(initcap(p.external_patient_id), '') AS external_patient_id,
        p.patient_uuid AS patient_uuid,
        p.referral_program AS referral_program,
        coalesce(po.name, 'N/A') AS referral_partner,
        coalesce(rc.data ->> 'name', 'N/A') AS referral_channel,
        ref_pro.provider_name AS referring_provider,
        p.original_referral_date AS original_referral_date,
        etr.encounter_uuid AS encounter_uuid,
        etr.encounter_type AS encounter_type,
        etr.visit_status AS visit_status,
        etr.date_of_service AS date_of_service,
        etr.created_at AS created_at,
        etr.consultation_type AS consultation_type,
        etr.vsee_specialty AS requested_specialty,
        etr.provider_indicated_specialty AS provider_indicated_specialty,
        pos.enabled AS patient_outreach_setting_enabled,
        pos.outreach_window_completed AS patient_outreach_setting_outreach_window_completed,
        coalesce(etr.relationship_to_patient, '') AS relationship_to_patient,
        coalesce(etr.drug_interaction, '') AS drug_interaction,
        coalesce(etr.no_of_interactions, '') AS no_of_interactions,
        coalesce(etr.drug_contraindications, '') AS drug_contraindications,
        etr.drug_dosage_adjustment_recommended AS drug_dosage_adjustment_recommended,
        coalesce(etr.pharmd, '') AS pharmd,
        coalesce(etr.state_of_visit, '') AS state_of_visit,
        coalesce(p.patient_state, '') AS patient_state,
        CASE
            WHEN etr.test_recommended IS NULL THEN 'Order Status Pending'
            WHEN lower(etr.test_recommended) = 'no' THEN 'Testing Not Recommended'
            WHEN lower(etr.test_recommended) = 'pa' THEN 'N/A'
            WHEN lower(etr.test_recommended) = 'yes' THEN gto.order_status
            ELSE NULL
        END AS test_order_status,
        gto.ordering_physician AS ordering_physician,
        gto.gene_test_display_name AS test_name,
        gto.lab_display_name AS testing_lab,
        etr.type_of_test AS type_of_test,
        etr.date_test_ordered AS date_test_ordered,
        etr.date_received_report AS date_received_report,
        etr.cap_sent_to_patient AS cap_sent_to_patient,
        etr.ror_date_contacted AS ror_outreach_date
    FROM patient_encounter_summary AS p
    LEFT JOIN patient_outreach_settings pos ON pos.patient_uuid = p.patient_uuid
    LEFT JOIN patient_outreach pot ON pot.patient_uuid = p.patient_uuid
    LEFT JOIN encounter_details AS etr ON etr.user_uuid = p.patient_uuid
    LEFT JOIN test_orders AS gto ON gto.encounter_uuid = etr.encounter_uuid
    LEFT JOIN referring_providers as ref_pro ON p.patient_uuid = ref_pro.patient_uuid
    LEFT JOIN partners AS prt ON etr.partner_uuid = prt.uuid
    LEFT JOIN referral_channels AS rc ON prt.data ->> 'referral_channel_id' = rc.data ->> 'id'
    LEFT JOIN (
      SELECT p.data->'id' AS "id", array_to_string(array_agg(po.name), ', ') AS "name"
      FROM partners p
      JOIN partner_organizations po ON (p.data->'partner_organization_ids')::jsonb @> po.id::text::jsonb
      GROUP BY p.data->'id'
    ) AS po ON prt.data->'id' = po.id
    WHERE NOT (p.patient_email ILIKE '%+%test%@%') AND p.is_deleted = false
    ;;
  }

  # Define your dimensions and measures here, like this:
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

  dimension: patient_first_name {
    description: "Patient First Name"
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: patient_last_name {
    description: "Patient Last Name"
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_dob {
    description: "Patient DoB"
    type: string
    sql: ${TABLE}.patient_dob ;;
  }

  dimension: patient_email {
    description: "Patient Email"
    type: string
    sql: ${TABLE}.patient_email ;;
  }

  dimension: patient_external_id {
    description: "Patient External Id"
    type: string
    sql: ${TABLE}.patient_external_id ;;
  }

  dimension: patient_uuid {
    description: "Genome Medical Patient UUID"
    type: string
    sql: ${TABLE}.patient_uuid ;;
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

  dimension: referring_provider {
    description: "Referring Provider"
    type: string
    sql: ${TABLE}.referring_provider ;;
  }

  dimension: encounter_uuid {
    primary_key: yes
    description: "Encounter UUID"
    type: string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension: encounter_type {
    description: "Encounter Type"
    type: string
    sql: ${TABLE}.encounter_type ;;
  }

  dimension: visit_status {
    description: "Visit Status"
    type: string
    sql: ${TABLE}.visit_status ;;
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

  dimension: referral_channel {
    description: "Referral Channel"
    type: string
    sql: ${TABLE}.referral_channel ;;
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

  dimension: patient_outreach_setting_enabled {
    description: "Patient Outreach Enabled"
    type: yesno
    sql: ${TABLE}.patient_outreach_setting_enabled ;;
  }

  dimension_group: patient_outreach_setting_outreach_window_completed {
    type: time
    description: "Patient Outreach Window Completed"
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
    sql: ${TABLE}."patient_outreach_setting_outreach_window_completed" ;;
  }

  dimension: relationship_to_patient {
    description: "Relationship to Patient"
    type: string
    sql: ${TABLE}.relationship_to_patient ;;
  }

  dimension: drug_interaction {
    description: "Drug Interaction"
    type: string
    sql: ${TABLE}.drug_interaction ;;
  }

  dimension: drug_contraindications {
    description: "Drug Contraindications"
    type: string
    sql: ${TABLE}.drug_contraindications ;;
  }

  dimension: drug_dosage_adjustment_recommended {
    description: "Drug Dosage Adjustment Recommended"
    type: string
    sql: ${TABLE}.drug_dosage_adjustment_recommended ;;
  }

  dimension: pharmd {
    description: "PharmD"
    type: string
    sql: ${TABLE}.pharmd ;;
  }

  dimension: state_of_visit {
    description: "State of Visit"
    type: string
    sql: ${TABLE}.state_of_visit ;;
  }

  dimension: test_order_status {
    description: "Test Order Status"
    type: string
    sql: ${TABLE}.test_order_status ;;
  }

  dimension: preauth_form_status {
    description: "Pre-Auth Form Status"
    type: string
    sql: ${TABLE}.test_name ;;
  }

  dimension: preauth_decision {
    description: "Pre-Auth Decision"
    type: string
    sql: ${TABLE}.preauth_decision ;;
  }

  dimension: alternate_lab {
    description: "Alternate Lab (PA)"
    type: string
    sql: ${TABLE}.alternate_lab ;;
  }

  dimension: alternate_test {
    description: "Alternate Test (PA)"
    type: string
    sql: ${TABLE}.alternate_test ;;
  }

  dimension: type_of_test {
    description: "Type of Test Ordered (Legacy)"
    type: string
    sql: ${TABLE}.type_of_test ;;
  }

  dimension: ordering_physician {
    description: "Ordering Physician"
    type: string
    sql: ${TABLE}.ordering_physician ;;
  }

  dimension: test_name {
    description: "Gene Test Name"
    type: string
    sql: ${TABLE}.test_name ;;
  }

  dimension: testing_lab {
    description: "Test Lab Name"
    type: string
    sql: ${TABLE}.testing_lab ;;
  }

  dimension_group: date_test_ordered {
    type: time
    description: "Date Test Ordered"
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
    sql: ${TABLE}."date_test_ordered" ;;
  }

  dimension_group: date_received_report {
    type: time
    description: "Test Results Received Date"
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
    sql: ${TABLE}."date_received_report" ;;
  }

  dimension: cap_sent_to_patient {
    description: "Results/CAP Sent to Patient"
    type: string
    sql: ${TABLE}.cap_sent_to_patient ;;
  }

  dimension_group: ror_outreach_date {
    type: time
    description: "RoR Outreach Date"
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
    sql: ${TABLE}."ror_outreach_date" ;;
  }

  dimension_group: referral_to_completion_time {
    type: duration
    label: "Time to Schedule from Referral"
    sql_start:  ${TABLE}.date_of_service;;
    sql_end:  ${TABLE}.original_referral_raw;;
  }

  measure: count {
    type: count
  }

  measure: count_encounters {
    type: count
    label: "Encounters Count"
    drill_fields: [encounter_type, referral_program, count_encounters]
  }

  dimension: referral_to_scheduling_time {
    type: number
    label: "Time between the referral date and date 1st appointment was created"
    sql: count_business_days(${date_of_service_date}, ${original_referral_date_date}) ;;
  }

  measure: average_referral_to_scheduling_time_in_days {
    type: average
    label: "Average time between the referral date and date 1st appointment was created"
    filters: [referral_to_scheduling_time: ">=0"]
    sql: ${referral_to_scheduling_time} ;;
    drill_fields: [visit_provider, referral_program, average_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }
}