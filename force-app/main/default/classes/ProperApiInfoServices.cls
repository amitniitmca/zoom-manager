/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 06-07-2024
 * @last modified on  : 06-07-2024
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public inherited sharing class ProperApiInfoServices {

    public Enum API {
        IP_Geolocation
    }
    
    public static void addApiKey(Map<String, String> recordInfo){
        pzm__Proper_API_Info__c apiInfo = new pzm__Proper_API_Info__c();
        apiInfo.pzm__API_Name__c = recordInfo.get('apiName');
        apiInfo.pzm__Key__c = recordInfo.get('key');
        apiInfo.pzm__Position__c = recordInfo.get('position'); 
        INSERT apiInfo;
    }

    public static List<String> getAllSavedApiNames(){
        List<pzm__Proper_API_Info__c> settingsList = getAllValues();
        List<String> apiNames = new List<String>();
        for(pzm__Proper_API_Info__c setting : settingsList){
            apiNames.add(setting.pzm__API_Name__c);
        }
        return apiNames;
    }

    public static List<String> getAllApiNames(){
        List<ProperApiInfoServices.API> apis = new List<ProperApiInfoServices.API>();
        List<String> apiNames = new List<String>();
        for(ProperApiInfoServices.API api : apis){
            apiNames.add(api.name());
        }
        return apiNames;
    }

    public static String getApiKey(String apiName){
        List<pzm__Proper_API_Info__c> settingsList = getAllValues();
        List<String> apiNames = new List<String>();
        for(pzm__Proper_API_Info__c setting : settingsList){
            if(setting.pzm__API_Name__c == apiName){
                return setting.pzm__Key__c;
            }
        }
        return null;
    }

    private static List<pzm__Proper_API_Info__c> getAllValues(){
        return pzm__Proper_API_Info__c.getAll().values();
    }
}