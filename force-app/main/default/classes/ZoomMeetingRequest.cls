public inherited sharing class ZoomMeetingRequest {
    static final String NAMED_CREDENTIALS = 'pzm__Zoom_Connect';
    
    public static HttpRequest getCreateMeetingRequest(String userId, String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/users/'+userId+'/meetings');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        return request;
    }

    public static HttpRequest getCreateMeetingInviteLinkRequest(String meetingId, String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/meetings/'+meetingId+'/invite_links');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        return request;
    }

    public static HttpRequest getDeleteMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('DELETE');
        return request;
    }

    public static HttpRequest getMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('GET');
        return request;
    }
    
    public static HttpRequest getPastMeetingRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/past_meetings/'+meetingId);
        request.setMethod('GET');
        return request;
    }

    public static HttpRequest getPastMeetingParticipantRequest(String meetingId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/past_meetings/'+meetingId+'/participants');
        request.setMethod('GET');
        return request;
    }

    public static HttpRequest getListMeetingsRequest(String userId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/users/'+userId+'/meetings');
        request.setMethod('GET');
        return request;
    }

    public static HttpRequest getUpcomingMeetingsRequest(String userId){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/users/'+userId+'/upcoming_meetings');
        request.setMethod('GET');
        return request;
    }

    public static HttpRequest getUpdateMeetingRequest(String meetingId, String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('connect:'+NAMED_CREDENTIALS+'/meetings/'+meetingId);
        request.setMethod('PATCH');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        return request;
    }
}