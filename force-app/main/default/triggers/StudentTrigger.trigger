trigger StudentTrigger on Student__c (after insert,after update,after delete,after undelete) {
	StudentTriggerHandler.countStudents3(Trigger.New,Trigger.Old, Trigger.oldMap);
}