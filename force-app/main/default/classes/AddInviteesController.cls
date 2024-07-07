public with sharing class AddInviteesController {
    @AuraEnabled(cacheable=true)
    public static Map<String, List<SObject>> getInviteesDetails(){
        Map<String, List<SObject>> inviteesMap = new Map<String, List<SObject>>();
        inviteesMap.put('Contact', AddInviteesServices.getContactsWithEmail());
        inviteesMap.put('Lead', AddInviteesServices.getLeadsWithEmail());
        inviteesMap.put('User', AddInviteesServices.getUsersWithEmail());
        return inviteesMap;
    }
}