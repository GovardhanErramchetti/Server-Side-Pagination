public class ApexScenario2 {
    public static void createMapOfAccountToContacts(){
        Map<Id,List<Contact>> accountIdToContactMap=new Map<Id,List<Contact>>();
        for(Account acc:[SELECT Id,(SELECT Id,Name 
                                    FROM Contacts)
                         FROM Account]){
                             accountIdToContactMap.put(acc.Id,acc.Contacts);
                         }
        for(Id accountId : accountIdToContactMap.keySet()){
            System.debug('#Account Id '+accountId+' >>>contacts are: '+accountIdToContactMap.get(accountId));
            
        }
    }
    public static void createMapOfAccountToContacts1(){
        Map<Id,List<Contact>> accountIdToContactMap=new Map<Id,List<Contact>>();
        for(Account acc:[SELECT Id
                         FROM Account]){
                             accountIdToContactMap.put(acc.Id,new List<Contact>());
                         }
        for(Contact con:[SELECT Id,Name,AccountId
                        FROM Contact
                        WHERE AccountId IN:accountIdToContactMap.keySet()
                         AND AccountId !=NULL]){
                             accountIdToContactMap.get(con.AccountId).add(con);
                         }
        for(Id accountId:accountIdToContactMap.keySet())
        {
             System.debug('#Account Id '+accountId+' >>>contacts are: '+accountIdToContactMap.get(accountId));
 
        }
        
    }
    public static void findAccount(Decimal revenue){
        List<Account> accountList=[SELECT Id,Name
                                  FROM Account
                                  WHERE AnnualRevenue>:revenue];
        System.debug('Accounts are: '+accountList);
    }
    public static void findAccountBasedOnIndustry(String industryVar){
        List<Account> accountList=[SELECT Id,Name
                                  FROM Account
                                  WHERE Industry =:industryVar];
        System.debug('Accounts are: '+accountList);
    }


}