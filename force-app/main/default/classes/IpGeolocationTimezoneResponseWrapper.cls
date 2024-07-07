/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 06-07-2024
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class IpGeolocationTimezoneResponseWrapper {
	public class Geo {
		public String location {get;set;} 
		public String country {get;set;} 
		public String state {get;set;} 
		public String city {get;set;} 
		public String locality {get;set;} 
		public Double latitude {get;set;} 
		public Double longitude {get;set;} 

		public Geo(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'location') {
							location = parser.getText();
						} else if (text == 'country') {
							country = parser.getText();
						} else if (text == 'state') {
							state = parser.getText();
						} else if (text == 'city') {
							city = parser.getText();
						} else if (text == 'locality') {
							locality = parser.getText();
						} else if (text == 'latitude') {
							latitude = parser.getDoubleValue();
						} else if (text == 'longitude') {
							longitude = parser.getDoubleValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Geo consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Geo geo {get;set;} 
	public String timezone {get;set;} 
	public Integer timezone_offset {get;set;} 
	public Integer timezone_offset_with_dst {get;set;} 
	public String date_Z {get;set;} // in json: date
	public String date_time {get;set;} 
	public String date_time_txt {get;set;} 
	public String date_time_wti {get;set;} 
	public String date_time_ymd {get;set;} 
	public Double date_time_unix {get;set;} 
	public String time_24 {get;set;} 
	public String time_12 {get;set;} 
	public Integer week {get;set;} 
	public Integer month {get;set;} 
	public Integer year {get;set;} 
	public String year_abbr {get;set;} 
	public Boolean is_dst {get;set;} 
	public Integer dst_savings {get;set;} 
	public Boolean dst_exists {get;set;} 
	public Dst_start dst_start {get;set;} 
	public Dst_start dst_end {get;set;} 

	public IpGeolocationTimezoneResponseWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'geo') {
						geo = new Geo(parser);
					} else if (text == 'timezone') {
						timezone = parser.getText();
					} else if (text == 'timezone_offset') {
						timezone_offset = parser.getIntegerValue();
					} else if (text == 'timezone_offset_with_dst') {
						timezone_offset_with_dst = parser.getIntegerValue();
					} else if (text == 'date') {
						date_Z = parser.getText();
					} else if (text == 'date_time') {
						date_time = parser.getText();
					} else if (text == 'date_time_txt') {
						date_time_txt = parser.getText();
					} else if (text == 'date_time_wti') {
						date_time_wti = parser.getText();
					} else if (text == 'date_time_ymd') {
						date_time_ymd = parser.getText();
					} else if (text == 'date_time_unix') {
						date_time_unix = parser.getDoubleValue();
					} else if (text == 'time_24') {
						time_24 = parser.getText();
					} else if (text == 'time_12') {
						time_12 = parser.getText();
					} else if (text == 'week') {
						week = parser.getIntegerValue();
					} else if (text == 'month') {
						month = parser.getIntegerValue();
					} else if (text == 'year') {
						year = parser.getIntegerValue();
					} else if (text == 'year_abbr') {
						year_abbr = parser.getText();
					} else if (text == 'is_dst') {
						is_dst = parser.getBooleanValue();
					} else if (text == 'dst_savings') {
						dst_savings = parser.getIntegerValue();
					} else if (text == 'dst_exists') {
						dst_exists = parser.getBooleanValue();
					} else if (text == 'dst_start') {
						dst_start = new Dst_start(parser);
					} else if (text == 'dst_end') {
						dst_end = new Dst_start(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'IpGeolocationTimezoneResponseWra consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Dst_start {
		public String utc_time {get;set;} 
		public String duration {get;set;} 
		public Boolean gap {get;set;} 
		public String dateTimeAfter {get;set;} 
		public String dateTimeBefore {get;set;} 
		public Boolean overlap {get;set;} 

		public Dst_start(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'utc_time') {
							utc_time = parser.getText();
						} else if (text == 'duration') {
							duration = parser.getText();
						} else if (text == 'gap') {
							gap = parser.getBooleanValue();
						} else if (text == 'dateTimeAfter') {
							dateTimeAfter = parser.getText();
						} else if (text == 'dateTimeBefore') {
							dateTimeBefore = parser.getText();
						} else if (text == 'overlap') {
							overlap = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Dst_start consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static IpGeolocationTimezoneResponseWrapper parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new IpGeolocationTimezoneResponseWrapper(parser);
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
}