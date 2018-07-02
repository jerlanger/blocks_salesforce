view: sfdc_campaign_view {
    sql_table_name: sfdc.campaign ;;

    # dimensions #

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: amount_all_opportunities {
      type: number
      sql: ${TABLE}.amountallopportunities ;;
    }

    dimension: amount_won_opportunities {
      type: number
      sql: ${TABLE}.amountwonopportunities ;;
    }

    dimension: campaign_member_record_type_id {
      type: string
      hidden: yes
      sql: ${TABLE}.campaignmemberrecordtypeid ;;
    }

    dimension: created_by_id {
      type: string
      hidden: yes
      sql: ${TABLE}.createdbyid ;;
    }

    dimension_group: created {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.createddate ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension_group: end {
      type: time
      timeframes: [date, week, month, year]
      convert_tz: no
      sql: TO_DATE(NULLIF(${TABLE}.enddate,''),'YYYY-MM-DD') ;;
    }

    dimension: is_active {
      type: yesno
      sql: ${TABLE}.isactive ;;
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}.isdeleted = 'TRUE' ;;
    }

    dimension_group: last_activity {
      type: time
      timeframes: [date, week, month]
      convert_tz: no
      sql: TO_DATE(NULLIF(${TABLE}.lastactivitydate,''),'YYYY-MM-DD') ;;
    }

    dimension: last_modified_by_id {
      type: string
      hidden: yes
      sql: ${TABLE}.lastmodifiedbyid ;;
    }

    dimension_group: last_modified {
      type: time
      timeframes: [date, week, month]
      sql: ${TABLE}.lastmodifieddate ;;
    }

    dimension_group: last_referenced {
      type: time
      timeframes: [date, week, month]
      sql: TO_DATE(NULLIF(${TABLE}.lastreferenceddate,''),'YYYY-MM-DD') ;;
    }

    dimension_group: last_viewed {
      type: time
      timeframes: [date, week, month]
      sql: TO_DATE(NULLIF(${TABLE}.lastvieweddate,''),'YYYY-MM-DD') ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: number_of_contacts {
      type: number
      sql: ${TABLE}.numberofcontacts ;;
    }

    dimension: number_of_converted_leads {
      type: number
      sql: ${TABLE}.numberofconvertedleads ;;
    }

    dimension: number_of_leads {
      type: number
      sql: ${TABLE}.numberofleads ;;
    }

    dimension: number_of_opportunities {
      type: number
      sql: ${TABLE}.numberofopportunities ;;
    }

    dimension: number_of_responses {
      type: number
      sql: ${TABLE}.numberofresponses ;;
    }

    dimension: number_of_won_opportunities {
      type: number
      sql: ${TABLE}.numberofwonopportunities ;;
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

    dimension_group: start {
      type: time
      timeframes: [date, week, month]
      convert_tz: no
      sql: TO_DATE(NULLIF(${TABLE}.startdate,''),'YYYY-MM-DD');;
    }

    dimension: status {
      type: string
      sql: ${TABLE}.status ;;
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

    # measures #

    measure: count {
      type: count
      drill_fields: [id, name]
    }
  }

view: campaign {
  extends: [sfdc_campaign_view]
}
