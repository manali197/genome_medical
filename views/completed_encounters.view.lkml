view: completed_encounters {
  # TODOs:
  # 1. add the (lp.data ->> 'uuid')::uuid = c.lab_patient_uuid condition
  derived_table: {
    sql:
      WITH lp AS (
        SELECT
            json_extract_path(json_array_elements(p.lab_patients), 'first_name')::text AS first_name,
            json_extract_path(json_array_elements(p.lab_patients), 'last_name')::text AS last_name,
            json_extract_path(json_array_elements(p.lab_patients), 'email')::text AS patient_email,
            json_extract_path(json_array_elements(p.lab_patients), 'uuid')::text AS patient_uuid,
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
            e.visit_provider AS visit_provider
        FROM encounter_details AS e
        JOIN patient_encounter_summary AS p ON p.patient_uuid = e.user_uuid
        WHERE
            e.encounter_type = 'lab_test_authorization' and (e.order_request_status in ('approved', 'rejected'))
      ),
      nlp AS (
        SELECT
            p.patient_first_name AS first_name,
            p.patient_last_name AS last_name,
            p.patient_email AS patient_email,
            p.patient_uuid AS patient_uuid,
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
            e.visit_provider AS visit_provider
        FROM encounter_details AS e
        JOIN patient_encounter_summary AS p ON p.patient_uuid = e.user_uuid
        WHERE
            (e.encounter_type = 'visit' and e.visit_status = 'completed') OR
            (e.encounter_type = 'cc-intake' and e.visit_status = 'completed') OR
            (e.encounter_type = 'group-session' and (e.visit_status in ('webinar_attended', 'webinar_recording_viewed'))) OR
            (e.encounter_type = 'research-data') OR
            (e.encounter_type = 'scp')
      ),
      mgr AS (
        SELECT
            to_char(to_date(m.date_of_service, 'YYYY-MM-DD HH24:MI:SS'), 'MM/DD/YYYY'),
            'N/A' AS patient_name,
            'N/A'  AS patient_email,
            m.referral_program AS referral_program,
            'N/A' AS referral_partner,
            'Health Systems' AS referral_channel,
            m.uuid AS encounter_uuid,
            'Medical Geneticist' AS encounter_type,
            'N/A' AS encounter_subtype,
            'N/A' AS consultation_type,
            'N/A' AS payor,
            (NULL)::int AS units,
            'N/A' AS requested_specialty,
            'N/A' AS provider_indicated_specialty,
            m.visit_provider AS visit_provider
        FROM mg_encounters AS m
    ),
    final AS (
        SELECT * FROM lp
        UNION
        SELECT * FROM nlp
    ),
    final_from_db AS (
      SELECT
          to_char(final.date_of_service, 'MM/DD/YYYY') AS date_of_service,
          initcap(concat(final.first_name, ' ', final.last_name)) AS patient_name,
          final.patient_email AS patient_email,
          prt.data ->> 'display_name' AS referral_program,
          po.name AS referral_partner,
          rc.data ->> 'name'AS referral_channel,
          final.encounter_uuid AS encounter_uuid,
          final.encounter_type AS encounter_type,
          final.encounter_subtype AS encounter_subtype,
          final.consultation_type AS consultation_type,
          case when final.payor = 'self_pay' then 'Self' else final.payor end AS payor,
          final.units AS units,
          final.vsee_specialty AS requested_specialty,
          final.provider_indicated_specialty AS provider_indicated_specialty,
          INITCAP(REPLACE(final.visit_provider, '_', ' ')) AS visit_provider
      FROM final
      LEFT JOIN partners AS prt ON final.partner_uuid = prt.uuid
      LEFT JOIN referral_channels AS rc ON prt.data ->> 'referral_channel_id' = rc.data ->> 'id'
      LEFT JOIN
      (
        SELECT p.data->'id' AS "id", array_to_string(array_agg(po.name), ', ') AS "name"
        FROM partners p
        JOIN partner_organizations po ON (p.data->'partner_organization_ids')::jsonb @> po.id::text::jsonb
        GROUP BY p.data->'id'
      ) AS po ON prt.data->'id' = po.id
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
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date_of_service" ;;
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

  measure: count {
    type: count
  }

  measure: count_not_null_encounters {
    type: count
    label: "Encounters"
    filters: []
    drill_fields: [encounter_type, count_not_null_encounters]
    link: {
      label: "Drill by Referral Channel"
      url: "{{ link }}&fields=encounter_details.visit_status,encounter_details.count_not_null_encounters"
    }
    link: {
      label: "Drill by Referral Program"
      url: "{{ link }}&fields=patient_encounter_summary.referral_program,encounter_details.count_not_null_encounters"
    }
  }

  measure: completed_encounters {
    type: count
    filters: []
    drill_fields: [encounter_uuid, date_of_service_date, visit_provider, patient_encounter_summary.referral_program]
    link: {
      label: "Break out by Encounter Type"
      url: "{{ link }}&fields=encounter_details.encounter_type,encounter_details.count_not_null_encounters"
    }
  }
}
