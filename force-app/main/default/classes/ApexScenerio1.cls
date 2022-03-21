public class ApexScenerio1 {
    public static void updateActiveFieldUsingMap(){
        Map<String,Account> accountIdToAccountMap=new Map<String,Account>();
        for(Contact con:[SELECT Id,Name,AccountId
                        FROM Contact
                         WHERE Name LIKE 'Demo Test%']){
                             
                                 	Account acc=new Account();
                                 acc.Id=con.AccountId;
                                 acc.Active__c='Yes';
                                 accountIdToAccountMap.put(acc.Id,acc);
                             }
        if(accountIdToAccountMap.size()>0)
        {
			Update accountIdToAccountMap.values();           
        }
        
    }

    public static void updateActiveField(){
        List<Contact> contactList=new List<Contact>();
        contactList=[SELECT Id,Name,AccountId
                    FROM Contact
                    WHERE Name LIKE 'Demo Test%'];
        List<Account> accountList=new List<Account>();
        Set<Id> accountIdSet=new Set<Id>();
        for(Contact con:contactList){
            Account acc=new Account();
            acc.Id=con.AccountId;
            acc.Active__c='No';
            //accountList.add(acc);
            if(!accountIdSet.contains(acc.Id))
            {
                accountList.add(acc);
                System.debug('$$$$'+acc.Id);
                accountIdSet.add(acc.Id);
            }
            
        }
        if(accountList.size()>0)
        {
            System.debug('@@@'+accountList);
            update accountList; 
        }
    }
    public static void updateActiveField1(){
        Set<Id> accountIdSet=new Set<Id>();
        List<Account> accountList=new List<Account>();
        for(Contact con:[SELECT Id,Name,AccountId
                        FROM Contact
                         WHERE Name LIKE 'Demo Test%']){
                             accountIdSet.add(con.AccountId);
                         }
        for(Id accountId:accountIdSet)
        {
           Account acc=new Account();
            acc.Id=accountId;
            acc.Active__c='No';
            accountList.add(acc); 
        }
        if(accountList.size()>0){
            Update accountList;
        }
    }
    
    public static void updateActiveField2(){
        Set<Id> accountIdSet=new Set<Id>();
        List<Account> accountList=new List<Account>();
        for(Contact con:[SELECT Id,Name,AccountId
                        FROM Contact
                         WHERE Name LIKE 'Demo Test%']){
                             if(!accountIdSet.contains(con.AccountId)){
                                 	accountIdSet.add(con.AccountId);
                                	Account acc=new Account();
                                    acc.Id=con.AccountId;
                                    acc.Active__c='No';
                                    accountList.add(acc);
                             }
    	}
         if(accountList.size()>0)
        {
            System.debug('@@@'+accountList);
            update accountList; 
        }
    }

}