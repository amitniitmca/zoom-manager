/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 
 * @last modified on  : 06-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class AbortScheduleApex {
    public static void cancelScheduledJob(String apexClassName){
        CronTrigger cronTrigger = [SELECT Id 
                                   FROM CronTrigger 
                                   WHERE CronJobDetail.Name = :apexClassName 
                                   LIMIT 1];

        if (cronTrigger != null) {
            System.abortJob(cronTrigger.Id);
        } else {
            System.debug('No scheduled job found with the name "ScheduleTimezoneUpdate"');
        }
    }
}