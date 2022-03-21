public class ContactTriggerHandler {
    public static void beforeInsert(List<Contact> newList,Map<Id,Contact> oldMap)
    {
        duplicateContactCheck(newList,oldMap);
    }
    public static void beforeUpdate(List<Contact> newList,Map<Id,Contact> oldMap)
    {
        duplicateContactCheck(newList,oldMap);
    }
    public static void duplicateContactCheck(List<Contact> newList,Map<Id,Contact> oldMap)
    {
        
        Set<String> newFirstNameSet=new Set<String>();
        Set<String> newLastNameSet=new Set<String>();
        Set<String> newEmailSet=new Set<String>();
        Set<Date> newDobSet=new Set<Date>();
        
        for(Contact con : newList)
        {
            newFirstNameSet.add(con.FirstName);
            newLastNameSet.add(con.LastName);
            newEmailSet.add(con.Email);
            newDobSet.add(con.Birthdate);
            
        }
        
        List<Contact> existingContactList=[SELECT Id,FirstName,LastName,Email,Birthdate
                                           FROM Contact
                                           WHERE FirstName IN:newFirstNameSet
                                           AND LastName IN:newLastNameSet
                                           AND Email IN:newEmailSet
                                           AND Birthdate IN:newDobSet];
        
        /* Set<String> existingFirstNameSet=new Set<String>();
Set<String> existingFirstNameSet=new Set<String>();
Set<String> existingFirstNameSet=new Set<String>();
*/
        /* 
* Set<String> existingEmailSet=new Set<String>();
for(Contact existingCon : existingContactList)
{
existingEmailSet.add(existingCon.Email);
}
*/
        for(Contact con : newList)
        {
            for(Contact existingCon : existingContactList)
            {
                if( (con.FirstName==existingCon.FirstName
                     && con.LastName==existingCon.LastName 
                     && con.Email==existingCon.Email 
                     && con.Birthdate==existingCon.Birthdate)){
                         con.addError('duplicate Contact Found Please check ');
                     }
                else{
                    existingContactList.add(con);
                    //existingEmailSet.add(con.Email);
                }
            }
            
        }
    }
    
    
}