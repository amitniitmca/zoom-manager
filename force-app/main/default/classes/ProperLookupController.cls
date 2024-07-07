public with sharing class ProperLookupController {
    @AuraEnabled
    public static List<SObject> getRecords(String objectName, List<String> fieldNames){
        try {
            String query = 'SELECT Id, Name ';
            for(String field : fieldNames){
                if(field != 'Id' && field != 'Name'){
                    query += ', '+field;
                }
            }
            query += ' FROM '+objectName+' WITH SECURITY_ENFORCED';
            query = String.escapeSingleQuotes(query);
            return Database.query(query);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}