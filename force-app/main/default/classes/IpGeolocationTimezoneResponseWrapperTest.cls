/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
@IsTest
class IpGeolocationTimezoneResponseWrapperTest {
    @IsTest
    static void testParse() {
		String json = '{'+
		'  \"geo\": {'+
		'    \"location\": \"San Antonio, Texas\",'+
		'    \"country\": \"United States\",'+
		'    \"state\": \"Texas\",'+
		'    \"city\": \"San Antonio\",'+
		'    \"locality\": \"\",'+
		'    \"latitude\": 29.4246002,'+
		'    \"longitude\": -98.4951405'+
		'  },'+
		'  \"timezone\": \"America/Chicago\",'+
		'  \"timezone_offset\": -6,'+
		'  \"timezone_offset_with_dst\": -5,'+
		'  \"date\": \"2024-07-06\",'+
		'  \"date_time\": \"2024-07-06 14:30:05\",'+
		'  \"date_time_txt\": \"Saturday, July 06, 2024 14:30:05\",'+
		'  \"date_time_wti\": \"Sat, 06 Jul 2024 14:30:05 -0500\",'+
		'  \"date_time_ymd\": \"2024-07-06T14:30:05-0500\",'+
		'  \"date_time_unix\": 1720294205.576,'+
		'  \"time_24\": \"14:30:05\",'+
		'  \"time_12\": \"02:30:05 PM\",'+
		'  \"week\": 27,'+
		'  \"month\": 7,'+
		'  \"year\": 2024,'+
		'  \"year_abbr\": \"24\",'+
		'  \"is_dst\": true,'+
		'  \"dst_savings\": 1,'+
		'  \"dst_exists\": true,'+
		'  \"dst_start\": {'+
		'    \"utc_time\": \"2024-03-10 TIME 08\",'+
		'    \"duration\": \"+1H\",'+
		'    \"gap\": true,'+
		'    \"dateTimeAfter\": \"2024-03-10 TIME 03\",'+
		'    \"dateTimeBefore\": \"2024-03-10 TIME 02\",'+
		'    \"overlap\": false'+
		'  },'+
		'  \"dst_end\": {'+
		'    \"utc_time\": \"2024-11-03 TIME 07\",'+
		'    \"duration\": \"-1H\",'+
		'    \"gap\": false,'+
		'    \"dateTimeAfter\": \"2024-11-03 TIME 01\",'+
		'    \"dateTimeBefore\": \"2024-11-03 TIME 02\",'+
		'    \"overlap\": true'+
		'  }'+
		'}';
		IpGeolocationTimezoneResponseWrapper r = IpGeolocationTimezoneResponseWrapper.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		IpGeolocationTimezoneResponseWrapper.Geo objGeo = new IpGeolocationTimezoneResponseWrapper.Geo(System.JSON.createParser(json));
		System.assert(objGeo != null);
		System.assert(objGeo.location == null);
		System.assert(objGeo.country == null);
		System.assert(objGeo.state == null);
		System.assert(objGeo.city == null);
		System.assert(objGeo.locality == null);
		System.assert(objGeo.latitude == null);
		System.assert(objGeo.longitude == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		IpGeolocationTimezoneResponseWrapper objIpGeolocationTimezoneResponseWra = new IpGeolocationTimezoneResponseWrapper(System.JSON.createParser(json));
		System.assert(objIpGeolocationTimezoneResponseWra != null);
		System.assert(objIpGeolocationTimezoneResponseWra.geo == null);
		System.assert(objIpGeolocationTimezoneResponseWra.timezone == null);
		System.assert(objIpGeolocationTimezoneResponseWra.timezone_offset == null);
		System.assert(objIpGeolocationTimezoneResponseWra.timezone_offset_with_dst == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_Z == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_time == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_time_txt == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_time_wti == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_time_ymd == null);
		System.assert(objIpGeolocationTimezoneResponseWra.date_time_unix == null);
		System.assert(objIpGeolocationTimezoneResponseWra.time_24 == null);
		System.assert(objIpGeolocationTimezoneResponseWra.time_12 == null);
		System.assert(objIpGeolocationTimezoneResponseWra.week == null);
		System.assert(objIpGeolocationTimezoneResponseWra.month == null);
		System.assert(objIpGeolocationTimezoneResponseWra.year == null);
		System.assert(objIpGeolocationTimezoneResponseWra.year_abbr == null);
		System.assert(objIpGeolocationTimezoneResponseWra.is_dst == null);
		System.assert(objIpGeolocationTimezoneResponseWra.dst_savings == null);
		System.assert(objIpGeolocationTimezoneResponseWra.dst_exists == null);
		System.assert(objIpGeolocationTimezoneResponseWra.dst_start == null);
		System.assert(objIpGeolocationTimezoneResponseWra.dst_end == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		IpGeolocationTimezoneResponseWrapper.Dst_start objDst_start = new IpGeolocationTimezoneResponseWrapper.Dst_start(System.JSON.createParser(json));
		System.assert(objDst_start != null);
		System.assert(objDst_start.utc_time == null);
		System.assert(objDst_start.duration == null);
		System.assert(objDst_start.gap == null);
		System.assert(objDst_start.dateTimeAfter == null);
		System.assert(objDst_start.dateTimeBefore == null);
		System.assert(objDst_start.overlap == null);
	}
}