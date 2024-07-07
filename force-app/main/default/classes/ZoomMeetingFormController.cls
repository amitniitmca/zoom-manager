/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 02-07-2024
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public with sharing class ZoomMeetingFormController {
    
    @AuraEnabled(cacheable=true)
    public static List<ProperPicklist> getMeetingTypePicklist(){
        List<ProperPicklist> values = new List<ProperPicklist>();
        for(Schema.PicklistEntry entry : ZoomMeetingServices.getPicklistValueOf('pzm__Meeting_Type__c')){
            values.add(new ProperPicklist(entry));
        }
        return values;
    }

    @AuraEnabled
    public static pzm__Zoom_Meeting__c createScheduleMeeting(Map<String, Object> meetingDetails, List<Map<String, Object>> inviteeDetails){
        List<String> inviteeEmails = new List<String>();
        for(Map<String, Object> invMap : inviteeDetails){
            inviteeEmails.add(String.valueOf(invMap.get('recordEmail')));
        }
        pzm__Zoom_Meeting__c zoomMeeting = ZoomMeetingServices.createZoomMeetingRecord(meetingDetails, inviteeEmails);
        ZoomMeetingDetailsServices.createZoomMeetingDetails(zoomMeeting.Id, inviteeDetails);

        CreateMeetingRequestWrapper cmrWrapper = new CreateMeetingRequestWrapper(zoomMeeting, inviteeEmails);
        
        String body = CreateMeetingRequestWrapper.parse(cmrWrapper);

        ZoomMeetingCallout.createMeeting(body, zoomMeeting.Id);
        return zoomMeeting;
    }

    public class ProperPicklist{
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String value;
        @AuraEnabled
        public Boolean isDefault;
        @AuraEnabled
        public Boolean isActive;
        public ProperPicklist(Schema.PicklistEntry entry){
            this.label = entry.getLabel();
            this.value = entry.getValue();
            this.isDefault = entry.isDefaultValue();
            this.isActive = entry.isActive();
        }
    }
}