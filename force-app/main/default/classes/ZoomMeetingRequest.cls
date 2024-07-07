/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 01-07-2024
 * @last modified on  : 04-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class ZoomMeetingRequest {
    static final String NAMED_CREDENTIALS = 'pzm__Zoom_Connect';
    
    public static HttpRequest getCreateMeetingRequest(String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/users/me/meetings');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getCreateMeetingInviteLinkRequest(String meetingId, String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/meetings/'+meetingId+'/invite_links');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getDeleteMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('DELETE');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('GET');
        request.setTimeout(120000);
        return request;
    }
    
    public static HttpRequest getPastMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/past_meetings/'+meetingId);
        request.setMethod('GET');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getPastMeetingParticipantRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/past_meetings/'+meetingId+'/participants');
        request.setMethod('GET');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getListMeetingsRequest(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/users/me/meetings');
        request.setMethod('GET');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getUpcomingMeetingsRequest(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/users/me/upcoming_meetings');
        request.setMethod('GET');
        request.setTimeout(120000);
        return request;
    }

    public static HttpRequest getUpdateMeetingRequest(String meetingId, String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('PATCH');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setTimeout(120000);
        return request;
    }
}