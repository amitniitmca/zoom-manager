public inherited sharing class AddInviteesServices {
    
    public static List<Contact> getContactsWithEmail(){
        return [SELECT Id, Name, Email FROM Contact WHERE Email <> null];
    }

    public static List<User> getUsersWithEmail(){
        return [SELECT Id, Name, Email 
                FROM User 
                WHERE Email <> null AND Id != :UserInfo.getUserId()];
    }

    public static List<Lead> getLeadsWithEmail(){
        return [SELECT Id, Name, Email FROM Lead WHERE Email <> null];
    }
}