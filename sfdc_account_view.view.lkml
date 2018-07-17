view: sfdc_account_view {
  sql_table_name: sfdc.account ;;
  # dimensions #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: annual_revenue {
    type: number
    sql: NULLIF(${TABLE}.annualrevenue,'') ;;
    group_label: "Company Information"
    hidden: yes
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billingcity ;;
    group_label: "Company Information"
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billingcountry ;;
    group_label: "Company Information"
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billinglatitude ;;
    group_label: "Company Information"
    hidden: yes
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billinglongitude ;;
    group_label: "Company Information"
    hidden: yes
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billingpostalcode ;;
    group_label: "Company Information"
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billingstate ;;
    group_label: "Company Information"
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billingstreet ;;
    hidden: yes
    group_label: "Company Information"
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
    group_label: "Company Information"
  }

  dimension: duns_number {
    type: string
    sql: ${TABLE}.dunsnumber ;;
    group_label: "Company Information"
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
    hidden: yes
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
    group_label: "Company Information"
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted = 'True' ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: naics_desc {
    type: string
    sql: ${TABLE}.naicsdesc ;;
    group_label: "Company Information"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    group_label: "Company Information"
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.numberofemployees ;;
    group_label: "Company Information"
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
    hidden: yes
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photourl ;;
    hidden: yes
  }

  dimension: record_type_id {
    type: string
    hidden: yes
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shippingcity ;;
    hidden: yes
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shippingcountry ;;
    hidden: yes
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shippinglatitude ;;
    hidden: yes
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shippinglongitude ;;
    hidden: yes
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shippingpostalcode ;;
    hidden: yes
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shippingstate ;;
    hidden: yes
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shippingstreet ;;
    hidden: yes
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
    hidden: yes
  }

  dimension: type {
    type: string
    label: "Account Type"
    sql: NULLIF(${TABLE}.type,'') ;;
    group_label: "Company Information"
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
    hidden: yes
  }

  # custom dimensions

  dimension: open_opportunities_hidden {
    type: number
    sql: ${TABLE}.open_direct_opportunities__c ;;
    description: "Number of open opportunities associated with account"
    hidden: yes
  }

  dimension: owner {
    type: string
    sql: NULLIF(${TABLE}.account_owner_name__c,'') ;;
    group_label: "Sales Ownership"
  }

  dimension: id_account_sfdc_18 {
    type: string
    sql: ${TABLE}.account_sfdc_18__c ;;
    description: "Non-case sensitive SFDC ID"
    hidden: yes
  }

  dimension: customer_service_specialist {
    type: string
    sql: NULLIF(${TABLE}.css__c,'') ;;
    group_label: "Sales Ownership"
  }

  dimension: account_advertiser_history {
    type: string
    sql: ${TABLE}.advertiser_account_status__c ;;
    description: "Relationship and recency of client to LI's ad-side business"
    group_label: "Relationship to LiveIntent"
  }

  dimension: id_associated_agency {
    type: string
    sql: ${TABLE}.associated_agency__c ;;
    description: "Associated agency ID"
    hidden: yes
  }

  dimension: associated_agency_owner {
    type: string
    sql: ${TABLE}.associated_agency_owner__c ;;
    description: "Owner of agency associated with account"
    group_label: "Sales Ownership"
  }

  dimension: projected_legacy_date {
    type: string
    sql: ${TABLE}.client_becomes_legacy__c ;;
    description: "Time in which a client will convert to a legacy client"
    group_label: "Relationship to LiveIntent"
  }

  dimension: client_classification_type {
    type: string
    sql: ${TABLE}.client_classification__c ;;
    description: "Is client media, SMB, or brand"
    group_label: "Commissions"
  }

  dimension: client_id {
    type: number
    #sql: NULLIF(REGEXP_SUBSTR(${TABLE}.client_id__c,'^[^.]*'),'')) ;;
    sql: NULLIF(${TABLE}.client_id__c,'')::DECIMAL(18,0)::INT ;;
    description: "ID for matching SFDC to LFM"
    hidden: yes
  }

  dimension: core_tier_advertiser {
    type: string
    sql: ${TABLE}.core_tier__c ;;
    description: "Tiers for core advertiser clients"
    group_label: "Relationship to LiveIntent"
  }

  dimension: core_tier_publisher {
    type: string
    sql: ${TABLE}.core_publisher_tier__c ;;
    description: "Tiers for core publisher clients"
    group_label: "Relationship to LiveIntent"
  }

  dimension: css_email {
    type: string
    sql: ${TABLE}.css_email__c ;;
    description: "Client Services Specialist email address"
    hidden: yes
  }

  dimension: css_manager {
    type: string
    sql: ${TABLE}.css_lead__c ;;
    label: "Client Services Specalist Manager"
    group_label: "Sales Ownership"
  }

  dimension: css_manager_email {
    type: string
    sql: ${TABLE}.css_lead_email__c ;;
    description: "Client Services Specialist manager email address"
    hidden: yes
  }

  dimension: current_fq_commission_account_type {
    type: string
    sql: ${TABLE}.current_fq_commission_classification__c ;;
    label: "Current FQ Commission Account Type"
    description: "New or legacy account for current financial quarter commissions"
    group_label: "Commissions"
  }

  dimension: customer_success_director {
    type: string
    sql: ${TABLE}.customer_success_director__c ;;
    group_label: "Sales Ownership"
  }

  dimension: customer_success_director_email {
    type: string
    sql: ${TABLE}.customer_success_director_email__c ;;
    hidden: yes
  }

  dimension: customer_success_manager {
    type: string
    sql: ${TABLE}.primary_account_manager__c ;;
    group_label: "Sales Ownership"
  }

  dimension: customer_success_manager_email {
    type: string
    sql: ${TABLE}.customer_success_manager_email__c ;;
    hidden: yes
  }

  dimension: datanyze_ad_server {
    type: string
    sql: ${TABLE}.datanyze_ad_server__c ;;
    group_label: "Datanyze Information"
    label: "Vendors: Ad Server"
  }

  dimension: datanyze_address {
    type: string
    sql: ${TABLE}.datanyze_address__c ;;
    label: "Location: Street Address"
    group_label: "Datanyze Information"
    description: "Company Street Address"
  }

  dimension: datanyze_alexa_rank {
    type: number
    sql: NULLIF(REGEXP_SUBSTR(${TABLE}.datanyze_alexa_rank__c,'^[^.]*'),'')) ;;
    label: "Alexa Rank"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_cdp {
    type: string
    sql: ${TABLE}.datanyze_cdp__c ;;
    label: "Vendors: Customer Data Platform"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_city {
    type: string
    sql: ${TABLE}.datanyze_city__c ;;
    label: "Location: City"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_country {
    type: string
    sql: ${TABLE}.datanyze_country__c ;;
    label: "Location: Country"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_crm {
    type: string
    sql: ${TABLE}.datanyze_crm__c ;;
    label: "Vendors: Customer Relationship Management Platform"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_description {
    type: string
    sql: ${TABLE}.datanyze_description__c ;;
    label: "Description"
    description: "Datanyze generated description of company"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_dmp {
    type: string
    sql: ${TABLE}.datanyze_dmp__c ;;
    label: "Vendors: Data Management Platform"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_dsp {
    type: string
    sql: ${TABLE}.datanyze_dsp__c ;;
    label: "Vendors: Demand Side Platform"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_employees {
    type: string
    sql: ${TABLE}.datanyze_employees__c ;;
    label: "Company Size"
    description: "Number of employees"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_esp {
    type: string
    sql: ${TABLE}.datanyze_esp__c ;;
    label: "Vendors: Email Service Provider"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_funding {
    type: string
    sql: ${TABLE}.datanyze_funding__c ;;
    label: "Funding"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_industry {
    type: string
    sql: ${TABLE}.datanyze_industry__c ;;
    label: "Industry"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_phone {
    type: string
    sql: ${TABLE}.datanyze_phone__c ;;
    label: "Phone Number"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_product_feed_manager {
    type: string
    sql: ${TABLE}.datanyze_product_feed_manager__c ;;
    label: "Vendors: Product Feed Manager"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_public {
    type: yesno
    sql: ${TABLE}.datanyze_public__c = 'True' ;;
    label: "Is_Public"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_revenue_size {
    type: string
    sql: ${TABLE}.datanyze_revenue__c ;;
    label: "Revenue Size"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_state {
    type: string
    sql: ${TABLE}.datanyze_state__c ;;
    label: "Location: State"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_tag_manager {
    type: string
    sql: ${TABLE}.datanyze_tag_manager__c ;;
    label: "Vendors: Tag Manager"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_website_technologies {
    type: string
    sql: ${TABLE}.datanyze_website_technologies__c ;;
    label: "Vendors: Website Technologies"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_twitter {
    type: string
    sql: '@' || ${TABLE}.datanyze_twitter__c ;;
    label: "Twitter Account"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_website_history {
    type: string
    sql: ${TABLE}.datanyze_website_history__c ;;
    label: "Website History"
    group_label: "Datanyze Information"
    hidden: yes
  }

  dimension: datanyze_year_founded {
    type: date_year
    sql: ${TABLE}.datanyze_year_founded__c ;;
    label: "Year Founded"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_zip_postal_code {
    type: zipcode
    sql: ${TABLE}.datanyze_zip_postal_code__c ;;
    label: "Location: Postal Code"
    group_label: "Datanyze Information"
  }

  dimension: datanyze_days_since_last_updated {
    type: number
    sql: ${TABLE}.datanyze_days_since_last_activity__c ;;
    label: "Days Since Information Updated"
    group_label: "Datanyze Information"
  }

  dimension_group: first_opportunity {
    type: time
    sql: NULLIF(${TABLE}.minimum_of_opportunity_created_date__c,'')::DATE ;;
    description: "Date of first ever opportunity associated with account"
    timeframes: [raw,date,month,quarter,year]
  }

  dimension: full_set_up_status {
    type: string
    sql: ${TABLE}.full_set_up__c ;;
    group_label: "LI Products Used"
  }

  dimension: house_status {
    type: string
    sql: ${TABLE}.house_status__c ;;
    description: "CSM ownership status as 'house' in current FQ commissions"
    group_label: "Commissions"
  }

  dimension: impressions_above_threshold {
    type: yesno
    sql: ${TABLE}.impressions_above_threshold__c ;;
    description: "Has account hit impression milestone counting towards full set-up status"
    group_label: "LI Products Used"
  }

  dimension: last_date_opportunity_closed_won {
    type: date
    sql: NULLIF(${TABLE}.last_closed_won_date__c,'')::DATE ;;
    description: "Close date of latest won opportunity"
  }

  dimension: last_date_marked_new {
    type: date
    sql: NULLIF(${TABLE}.last_day_new__c,'')::DATE ;;
    description: "Last date account marked as 'new' for legacy formulas"
    hidden: yes
  }

  dimension: last_day_ownership_changed {
    type: date
    sql: NULLIF(${TABLE}.last_day_new__c,'')::DATE ;;
    description: "Last date account ownership was changed"
    group_label: "Sales Ownership"
  }

  dimension: is_lbm_client {
    type: yesno
    sql: ${TABLE}.lbm_client__c = 'True' ;;
    description: "Account is self-service client"
    group_label: "LI Products Used"
  }

  dimension: has_liveconnect_tag_placed {
    type: yesno
    sql: ${TABLE}.liveconnect_tag_down__c = 'True' ;;
    description: "LiveConnect tag placed on site"
    group_label: "LI Products Used"
  }

  dimension: last_date_opportunity_creation {
    type: date
    sql: NULLIF(${TABLE}.most_recent_opportunity_create_date__c,'')::DATE ;;
    description: "Last date opportunity was created for account"
    group_label: "Relationship to LiveIntent"
  }

  dimension: is_legacy_client__hidden {
    # There are no values in the DB, still used?
    type: yesno
    sql: LOWER(${TABLE}.new_vs_legacy__c) = 'legacy' ;;
    description: "Client marked as legacy client"
    hidden: yes
  }

  dimension: id_platform_development_specialist {
    # Seems to be infrequently used, most accounts are blank
    type: string
    sql: ${TABLE}.pds__c ;;
    description: "ID of associated PDS"
    hidden: yes
  }

  dimension: platform_development_specialist_email {
    type: string
    sql: ${TABLE}.pds_email__c ;;
    description: "Email of associated PDS"
    hidden: yes
  }

  dimension: platform_development_specialist_manager_email {
    type: string
    sql: ${TABLE}.pds_lead_email__c ;;
    description: "Email of associated PDS' manager"
    hidden: yes
  }

  dimension: account_publisher_history {
    type: string
    sql: ${TABLE}.platform_account_status__c ;;
    description: "Relationship and recency of client to LI's publisher-side business"
    group_label: "Relationship to LiveIntent"
  }

  dimension: is_legacy_client {
    type: yesno
    sql: LOWER(NULLIF(${TABLE}.revenue_classification__c,'')) = 'legacy' ;;
    description: "If true then client is legacy. If false client is new. If null client is neither"
    group_label: "Relationship to LiveIntent"
    }

  dimension: sales_director {
    type: string
    sql: ${TABLE}.sales_director__c ;;
    group_label: "Sales Ownership"
  }

  dimension: sales_director_email {
    type: string
    sql: ${TABLE}.sales_director_email__c ;;
    description: "Email of associated sales director"
    hidden: yes
  }

  dimension: id_sfdc_2 {
    # What is the point of this field?
    type: string
    sql: ${TABLE}.salesforce_id2__c ;;
    description: "Repeat of SFDC ID"
    hidden: yes
  }

  dimension: has_spend_above_threshold {
    type: yesno
    sql: ${TABLE}.spend_above_threshold__c = 'True' ;;
    description: "Is spend above the threshold needed towards full set-up status?"
    group_label: "LI Products Used"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status__c ;;
    description: "Current state of account in sales organization"
    group_label: "Relationship to LiveIntent"
  }

  dimension: attributed_prospecting_source {
    type: string
    sql: NULLIF(${TABLE}.strategic_initiatives__c,'') ;;
    description: "Prospecting source attributed to account"
    group_label: "Relationship to LiveIntent"
  }

  dimension: li_tag_manager {
    # Has 17 accounts total with values, hiding
    type: string
    sql: NULLIF(${TABLE}.tag_manger__c,'') ;;
    description: "Manually entered value for tag manager used"
    hidden: yes
  }

  dimension: is_white_glove_enabled {
    type: yesno
    sql: NULLIF(${TABLE}.white_glove_strategic__c,'') = 'True' ;;
    description: "Account approved to recieve 'white glove' marketing support"
    group_label: "Relationship to LiveIntent"
  }

  dimension: account_manager_email {
    # Lots of obsolete values
    type: string
    sql: NULLIF(${TABLE}.account_manager_email__c,'') ;;
    description: "Email of associated account manager"
    hidden: yes
  }

  dimension: owner_role {
    # Can be covered elsewhere through a join
    type: string
    sql: NULLIF(${TABLE}.account_owner_role__c,'') ;;
    description: "Organization team of owner"
    group_label: "Sales Ownership"
  }

  dimension: owner_email {
    type: string
    sql: NULLIF(${TABLE}.account_owner_email__c,'') ;;
    description: "Email address of owner"
    hidden: yes
  }

  dimension: furthest_won_flight_end_brand  {
    type: date
    sql: NULLIF(${TABLE}.greatest_closed_won_brand_flight_end__c,'')::DATE ;;
    description: "Maximum flight end date for won brand opportunities"
  }

  dimension: furthest_won_flight_end_direct {
    type: date
    sql: NULLIF(${TABLE}.greatest_closed_won_flight_end__c,'')::DATE ;;
    description: "Maximum flight end date for won direct opportunities"
  }

  dimension: account_manager {
    # Lots of obsolete values, hiding
    type: string
    sql: NULLIF(${TABLE}.account_manager_name__c,'') ;;
    group_label: "Sales Ownership"
    hidden: yes
  }

  dimension: li_description {
    # What is the difference between this is and the regular description field?
    type: string
    sql: NULLIF(${TABLE}.company_description__c,'') ;;
    description: "Description of account"
    hidden: yes
  }

  dimension: is_current_client {
    # Notes indicate this is for a SFDC backend trigger, not sure why it was requested to be included
    type: yesno
    sql: NULLIF(${TABLE}.current_client__c,'') = 'True' ;;
    group_label: "Relationship to LiveIntent"
  }

  dimension: is_customer_advocate {
    # Again, notes indicate this is a marketing program field, not sure why it was requested to be included
    type: yesno
    sql: NULLIF(${TABLE}.customer_advocate__c,'') = 'True' ;;
    group_label: "Relationship to LiveIntent"
  }

  dimension: has_direct_integration {
    type: yesno
    sql: NULLIF(${TABLE}.direct_integration__c,'') = 'True' ;;
    description: "If tech partner, do they have a direct integration with LI?"
    group_label: "Relationship to LiveIntent"
  }

  dimension: li_email_service_provider {
    type: string
    sql: NULLIF(${TABLE}.email_service_provider_del__c,'') ;;
    description: "Manually entered ESP for account"
    hidden: yes
  }

  dimension: first_date_opportunity_closed_won {
    type: date
    sql: NULLIF(${TABLE}.first_opportunity_won_date__c,'')::DATE ;;
    description: "Close date of the first won opportunity associated with account"
  }

  dimension: first_date_opportunity_created_and_closed_won {
    type: date
    sql: NULLIF(${TABLE}.first_opportunity_won_created_date__c,'')::DATE ;;
    description: "Creation date of the first won opportunity associated with account"
  }

  dimension: gdpr_tier {
    type: number
    sql: NULLIF(${TABLE}.gdpr_tier__c,'') ;;
    label: "GDPR Tier"
    description: "GDPR documents status"
  }

  dimension: has_rtb_spend_above_threshold {
    type: yesno
    sql: NULLIF(${TABLE}.rtb_spender__c,'') = 'True' ;;
    description: "Account has hit RTB spend threshold"
    group_label: "Commissions"
  }

  # derived dimensions #

  dimension: days_since_last_won_opportunity {
    type: number
    sql: DATEDIFF(day,${last_date_opportunity_closed_won},CURRENT_DATE) ;;
    group_label: "Relationship to LiveIntent"
  }

  dimension: furthest_won_flight_end_all {
    type: date
    sql: GREATEST(${furthest_won_flight_end_brand},${furthest_won_flight_end_direct}) ;;
    description: "Maximum flight end date for all opportunities"
  }

  dimension: days_since_account_became_client {
    type: number
    sql: DATEDIFF(day,${first_date_opportunity_closed_won},CURRENT_DATE) ;;
    description: "Days since first opportunity closed won"
    group_label: "Relationship to LiveIntent"
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  # custom measures #

  measure: open_opportunities {
    type: sum
    sql: ${open_opportunities_hidden} ;;
    value_format_name: decimal_0
    description: "Sum of open opportunities associated with account"
    group_label: "Summations"
  }

  measure: average_days_being_LI_customer {
    type: average
    sql: ${days_since_account_became_client} ;;
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

    group_label: "Company Information"
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
      field: is_current_client
      value: "True"
    }
  }
}
