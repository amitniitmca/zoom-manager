/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 05-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class ZoomMeetingServices {

    public static pzm__Zoom_Meeting__c createZoomMeetingRecord(Map<String, Object> recordInfo, List<String> inviteeEmails){
        pzm__Zoom_Meeting__c zoomMeeting = new pzm__Zoom_Meeting__c();
        zoomMeeting.pzm__Agenda__c = String.valueOf(recordInfo.get('agenda'));
        zoomMeeting.pzm__Duration_in_Minutes__c = Integer.valueOf(recordInfo.get('duration'));
        zoomMeeting.pzm__Meeting_Type__c = String.valueOf(recordInfo.get('meetingType'));
        zoomMeeting.pzm__Schedule_For__c = String.valueOf(recordInfo.get('scheduleFor'));
        zoomMeeting.pzm__Start_Time__c = parseDatetime(String.valueOf(recordInfo.get('startTime')));
        zoomMeeting.pzm__Timezone__c = String.valueOf(recordInfo.get('timezone'));
        INSERT zoomMeeting;

        Map<String, Object> recurrenceMap = new Map<String, Object>();
        if(Boolean.valueOf(recordInfo.get('isRecurring'))){
            recurrenceMap.put('type', Integer.valueOf(recordInfo.get('recurrenceType')));
            if(recordInfo.get('recurrenceEndDateTime') != null){
                recurrenceMap.put('end_date_time', String.valueOf(recordInfo.get('recurrenceEndDateTime')));
            }
            if(recordInfo.get('recurrenceEndTimes') != null){
                recurrenceMap.put('end_times', Integer.valueOf(recordInfo.get('recurrenceEndTimes')));
            }
            if(Integer.valueOf(recordInfo.get('recurrenceType')) == 3){
                recurrenceMap.put('monthly_day', Integer.valueOf(recordInfo.get('recurrenceMonthlyDay')));
                recurrenceMap.put('monthly_week', Integer.valueOf(recordInfo.get('recurrenceMonthlyWeek')));
                recurrenceMap.put('monthly_week_day', Integer.valueOf(recordInfo.get('recurrenceMonthlyWeekDay')));
            }
            recurrenceMap.put('repeat_interval', Integer.valueOf(recordInfo.get('recurrenceRepeatInterval')));
            recurrenceMap.put('weekly_days', String.valueOf(recordInfo.get('recurrenceWeeklyDays')));
        }
        CreateMeetingRequestWrapper cmrw = new CreateMeetingRequestWrapper(zoomMeeting, inviteeEmails);
        if(recurrenceMap.size() > 0){
            cmrw.setRecurrenceInfo(recurrenceMap);
        }

        return zoomMeeting;
    }

    public static void updateZoomMeetingUrls(Map<String, String> recordInfo){
        pzm__Zoom_Meeting__c meeting = [SELECT Id, pzm__Start_URL__c, pzm__Join_URL__c, pzm__Meeting_Id__c
                                        FROM pzm__Zoom_Meeting__c WHERE Id = :recordInfo.get('recordId')];
        meeting.pzm__Start_URL__c = recordInfo.get('startUrl');
        meeting.pzm__Join_URL__c = recordInfo.get('joinUrl');
        meeting.pzm__Meeting_Id__c = recordInfo.get('meetingId');
        System.debug(meeting);
        UPDATE meeting;
    }

    public static List<Schema.PicklistEntry> getPicklistValueOf(String picklistFieldName){
        Schema.DescribeSObjectResult objResult = pzm__Zoom_Meeting__c.SObjectType.getDescribe();
        Map<String, Schema.SObjectField> fieldMap = objResult.fields.getMap();
        for(String key : fieldMap.keySet()){
            Schema.DescribeFieldResult fieldRes = fieldMap.get(key).getDescribe();
            if(fieldRes.getName() == picklistFieldName){
                return fieldRes.getPicklistValues();
            }
        }
        return null;
    }

    private static Datetime parseDatetime(String utcDtString){
        String [] dateArray = utcDtString.split('T')[0].split('-');
        String [] timeArray = utcDtString.split('T')[1].split(':');
        DateTime utcDateTime = Datetime.newInstanceGmt(Integer.valueOf(dateArray[0]), Integer.valueOf(dateArray[1]), Integer.valueOf(dateArray[2]), 
                                                        Integer.valueOf(timeArray[0]), Integer.valueOf(timeArray[1]), 0);
        return utcDateTime;
    }
}