trigger ContactTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after Undelete) {
    if(Trigger.isInsert && Trigger.isBefore)
    {
     	//ContactTriggerHandler.beforeInsert(Trigger.New,Trigger.oldMap);   
    }
    if(Trigger.isInsert && Trigger.isAfter){}
    if(Trigger.isUpdate && Trigger.isBefore){
      // ContactTriggerHandler.beforeUpdate(Trigger.New, Trigger.oldMap);
    }
    if(Trigger.isUpdate && Trigger.isAfter){}
    if(Trigger.isDelete && Trigger.isBefore){}
    if(Trigger.isDelete && Trigger.isAfter){}
    if(Trigger.isUndelete && Trigger.isAfter){}

}