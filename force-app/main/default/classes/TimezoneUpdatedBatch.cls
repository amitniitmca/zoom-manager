/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 07-07-2024
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public with sharing class TimezoneUpdatedBatch implements Database.Batchable<SObject>{
    private List<SObject> records;

    public TimezoneUpdatedBatch(List<SObject> records) {
        this.records = records;
    }
    
    public Iterable<SObject> start(Database.BatchableContext BC) {
        return records;
    }
    
    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        for (SObject sObj : scope) {
            sObj.put('pzm__Timezone_Updated__c', false);    
        }
        UPDATE scope;
    }
    
    public void finish(Database.BatchableContext BC) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { UserInfo.getUserEmail() });
        mail.setSubject('Timezones Updated Successfully');
        String body = '<h2>Dear '+UserInfo.getName()+',</h2>';
        body += '<p>All timezone related information have been updated successfully to valid users, contacts and leads.</p>';
        body += '<p>Best Regards, <br>Proper Zoom Manager</p>';
        mail.setHtmlBody(body);
        try {
            Messaging.sendEmail(new Messaging.Email[] { mail });
        } catch (Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }
}