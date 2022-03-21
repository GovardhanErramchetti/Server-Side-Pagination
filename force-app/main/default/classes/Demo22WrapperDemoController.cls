public with sharing class Demo22WrapperDemoController {
    @AuraEnabled
    public static string getAccountDeatailsWithRelatedData(String accountId){
        List<Account> accountList=new List<Account>();
        List<Contact> contactList=new List<Contact>();
        List<Opportunity> opportunityList=new List<Opportunity>();
        accountList=[SELECT Id,Name
                     FROM Account 
                     WHERE Id =:accountId];
        contactList=[SELECT FirstName,Lastname,Phone,Email,accountId
                    FROM Contact
                    WHERE AccountId=:accountId];
        opportunityList=[SELECT Id,name,CloseDate,Amount
                        FROM Opportunity
                        WHERE AccountId =:accountId];
        ResponseJSONWrapper wrapper = new ResponseJSONWrapper();
        if(accountList.size()>0){
            Account acc=accountList.get(0);
            wrapper.name=acc.Name;
            wrapper.id=acc.id;
            wrapper.wrapperContactList=contactList;
            wrapper.wrapperOpportunityList=opportunityList;

        }
        String response='';
        response=JSON.serialize(wrapper);
        return response;


    }
    @AuraEnabled
    public static void saveDatatoDatabase(String jsonString){
        ResponseJSONWrapper wrapper = new ResponseJSONWrapper();
        wrapper= (ResponseJSONWrapper) JSON.deserialize(jsonString, ResponseJSONWrapper.class);
        List<Contact> contactList= wrapper.wrapperContactList;
        List<Opportunity> opportunityList= wrapper.wrapperOpportunityList;
        Account acc=new Account();
        acc.Name=wrapper.name;
        acc.Id=wrapper.id;
        //update opportuityList;
        upsert contactList;
    }
    public class ResponseJSONWrapper{
        public Id id;
        public String name;
        public List<Contact> wrapperContactList;
        public List<Opportunity> wrapperOpportunityList;
        public ResponseJSONWrapper(){
            wrapperContactList=new List<Contact>();
            wrapperOpportunityList=new List<Opportunity>();
        }

    }
}