/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class CreateMeetingRequestWrapper {
    
	public class Recurrence {

        /*       
            Recurrence meeting types. 
                1 - Daily.
                2 - Weekly.
                3 - Monthly.
        */
		public Integer type;

		public String end_date_time; // Select the final date when the meeting will recur before it is canceled. Should be in UTC time, such as 2017-11-25T12:00:00Z. Cannot be used with end_times.

		public Integer end_times;   // Select how many times the meeting should recur before it is canceled. If end_times is set to 0, it means there is no end time. 
                                    // The maximum number of recurring is 60. Cannot be used with end_date_time.

		/*
            Use this field only if you're scheduling a recurring meeting of type 3 to state the day in a month when the meeting should recur. The value range is from 1 to 31.
            For the meeting to recur on 23rd of each month, provide 23 as this field's value and 1 as the repeat_interval field's value. 
            Instead, if you would like the meeting to recur every three months, on 23rd of the month, change the value of the repeat_interval field to 3.
        */
        public Integer monthly_day;
        
        /*
            Use this field only if you're scheduling a recurring meeting of type 3 to state the week of the month when the meeting should recur. 
            If you use this field, you must also use the monthly_week_day field to state the day of the week when the meeting should recur.
                -1 - Last week of the month.
                1 - First week of the month.
                2 - Second week of the month.
                3 - Third week of the month.
                4 - Fourth week of the month.
        */
		public Integer monthly_week;

        /*       
            Use this field only if you're scheduling a recurring meeting of type 3 to state a specific day in a week when the monthly meeting should recur. 
            To use this field, you must also use the monthly_week field.
                1 - Sunday.
                2 - Monday.
                3 - Tuesday.
                4 - Wednesday.
                5 - Thursday.
                6 - Friday.
                7 - Saturday.
        */
		public Integer monthly_week_day;

        /*       
            Define the interval when the meeting should recur. For instance, to schedule a meeting that recurs every two months, set this field's value as 2 and the value of the type parameter as 3.
            For a daily meeting, the maximum interval you can set is 90 days. For a weekly meeting the maximum interval that you can set is of 12 weeks. For a monthly meeting, there is a maximum of 3 months.
        */
		public Integer repeat_interval;

        /*
            This field is required if you're scheduling a recurring meeting of type 2 to state the days of the week when the meeting should repeat.
            The value for this field could be a number between 1 to 7 in string format. For instance, if the meeting should recur on Sunday, provide 1 as this field's value.
            
            Note: To set the meeting to occur on multiple days of a week, provide comma separated values for this field. 
                    For instance, if the meeting should recur on Sundays and Tuesdays, provide 1,3 as this field's value.
                1 - Sunday.
                2 - Monday.
                3 - Tuesday.
                4 - Wednesday.
                5 - Thursday.
                6 - Friday.
                7 - Saturday.
        */
		public String weekly_days;
	}

	public String agenda;
	public Integer duration;
	public Recurrence recurrence;
	public String schedule_for;
	public Settings settings;
	public String start_time;
	public String timezone;
	public String topic;
	public Integer type;

	public class Meeting_invitees {
		public String email;
	}

	public class Settings {
		public List<Meeting_invitees> meeting_invitees;
	}

    public CreateMeetingRequestWrapper(pzm__Zoom_Meeting__c zoomMeeting, List<String> inviteesMailList){
        this.agenda = zoomMeeting.pzm__Agenda__c;
        this.duration = Integer.valueOf(zoomMeeting.pzm__Duration_in_Minutes__c);
        this.schedule_for = zoomMeeting.pzm__Schedule_For__c;
        this.start_time = zoomMeeting.pzm__Start_Time__c.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
        this.timezone = zoomMeeting.pzm__Timezone__c;
        this.topic = zoomMeeting.pzm__Agenda__c;
        this.type = Integer.valueOf(zoomMeeting.pzm__Meeting_Type__c);

        List<Meeting_invitees> invitees = new List<Meeting_invitees>();
        for(String mail : inviteesMailList){
            Meeting_invitees mi = new Meeting_invitees();
            mi.email =mail;
            invitees.add(mi);
        }
        this.settings = new CreateMeetingRequestWrapper.Settings();
        this.settings.meeting_invitees = invitees;
    }

	public static String parse(CreateMeetingRequestWrapper wrapper) {
        return JSON.serialize(wrapper);
	}

    public void setRecurrenceInfo(Map<String, Object> infoMap){
        CreateMeetingRequestWrapper.Recurrence rec = new CreateMeetingRequestWrapper.Recurrence();
        if(infoMap.size() != 0){
            rec.type = Integer.valueOf(infoMap.get('type'));
            if(infoMap.get('end_date_time') != null){
                rec.end_date_time = String.valueOf(infoMap.get('end_date_time'));
            }
            if(infoMap.get('end_times') != null){
                rec.end_times = Integer.valueOf(infoMap.get('end_times'));
            }
            if(rec.type == 3){
                rec.monthly_day = Integer.valueOf(infoMap.get('monthly_day'));
                rec.monthly_week = Integer.valueOf(infoMap.get('monthly_week'));
                rec.monthly_week_day = Integer.valueOf(infoMap.get('monthly_week_day'));
            }
            rec.repeat_interval = Integer.valueOf(infoMap.get('repeat_interval'));
            rec.weekly_days = String.valueOf(infoMap.get('weekly_days'));
        }
        this.recurrence = rec;
    }
}