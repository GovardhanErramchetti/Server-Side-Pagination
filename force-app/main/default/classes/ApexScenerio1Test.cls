@isTest
public class ApexScenerio1Test {
    @isTest
    static void testUpdateActiveFieldUsingMap()
    {
        Account acc=new Account();
        acc.Name='Test Class Demo';
        insert acc;
        
        Contact con=new Contact();
        con.FirstName='Demo';
        con.LastName='Test1';
        
        con.AccountId=acc.Id;
        insert con;
        ApexScenerio1.updateActiveFieldUsingMap();
        for(Account temp : [SELECT ID,Active__c
                            FROM Account
                            WHERE Id =: acc.Id]){
                                System.assertEquals('Yes', temp.Active__c);
                            }
    }
}