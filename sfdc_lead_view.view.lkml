view: sfdc_lead_view {
  sql_table_name: sfdc.lead ;;
  # dimensions #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annualrevenue ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_duns_number {
    type: string
    sql: ${TABLE}.companydunsnumber ;;
  }

  dimension: converted_account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.convertedaccountid ;;
  }

  dimension: converted_contact_id {
    type: string
    hidden: yes
    sql: ${TABLE}.convertedcontactid ;;
  }

  dimension_group: converted {
    type: time
    timeframes: [time, date, week, month]
    convert_tz: no
    sql: ${TABLE}.converteddate ;;
  }

  dimension: converted_opportunity_id {
    type: string
    hidden: yes
    sql: ${TABLE}.convertedopportunityid ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: created_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createddate ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_bounced {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.emailbounceddate ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.emailbouncedreason ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.isconverted = 'TRUE';;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted = 'TRUE';;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.isunreadbyowner ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.lastactivitydate ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: master_record_id {
    type: string
    hidden: yes
    sql: ${TABLE}.masterrecordid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.numberofemployees ;;
  }

  dimension: owner_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ownerid ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photourl ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalcode ;;
  }

  dimension: record_type_id {
    type: string
    hidden: yes
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, name]
  }
  }

view: lead {
  extends: [sfdc_lead_view]

  dimension: name {
    html: <a href="https://na9.salesforce.com/{{ lead.id._value }}" target="_new">
      <img src="https://www.salesforce.com/favicon.ico" height=16 width=16></a>
      {{ linked_value }}
      ;;
  }

  dimension: number_of_employees_tier {
    type: tier
    tiers: [
      0,
      1,
      11,
      51,
      201,
      501,
      1001,
      5001,
      10000
    ]
    sql: ${number_of_employees} ;;
    style: integer
    description: "Number of Employees as reported on the Salesforce lead"
  }

  measure: converted_to_contact_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_contact_id
      value: "-null"
    }
  }

  measure: converted_to_account_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_account_id
      value: "-null"
    }
  }

  measure: converted_to_opportunity_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_opportunity_id
      value: "-null"
    }
  }

  measure: conversion_to_contact_percent {
    sql: 100.00 * ${converted_to_contact_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_account_percent {
    sql: 100.00 * ${converted_to_account_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_opportunity_percent {
    sql: 100.00 * ${converted_to_opportunity_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  set: detail {
    fields: [
      id,
      company,
      name,
      title,
      phone,
      email,
      status
    ]
  }
}
