/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 07-07-2024
 * @last modified on  : 07-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public with sharing class DatetimeConverter {

    @InvocableMethod(label='Datetime Converter' description='This Invocable method is used to convert datetime to a specific timezone.')
    public static List<Datetime> convertTo(List<FlowInput> inputs) {
        Datetime startDatetime  = inputs[0].startDatetime;
        Decimal timezoneOffset = inputs[0].timezoneOffset;
        Boolean isDST = inputs[0].isDst;
        Date startDate = inputs[0].startDate;
        Date endDate = inputs[0].endDate;
        Decimal dstOffset = inputs[0].dstOffset;
        Decimal offset;
        if(isDST && Date.today() < endDate && Date.today() > startDate){
            offset = dstOffset;
        }
        else{
            offset = timezoneOffset;
        }
        Integer offsetMinutes = Integer.valueOf(offset * 60);
        Datetime newDatetime = startDatetime.addMinutes(offsetMinutes);
        return new List<Datetime>{newDatetime};
    }

    public class FlowInput{
        @InvocableVariable
        public Datetime startDatetime;
        @InvocableVariable
        public Decimal timezoneOffset;
        @InvocableVariable
        public Boolean isDst;
        @InvocableVariable
        public Date startDate;
        @InvocableVariable
        public Date endDate;
        @InvocableVariable
        public Decimal dstOffset;
    }
}