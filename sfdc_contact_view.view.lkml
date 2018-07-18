view: sfdc_contact_view {
  sql_table_name: sfdc.contact ;;
  # dimensions #

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.accountid ;;
  }

  dimension: assistant_name {
    type: string
    sql: ${TABLE}.assistantname ;;
    group_label: "Employment Information"
  }

  dimension: assistant_phone {
    type: string
    sql: ${TABLE}.assistantphone ;;
    hidden: yes
  }

  dimension_group: birth {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.birthdate ;;
    hidden: yes
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

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    group_label: "Employment Information"
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    hidden: yes
  }

  dimension_group: email_bounced {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.emailbounceddate ;;
    hidden: yes
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.emailbouncedreason ;;
    hidden: yes
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.firstname ;;
    hidden: yes
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.homephone ;;
    hidden: yes
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted = 'True' ;;
    group_label: "Relationship to LiveIntent"
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.isemailbounced = 'True' ;;
    group_label: "Relationship to LiveIntent"
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
    timeframes: [date, week, month]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.lastname ;;
    hidden: yes
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.leadsource ;;
    group_label: "Relationship to LiveIntent"
  }

  dimension: mailing_city {
    type: string
    label: "City"
    sql: ${TABLE}.mailingcity ;;
    group_label: "Location Information"
  }

  dimension: mailing_country {
    type: string
    label: "Country"
    sql: ${TABLE}.mailingcountry ;;
    group_label: "Location Information"
  }

  dimension: mailing_latitude {
    type: number
    sql: ${TABLE}.mailinglatitude ;;
    hidden: yes
  }

  dimension: mailing_longitude {
    type: number
    sql: ${TABLE}.mailinglongitude ;;
    hidden: yes
  }

  dimension: mailing_postal_code {
    type: string
    label: "Postal Code"
    sql: ${TABLE}.mailingpostalcode ;;
    group_label: "Location Information"
  }

  dimension: mailing_state {
    type: string
    label: "State"
    sql: ${TABLE}.mailingstate ;;
    group_label: "Location Information"
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailingstreet ;;
    hidden: yes
  }

  dimension: master_record_id {
    type: string
    hidden: yes
    sql: ${TABLE}.masterrecordid ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobilephone ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_city {
    type: string
    sql: ${TABLE}.othercity ;;
    hidden: yes
  }

  dimension: other_country {
    type: string
    sql: ${TABLE}.othercountry ;;
    hidden: yes
  }

  dimension: other_latitude {
    type: number
    sql: ${TABLE}.otherlatitude ;;
    hidden: yes
  }

  dimension: other_longitude {
    type: number
    sql: ${TABLE}.otherlongitude ;;
    hidden: yes
  }

  dimension: other_phone {
    type: string
    sql: ${TABLE}.otherphone ;;
    hidden: yes
  }

  dimension: other_postal_code {
    type: string
    sql: ${TABLE}.otherpostalcode ;;
    hidden: yes
  }

  dimension: other_state {
    type: string
    sql: ${TABLE}.otherstate ;;
    hidden: yes
  }

  dimension: other_street {
    type: string
    sql: ${TABLE}.otherstreet ;;
    hidden: yes
  }

  dimension: owner_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ownerid ;;
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

  dimension: reports_to_id {
    type: string
    hidden: yes
    sql: ${TABLE}.reportstoid ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
    hidden: yes
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    group_label: "Employment Information"
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

view: contact {
  extends: [sfdc_contact_view]

  dimension: name {
    html: <a href="mailto:{{ contact.email._value }}" target="_blank">
        <img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Gmail_Icon.png" width="16" height="16" />
      </a>
      {{ linked_value }}
      ;;
  }
}
