view: sfdc_account_view {
  sql_table_name: sfdc.account ;;
  # dimensions #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: annual_revenue {
    type: number
    sql: NULLIF(${TABLE}.annualrevenue,'') ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billingcity ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billingcountry ;;
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billinglatitude ;;
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billinglongitude ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billingpostalcode ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billingstate ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billingstreet ;;
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

  dimension: duns_number {
    type: string
    sql: ${TABLE}.dunsnumber ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted = 'TRUE' ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.lastactivitydate ;;
  }

  dimension: last_modified_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: master_record_id {
    type: string
    hidden: yes
    sql: ${TABLE}.masterrecordid ;;
  }

  dimension: naics_code {
    type: string
    sql: ${TABLE}.naicscode ;;
  }

  dimension: naics_desc {
    type: string
    sql: ${TABLE}.naicsdesc ;;
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

  dimension: parent_id {
    type: string
    hidden: yes
    sql: ${TABLE}.parentid ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photourl ;;
  }

  dimension: record_type_id {
    type: string
    hidden: yes
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shippingcity ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shippingcountry ;;
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shippinglatitude ;;
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shippinglongitude ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shippingpostalcode ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shippingstate ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shippingstreet ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [id, name]
  }


}

view: account {
  extends: [sfdc_account_view]
  # dimensions #

  dimension: created {
    #X# Invalid LookML inside "dimension": {"timeframes":["date","week","month","raw"]}
  }

  dimension: business_segment {
    type: string

    case: {
      when: {
        sql: ${number_of_employees} BETWEEN 0 AND 500 ;;
        label: "Small Business"
      }

      when: {
        sql: ${number_of_employees} BETWEEN 501 AND 1000 ;;
        label: "Mid-Market"
      }

      when: {
        sql: ${number_of_employees} > 1000 ;;
        label: "Enterprise"
      }

      else: "Unknown"
    }
  }

  # measures #

  measure: percent_of_accounts {
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: average_annual_revenue {
    type: average
    sql: ${annual_revenue} ;;
    value_format: "$#,##0"
  }

  measure: total_number_of_employees {
    type: sum
    sql: ${number_of_employees} ;;
  }

  measure: average_number_of_employees {
    type: average
    sql: ${number_of_employees} ;;
  }

  measure: count_customers {
    type: count

    filters: {
      field: account.type
      value: "\"Customer\""
    }
  }
}
