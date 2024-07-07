/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 04-07-2024
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class ZoomMeetingDetailsServices {
    
    public static void createZoomMeetingDetails(String meetingId, List<Map<String, Object>> inviteeDetails){
        List<pzm__Zoom_Meeting_Detail__c> meetingDetails = new List<pzm__Zoom_Meeting_Detail__c>();

        for(Map<String, Object> invitee : inviteeDetails){
            pzm__Zoom_Meeting_Detail__c detail = new pzm__Zoom_Meeting_Detail__c();
            detail.pzm__Zoom_Meeting__c = meetingId;
            if(String.valueOf(invitee.get('objectName')) == 'Contact'){
                detail.pzm__Participating_Contact__c = String.valueOf(invitee.get('recordId'));
            }
            else if(String.valueOf(invitee.get('objectName')) == 'Lead'){
                detail.pzm__Participating_Lead__c = String.valueOf(invitee.get('recordId'));
            }
            else{
                detail.pzm__Participating_User__c = String.valueOf(invitee.get('recordId'));
            }
            detail.pzm__Status__c = 'Not Started';
            meetingDetails.add(detail);
        }

        if(meetingDetails.size() > 0){
            INSERT meetingDetails;
        }
    }
}