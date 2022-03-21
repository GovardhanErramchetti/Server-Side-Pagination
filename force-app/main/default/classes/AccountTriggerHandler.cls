public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newList,Map<Id,Account> oldMap){
        populateSLAExpirationDate(newList);
        populateColor(newList,oldMap);
        copyBillingtoShipping(newList,oldMap);
    }
    public static void afterInsert(List<Account> newList,Map<Id,Account> oldMap){
        if(StaticConstants.runAccountTrigger){      
            populateSLAExpirationDate(newList,oldMap);
        }
        addUserToPublicGroup(newList);
       
    }
    public static void beforeUpdate(List<Account> newList,Map<Id,Account> oldMap){
        //populateColor(newList);
        //populateColoronUpdate(newList,oldMap);
        populateColor(newList,oldMap);
        copyBillingtoShipping(newList,oldMap);
    }
    public static void afterUpdate(List<Account> newList,Map<Id,Account> oldMap){
        if(StaticConstants.runAccountTrigger){  
            populateSLAExpirationDate(newList,oldMap);
        }
        
    }
    public static void beforeDelete(List<Account> newList,Map<Id,Account> oldMap){
        
    }
    public static void afterDelete(List<Account> newList,Map<Id,Account> oldMap){
        
    }
    public static void afterUndelete(List<Account> newList,Map<Id,Account> oldMap){
        
    }
    public static void populateSLAExpirationDate(List<Account> newList)
    {
        for(Account acc : newList)
        {
            acc.SLAExpirationDate__c=Date.today().addDays(180);
        }
    }
    public static void populateColor(List<Account> newList,Map<Id,Account> oldMap)
    {
        Set<Id> ownerIdSet=new Set<Id>();
        for(Account acc :newList)
        { 
            if(oldMap==NULL || (acc.OwnerId != oldMap.get(acc.Id).ownerId)) //optimized code
                ownerIdSet.add(acc.OwnerId);
        }
        Map<Id,String> ownerIdtoColorMap=new Map<Id,String>();
        for(User usr : [SELECT Id,Favourite_Color__c
                        FROM User
                        WHERE Id IN:ownerIdSet])
        {
            ownerIdtoColorMap.put(usr.Id,usr.Favourite_Color__c);
        }
        for(Account acc : newList)
        {
            acc.Favourite_Color__c=ownerIdtoColorMap.get(acc.OwnerId);
        }
        
    }
    public static void createOpportunity(List<Account> newList)
    {
        List<Opportunity> oppList=new List<Opportunity>();
        for(Account acc : newList)
        {
            Opportunity opp=new Opportunity();
            opp.name=acc.name + '-Opportunity';
            opp.AccountId=acc.Id;
            opp.CloseDate=Date.today().addDays(30);
            opp.StageName='prospecting';
            oppList.add(opp);
            
        }
        insert oppList;
    }
    public static void populateSLAExpirationDate(List<Account> newList,Map<Id,Account> oldMap)
    {
        List<Account> tempAccList= new List<Account>();
        for(Account acc:newList)
        {
            Account temp= new Account();
            temp.Id=acc.Id;
            temp.SLAExpirationDate__c=Date.today().addDays(180);
            tempAccList.add(temp);
        }
        if(tempAccList.size()>0)
        {
            StaticConstants.runAccountTrigger=false;
            update tempAccList;
        }
    }
    public static void populateColoronUpdate(List<Account> newList,Map<Id,Account> oldMap)
    {
        Set<Id> ownerIdSet=new Set<Id>();
        for(Account acc : newList)
        {
            if(acc.OwnerId != oldMap.get(acc.Id).OwnerId)
            {
                ownerIdSet.add(acc.OwnerId);
            }
        }
        if(ownerIdSet.size() > 0)
        {
            Map<Id,String> ownerIdtoColorMap=new Map<Id,String>();
            for(User usr : [SELECT Id,Favourite_Color__c
                            FROM User
                            WHERE Id IN:ownerIdSet])
            {
                ownerIdtoColorMap.put(usr.Id,usr.Favourite_Color__c);
            }
            for(Account acc : newList)
            {
                acc.Favourite_Color__c=ownerIdtoColorMap.get(acc.OwnerId);
            }
        }
        
    }
    
    
    
    public static void copyBillingtoShipping(List<Account> newList,Map<Id,Account> oldMap){
        for(Account acc:newList)
        {
            Boolean checkBoxChecked=false;
            Boolean isBillingAddressChanged=false;
            Boolean isShippigAddressChanged=false;
            if(oldMap != null){
                checkBoxChecked=acc.Copy_Billing_To_Shipping__c!=oldMap.get(acc.Id).Copy_Billing_To_Shipping__c;
                isBillingAddressChanged=(acc.BillingStreet != oldMap.get(acc.Id).BillingStreet
                                         || acc.BillingCity != oldMap.get(acc.Id).BillingCity
                                         || acc.BillingState != oldMap.get(acc.Id).BillingState
                                         || acc.BillingPostalCode != oldMap.get(acc.Id).BillingPostalCode
                                         || acc.BillingCountry != oldMap.get(acc.Id).BillingCountry);
                isShippigAddressChanged=(acc.ShippingStreet != oldMap.get(acc.Id).ShippingStreet
                                         || acc.ShippingCity != oldMap.get(acc.Id).ShippingCity	
                                         || acc.ShippingState != oldMap.get(acc.Id).ShippingState
                                         || acc.ShippingPostalCode != oldMap.get(acc.Id).ShippingPostalCode
                                         || acc.ShippingCountry != oldMap.get(acc.Id).ShippingCountry);
            }
            if(oldMap == null || isBillingAddressChanged || isShippigAddressChanged)
            {
                if(acc.Copy_Billing_To_Shipping__c)
                {
                    if(isShippigAddressChanged)
                    {
                        acc.addError('you are not allowed to change shipping address if cn is checked');
                    }
                    else
                    {
                        acc.ShippingStreet=acc.BillingStreet;
                        acc.ShippingCity=acc.BillingCity;
                        acc.ShippingState=acc.BillingState;
                        acc.ShippingPostalCode=acc.BillingPostalCode;
                        acc.ShippingCountry=acc.BillingCountry;
                    }
                    
                }
            }
        }
    }
    public static void addUserToPublicGroup(List<Account> newList){
        Set<Id> ownerIdSet=new Set<Id>();
        for(Account acc : newList){
            ownerIdSet.add(acc.OwnerId);
        }
        addUserToGroup(ownerIdSet);
    }
    
    
    public static void addUserToGroup(Set<Id> ownerSet){
        List<GroupMember> memberList=new List<GroupMember>();
        for(Id userId : ownerSet){
            GroupMember member= new GroupMember();
            member.GroupId='3D00G5g000000RRDe';
            member.UserOrGroupId=userId;
            memberList.add(member);
        }
       // insert memberList;
    }
    
    
    
}