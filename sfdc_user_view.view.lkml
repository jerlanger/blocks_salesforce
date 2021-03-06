view: sfdc_user_view {
  sql_table_name: sfdc.user ;;

  # dimensions #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: about_me {
    type: string
    sql: ${TABLE}.aboutme ;;
    hidden: yes
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.accountid ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
    hidden: yes
  }

  dimension: badge_text {
    type: string
    sql: ${TABLE}.badgetext ;;
    hidden: yes
  }

  dimension: call_center_id {
    type: string
    hidden: yes
    sql: ${TABLE}.callcenterid ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    hidden: yes
  }

  dimension: community_nickname {
    type: string
    sql: ${TABLE}.communitynickname ;;
    hidden: yes
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.companyname ;;
    hidden: yes
  }

  dimension: contact_id {
    type: string
    hidden: yes
    sql: ${TABLE}.contactid ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: default_group_notification_frequency {
    type: string
    sql: ${TABLE}.defaultgroupnotificationfrequency ;;
    hidden: yes
  }

  dimension: delegated_approver_id {
    type: string
    hidden: yes
    sql: ${TABLE}.delegatedapproverid ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digest_frequency {
    type: string
    sql: ${TABLE}.digestfrequency ;;
    hidden: yes
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_encoding_key {
    type: string
    sql: ${TABLE}.emailencodingkey ;;
    hidden: yes
  }

  dimension: email_preferences_auto_bcc {
    type: yesno
    sql: ${TABLE}.emailpreferencesautobcc ;;
    hidden: yes
  }

  dimension: email_preferences_auto_bcc_stay_in_touch {
    type: yesno
    sql: ${TABLE}.emailpreferencesautobccstayintouch ;;
    hidden: yes
  }

  dimension: email_preferences_stay_in_touch_reminder {
    type: yesno
    sql: ${TABLE}.emailpreferencesstayintouchreminder ;;
    hidden: yes
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employeenumber ;;
    hidden: yes
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
    hidden: yes
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
    hidden: yes
  }

  dimension: federation_identifier {
    type: string
    sql: ${TABLE}.federationidentifier ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.firstname ;;
    hidden: yes
  }

  dimension: forecast_enabled {
    type: yesno
    sql: ${TABLE}.forecastenabled ;;
    hidden: yes
  }

  dimension: full_photo_url {
    type: string
    sql: ${TABLE}.fullphotourl ;;
    hidden: yes
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.isactive = 'True' ;;
  }

  dimension: is_portal_enabled {
    type: yesno
    sql: ${TABLE}.isportalenabled  = 'True';;
    hidden: yes
  }

  dimension: language_locale_key {
    type: string
    sql: ${TABLE}.languagelocalekey ;;
    hidden: yes
  }

  dimension_group: last_login {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastlogindate ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.lastname ;;
    hidden: yes
  }

  dimension_group: last_password_change {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastpasswordchangedate ;;
    hidden: yes
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastreferenceddate ;;
    hidden: yes
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastvieweddate ;;
    hidden: yes
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: locale_sid_key {
    type: string
    sql: ${TABLE}.localesidkey ;;
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }

  dimension: manager_id {
    type: string
    hidden: yes
    sql: ${TABLE}.managerid ;;
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

  dimension_group: offline_pda_trial_expiration {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.offlinepdatrialexpirationdate ;;
    hidden: yes
  }

  dimension_group: offline_trial_expiration {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.offlinetrialexpirationdate ;;
    hidden: yes
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
    hidden: yes
  }

  dimension: portal_role {
    type: string
    sql: ${TABLE}.portalrole ;;
    hidden: yes
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalcode ;;
    hidden: yes
  }

  dimension: profile_id {
    type: string
    hidden: yes
    sql: ${TABLE}.profileid ;;
  }

  dimension: receives_admin_info_emails {
    type: yesno
    sql: ${TABLE}.receivesadmininfoemails = 'True' ;;
    hidden: yes
  }

  dimension: receives_info_emails {
    type: yesno
    sql: ${TABLE}.receivesinfoemails = 'TRUE' ;;
    hidden: yes
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.senderemail ;;
    hidden: yes
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sendername ;;
    hidden: yes
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
    hidden: yes
  }

  dimension: small_photo_url {
    type: string
    sql: ${TABLE}.smallphotourl ;;
    hidden: yes
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    hidden: yes
  }

  dimension: stay_in_touch_note {
    type: string
    sql: ${TABLE}.stayintouchnote ;;
    hidden: yes
  }

  dimension: stay_in_touch_signature {
    type: string
    sql: ${TABLE}.stayintouchsignature ;;
    hidden: yes
  }

  dimension: stay_in_touch_subject {
    type: string
    sql: ${TABLE}.stayintouchsubject ;;
    hidden: yes
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
    hidden: yes
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
    hidden: yes
  }

  dimension: time_zone_sid_key {
    type: string
    sql: ${TABLE}.timezonesidkey ;;
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_permissions_avantgo_user {
    type: yesno
    sql: ${TABLE}.userpermissionsavantgouser = 'True';;
    hidden: yes
  }

  dimension: user_permissions_call_center_auto_login {
    type: yesno
    sql: ${TABLE}.userpermissionscallcenterautologin = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_chatter_answers_user {
    type: yesno
    sql: ${TABLE}.userpermissionschatteranswersuser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_interaction_user {
    type: yesno
    sql: ${TABLE}.userpermissionsinteractionuser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_marketing_user {
    type: yesno
    sql: ${TABLE}.userpermissionsmarketinguser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_mobile_user {
    type: yesno
    sql: ${TABLE}.userpermissionsmobileuser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_offline_user {
    type: yesno
    sql: ${TABLE}.userpermissionsofflineuser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_permissions_sfcontent_user {
    type: yesno
    sql: ${TABLE}.userpermissionssfcontentuser = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_activity_reminders_popup {
    type: yesno
    sql: ${TABLE}.userpreferencesactivityreminderspopup = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_apex_pages_developer_mode {
    type: yesno
    sql: ${TABLE}.userpreferencesapexpagesdevelopermode = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_dis_comment_after_like_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdiscommentafterlikeemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_dis_mentions_comment_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdismentionscommentemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_dis_prof_post_comment_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisprofpostcommentemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_all_feeds_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableallfeedsemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_bookmark_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablebookmarkemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_change_comment_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablechangecommentemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_endorsement_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableendorsementemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_file_share_notifications_for_api {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefilesharenotificationsforapi = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_followers_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefollowersemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_later_comment_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelatercommentemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_like_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelikeemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_mentions_post_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablementionspostemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_message_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablemessageemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_profile_post_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableprofilepostemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_disable_share_post_email {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablesharepostemail = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_enable_auto_sub_for_feeds {
    type: yesno
    sql: ${TABLE}.userpreferencesenableautosubforfeeds = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_event_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.userpreferenceseventreminderscheckboxdefault = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_hide_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.userpreferenceshidechatteronboardingsplash = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_hide_csndesktop_task {
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsndesktoptask = 'TRUE';;
    hidden: yes
  }

  dimension: user_preferences_hide_csnget_chatter_mobile_task {
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsngetchattermobiletask = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_hide_s_1_browser_ui {
    type: yesno
    sql: ${TABLE}.userpreferenceshides1browserui = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_hide_second_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.userpreferenceshidesecondchatteronboardingsplash = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_lightning_experience_preferred {
    type: yesno
    sql: ${TABLE}.userpreferenceslightningexperiencepreferred = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_reminder_sound_off {
    type: yesno
    sql: ${TABLE}.userpreferencesremindersoundoff = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_city_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_city_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_country_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_country_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_email_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowemailtoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_fax_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowfaxtoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_manager_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmanagertoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_mobile_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmobilephonetoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_postal_code_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_postal_code_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_profile_pic_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowprofilepictoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_state_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_state_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_street_address_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstreetaddresstoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_title_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_title_to_guest_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoguestusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_show_work_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.userpreferencesshowworkphonetoexternalusers = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_preferences_task_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.userpreferencestaskreminderscheckboxdefault = 'TRUE' ;;
    hidden: yes
  }

  dimension: user_role_id {
    type: string
    hidden: yes
    sql: ${TABLE}.userroleid ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.usertype ;;
    hidden: yes
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
    hidden: yes
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # sets #

  set: detail {
    fields: [
      id,
      username,
      last_name,
      first_name,
      name,
      company_name,
      sender_name,
      community_nickname
    ]
  }
}

view: user {
  extends: [sfdc_user_view]
  # dimensions #

  filter: name_select {
    suggest_dimension: name
  }

  filter: department_select {
    suggest_dimension: department
  }

  # rep_comparitor currently depends on "account.business_segment" instead of the intended
  # "department" field. If a custom user table attribute "department" exists,
  # replace business_segment with it.
  dimension: rep_comparitor {
    sql: CASE
        WHEN {% condition name_select %} ${name} {% endcondition %}
          THEN CONCAT('1 - ', ${name})
        WHEN {% condition department_select %} ${account.business_segment} {% endcondition %}
          THEN CONCAT('2 - Rest of ', ${account.business_segment})
      ELSE '3 - Rest of Sales Team'
      END
       ;;
  }

#  dimension: created {
    #X# Invalid LookML inside "dimension": {"timeframes":["date","week","month","raw"]}
#  }

#  dimension: age_in_months {
#    type: number
#    sql: datediff(days,${created_raw},current_date) ;;
#  }

  measure: average_revenue_pipeline {
    type: number
    sql: ${opportunity.total_pipeline_revenue}/ NULLIF(${count},0) ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [account.name, opportunity.type, opportunity.closed_date, opportunity.total_acv]
  }

  set: opportunity_set {
    fields: [average_revenue_pipeline]
  }
}
