public with sharing class Demo11CallingApexController {
   @AuraEnabled
   public static List<Account> getAccounts(){
      return [SELECT Id,Name FROM Account LIMIT 25];
   } 
    @AuraEnabled
    public static List<Contact> getContacts(String accountId)
    {
        List<Contact> contactList=new List<Contact>();
       contactList= [SELECT Id,Name 
               FROM Contact
               WHERE AccountId=:accountId
               AND AccountId != NULL];
        return contactList;
    }
    @AuraEnabled
    public static Account getAccountDetails(String accountId){
        return [SELECT Id,Name,Rating FROM Account WHERE Id=: accountId];
    }

    @AuraEnabled
    public static String updateAccountDetails(Account acc){
        try{
            update acc;
            return 'success';
        }
        catch(Exception e){
            return 'error';
        }
    }
}