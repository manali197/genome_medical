view: completed_encounters {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:
      WITH lp AS (
        SELECT
            lp.data ->> 'first_name' AS first_name,
            lp.data ->>  'last_name' AS last_name,
            lp.data ->>  'email' AS email,
            lp.uuid::text AS patient_uuid,
            lp.data -> 'referral_reason_ids' -> 0 AS patient_referral_reason,
            etr.date_of_service AS date_of_service,
            etr.type AS type,
            etr.encounter_subtype AS encounter_subtype,
            c.consultation_type AS consultation_type,
            s.vsee_specialty AS vsee_specialty,
            s.provider_indicated_specialty AS provider_indicated_specialty,
            b.payor AS payor,
            b.units AS units,
            etr.partner_uuid AS partner_uuid
        FROM
        LEFT JOIN
            billing AS b
        ON
            etr.uuid = b.encounter_uuid
        LEFT JOIN
            (
                SELECT
                    jsonb_array_elements(data -> 'lab_patients') AS data,
                    patients.data ->>'is_deleted' AS is_deleted,
                    uuid
                FROM
                    patients
            ) AS lp
        ON
            (lp.data ->> 'uuid')::uuid = c.lab_patient_uuid
        WHERE
            etr.type = 'lab_test_authorization' and (c.order_request_status in ('approved', 'rejected'))
            AND lp.is_deleted = 'false'
    ),
      ),
      mgr AS (
        SELECT
            to_char(to_date(eg.data ->> 'date_of_service', 'YYYY-MM-DD HH24:MI:SS'), 'MM/DD/YYYY') AS "Date of Service (UTC)",
            'N/A' AS "Patient Name",
            'N/A'  AS "Email",
            eg.data ->> 'referral_program' AS "Referral Program",
            'N/A' AS "Referral Partner",
            'Health Systems' AS "Referral Channel",
            'N/A' AS "Referral Reason",
            'Medical Geneticist' AS "Encounter Type",
            'N/A' AS "Encounter Subtype",
            'N/A' AS "Consultation Type",
            'N/A' AS "Payor",
            (NULL)::int AS "Units",
            'N/A' AS "Requested Specialty",
            'N/A' AS "Provider Indicated Specialty"
        FROM
            mg_encounters AS eg
        WHERE
            to_date(eg.data ->> 'date_of_service', 'YYYY-MM-DD HH24:MI:SS') between '%s' AND '%s'
    )
    SELECT * FROM final_from_db
    UNION ALL
    SELECT* FROM mgr ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: user_id {
    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_orders {
    description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension_group: most_recent_purchase {
    description: "The date when each user last ordered"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.most_recent_purchase_at ;;
  }

  measure: total_lifetime_orders {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${lifetime_orders} ;;
  }
}
