public without sharing class LWCDemo24Controller {
    @AuraEnabled(cacheable=true)
   public static List<AccountWrapper> getAccountList( Integer recordPerPage, String startIndex, String endIndex, String action){
       String query = 'SELECT Id, Name ,Active__c ,Industry ,Index__c FROM Account';
       String filter ='';
       if(!String.isBlank(action)){
            filter += action == 'next' ? 'WHERE  Index__c < \''+String.escapeSingleQuotes(endIndex)+'\''  : ' WHERE  Index__c > \''+String.escapeSingleQuotes(startIndex)+'\'';
        }
        if(action == 'prev'){
            query =  query +' '+ filter + '  ORDER BY Index__c ASC LIMIT ' + recordPerPage;
        } else {
            query =  query +' '+ filter + ' ORDER BY Index__c DESC LIMIT ' + recordPerPage;
        }
        List<AccountWrapper> result = new List<AccountWrapper>();
        for(SObject acc : Database.query(query)){
            AccountWrapper wrapper = new AccountWrapper();

            wrapper.id = (String)acc.get('Id'); 
            wrapper.name =(String) acc.get('Name'); 
            // wrapper.name = query ;
            wrapper.index = (String)acc.get('Index__c'); 
            wrapper.industry =(String) acc.get('Industry'); 
            result.add(wrapper);
        }
        return result ;
    //    return [SELECT Id,Name,Active__c FROM Account WHERE Industry='Technology'];
   }
   @AuraEnabled(cacheable=true)
   public static Integer getTotalAccountRecords(){
    //    try {
        List<AggregateResult> aggResList =[SELECT COUNT(Id) totalRecords FROM Account];
        if(!aggResList.isEmpty()) {
            return (Integer)aggResList.get(0).get('totalRecords');
        }
        return 0;
    //    } catch (Exception e) {
    //        throw new AuraHandledException(e.getMessage());
    //    }
   }
 
   @AuraEnabled
   public static void updateAccountList(){
       List<Account> accList= [SELECT Id,Name,Active__c FROM Account WHERE Industry='Technology'];
       for(Account acc : accList){
           acc.Active__c = 'Yes';
       }
       update accList;
   }
   public class AccountWrapper{
    @AuraEnabled public String name{get; set;}
    @AuraEnabled public String id{get; set;}
    @AuraEnabled public String industry{get; set;}
    @AuraEnabled public String index{get; set;}

}
    public static void insertAccounts(Integer j){
        List<Account> accList  = new List<Account>();
        Integer i =j;
        for(Account acc : [SELECT ID , Name,Industry FROM Account LIMIT 50000]){
            Account a = new Account();
            a.Industry = 'Technology';
            i++;
            a.Name = acc.Name +' '+i;
            accList.add(a);
        }
        insert accList;
    }

}