/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 05-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class ZoomMeetingCallout {
    
    @future(callout=true)
    public static void createMeeting(String requestBody, String meetingRecordId){
        HttpRequest request = ZoomMeetingRequest.getCreateMeetingRequest(requestBody);
        HttpResponse response = new Http().send(request);
        if(response.getStatusCode() == 201){
            CreateMeetingResponseWrapper wrapper = CreateMeetingResponseWrapper.parse(response.getBody());
            Map<String,String> recordInfo = new Map<String,String>();
            recordInfo.put('recordId', meetingRecordId);
            recordInfo.put('meetingId', String.valueOf(wrapper.id));
            recordInfo.put('startUrl', wrapper.start_url);
            recordInfo.put('joinUrl', wrapper.join_url);
            System.debug('AMIT: '+recordInfo);
            ZoomMeetingServices.updateZoomMeetingUrls(recordInfo);
        }
        else{
            throw new ZoomMeetingCalloutException('CALLOUT EXCEPTION: '+response.getStatus()+'['+response.getStatusCode()+']');
        }
    }

    public class ZoomMeetingCalloutException extends Exception{}
}