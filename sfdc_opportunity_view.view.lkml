view: sfdc_opportunity_view {
    sql_table_name: sfdc.opportunity ;;

    # dimensions #

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: account_id {
      type: string
      hidden: yes
      sql: ${TABLE}.accountid ;;
    }

    dimension: amount {
      type: number
      sql: NULLIF(${TABLE}.amount,'') ;;
    }

    dimension: campaign_id {
      type: string
      hidden: yes
      sql: ${TABLE}.campaignid ;;
    }

    dimension_group: close {
      type: time
      timeframes: [date, week, month, raw]
      convert_tz: no
      sql: ${TABLE}.closedate::DATE ;;
    }

    dimension: created_by_id {
      type: string
      hidden: yes
      sql: ${TABLE}.createdbyid ;;
    }

    dimension_group: created {
      type: time
      timeframes: [date, week, month, raw]
      sql: ${TABLE}.createddate::DATE ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: fiscal {
      type: string
      sql: ${TABLE}.fiscal ;;
      hidden: yes
    }

    dimension: fiscal_quarter {
      type: number
      sql: ${TABLE}.fiscalquarter ;;
    }

    dimension: fiscal_year {
      type: number
      sql: ${TABLE}.fiscalyear ;;
    }

    dimension: forecast_category {
      type: string
      sql: ${TABLE}.forecastcategory ;;
      hidden: yes
    }

    dimension: forecast_category_name {
      type: string
      sql: ${TABLE}.forecastcategoryname ;;
      group_label: "Status"
    }

    dimension: has_opportunity_line_item {
      type: yesno
      sql: ${TABLE}.has_opportunitylineitem = 'true';;
    }

    dimension: is_closed {
      type: yesno
      sql: ${TABLE}.isclosed = 'true';;
      group_label: "Status"
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}.isdeleted = 'true';;
      group_label: "Status"
    }

    dimension: is_won {
      type: yesno
      sql: ${TABLE}.iswon = 'true';;
      group_label: "Status"
    }

    dimension_group: last_activity {
      type: time
      timeframes: [date, week, month]
      convert_tz: no
      sql: ${TABLE}.lastactivitydate::DATE ;;
    }

    dimension: last_modified_by_id {
      type: string
      hidden: yes
      sql: ${TABLE}.lastmodifiedbyid ;;
    }

    dimension_group: last_modified {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.lastmodifieddate::DATE ;;
    }

    dimension_group: last_referenced {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.lastreferenceddate::DATE ;;
    }

    dimension_group: last_viewed {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.lastvieweddate:DATE ;;
    }

    dimension: lead_source {
      type: string
      sql: ${TABLE}.leadsource ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: owner_id {
      type: string
      hidden: yes
      sql: ${TABLE}.ownerid ;;
    }

    dimension: pricebook_2_id {
      type: string
      hidden: yes
      sql: ${TABLE}.pricebook2id ;;
    }

    dimension: probability {
      type: number
      sql: ${TABLE}.probability ;;
      group_label: "Status"
    }

    dimension: stage_name {
      type: string
      sql: ${TABLE}.stagename ;;
      group_label: "Status"
    }

    dimension: synced_quote_id {
      type: string
      hidden: yes
      sql: ${TABLE}.syncedquoteid ;;
    }

    dimension_group: system_modstamp {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.systemmodstamp ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
    }

    # Custom Dimensions

    dimension: associated_trading_desk_id {
      type: string
      sql: ${TABLE}.associated_trading_desk__c ;;
      hidden: yes
    }

    dimension: billing_numbers {
      type: string
      sql: ${TABLE}.billing_numbers__c ;;
      description: "Is billing off of LiveIntent numbers or other"
    }

    dimension: brand_advertiser_id {
      type: string
      sql: ${TABLE}.brand_advertiser__c ;;
      hidden: yes
    }

    dimension: brand_id {
      type: string
      sql: ${TABLE}.brand_id__c ;;
      hidden: yes
      description: "If agency opportunity, ID of brand represented"
    }

    dimension: brand_owner_id {
      type: string
      sql: ${TABLE}.brand_owner__c ;;
      hidden: yes
      description: "Owner of SFDC brand account"
    }

    dimension: campaign_duration {
      type: number
      sql: ${TABLE}.campaign_flight_length__c ;;
      value_format_name: decimal_0
      description: "Length of Campaign"
    }

    dimension: css_email {
      type: string
      sql: ${TABLE}.css_email__c ;;
      label: "CSS Email"
      description: "Client services specialist email"
    }

    dimension: client_services_manager {
      type: string
      sql: ${TABLE}.account_manager__c ;;
      description: "ID of CSM on opportunity"
      hidden: yes
    }

    dimension: direct_sold_monthly_impressions {
      type: number
      sql: ${TABLE}.direct_sold_monthly_impressions ;;
      description: "Expected direct sold impressions"
      value_format_name: decimal_0
    }

    dimension: dsp_id {
      type: string
      sql: ${TABLE}.dsp__c ;;
      description: "ID of associated DSP (for RTB opportunities)"
      hidden: yes
    }

    dimension: has_agreement {
      type: yesno
      sql: ${TABLE}.has_agreement__c = 'true' ;;
      description: "Agreement associated with opportunity"
    }

    dimension: iab_category {
      type: string
      sql: ${TABLE}.iab_category__c ;;
      label: "IAB Category"
      description: "Primary IAB Category"
    }

    dimension: lfm_io_id {
      type: string
      sql: ${TABLE}.lfm_io_id__c ;;
      label: "LFM Insertion Order"
      description: "Corresponding IO in Liveintent's platform"
      value_format_name: decimal_0
    }

    dimension: css_name {
      type: string
      sql: ${TABLE}.opportunity_css__c ;;
      label: "CSS Name"
      description: "Name of CSS associated with the opportunity"
    }

    dimension: inbound_or_outbound_opportunity {
      type: string
      sql: ${TABLE}.opportunity_origin__c ;;
      description: "Source of opportunity"
    }

    dimension: opportunity_sfdc_18_id {
      type: string
      sql: ${TABLE}.opportunity_sfdc_18__c ;;
      description: "18 Character Salesforce ID"
      hidden: yes
    }

    dimension: reason_lost_description {
      type: string
      sql: ${TABLE}.reason_lost__c ;;
      description: "Description of loss reason if marked as 'other'"
    }

    dimension: owner_team {
      type: string
      sql: ${TABLE}.owner_team__c ;;
      description: "The Liveintent team that the opportunity owner belongs to"
    }

    dimension: pct_direct_sold_impressions {
      type: number
      sql: ${TABLE}.directsold__c ;;
      description: "Expected direct sold impressions ÷ total opportunity impressions"
    }

    dimension: number_campaigns_associated {
      type: number
      sql: ${TABLE}.product_count__c ;;
      description: "Number of campaigns associated with opportunity"
      value_format_name: decimal_0
    }

    dimension: reason_lost {
      type: string
      sql: ${TABLE}.reason_lost__c ;;
      description: "Reason opportunity was lost"
    }

    dimension: stalled_reason {
      type: string
      sql: ${TABLE}.stalled_reason__c ;;
      description: "Reason opportunity has been marked as 'stalled'"
    }

    dimension: expected_monthly_impressions {
      type: number
      sql: ${TABLE}.impressions__c ;;
      #description: "Expected monthly impressions"
      value_format_name: decimal_0
    }

    dimension: expected_ad_units {
      type: number
      sql: ${TABLE}.ad_units_added__c ;;
      value_format_name: decimal_0
      description: "Number of ad units expected to be added"
    }

    dimension: has_incremental_budget_added {
      type: yesno
      sql: ${TABLE}.incremental__c = 'true' ;;
      description: "Client has added incremental budget to opportunity"
    }

    # measures #

    measure: count {
      type: count
      drill_fields: [id, name, stage_name, forecast_category_name]
    }
  }

view: opportunity {
  extends: [sfdc_opportunity_view]

  # dimensions #

  dimension: is_lost {
    type: yesno
    sql: ${is_closed} AND NOT ${is_won} ;;
  }

  dimension: probability_group {
    case: {
      when: {
        sql: ${probability} = 100 ;;
        label: "Won"
      }

      when: {
        sql: ${probability} > 80 ;;
        label: "Above 80%"
      }

      when: {
        sql: ${probability} > 60 ;;
        label: "60 - 80%"
      }

      when: {
        sql: ${probability} > 40 ;;
        label: "40 - 60%"
      }

      when: {
        sql: ${probability} > 20 ;;
        label: "20 - 40%"
      }

      when: {
        sql: ${probability} > 0 ;;
        label: "Under 20%"
      }

      when: {
        sql: ${probability} = 0 ;;
        label: "Lost"
      }
    }
  }

  dimension: days_open {
    type: number
    sql: datediff(days, ${created_raw}, coalesce(${close_raw}, current_date) ) ;;
  }

  dimension: created_to_closed_in_60 {
    hidden: yes
    type: yesno
    sql: ${days_open} <=60 AND ${is_closed} = 'yes' AND ${is_won} = 'yes' ;;
  }

  # measures #

  measure: total_revenue {
    type: sum
    sql: ${amount} ;;
    value_format: "$#,##0"
  }

  measure: average_revenue_won {
    label: "Average Revenue (Closed/Won)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_won
      value: "Yes"
    }

    value_format: "$#,##0"
  }

  measure: average_revenue_lost {
    label: "Average Revenue (Closed/Lost)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_lost
      value: "Yes"
    }

    value_format: "$#,##0"
  }

  measure: total_pipeline_revenue {
    type: sum
    sql: ${amount} ;;

    filters: {
      field: is_closed
      value: "No"
    }

    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";$0.00"
  }

  measure: average_deal_size {
    type: average
    sql: ${amount} ;;
    value_format: "$#,##0"
  }

  measure: count_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: average_days_open {
    type: average
    sql: ${days_open} ;;
  }

  measure: count_closed {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }
  }

  measure: count_open {
    type: count

    filters: {
      field: is_closed
      value: "No"
    }
  }

  measure: count_lost {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }

    filters: {
      field: is_won
      value: "No"
    }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: win_percentage {
    type: number
    sql: 100.00 * ${count_won} / NULLIF(${count_closed}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: open_percentage {
    type: number
    sql: 100.00 * ${count_open} / NULLIF(${count}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: count_new_business_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    filters: {
      field: opportunity.type
      value: "\"New Business\""
    }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: count_new_business {
    type: count

    filters: {
      field: opportunity.type
      value: "\"New Business\""
    }

    drill_fields: [opportunity.id, account.name, type]
  }
}
