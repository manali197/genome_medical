view: partners {
  sql_table_name: public.partners ;;

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: nullif(jsonb_extract_path(${TABLE}.data, 'id')::text, '')::int ;;
  }

  dimension: name {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'name')::text ;;
  }

  dimension: display_name {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'display_name')::text ;;
  }

  dimension: partner_organization_ids {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'partner_organization_ids')::text ;;
  }

  dimension: referral_channel_id {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'referral_channel_id')::text ;;
  }

  dimension: insurance_enabled {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'insurance_enabled')::text ;;
  }

  dimension: eligibility_referral_code {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'eligibility_referral_code')::boolean ;;
  }

  dimension: insurance_package_address {
    type: string
    sql: jsonb_extract_path(${TABLE}.data, 'insurance_package_address')::boolean ;;
  }

  dimension: price_per_webinar_package {
    type: number
    sql: jsonb_extract_path(${TABLE}.data, 'price_per_webinar_package')::number ;;
  }

  dimension: self_registration_enabled {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'self_registration_enabled')::boolean ;;
  }

  dimension: specific_consultations_only {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'specific_consultations_only')::boolean ;;
  }

  dimension: insurance_claim_balance_bill {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'insurance_claim_balance_bill')::boolean ;;
  }

  dimension: referral_api_address_required {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'referral_api_address_required')::boolean ;;
  }

  dimension: allow_patients_register_notify {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'allow_patients_register_notify')::boolean ;;
  }

  dimension: allow_patients_self_scheduling {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'allow_patients_self_scheduling')::boolean ;;
  }

  dimension: send_patient_registration_link {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'send_patient_registration_link')::boolean ;;
  }

  dimension: allow_patients_reminders_notify {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'allow_patients_reminders_notify')::boolean ;;
  }

  dimension: referral_outreach_automation_enabled {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'referral_outreach_automation_enabled')::boolean ;;
  }

  dimension: send_actionability_determination_flag {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'send_actionability_determination_flag')::boolean ;;
  }

  dimension: last_modified_patient_reminder_flag_at {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'last_modified_patient_reminder_flag_at')::date ;;
  }

  dimension: release_result_cap_upon_result_receipt {
    type: yesno
    sql: jsonb_extract_path(${TABLE}.data, 'release_result_cap_upon_result_receipt')::boolean ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}."test" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
