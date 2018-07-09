view: sfdc_opportunity_product_view {
  sql_table_name: sfdc.opportunity_product ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
    description: "Salesforce product ID"
  }

  dimension: auction_type {
    type: string
    sql: NULLIF(${TABLE}.auction_type__c,'') ;;
    description: "Bidding type: 1st or 2nd Price"
  }

  dimension: bid_amount {
    type: number
    sql: NULLIF(${TABLE}.bid_amount_new__c,'') ;;
    description: "Bid amount as stated in IO and LI platform"
    value_format_name: usd
  }

  dimension: campaign_goal {
    type: string
    sql: NULLIF(${TABLE}.campaign_goal__c,'') ;;
    description: "Goal of campaign"
  }

  dimension: campaign_id {
    type: string
    sql: NULLIF(${TABLE}.campaign_id__c,'') ;;
    description: "LI platform ID"
  }

  dimension: campaign_name {
    type: string
    sql: NULLIF(${TABLE}.campaignname__c,'') ;;
    description: "Campaign name as stated in IO"
  }

  dimension: cpa__c {
    #blank
    type: string
    sql: ${TABLE}.cpa__c ;;
    hidden: yes
  }

  dimension: cpc__c {
    #blank
    type: string
    sql: ${TABLE}.cpc__c ;;
    hidden: yes
  }

  dimension: cpm__c {
    #blank
    type: string
    sql: ${TABLE}.cpm__c ;;
    hidden: yes
  }

  dimension: created_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.createdbyid ;;
  }

  dimension: created_date {
    type: string
    sql: ${TABLE}.createddate ;;
    hidden: yes
  }

  dimension: daily_cap {
    type: number
    sql: NULLIF(${TABLE}.dailycap__c,'') ;;
    description: "Frequency cap"
    value_format_name: usd
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    hidden: yes
  }

  dimension: estimated_budget_hidden {
    type: number
    sql: NULLIF(${TABLE}.estimated_budget__c,'') ;;
    description: "Budget x Probability of Opportunity Being Won"
    value_format_name: usd
    hidden: yes
  }

  dimension: flight_end {
    type: date
    sql: NULLIF(${TABLE}.flightend__c,'')::DATE ;;
    description: "End of campaign"
  }

  dimension: has_quantity_schedule {
    type: yesno
    sql: NULLIF(${TABLE}.hasquantityschedule,'') = 'True' ;;
    hidden: yes
  }

  dimension: has_revenues_chedule {
    type: string
    sql: NULLIF(${TABLE}.hasrevenueschedule,'') = 'True' ;;
    hidden: yes
  }

  dimension: has_schedule {
    type: string
    sql: NULLIF(${TABLE}.hasschedule,'') = 'True' ;;
    hidden: yes
  }

  dimension: is_deleted {
    type: string
    sql: NULLIF(${TABLE}.isdeleted,'') = 'True' ;;
    hidden: yes
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
    hidden: yes
  }

  dimension: last_modified_date {
    type: string
    sql: ${TABLE}.lastmodifieddate ;;
    hidden: yes
  }

  dimension: list_price {
    type: string
    sql: ${TABLE}.listprice ;;
    hidden: yes
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunityid ;;
    hidden: yes
    description: "ID of associated salesforce opportunity"
  }

  dimension: pacing_type {
    type: string
    sql: NULLIF(${TABLE}.pacing__c,'') ;;
    description: "Even or ASAP campaign pacing"
  }

  dimension: pricebook_entry_id {
    type: string
    sql: ${TABLE}.pricebookentryid ;;
    hidden: yes
  }

  dimension: pricing_model {
    type: string
    sql: NULLIF(${TABLE}.pricingmodel__c,'') ;;
    description: "Campaign pricing type: CPA, CPC, or CPM"
  }

  dimension: primary_iab_category {
    type: string
    sql: NULLIF(${TABLE}.primary_iab_category__c,'') ;;
    description: "From LI platform"
    label: "1st IAB Category"
  }

  dimension: product_sfdc_18__id {
    type: string
    sql: ${TABLE}.product_sfdc_18__c ;;
    description: "18 Character SFDC ID"
    hidden: yes
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}.quantity ;;
    hidden: yes
  }

  dimension: secondary_iab_category {
    type: string
    sql: NULLIF(NULLIF(${TABLE}.secondary_iab_category__c,''),'[]') ;;
    description: "From LI Platform"
    label: "2nd IAB Cateogry"
  }

  dimension: flight_start {
    type: date
    sql: NULLIF(${TABLE}.servicedate,'')::DATE ;;
    description: "Start of campaign"
  }

  dimension: sortorder {
    #blank?
    type: string
    sql: ${TABLE}.sortorder ;;
    hidden: yes
  }

  dimension: special_terms {
    type: string
    sql: ${TABLE}.specialterms__c ;;
    description: "Manually entered special terms as listed on IO"
    hidden: yes
  }

  dimension: system_mod_stamp {
    type: string
    sql: ${TABLE}.systemmodstamp ;;
    hidden: yes
  }

  dimension: target_ecpa__c {
    #blank
    type: string
    sql: ${TABLE}.target_ecpa__c ;;
    hidden: yes
  }

  dimension: target_ecpc__c {
    #blank
    type: string
    sql: ${TABLE}.target_ecpc__c ;;
    hidden: yes
  }

  dimension: target_ecpm__c {
    #blank
    type: string
    sql: ${TABLE}.target_ecpm__c ;;
    hidden: yes
  }

  dimension: targeting {
    type: string
    sql: ${TABLE}.targeting__c ;;
    description: "Manually entered targeting parameters"
    hidden: yes
  }

  dimension: totalprice {
    type: string
    sql: ${TABLE}.totalprice ;;
    description: "Unit Price x Quantity"
    hidden: yes
  }

  dimension: budget_hidden {
    type: number
    sql: NULLIF(${TABLE}.unitprice,'') ;;
    value_format_name: usd
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: budget {
    type: sum
    sql: ${budget_hidden} ;;
    value_format_name: usd
  }

  measure: weighted_budget {
    type: sum
    sql: ${estimated_budget_hidden} ;;
    description: "Budget x Probability of Winning Opportunity"
    value_format_name: usd
  }

  dimension: conversions_or_clicks_to_fullfill_hidden {
    type: number
    sql: ROUND(NULLIF(${budget_hidden},'')::FLOAT/NULLIF(${bid_amount}::FLOAT,0),0);;
    description: "Budget ÷ Bid Amount"
    hidden: yes
  }

  measure: conversions_or_clicks_to_fulfill {
    type: sum
    sql: ${conversions_or_clicks_to_fullfill_hidden} ;;
    description: "Sum of (Budget ÷ Bid Amount)"
    group_label: "Summations"
  }
}

view: opportunity_product {
  extends: [sfdc_opportunity_product_view]

}
