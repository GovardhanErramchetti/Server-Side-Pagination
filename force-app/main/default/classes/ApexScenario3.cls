public class ApexScenario3 {
    public static void createMapOfAccountToContacts(){
        Map<Id,List<Contact>> accountIdToContactMap=new Map<Id,List<Contact>>();
        for(Account acc:[SELECT Id,(SELECT Id,Name 
                                    FROM Contacts)
                         FROM Account]){
                             if(acc.Contacts.size()>0){
                             	accountIdToContactMap.put(acc.Id,acc.Contacts);
                         	}
                         }
        for(Id accountId : accountIdToContactMap.keySet()){
            System.debug('#Account Id '+accountId+' >>>contacts are: '+accountIdToContactMap.get(accountId));
            
        }
    }
    public static void createMapOfAccountToContacts1(){
        Map<Id,List<Contact>> accountIdToContactMap=new Map<Id,List<Contact>>();
        for(Contact con : [SELECT Id,Name,AccountId
                          FROM Contact
                          WHERE AccountId !=NULL]){
                               if(!accountIdToContactMap.containsKey(con.AccountId)){
                                   accountIdToContactMap.put(con.AccountId,new List<Contact>());
                               }
                               accountIdToContactMap.get(con.AccountId).add(con);
                               
                               
                           }
        for(Id accountId : accountIdToContactMap.keySet()){
            System.debug('#Account Id '+accountId+' >>>contacts are: '+accountIdToContactMap.get(accountId));
            
        }
    }

    
    

}