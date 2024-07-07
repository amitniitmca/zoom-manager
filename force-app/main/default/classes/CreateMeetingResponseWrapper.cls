/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 04-07-2024
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class CreateMeetingResponseWrapper {
    public class Global_dial_in_numbers {
		public String country_name {get;set;} 
		public String number_Z {get;set;} // in json: number
		public String type {get;set;} 
		public String country {get;set;} 
		public String city {get;set;} 

		public Global_dial_in_numbers(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'country_name') {
							country_name = parser.getText();
						} else if (text == 'number') {
							number_Z = parser.getText();
						} else if (text == 'type') {
							type = parser.getText();
						} else if (text == 'country') {
							country = parser.getText();
						} else if (text == 'city') {
							city = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Global_dial_in_numbers consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Resources {

		public Resources(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Resources consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Continuous_meeting_chat {
		public Boolean enable {get;set;} 
		public Boolean auto_add_invited_external_users {get;set;} 

		public Continuous_meeting_chat(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'enable') {
							enable = parser.getBooleanValue();
						} else if (text == 'auto_add_invited_external_users') {
							auto_add_invited_external_users = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Continuous_meeting_chat consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Meeting_invitees {
		public String email {get;set;} 

		public Meeting_invitees(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'email') {
							email = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Meeting_invitees consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public String uuid {get;set;} 
	public Long id {get;set;} 
	public String host_id {get;set;} 
	public String host_email {get;set;} 
	public String topic {get;set;} 
	public Integer type {get;set;} 
	public String status {get;set;} 
	public String start_time {get;set;} 
	public Integer duration {get;set;} 
	public String timezone {get;set;} 
	public String agenda {get;set;} 
	public String created_at {get;set;} 
	public String start_url {get;set;} 
	public String join_url {get;set;} 
	public Settings settings {get;set;} 
	public Boolean pre_schedule {get;set;} 

	public CreateMeetingResponseWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'uuid') {
						uuid = parser.getText();
					} else if (text == 'id') {
						id = parser.getLongValue();
					} else if (text == 'host_id') {
						host_id = parser.getText();
					} else if (text == 'host_email') {
						host_email = parser.getText();
					} else if (text == 'topic') {
						topic = parser.getText();
					} else if (text == 'type') {
						type = parser.getIntegerValue();
					} else if (text == 'status') {
						status = parser.getText();
					} else if (text == 'start_time') {
						start_time = parser.getText();
					} else if (text == 'duration') {
						duration = parser.getIntegerValue();
					} else if (text == 'timezone') {
						timezone = parser.getText();
					} else if (text == 'agenda') {
						agenda = parser.getText();
					} else if (text == 'created_at') {
						created_at = parser.getText();
					} else if (text == 'start_url') {
						start_url = parser.getText();
					} else if (text == 'join_url') {
						join_url = parser.getText();
					} else if (text == 'settings') {
						settings = new Settings(parser);
					} else if (text == 'pre_schedule') {
						pre_schedule = parser.getBooleanValue();
					} else {
						System.debug(LoggingLevel.WARN, 'CreateMeetingResponseWrapper consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Settings {
		public Boolean host_video {get;set;} 
		public Boolean participant_video {get;set;} 
		public Boolean cn_meeting {get;set;} 
		public Boolean in_meeting {get;set;} 
		public Boolean join_before_host {get;set;} 
		public Integer jbh_time {get;set;} 
		public Boolean mute_upon_entry {get;set;} 
		public Boolean watermark {get;set;} 
		public Boolean use_pmi {get;set;} 
		public Integer approval_type {get;set;} 
		public String audio {get;set;} 
		public String auto_recording {get;set;} 
		public Boolean enforce_login {get;set;} 
		public String enforce_login_domains {get;set;} 
		public String alternative_hosts {get;set;} 
		public Boolean alternative_host_update_polls {get;set;} 
		public Boolean close_registration {get;set;} 
		public Boolean show_share_button {get;set;} 
		public Boolean allow_multiple_devices {get;set;} 
		public Boolean registrants_confirmation_email {get;set;} 
		public Boolean waiting_room {get;set;} 
		public Boolean request_permission_to_unmute_participants {get;set;} 
		public List<String> global_dial_in_countries {get;set;} 
		public List<Global_dial_in_numbers> global_dial_in_numbers {get;set;} 
		public Boolean registrants_email_notification {get;set;} 
		public Boolean meeting_authentication {get;set;} 
		public String encryption_type {get;set;} 
		public Approved_or_denied_countries_or_regions approved_or_denied_countries_or_regions {get;set;} 
		public Approved_or_denied_countries_or_regions breakout_room {get;set;} 
		public Boolean internal_meeting {get;set;} 
		public Continuous_meeting_chat continuous_meeting_chat {get;set;} 
		public Boolean participant_focused_meeting {get;set;} 
		public Boolean push_change_to_calendar {get;set;} 
		public List<Resources> resources {get;set;} 
		public Boolean auto_start_meeting_summary {get;set;} 
		public Boolean auto_start_ai_companion_questions {get;set;} 
		public Boolean alternative_hosts_email_notification {get;set;} 
		public Boolean show_join_info {get;set;} 
		public Boolean device_testing {get;set;} 
		public Boolean focus_mode {get;set;} 
		public List<Meeting_invitees> meeting_invitees {get;set;} 
		public Boolean enable_dedicated_group_chat {get;set;} 
		public Boolean private_meeting {get;set;} 
		public Boolean email_notification {get;set;} 
		public Boolean host_save_video_order {get;set;} 
		public Approved_or_denied_countries_or_regions sign_language_interpretation {get;set;} 
		public Boolean email_in_attendee_report {get;set;} 

		public Settings(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'host_video') {
							host_video = parser.getBooleanValue();
						} else if (text == 'participant_video') {
							participant_video = parser.getBooleanValue();
						} else if (text == 'cn_meeting') {
							cn_meeting = parser.getBooleanValue();
						} else if (text == 'in_meeting') {
							in_meeting = parser.getBooleanValue();
						} else if (text == 'join_before_host') {
							join_before_host = parser.getBooleanValue();
						} else if (text == 'jbh_time') {
							jbh_time = parser.getIntegerValue();
						} else if (text == 'mute_upon_entry') {
							mute_upon_entry = parser.getBooleanValue();
						} else if (text == 'watermark') {
							watermark = parser.getBooleanValue();
						} else if (text == 'use_pmi') {
							use_pmi = parser.getBooleanValue();
						} else if (text == 'approval_type') {
							approval_type = parser.getIntegerValue();
						} else if (text == 'audio') {
							audio = parser.getText();
						} else if (text == 'auto_recording') {
							auto_recording = parser.getText();
						} else if (text == 'enforce_login') {
							enforce_login = parser.getBooleanValue();
						} else if (text == 'enforce_login_domains') {
							enforce_login_domains = parser.getText();
						} else if (text == 'alternative_hosts') {
							alternative_hosts = parser.getText();
						} else if (text == 'alternative_host_update_polls') {
							alternative_host_update_polls = parser.getBooleanValue();
						} else if (text == 'close_registration') {
							close_registration = parser.getBooleanValue();
						} else if (text == 'show_share_button') {
							show_share_button = parser.getBooleanValue();
						} else if (text == 'allow_multiple_devices') {
							allow_multiple_devices = parser.getBooleanValue();
						} else if (text == 'registrants_confirmation_email') {
							registrants_confirmation_email = parser.getBooleanValue();
						} else if (text == 'waiting_room') {
							waiting_room = parser.getBooleanValue();
						} else if (text == 'request_permission_to_unmute_participants') {
							request_permission_to_unmute_participants = parser.getBooleanValue();
						} else if (text == 'global_dial_in_countries') {
							global_dial_in_countries = arrayOfString(parser);
						} else if (text == 'global_dial_in_numbers') {
							global_dial_in_numbers = arrayOfGlobal_dial_in_numbers(parser);
						} else if (text == 'registrants_email_notification') {
							registrants_email_notification = parser.getBooleanValue();
						} else if (text == 'meeting_authentication') {
							meeting_authentication = parser.getBooleanValue();
						} else if (text == 'encryption_type') {
							encryption_type = parser.getText();
						} else if (text == 'approved_or_denied_countries_or_regions') {
							approved_or_denied_countries_or_regions = new Approved_or_denied_countries_or_regions(parser);
						} else if (text == 'breakout_room') {
							breakout_room = new Approved_or_denied_countries_or_regions(parser);
						} else if (text == 'internal_meeting') {
							internal_meeting = parser.getBooleanValue();
						} else if (text == 'continuous_meeting_chat') {
							continuous_meeting_chat = new Continuous_meeting_chat(parser);
						} else if (text == 'participant_focused_meeting') {
							participant_focused_meeting = parser.getBooleanValue();
						} else if (text == 'push_change_to_calendar') {
							push_change_to_calendar = parser.getBooleanValue();
						} else if (text == 'resources') {
							resources = arrayOfResources(parser);
						} else if (text == 'auto_start_meeting_summary') {
							auto_start_meeting_summary = parser.getBooleanValue();
						} else if (text == 'auto_start_ai_companion_questions') {
							auto_start_ai_companion_questions = parser.getBooleanValue();
						} else if (text == 'alternative_hosts_email_notification') {
							alternative_hosts_email_notification = parser.getBooleanValue();
						} else if (text == 'show_join_info') {
							show_join_info = parser.getBooleanValue();
						} else if (text == 'device_testing') {
							device_testing = parser.getBooleanValue();
						} else if (text == 'focus_mode') {
							focus_mode = parser.getBooleanValue();
						} else if (text == 'meeting_invitees') {
							meeting_invitees = arrayOfMeeting_invitees(parser);
						} else if (text == 'enable_dedicated_group_chat') {
							enable_dedicated_group_chat = parser.getBooleanValue();
						} else if (text == 'private_meeting') {
							private_meeting = parser.getBooleanValue();
						} else if (text == 'email_notification') {
							email_notification = parser.getBooleanValue();
						} else if (text == 'host_save_video_order') {
							host_save_video_order = parser.getBooleanValue();
						} else if (text == 'sign_language_interpretation') {
							sign_language_interpretation = new Approved_or_denied_countries_or_regions(parser);
						} else if (text == 'email_in_attendee_report') {
							email_in_attendee_report = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Settings consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Approved_or_denied_countries_or_regions {
		public Boolean enable {get;set;} 

		public Approved_or_denied_countries_or_regions(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'enable') {
							enable = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Approved_or_denied_countries_or_regions consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static CreateMeetingResponseWrapper parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new CreateMeetingResponseWrapper(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}

    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }

    private static List<Resources> arrayOfResources(System.JSONParser p) {
        List<Resources> res = new List<Resources>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Resources(p));
        }
        return res;
    }

    private static List<Meeting_invitees> arrayOfMeeting_invitees(System.JSONParser p) {
        List<Meeting_invitees> res = new List<Meeting_invitees>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Meeting_invitees(p));
        }
        return res;
    }

    private static List<Global_dial_in_numbers> arrayOfGlobal_dial_in_numbers(System.JSONParser p) {
        List<Global_dial_in_numbers> res = new List<Global_dial_in_numbers>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Global_dial_in_numbers(p));
        }
        return res;
    }
}