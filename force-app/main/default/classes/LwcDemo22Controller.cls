public with sharing class LwcDemo22Controller {
    @AuraEnabled(cacheable=true)
  public static List<Account> getAccountList(){
       return [SELECt Id,Name 
       FROM Account LIMIT 25];     
  }
 
  @AuraEnabled(cacheable=true)
  public static List<Contact> getContactList(String selectedAccountId){
      return [SELECT Id,Name,Email,Phone
              FROM Contact
              WHERE AccountId = :selectedAccountId
              AND AccountId != NULL];
  }

}