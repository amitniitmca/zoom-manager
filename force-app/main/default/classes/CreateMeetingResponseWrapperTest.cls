/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
@IsTest 
class CreateMeetingResponseWrapperTest {
    @IsTest
    static void testParse() {
		String json = '{'+
		'  \"uuid\": \"PYqDL3iYQxi0OJ8KXrGmAA==\",'+
		'  \"id\": 88976377568,'+
		'  \"host_id\": \"SE0itqbtQ-WlpF9QAna0Pg\",'+
		'  \"host_email\": \"amitpropertutorials@gmail.com\",'+
		'  \"topic\": \"Sample Agenda\",'+
		'  \"type\": 2,'+
		'  \"status\": \"waiting\",'+
		'  \"start_time\": \"2024-07-04T15:15:11Z\",'+
		'  \"duration\": 25,'+
		'  \"timezone\": \"Asia/Kolkata\",'+
		'  \"agenda\": \"Sample Agenda\",'+
		'  \"created_at\": \"2024-07-04T15:15:11Z\",'+
		'  \"start_url\": \"start_url\",'+
		'  \"join_url\": \"join_url\",'+
		'  \"settings\": {'+
		'    \"host_video\": false,'+
		'    \"participant_video\": false,'+
		'    \"cn_meeting\": false,'+
		'    \"in_meeting\": false,'+
		'    \"join_before_host\": false,'+
		'    \"jbh_time\": 0,'+
		'    \"mute_upon_entry\": false,'+
		'    \"watermark\": false,'+
		'    \"use_pmi\": false,'+
		'    \"approval_type\": 2,'+
		'    \"audio\": \"both\",'+
		'    \"auto_recording\": \"none\",'+
		'    \"enforce_login\": false,'+
		'    \"enforce_login_domains\": \"\",'+
		'    \"alternative_hosts\": \"\",'+
		'    \"alternative_host_update_polls\": false,'+
		'    \"close_registration\": false,'+
		'    \"show_share_button\": false,'+
		'    \"allow_multiple_devices\": false,'+
		'    \"registrants_confirmation_email\": true,'+
		'    \"waiting_room\": true,'+
		'    \"request_permission_to_unmute_participants\": false,'+
		'    \"global_dial_in_countries\": ['+
		'      \"US\"'+
		'    ],'+
		'    \"global_dial_in_numbers\": ['+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 689 278 1000\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 719 359 4580\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 253 205 0468\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"Tacoma\",'+
		'        \"number\": \"+1 253 215 8782\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"Washington DC\",'+
		'        \"number\": \"+1 301 715 8592\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 305 224 1968\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 309 205 3325\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"Chicago\",'+
		'        \"number\": \"+1 312 626 6799\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"Houston\",'+
		'        \"number\": \"+1 346 248 7799\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 360 209 5623\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 386 347 5053\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"San Jose\",'+
		'        \"number\": \"+1 408 638 0968\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 507 473 4847\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 564 217 2000\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"New York\",'+
		'        \"number\": \"+1 646 876 9923\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 646 931 3860\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"number\": \"+1 669 444 9171\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      },'+
		'      {'+
		'        \"country_name\": \"US\",'+
		'        \"city\": \"San Jose\",'+
		'        \"number\": \"+1 669 900 6833\",'+
		'        \"type\": \"toll\",'+
		'        \"country\": \"US\"'+
		'      }'+
		'    ],'+
		'    \"registrants_email_notification\": true,'+
		'    \"meeting_authentication\": false,'+
		'    \"encryption_type\": \"enhanced_encryption\",'+
		'    \"approved_or_denied_countries_or_regions\": {'+
		'      \"enable\": false'+
		'    },'+
		'    \"breakout_room\": {'+
		'      \"enable\": false'+
		'    },'+
		'    \"internal_meeting\": false,'+
		'    \"continuous_meeting_chat\": {'+
		'      \"enable\": false,'+
		'      \"auto_add_invited_external_users\": false'+
		'    },'+
		'    \"participant_focused_meeting\": false,'+
		'    \"push_change_to_calendar\": false,'+
		'    \"resources\": [],'+
		'    \"auto_start_meeting_summary\": false,'+
		'    \"auto_start_ai_companion_questions\": false,'+
		'    \"alternative_hosts_email_notification\": true,'+
		'    \"show_join_info\": false,'+
		'    \"device_testing\": false,'+
		'    \"focus_mode\": false,'+
		'    \"meeting_invitees\": ['+
		'      {'+
		'        \"email\": \"rose@edge.com\"'+
		'      }'+
		'    ],'+
		'    \"enable_dedicated_group_chat\": false,'+
		'    \"private_meeting\": false,'+
		'    \"email_notification\": true,'+
		'    \"host_save_video_order\": false,'+
		'    \"sign_language_interpretation\": {'+
		'      \"enable\": false'+
		'    },'+
		'    \"email_in_attendee_report\": false'+
		'  },'+
		'  \"pre_schedule\": false'+
		'}';
		CreateMeetingResponseWrapper r = CreateMeetingResponseWrapper.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Global_dial_in_numbers objGlobal_dial_in_numbers = new CreateMeetingResponseWrapper.Global_dial_in_numbers(System.JSON.createParser(json));
		System.assert(objGlobal_dial_in_numbers != null);
		System.assert(objGlobal_dial_in_numbers.country_name == null);
		System.assert(objGlobal_dial_in_numbers.number_Z == null);
		System.assert(objGlobal_dial_in_numbers.type == null);
		System.assert(objGlobal_dial_in_numbers.country == null);
		System.assert(objGlobal_dial_in_numbers.city == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Resources objResources = new CreateMeetingResponseWrapper.Resources(System.JSON.createParser(json));
		System.assert(objResources != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Continuous_meeting_chat objContinuous_meeting_chat = new CreateMeetingResponseWrapper.Continuous_meeting_chat(System.JSON.createParser(json));
		System.assert(objContinuous_meeting_chat != null);
		System.assert(objContinuous_meeting_chat.enable == null);
		System.assert(objContinuous_meeting_chat.auto_add_invited_external_users == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Meeting_invitees objMeeting_invitees = new CreateMeetingResponseWrapper.Meeting_invitees(System.JSON.createParser(json));
		System.assert(objMeeting_invitees != null);
		System.assert(objMeeting_invitees.email == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper objCreateMeetingResponseWrapper = new CreateMeetingResponseWrapper(System.JSON.createParser(json));
		System.assert(objCreateMeetingResponseWrapper != null);
		System.assert(objCreateMeetingResponseWrapper.uuid == null);
		System.assert(objCreateMeetingResponseWrapper.id == null);
		System.assert(objCreateMeetingResponseWrapper.host_id == null);
		System.assert(objCreateMeetingResponseWrapper.host_email == null);
		System.assert(objCreateMeetingResponseWrapper.topic == null);
		System.assert(objCreateMeetingResponseWrapper.type == null);
		System.assert(objCreateMeetingResponseWrapper.status == null);
		System.assert(objCreateMeetingResponseWrapper.start_time == null);
		System.assert(objCreateMeetingResponseWrapper.duration == null);
		System.assert(objCreateMeetingResponseWrapper.timezone == null);
		System.assert(objCreateMeetingResponseWrapper.agenda == null);
		System.assert(objCreateMeetingResponseWrapper.created_at == null);
		System.assert(objCreateMeetingResponseWrapper.start_url == null);
		System.assert(objCreateMeetingResponseWrapper.join_url == null);
		System.assert(objCreateMeetingResponseWrapper.settings == null);
		System.assert(objCreateMeetingResponseWrapper.pre_schedule == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Settings objSettings = new CreateMeetingResponseWrapper.Settings(System.JSON.createParser(json));
		System.assert(objSettings != null);
		System.assert(objSettings.host_video == null);
		System.assert(objSettings.participant_video == null);
		System.assert(objSettings.cn_meeting == null);
		System.assert(objSettings.in_meeting == null);
		System.assert(objSettings.join_before_host == null);
		System.assert(objSettings.jbh_time == null);
		System.assert(objSettings.mute_upon_entry == null);
		System.assert(objSettings.watermark == null);
		System.assert(objSettings.use_pmi == null);
		System.assert(objSettings.approval_type == null);
		System.assert(objSettings.audio == null);
		System.assert(objSettings.auto_recording == null);
		System.assert(objSettings.enforce_login == null);
		System.assert(objSettings.enforce_login_domains == null);
		System.assert(objSettings.alternative_hosts == null);
		System.assert(objSettings.alternative_host_update_polls == null);
		System.assert(objSettings.close_registration == null);
		System.assert(objSettings.show_share_button == null);
		System.assert(objSettings.allow_multiple_devices == null);
		System.assert(objSettings.registrants_confirmation_email == null);
		System.assert(objSettings.waiting_room == null);
		System.assert(objSettings.request_permission_to_unmute_participants == null);
		System.assert(objSettings.global_dial_in_countries == null);
		System.assert(objSettings.global_dial_in_numbers == null);
		System.assert(objSettings.registrants_email_notification == null);
		System.assert(objSettings.meeting_authentication == null);
		System.assert(objSettings.encryption_type == null);
		System.assert(objSettings.approved_or_denied_countries_or_regions == null);
		System.assert(objSettings.breakout_room == null);
		System.assert(objSettings.internal_meeting == null);
		System.assert(objSettings.continuous_meeting_chat == null);
		System.assert(objSettings.participant_focused_meeting == null);
		System.assert(objSettings.push_change_to_calendar == null);
		System.assert(objSettings.resources == null);
		System.assert(objSettings.auto_start_meeting_summary == null);
		System.assert(objSettings.auto_start_ai_companion_questions == null);
		System.assert(objSettings.alternative_hosts_email_notification == null);
		System.assert(objSettings.show_join_info == null);
		System.assert(objSettings.device_testing == null);
		System.assert(objSettings.focus_mode == null);
		System.assert(objSettings.meeting_invitees == null);
		System.assert(objSettings.enable_dedicated_group_chat == null);
		System.assert(objSettings.private_meeting == null);
		System.assert(objSettings.email_notification == null);
		System.assert(objSettings.host_save_video_order == null);
		System.assert(objSettings.sign_language_interpretation == null);
		System.assert(objSettings.email_in_attendee_report == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CreateMeetingResponseWrapper.Approved_or_denied_countries_or_regions objApproved_or_denied_countries_or_regions = new CreateMeetingResponseWrapper.Approved_or_denied_countries_or_regions(System.JSON.createParser(json));
		System.assert(objApproved_or_denied_countries_or_regions != null);
		System.assert(objApproved_or_denied_countries_or_regions.enable == null);
	}
}