/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 06-07-2024
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class IpGeolocationCallout {
    private static final String BASE_URL = 'https://api.ipgeolocation.io';

    public static Map<String, Object> getTimezone(String location){
        String key = ProperApiInfoServices.getApiKey(ProperApiInfoServices.API.IP_Geolocation.name());
        if(key != null){
            String endPoint = BASE_URL+'/timezone?apiKey='+key+'&location='+location;
            return makeCallout(endpoint);
        }
        else{
            throw new IpGeolocationCalloutException('IP Geolocation Exception: API key not saved yet. Please Ask your Admin for the same!');
        }
    }

    public static Map<String, Object> getTimezoneInfo(String timezone){
        String key = ProperApiInfoServices.getApiKey(ProperApiInfoServices.API.IP_Geolocation.name());
        if(key != null){
            String endPoint = BASE_URL+'/timezone?apiKey='+key+'&tz='+timezone;
            return makeCallout(endpoint);
        }
        else{
            throw new IpGeolocationCalloutException('IP Geolocation Exception: API key not saved yet. Please Ask your Admin for the same!');
        }
    }

    private static Map<String,Object> makeCallout(String endpoint){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        Map<String, Object> responseInfo = new Map<String, Object>();
        HttpResponse response = new Http().send(request);
        if(response.getStatusCode() == 200){
            IpGeolocationTimezoneResponseWrapper wrap = IpGeolocationTimezoneResponseWrapper.parse(response.getBody());
            String[] stDate;
            String[] edDate;
            if(wrap.is_dst){
                stDate = (wrap.dst_start.utc_time).split(' ')[0].split('-');
                edDate = (wrap.dst_end.utc_time).split(' ')[0].split('-');
                responseInfo.put('DSTStartDate', Date.newInstance(Integer.valueOf(stDate[0]), Integer.valueOf(stDate[1]), Integer.valueOf(stDate[2])));
                responseInfo.put('DSTEndDate', Date.newInstance(Integer.valueOf(edDate[0]), Integer.valueOf(edDate[1]), Integer.valueOf(edDate[2])));
            }
            responseInfo.put('timezone', wrap.timezone);
            responseInfo.put('isDST', wrap.is_dst);
            responseInfo.put('DSTOffset', wrap.timezone_offset_with_dst);
            responseInfo.put('TimezoneOffset', wrap.timezone_offset);
            return responseInfo;
        }
        else{
            throw new IpGeolocationCalloutException('IP Geolocation Exception: '+response.getStatus()+' ['+response.getStatusCode()+']');
        }
    }

    public class IpGeolocationCalloutException extends Exception{}
}