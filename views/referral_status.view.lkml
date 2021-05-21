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
          SELECT patient_uuid, jsonb_agg(outreach) AS outreaches
          FROM (
            SELECT patient_uuid AS patient_uuid,
              date_time AS outreach_date,
              communication_medium_subtype_name AS outreach_medium,
              patient_communication_outcome_display_name AS outreach_outcome,
              ROW_NUMBER() OVER (PARTITION BY patient_uuid ORDER BY date_time) AS rank
            FROM patient_communication_details
          ) outreach
          GROUP BY patient_uuid
        ),
        patient_outreach_before_encounter_creation AS (
          SELECT e.encounter_uuid, jsonb_agg(outreach) AS outreaches
          FROM (
            SELECT patient_uuid AS patient_uuid,
              date_time AS outreach_date,
              communication_medium_subtype_name AS outreach_medium,
              patient_communication_outcome_display_name AS outreach_outcome,
              ROW_NUMBER() OVER (PARTITION BY patient_uuid ORDER BY date_time) AS rank
            FROM patient_communication_details
          ) outreach
          LEFT JOIN encounter_details e ON e.user_uuid = patient_uuid AND outreach_date < e.created_at
          GROUP BY e.encounter_uuid
        ),
        test_orders AS (
          SELECT encounter_uuid AS encounter_uuid,
            string_agg(coalesce(nullif(status_reason, ''), order_status), ',' ORDER BY id ASC) AS order_status,
            string_agg(ordering_physician, ',' ORDER BY id ASC) AS ordering_physician,
            string_agg(gene_test_display_name, ',' ORDER BY id ASC) AS gene_test_display_name,
            string_agg(lab_display_name, ',' ORDER BY id ASC) AS lab_display_name,
            min(created_at) AS created_at,
            max(date_received_report) AS date_received_report
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
        partner_orgs AS (
          SELECT p.data->>'id' AS "id", array_to_string(array_agg(po.name), ', ') AS "name"
          FROM partners p
          JOIN partner_organizations po ON (p.data->'partner_organization_ids')::jsonb @> po.id::text::jsonb
          GROUP BY p.data->>'id'
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
          coalesce(prt.data->>'id', patient_level_prt.data->>'id', '')::int AS partner_id,
          coalesce(prt.data->>'display_name', patient_level_prt.data->>'display_name', 'N/A') AS referral_program,
          coalesce(po.name, patient_level_po.name, 'N/A') AS referral_partner,
          coalesce(rc.data->>'name', patient_level_rc.data->>'name', 'N/A') AS referral_channel,
          ref_pro.provider_name AS referring_provider,
          p.original_referral_date AS original_referral_date,
          etr.encounter_uuid AS encounter_uuid,
          CASE
            WHEN etr.encounter_type = 'scp' AND etr.encounter_subtype = 'partner_initiated/pre_test' THEN 'tro'
            WHEN etr.encounter_type = 'scp' AND etr.encounter_subtype != 'partner_initiated/pre_test' THEN 'scp'
            ELSE etr.encounter_type
          END AS encounter_type,
          etr.encounter_subtype AS encounter_subtype,
          etr.visit_status AS visit_status,
          etr.date_of_service AS date_of_service,
          etr.created_at AS created_at,
          etr.consultation_type AS consultation_type,
          etr.vsee_specialty AS requested_specialty,
          etr.provider_indicated_specialty AS provider_indicated_specialty,
          pos.enabled AS patient_outreach_setting_enabled,
          pos.outreach_window_completed AS patient_outreach_setting_outreach_window_completed,
          pos.outreach_window_completed_date AS patient_outreach_setting_outreach_window_completed_date,
          pot.outreaches AS patient_outreach_events,
          potec.outreaches AS patient_outreach_events_before_encounter,
          coalesce(etr.relationship_to_patient, '') AS relationship_to_patient,
          coalesce(etr.drug_interaction, '') AS drug_interaction,
          coalesce(etr.no_of_interactions, '') AS no_of_interactions,
          coalesce(etr.drug_contraindications, '') AS drug_contraindications,
          etr.drug_dosage_adjustment_recommended AS drug_dosage_adjustment_recommended,
          coalesce(etr.pharmd, '') AS pharmd,
          coalesce(etr.state_of_visit, '') AS state_of_visit,
          coalesce(p.patient_state, '') AS patient_state,
          etr.test_recommended AS test_recommended,
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
          CASE WHEN etr.encounter_type = 'lab_test_authorization' THEN etr.date_received_report ELSE gto.date_received_report END AS date_received_report,
          gto.created_at AS order_creation_date,
          etr.cap_sent_to_patient AS cap_sent_to_patient,
          etr.ror_visit_status AS ror_visit_status,
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
        LEFT JOIN patient_outreach_before_encounter_creation potec ON potec.encounter_uuid = etr.encounter_uuid
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
        LEFT JOIN partners AS patient_level_prt ON p.partner_id::text = patient_level_prt.data->>'id'
        LEFT JOIN partner_orgs AS po ON prt.data->>'id' = po.id
        LEFT JOIN partner_orgs AS patient_level_po ON p.partner_id::text = patient_level_po.id
        LEFT JOIN referral_channels AS rc ON prt.data->>'referral_channel_id' = rc.data ->> 'id'
        LEFT JOIN referral_channels AS patient_level_rc ON patient_level_prt.data ->>'referral_channel_id' = patient_level_rc.data->>'id'
        WHERE NOT (p.patient_email ILIKE '%+%test%@%') AND
        (p.is_deleted is NULL OR p.is_deleted = false)
    ;;
  }

  # Define your dimensions and measures here, like this:
  dimension_group: date_of_service {
    label: "Encounter date of service"
    description: "The date (UTC timezone) when a service was provided"
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
    label: "Encounter creation date"
    description: "The date (UTC timezone) when an encounter is created"
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
    label: "Current date"
    description: "Current date (used for reference)"
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
    description: "Whether given date of service is before month-to-date"
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

  dimension: is_original_referral_date_before_mtd {
    description: "Whether given original referral date is before month-to-date"
    # hidden: yes
    type: yesno
    sql:
    (EXTRACT(DAY FROM ${TABLE}."original_referral_date") < EXTRACT(DAY FROM CURRENT_TIMESTAMP))
    OR
    (EXTRACT(DAY FROM ${TABLE}."original_referral_date") = EXTRACT(DAY FROM CURRENT_TIMESTAMP) AND
    EXTRACT(HOUR FROM ${TABLE}."original_referral_date") < EXTRACT(HOUR FROM CURRENT_TIMESTAMP))
    OR
    (EXTRACT(DAY FROM ${TABLE}."original_referral_date") = EXTRACT(DAY FROM CURRENT_TIMESTAMP) AND
    EXTRACT(HOUR FROM ${TABLE}."original_referral_date") <= EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND
    EXTRACT(MINUTE FROM ${TABLE}."original_referral_date") < EXTRACT(MINUTE FROM CURRENT_TIMESTAMP)
    );;
  }

  dimension: patient_first_name {
    description: "Patient first name"
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }

  dimension: patient_last_name {
    description: "Patient last name"
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_dob {
    description: "Patient date of birth"
    type: string
    sql: ${TABLE}.patient_dob ;;
  }

  dimension: patient_email {
    description: "Patient email"
    type: string
    sql: ${TABLE}.patient_email ;;
  }

  dimension: patient_external_id {
    description: "A patient identifier specified and provided by the partner"
    type: string
    sql: ${TABLE}.patient_external_id ;;
  }

  dimension: patient_uuid {
    description: "A randomized, globally unqiue identifier assigned to each registered patient"
    type: string
    sql: ${TABLE}.patient_uuid ;;
  }

  dimension: partner_id {
    description: "Internal identifier for a referral program"
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: referral_program {
    description: "An instance of GM's engagement with a client, which typically involves patient
    referrals e.g. Invitae_FamilyVariant"
    type: string
    sql: ${TABLE}.referral_program ;;
  }

  dimension: referral_partner {
    description: "A GM client that is part of a referral program e.g. Invitae"
    type: string
    sql: ${TABLE}.referral_partner ;;
  }

  dimension: referring_provider {
    description: "A non-GM provider (e.g. PCP) who refers a patient to GM"
    type: string
    sql: ${TABLE}.referring_provider ;;
  }

  dimension: encounter_uuid {
    primary_key: yes
    description: "A randomized, globally unique identifier for each encounter"
    type: string
    sql: ${TABLE}.encounter_uuid ;;
  }

  dimension: encounter_type {
    description: "A category for encounters, and so a category of GM services"
    type: string
    sql: ${TABLE}.encounter_type ;;
  }

  dimension: encounter_subtype {
    description: "A category with encounter type, and so a sub-category of GM services"
    type: string
    sql: ${TABLE}.encounter_subtype ;;
  }

  dimension: visit_status_raw {
    description: "The status of a visit encounter during its execution e.g. booked, no-show, cancelled etc"
    hidden: yes
    type: string
    sql: ${TABLE}.visit_status ;;
  }

  dimension: visit_status {
    description: "The status of a visit encounter during its execution e.g. booked, no-show, cancelled etc"
    type: string
    sql: INITCAP(REPLACE(${TABLE}.visit_status, '_', ' ')) ;;
  }

  dimension: referral_visit_status {
    type: string
    hidden: yes
    sql: CASE WHEN ${visit_status_raw} IN
        ('cancelled','cancelled_by_care_coordinator','cancelled_by_patient','cancelled_by_provider',
          'cancelled_rescheduled_by_patient','cancelled_rescheduled_by_provider')
        THEN 'Cancelled'
        WHEN ${visit_status_raw} = 'no_show'
        THEN 'NoShow'
        WHEN ${visit_status_raw} IN
         ('completed','Completed','complete','booked','webinar_attended',
          'webinar_recording_viewed')
        THEN 'Scheduled'
        ELSE 'Unknown'
        END ;;
  }

  dimension: visit_status_grouped {
    description: "Patient visit status group into at most four buckets: cancelled/no-show, completed, scheduled, and
    unknown"
    type: string
    sql: CASE WHEN ${visit_status_raw} IN
        ('cancelled','cancelled_by_care_coordinator','cancelled_by_patient','cancelled_by_provider',
          'cancelled_rescheduled_by_patient','cancelled_rescheduled_by_provider', 'no_show')
        THEN 'Cancelled/No-show'
        WHEN ${visit_status_raw} IN
         ('completed','Completed','complete','webinar_attended',
          'webinar_recording_viewed')
        THEN 'Completed'
        WHEN ${visit_status_raw} IN ('booked')
        THEN 'Scheduled'
        ELSE 'Unknown'
        END ;;
  }

  dimension: patient_state {
    map_layer_name: us_states
    description: "The US state that the patient resides in."
    type: string
    sql: ${TABLE}.patient_state ;;
  }

  dimension_group: original_referral_date {
    type: time
    description: "The date a patient was first referred to GM. It's associated with a referral program."
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
    drill_fields: [referral_program, referral_partner, referral_channel]
  }

  dimension: referral_channel {
    description: "An over-arching sales-friendly category of GM's clients."
    type: string
    sql: ${TABLE}.referral_channel ;;
  }

  dimension: consultation_type {
    description: "A type of visit encounter that helps distinguish first visits from follow-ups."
    type: string
    sql: ${TABLE}.consultation_type ;;
  }

  dimension: consultation_type_limited {
    description: "A type of visit encounter limited to four types:
      new encounter without results, new encounter with results, follow-up, and others"
    type: string
   # sql: ${TABLE}.consultation_type ;;
    sql: CASE WHEN TRIM(${TABLE}.consultation_type) in ('Get Started - No Results',
                                                  'Get Started - w/Results',
                                                  'Return of Results')
              THEN TRIM(${TABLE}.consultation_type)
              ELSE 'OTHERS'
              END ;;
  }

  dimension: requested_specialty {
    description: "The provider specialty requested by the patient at the time of appointment scheduling.
      It is constrained by VSee, the scheduling platform that we use."
    type: string
    sql: ${TABLE}.requested_specialty ;;
  }

  dimension: provider_indicated_specialty {
    description: "The GM-determined provider specialty."
    type: string
    sql: ${TABLE}.provider_indicated_specialty ;;
  }

  dimension: visit_provider {
    description: "The provider who provided service during visit encounter."
    type: string
    sql: ${TABLE}.visit_provider ;;
  }

  dimension: patient_outreach_setting_enabled {
    description: "A boolean flag that indicates whether or not we should attempt patient outreach."
    type: yesno
    sql: ${TABLE}.patient_outreach_setting_enabled ;;
  }

  dimension: patient_outreach_setting_outreach_window_completed {
    description: "A boolean flag that indicates whether or not we've completed outreach for a patient."
    type: yesno
    sql: ${TABLE}.patient_outreach_setting_outreach_window_completed ;;
  }

  dimension_group: patient_outreach_setting_outreach_window_completed_date {
    type: time
    description: "The date when patient outreach was completed."
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

  dimension: patient_outreach_events {
    description: "A list of all patient outreach events"
    type: string
    sql: ${TABLE}.patient_outreach_events ;;
  }

  dimension: patient_outreach_events_before_encounter {
    description: "A list of all patient outreach events that happened before encounter creation"
    type: string
    sql: ${TABLE}.patient_outreach_events_before_encounter ;;
  }

  dimension: relationship_to_patient {
    description: "Relationship to patient e.g. parent, child, sibling"
    type: string
    sql: ${TABLE}.relationship_to_patient ;;
  }

  dimension: drug_interaction {
    description: "Notes on drug interaction for pharmacogenomics"
    type: string
    sql: ${TABLE}.drug_interaction ;;
  }

  dimension: drug_contraindications {
    description: "Notes on drug contraindications for pharmacogenomics"
    type: string
    sql: ${TABLE}.drug_contraindications ;;
  }

  dimension: drug_dosage_adjustment_recommended {
    description: "Notes on drug dosage adjustment recommendation for pharmacogenomics"
    type: string
    sql: ${TABLE}.drug_dosage_adjustment_recommended ;;
  }

  dimension: pharmd {
    description: "The PharmD overseeing for pharmacogenomics recommendations"
    type: string
    sql: ${TABLE}.pharmd ;;
  }

  dimension: state_of_visit {
    description: "The US state where a visit happened."
    type: string
    sql: ${TABLE}.state_of_visit ;;
  }

  dimension: test_recommended {
    description: "A boolean flag indicating whether genetic testing recommended."
    type: string
    sql: ${TABLE}.test_recommended ;;
  }

  dimension: test_order_status {
    description: "The status of the genetic test that was ordered, if at all."
    type: string
    sql: ${TABLE}.test_order_status ;;
  }

  dimension: preauth_form_status {
    description: "The status of a pre-authorization form"
    type: string
    sql: ${TABLE}.test_name ;;
  }

  dimension: preauth_decision {
    description: "The decision on pre-authorization"
    type: string
    sql: ${TABLE}.preauth_decision ;;
  }

  dimension: alternate_lab {
    description: "In case of pre-authorization, the gene testing lab name recommended as alternative."
    type: string
    sql: ${TABLE}.alternate_lab ;;
  }

  dimension: alternate_test {
    description: "In case of pre-authorization, the gene test name recommended as alternative."
    type: string
    sql: ${TABLE}.alternate_test ;;
  }

  dimension: type_of_test {
    description: "Type of genetic test that was ordered (legacy field, and not used anymore)."
    type: string
    sql: ${TABLE}.type_of_test ;;
  }

  dimension: ordering_physician {
    description: "The provider who ordered the genetic test."
    type: string
    sql: ${TABLE}.ordering_physician ;;
  }

  dimension: test_name {
    description: "The name of the genetic test if any was ordered"
    type: string
    sql: ${TABLE}.test_name ;;
  }

  dimension: testing_lab {
    description: "The name of the genetic testing lab with which an order may have been placed."
    type: string
    sql: ${TABLE}.testing_lab ;;
  }

  dimension_group: date_test_ordered {
    type: time
    description: "The date when a genetic test was ordered"
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
    description: "The date when genetic test results were received by the provider for a ptient from a lab."
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

  dimension_group: order_creation_date {
    type: time
    description: "The date when a genetic test order was created in the GM app"
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
    sql: ${TABLE}."order_creation_date" ;;
  }


  dimension_group: cap_sent_to_patient {
    type: time
    description: "The date when results/CAP was sent to patient by the provider."
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
    sql: ${TABLE}."cap_sent_to_patient" ;;
  }


  dimension_group: ror_outreach_date {
    type: time
    description: "The date when patient outreach was done on the return of genetic test results"
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

  dimension: ror_visit_status {
    type: string
    description: "The status of the visit encounter that may be scheduled on the return of genetic test results."
    sql: ${TABLE}.ror_visit_status ;;
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
    sql: coalesce(${TABLE}.is_first_visit_scheduled_encounter,true) ;;
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

  dimension: referral_to_scheduling_time {
    type: number
    label: "Time between the referral date and the date an encounter was created"
    sql: count_business_days(${original_referral_date_date}, ${created_at_date}) ;;
    drill_fields: [referral_program, referral_partner, referral_channel]
  }

  dimension: referral_to_date_of_service_time {
    type: number
    description: "Time between the referral date and date of service was created"
    sql: count_business_days(${original_referral_date_date}, ${date_of_service_date}) ;;
    drill_fields: [referral_program, referral_partner, referral_channel]
  }

  dimension: creation_to_date_of_service_time {
    type: number
    description: "Time between the encounter creation and date of service"
    sql: count_business_days(${created_at_date}, ${date_of_service_date}) ;;
    drill_fields: [referral_program, referral_partner, referral_channel]
  }

  dimension: number_of_outreaches {
    type: number
    description: "The total number of outreaches that have happended for each patient"
    sql: jsonb_array_length(${TABLE}.patient_outreach_events) ;;
    drill_fields: [referral_program, referral_partner, referral_channel]
  }

  dimension: number_of_outreaches_before_encounter_creation {
    type: number
    description: "The total number of outreaches that have happended for each patient before an encounter creation"
    sql: jsonb_array_length(${TABLE}.patient_outreach_events_before_encounter);;
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

## To show visit booked vs no visit booked patients ##


  dimension: first_visit_schedule {
    description: "A yes/no flag that indicates whether this encounter is the first visit scheduled for a patient."
    type: string
    hidden: yes
    sql: CASE WHEN ${is_first_visit_scheduled_encounter} THEN 'Yes' ELSE 'No' END ;;
  }

  dimension: referal_patient_visit_status {
    type: string
    sql: CASE WHEN ${first_visit_schedule} = 'Yes'
        and ${referral_visit_status} = 'Scheduled'
        THEN 'First Visit Successful'
        WHEN ${first_visit_schedule} = 'No'
        and ${referral_visit_status} = 'Scheduled'
        THEN 'Other Successful Visits'
        WHEN ${first_visit_schedule} = 'Yes'
        and ${visit_status} = 'no_show'
        THEN 'First Visit Not Booked'
        WHEN ${first_visit_schedule} = 'Yes'
        and ${referral_visit_status} = 'Cancelled'
        THEN 'First Visit Cancelled'
        WHEN ${first_visit_schedule} = 'No'
        and ${referral_visit_status} = 'Cancelled'
        THEN 'Other Visits Cancelled'
        ELSE 'Status unknown'
        END  ;;
    drill_fields: [visit_provider,referral_channel,referral_program,visit_status]
  }

  measure: count {
    type: count
  }

  measure: count_encounters {
    type: count_distinct
    description: "Number of encounters"
    filters: [encounter_uuid: "-NULL"]
    sql: ${encounter_uuid} ;;
    drill_fields: [encounter_type, referral_program,consultation_type, count_encounters]
  }

  measure: count_patients_with_encounters {
    type: count_distinct
    description: "Number of patients with at least one encounter"
    filters: [encounter_uuid: "-NULL"]
    sql: ${patient_uuid} ;;
    drill_fields: [referral_channel, referral_program, count_patients_with_encounters]
  }

  measure: total_patients_count {
    type: count_distinct
    description: "Number of registered patients"
    sql: ${patient_uuid} ;;
    drill_fields: [referral_channel, referral_program, total_patients_count]
    }

  dimension: dummy {
    type: string
    sql: 'abc' ;;
  }

  measure: count_patients_with_scheduled_encounters {
    type: count_distinct
    description: "Number of patients with at least 1 visit scheduled"
    sql: ${patient_uuid} ;;
    filters: [referral_visit_status: "Scheduled"]
    drill_fields: [referral_channel, referral_program, count_patients_with_scheduled_encounters]
  }

  measure: count_patients_with_morethan_1_encounters {
    type: count_distinct
    description: "Number of patients with at least 1 visit scheduled"
    sql: ${patient_uuid} ;;
    filters: [referral_visit_status: "Scheduled"]
    drill_fields: [referral_channel, referral_program, count_patients_with_morethan_1_encounters]
  }

  measure: percentage_patients_with_morethan1_encounter {
    type: number
    sql: 100* (${count_patients_with_encounters}/${total_patients_count}) ;;
    value_format_name: "percent_2"
  }

  measure: count_patients_with_outreach {
    type:  count_distinct
    description: "Number of patients with at least one outreach event"
    filters: [number_of_outreaches: ">=1"]
    drill_fields: [referral_channel, referral_program, count_patients_with_outreach]
    sql: ${patient_uuid} ;;
  }

  measure: count_patients_with_appointment {
    type:  count_distinct
    description: "Number of patients with at least one appointment"
    filters: [encounter_type: "visit", referral_visit_status: "Scheduled"]
    drill_fields: [referral_channel, referral_program, visit_status, count_patients_with_appointment]
    sql: ${patient_uuid} ;;
  }

  measure: count_patients_with_order {
    type:  count_distinct
    description: "Number of patients with test recommended"
    filters: [encounter_type: "visit", referral_visit_status: "Scheduled", order_creation_date_date: "-NULL"]
    drill_fields: [referral_channel, referral_program, test_order_status, count_patients_with_order]
    sql: ${patient_uuid} ;;
  }

  measure: count_patients_with_ror {
    type:  count_distinct
    description: "Number of patients with followup outreach done"
    filters: [encounter_type: "visit", referral_visit_status: "Scheduled", order_creation_date_date: "-NULL", consultation_type: "%return of result%"]
    drill_fields: [referral_channel, referral_program, ror_visit_status, count_patients_with_ror]
    sql: ${patient_uuid} ;;
  }

  measure: count_patients_with_result_sent {
    type:  count_distinct
    description: "Number of patients with results sent"
    filters: [encounter_type: "visit", referral_visit_status: "Scheduled", order_creation_date_date: "-NULL", consultation_type: "%return of result%", date_received_report_date: "-NULL"]
    drill_fields: [referral_channel, referral_program, count_patients_with_result_sent]
    sql: ${patient_uuid} ;;
  }

  measure: average_referral_to_scheduling_time_in_days {
    type: average
    description: "Average time (in days) between the referral date and date 1st appointment was created"
    filters: [referral_to_scheduling_time: ">=0", is_first_visit_encounter: "Yes"]
    sql: ${referral_to_scheduling_time} ;;
    drill_fields: [visit_provider, referral_program, average_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_referral_to_visit_completion_time_in_days {
    type: average
    description: "Average time (in days) from the referral date to the first appointment completed date"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_referral_to_visit_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_created_to_completion_time_in_days {
    type: average
    description: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = booked or completed)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_scheduled_encounter: "Yes"]
    sql: ${creation_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_created_to_completion_time_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_no_ror_in_days {
    type: average
    description: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, no RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_no_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_no_ror_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_with_ror_in_days {
    type: average
    description: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, with RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_with_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_with_ror_in_days]
    value_format_name: decimal_2
  }

  measure: average_visit_referral_to_completion_time_ror_in_days {
    type: average
    description: "Average time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, average_visit_referral_to_completion_time_ror_in_days]
    value_format_name: decimal_2
  }

  ### To show in box plot ###

  measure: min_visit_completion_time {
    description: "Minimum time to complete a visit encounter"
    type: min
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,min_visit_completion_time]

  }

  measure: first_percentile_visit_completion_time {
    description: "First percentile time to complete a visit encounter"
    type: percentile
    percentile: 25
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,first_percentile_visit_completion_time]
  }

  measure: median_visit_completion_time {
    description: "Median time to complete a visit encounter"
    type: median
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,median_visit_completion_time]
  }

  measure: second_percentile_visit_completion_time {
    description: "Second percentile time to complete a visit encounter"
    type: percentile
    percentile: 75
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,second_percentile_visit_completion_time]
  }

  measure: max_visit_completion_time {
    description: "Max time to complete a visit encounter"
    type: max
    group_label: "Boxplot"
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [boxplot_drill*,max_visit_completion_time]
  }

  measure: min_referral_to_scheduling_time_in_days {
    type: min
    description: "Max average time (in days) between the referral date and date 1st appointment was created"
    filters: [referral_to_scheduling_time: ">=0", is_first_visit_encounter: "Yes"]
    sql: ${referral_to_scheduling_time} ;;
    drill_fields: [visit_provider, referral_program, min_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }

  measure: max_referral_to_scheduling_time_in_days {
    type: max
    description: "Max time (in days) between the referral date and date 1st appointment was created"
    filters: [referral_to_scheduling_time: ">=0", is_first_visit_encounter: "Yes"]
    sql: ${referral_to_scheduling_time} ;;
    drill_fields: [visit_provider, referral_program, max_referral_to_scheduling_time_in_days]
    value_format_name: decimal_2
  }

  measure: min_visit_referral_to_completion_time_with_ror_in_days {
    type: min
    description: "Min time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, with RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_with_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, min_visit_referral_to_completion_time_with_ror_in_days]
    value_format_name: decimal_2
  }

  measure: max_visit_referral_to_completion_time_with_ror_in_days {
    type: max
    description: "Max time (in days) between the date the appointment was scheduled to the date of the appointment (w/status = completed, with RoR)"
    filters: [referral_to_date_of_service_time: ">=0", is_first_visit_completed_with_ror_encounter: "Yes"]
    sql: ${referral_to_date_of_service_time} ;;
    drill_fields: [visit_provider, referral_program, max_visit_referral_to_completion_time_with_ror_in_days]
    value_format_name: decimal_2
  }

  #is_first_visit_scheduled_encounter
  measure: average_number_of_outreaches_before_first_visit_scheduled {
    type: average
    description: "Average number of outreaches before first appointment was scheduled"
    filters: [number_of_outreaches_before_encounter_creation: ">=0", is_first_visit_scheduled_encounter: "Yes", created_at_date: "-NULL"]
    sql: ${number_of_outreaches_before_encounter_creation} ;;
    drill_fields: [visit_provider, referral_program, average_number_of_outreaches_before_first_visit_scheduled]
    value_format_name: decimal_2
  }
}
