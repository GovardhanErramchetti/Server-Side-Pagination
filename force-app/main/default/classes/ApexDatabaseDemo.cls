public class ApexDatabaseDemo {
    public static void insertSingleRecordAccount()
    {
        Account acc=new Account();
        acc.Name='Test From Apex Code';
        acc.Active__c='No';
        acc.Industry='Agriculture';
        insert acc;
        System.debug('>>>>>>  '+acc.Id+' >>>>');
    }
    public static void insertMultipleRecordAccountInvalid()
    {
        /*for(Integer count=0;count<152;count++){
            Account acc=new Account();
            acc.Name='Test From Apex Code'+count;
            acc.Active__c='No';
            acc.Industry='Agriculture';
            insert acc;
            System.debug('>>>>>>  '+acc.Id+' >>>>');
        }*/
    }
    public static void createMultipleAccountRecords()
    {
        List<Account> accountList=new List<Account>();
        for(Integer count=0;count<200;count++){
            Account acc=new Account();
            acc.Name='Test From Apex Code'+count;
            acc.Active__c='No';
            acc.Industry='Agriculture';
            accountList.add(acc);
    	}
        if(accountList.size()>0)
        {
            insert accountList;
        }
        for(Account acc:accountList){
            
            System.debug('@@@Account Name is '+acc.Name+' and Account Id is '+acc.Id);
        }
    }
    
    public static void updateMultipleRecords(){
        List<Account> accountList=new List<Account>();
        accountList=[SELECT Id,Name,Active__c,Industry
                    FROM Account
                    WHERE Name LIKE 'Test From Apex Code%'
                    ORDER BY Name];
        for(Account acc:accountList){
            acc.Active__c='No';
            acc.Industry='Technology';
        }
        if(accountList.size()>0){
        	update accountList;
        }
        
            
    }
    public static void deleteMultipleRecords(){
        List<Account> accountList=new List<Account>();
        accountList=[SELECT Id
                    FROM Account
                    WHERE Name LIKE 'Test From Apex Code%'];
        if(accountList.size()>0)
        {
            delete accountList;
        }
    }
    
        

}