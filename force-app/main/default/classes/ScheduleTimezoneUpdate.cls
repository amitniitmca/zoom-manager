/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 06-07-2024
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public with sharing class ScheduleTimezoneUpdate implements Schedulable{
    public void execute(SchedulableContext SC) {
        List<Contact> contacts = getPendingContacts();
        List<Lead> leads = getPendingLeads();
        List<User> users = getPendingUsers();
        if(contacts.size() > 0){
            updateContacts(contacts);
        }
        else if(leads.size() > 0){
            updateLeads(leads);
        }
        else if(users.size() > 0){
            updateUsers(users);
        }
        else{
            List<SObject> records = new List<SObject>();
            records.add([SELECT Id, pzm__Timezone_Updated__c FROM User]);
            records.add([SELECT Id, pzm__Timezone_Updated__c FROM Lead]);
            records.add([SELECT Id, pzm__Timezone_Updated__c FROM Contact]);
            TimezoneUpdatedBatch batch = new TimezoneUpdatedBatch(records);
            Database.executeBatch(batch, 200);
            AbortScheduleApex.cancelScheduledJob('ScheduleTimezoneUpdate');
        }
    }

    public static List<Contact> getPendingContacts(){
        return [SELECT Id, MailingCity, MailingState, MailingCountry, pzm__Timezone__c, 
                pzm__Is_DST__c, pzm__DST_Start_Date__c, pzm__DST_End_Date__c, pzm__DST_Offset__c
                FROM Contact
                WHERE MailingCity <> null AND MailingCountry <> null
                AND pzm__Timezone_Updated__c = false LIMIT 800];
    }

    public static List<Lead> getPendingLeads(){
        return [SELECT Id, City , State , Country, pzm__Timezone__c, 
                pzm__Is_DST__c, pzm__DST_Start_Date__c, pzm__DST_End_Date__c, pzm__DST_Offset__c 
                FROM Lead
                WHERE City <> null AND Country <> null AND pzm__Timezone_Updated__c = false LIMIT 800];
    }

    public static List<User> getPendingUsers(){
        return [SELECT Id, TimeZoneSidKey, pzm__Is_DST__c, pzm__DST_Start_Date__c, pzm__DST_End_Date__c, pzm__DST_Offset__c 
                FROM User
                WHERE pzm__Timezone_Updated__c = false LIMIT 800];
    }

    private static void updateContacts(List<Contact> contacts){
        for(Contact con : contacts){
            String location = con.MailingCity;
            if(con.MailingState != null){
                location += ', '+con.MailingState;
            }
            location += ', '+con.MailingCountry;
            Map<String,Object> recordInfo = IpGeolocationCallout.getTimezone(location);
            con.pzm__Timezone__c = String.valueOf(recordInfo.get('timezone'));
            con.pzm__Is_DST__c = Boolean.valueOf(recordInfo.get('isDST'));
            con.pzm__Timezone_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('TimezoneOffset')));
            con.pzm__DST_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('DSTOffset')));
            con.pzm__Timezone_Updated__c = true;
            if(recordInfo.get('DSTStartDate') != null){
                con.pzm__DST_Start_Date__c = Date.valueOf(recordInfo.get('DSTStartDate'));
                con.pzm__DST_End_Date__c = Date.valueOf(recordInfo.get('DSTEndDate'));
            }
        }
        UPDATE contacts;
    }

    private static void updateLeads(List<Lead> leads){
        for(Lead ld : leads){
            String location = ld.City;
            if(ld.State != null){
                location += ', '+ld.State;
            }
            location += ', '+ld.Country;
            Map<String,Object> recordInfo = IpGeolocationCallout.getTimezone(location);
            ld.pzm__Timezone__c = String.valueOf(recordInfo.get('timezone'));
            ld.pzm__Is_DST__c = Boolean.valueOf(recordInfo.get('isDST'));
            ld.pzm__Timezone_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('TimezoneOffset')));
            ld.pzm__DST_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('DSTOffset')));
            ld.pzm__Timezone_Updated__c = true;
            if(recordInfo.get('DSTStartDate') != null){
                ld.pzm__DST_Start_Date__c = Date.valueOf(recordInfo.get('DSTStartDate'));
                ld.pzm__DST_End_Date__c = Date.valueOf(recordInfo.get('DSTEndDate'));
            }
        }
        UPDATE leads;
    }

    private static void updateUsers(List<User> users){
        for(User u : users){
            String timezone = u.TimeZoneSidKey;
            Map<String,Object> recordInfo = IpGeolocationCallout.getTimezoneInfo(timezone);
            u.pzm__Is_DST__c = Boolean.valueOf(recordInfo.get('isDST'));
            u.pzm__Timezone_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('TimezoneOffset')));
            u.pzm__DST_Offset__c = Decimal.valueOf(String.valueOf(recordInfo.get('DSTOffset')));
            u.pzm__Timezone_Updated__c = true;
            if(recordInfo.get('DSTStartDate') != null){
                u.pzm__DST_Start_Date__c = Date.valueOf(recordInfo.get('DSTStartDate'));
                u.pzm__DST_End_Date__c = Date.valueOf(recordInfo.get('DSTEndDate'));
            }
        }
        UPDATE users;
    }
}