view: referral_status {
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
        ),
        preauthorizations AS (
          SELECT uuid,
            encounter_uuid,
            id,
            created_at,
            dispatch_status AS status,
            dispatch_status_reason AS status_reason,
            COALESCE(NULLIF(dispatch_status_reason, ''::text), dispatch_status) AS combined_status,
            request_decision
          FROM preauthorizations
        ),
        first_visit_status_encounters AS (
          SELECT encounter_uuid, visit_status, consultation_type,
            rank() over (PARTITION BY user_uuid ORDER BY date_of_service asc, created_at asc) AS position
          FROM encounter_details
          WHERE encounter_type = 'visit'
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
          CASE
            WHEN etr.encounter_type = 'scp' AND etr.encounter_subtype = 'partner_initiated/pre_test' THEN 'tro'
            WHEN etr.encounter_type = 'scp' AND etr.encounter_subtype != 'partner_initiated/pre_test' THEN 'scp'
            ELSE etr.encounter_type
          END AS encounter_type,
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
          CASE WHEN etr.encounter_type != 'lab_test_authorization' THEN gto.lab_display_name ELSE etr.lab END AS testing_lab,
          etr.type_of_test AS type_of_test,
          etr.date_test_ordered AS date_test_ordered,
          etr.date_received_report AS date_received_report,
          etr.cap_sent_to_patient AS cap_sent_to_patient,
          etr.ror_date_contacted AS ror_outreach_date,
          CASE WHEN pa.encounter_uuid IS NULL THEN NULL ELSE coalesce(nullif(pa.status_reason, ''), pa.status) END AS preauth_form_status,
          CASE WHEN pa.encounter_uuid IS NULL THEN NULL ELSE pa.request_decision END AS preauth_decision,
          CASE WHEN pa.encounter_uuid IS NULL THEN NULL ELSE gto.lab_display_name END AS alternate_lab,
          CASE WHEN pa.encounter_uuid IS NULL THEN NULL ELSE gto.gene_test_display_name END AS alternate_test,
          CASE WHEN fe.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_encounter,
          CASE WHEN fvc.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_completed_encounter,
          CASE WHEN fvb.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_scheduled_encounter,
          CASE WHEN fvca.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_completed_no_ror_encounter,
          CASE WHEN fvcb.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_completed_with_ror_encounter,
          CASE WHEN fvcc.encounter_uuid IS NULL THEN false ELSE true END AS is_first_visit_completed_ror_encounter
        FROM patient_encounter_summary AS p
        LEFT JOIN patient_outreach_settings pos ON pos.patient_uuid = p.patient_uuid
        LEFT JOIN patient_outreach pot ON pot.patient_uuid = p.patient_uuid
        LEFT JOIN encounter_details AS etr ON etr.user_uuid = p.patient_uuid
        LEFT JOIN first_visit_status_encounters fe ON fe.encounter_uuid = etr.encounter_uuid AND fe.position = 1
        LEFT JOIN first_visit_status_encounters fvc
          ON fvc.encounter_uuid = etr.encounter_uuid AND fvc.position = 1 AND fvc.visit_status = 'completed'
        LEFT JOIN first_visit_status_encounters fvb
          ON fvb.encounter_uuid = etr.encounter_uuid AND fvb.position = 1 AND (fvb.visit_status = 'completed' OR fvb.visit_status = 'booked')
        LEFT JOIN first_visit_status_encounters fvca
          ON fvca.encounter_uuid = etr.encounter_uuid AND fvca.position = 1 AND fvca.visit_status = 'completed' AND fvca.consultation_type ilike '%%get started%%no result%%'
        LEFT JOIN first_visit_status_encounters fvcb
          ON fvcb.encounter_uuid = etr.encounter_uuid AND fvcb.position = 1 AND fvcb.visit_status = 'completed' AND fvcb.consultation_type ilike '%%get started%% w/result%%'
        LEFT JOIN first_visit_status_encounters fvcc
          ON fvcc.encounter_uuid = etr.encounter_uuid AND fvcc.position = 1 AND fvcc.visit_status = 'completed' AND fvcc.consultation_type ilike '%%return of result%%'
        LEFT JOIN test_orders AS gto ON gto.encounter_uuid = etr.encounter_uuid
        LEFT JOIN preauthorizations AS pa ON pa.encounter_uuid = etr.encounter_uuid
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

  dimension_group: created_at {
    description: "Encounter Creation Date (UTC)"
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
    sql: ${TABLE}."created_at" ;;
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
    sql: ${TABLE}.patient_first_name ;;
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

  dimension: is_first_visit_encounter {
    type: yesno
    description: "Whether or not this is the first visit encounter from a patient"
    sql: ${TABLE}.is_first_visit_encounter ;;
  }

  dimension: is_first_visit_completed_encounter {
    type: yesno
    description: "Whether or not this is the first completed visit encounter from a patient"
    sql: ${TABLE}.is_first_visit_completed_encounter ;;
  }

  dimension: is_first_visit_scheduled_encounter {
    type: yesno
    description: "Whether or not this is the first scheduled visit encounter from a patient"
    sql: ${TABLE}.is_first_visit_scheduled_encounter ;;
  }

  dimension: is_first_visit_completed_no_ror_encounter {
    type: yesno
    description: "Whether or not this is the first completed visit encounter (without RoR) from a patient"
    sql: ${TABLE}.is_first_visit_completed_no_ror_encounter ;;
  }

  dimension: is_first_visit_completed_with_ror_encounter {
    type: yesno
    description: "Whether or not this is the first completed visit encounter (with RoR) from a patient"
    sql: ${TABLE}.is_first_visit_completed_with_ror_encounter ;;
  }

  dimension: is_first_visit_completed_ror_encounter {
    type: yesno
    description: "Whether or not this is the first completed visit encounter (RoR) from a patient"
    sql: ${TABLE}.is_first_visit_completed_ror_encounter ;;
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
    label: "Time between the referral date and the date an encounter was created"
    sql: count_business_days(${original_referral_date_date}, ${created_at_date}) ;;
  }

  dimension: referral_to_date_of_service_time {
    type: number
    label: "Time between the referral date and date of service was created"
    sql: count_business_days(${original_referral_date_date}, ${date_of_service_date}) ;;
  }

  dimension: creation_to_date_of_service_time {
    type: number
    label: "Time between the encounter creation and date of service"
    sql: count_business_days(${created_at_date}, ${date_of_service_date}) ;;
  }

  measure: average_referral_to_scheduling_time_in_days {
    type: average
    label: "Average time (in days) between the referral date and date 1st appointment was created"
    filters: [referral_to_scheduling_time: ">=0", is_first_visit_encounter: "Yes"]
    sql: ${referral_to_scheduling_time} ;;
    drill_fields: [visit_provider, referral_program, average_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_referral_to_visit_completion_time_in_days {
    type: average
    label: "Average time (in days) from the referral date to the first appointment completed date"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_referral_to_visit_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_created_to_completion_time_in_days {
    type: average
    label: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = booked or completed)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_scheduled_encounter: "Yes"]
    sql: ${creation_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_created_to_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_no_ror_in_days {
    type: average
    label: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, no RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_no_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_no_ror_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_with_ror_in_days {
    type: average
    label: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, with RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_with_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_with_ror_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_ror_in_days {
    type: average
    label: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_ror_in_days]
    value_format_name: decimal_2
  }

  ### To show in box plot ###

  measure: min_visit_completion_time {
    type: min
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,min_visit_completion_time]

  }

  measure: first_percentile_visit_completion_time {
    type: percentile
    percentile: 25
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,first_percentile_visit_completion_time]
  }

  measure: median_visit_completion_time {
    type: median
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,median_visit_completion_time]
  }

  measure: second_percentile_visit_completion_time {
    type: percentile
    percentile: 75
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,second_percentile_visit_completion_time]
  }

  measure: max_visit_completion_time {
    type: max
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,max_visit_completion_time]
  }

  set: boxplot_drill {
    fields: [patient_first_name,
      referring_provider,
      ordering_physician,
      consultation_type,
      original_referral_date_date,
      date_of_service_date,
      referral_to_date_of_service_time]
  }
}
