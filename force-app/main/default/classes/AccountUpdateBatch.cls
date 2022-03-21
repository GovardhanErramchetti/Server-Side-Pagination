public class AccountUpdateBatch implements Database.Batchable<sObject>,Database.StateFul,Schedulable {
    public Integer countFailed,countPassed;
    Set<Id> accountIdSet;
   Set<String> industrySet;
        public AccountUpdateBatch(){
            countFailed = 0;
            countPassed = 0;
            accountIdSet = new Set<Id>();
            
        }
    public AccountUpdateBatch(Set<String> tempSet){
          accountIdSet = new Set<Id>();
        industrySet=new Set<String>();
        industrySet.addAll(tempSet);
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query ='SELECT ID,Name FROM Account WHERE Industry IN: industrySet';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Account> accountList){
        for(Account acc : accountList){
            acc.Active__c='Yes';
        }
        //update accountList;
        Database.SaveResult[] lsr=Database.update(accountList,false);
        
        Integer count=0;
        for(Database.SaveResult sr : lsr){
            if(sr.isSuccess()){
                countPassed=countPassed+1;
                accountIdSet.add(sr.getId());
            }else{
                countFailed+=1;
            }
        }
      
        
    }
    public void finish(Database.BatchableContext bc){
        List<Account> failedAccountList =[SELECT Id,Name
                                         FROM Account
                                         WHERE Id NOt IN:accountIdSet ];
        System.debug('failed accounts >>>'+failedAccountList);
          System.debug('failed records ='+countFailed+' success records '+countPassed );
    }
    public void execute(SchedulableContext sc)
    {
        AccountUpdateBatch obj=new AccountUpdateBatch(industrySet);
        Database.executeBatch(obj,20);
    }
    
}