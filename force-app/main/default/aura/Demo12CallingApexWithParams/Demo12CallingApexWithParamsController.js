({
    doInit : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this,function(Response){
            var state = Response.getState();
            if(state === 'SUCCESS'){
                component.set('v.accountList',Response.getReturnValue());
            }
        });  
        $A.enqueueAction(action);

    },
    fetchContacts :function(component, event, helper) {
        component.set("v.showSpinner",true);
    	var action=component.get("c.getContacts");
        var accId=component.get("v.selectedAccountId");
        action.setParams({accountId : accId});
         action.setCallback(this,function(Response){
            var state = Response.getState();
            if(state === 'SUCCESS'){
                component.set('v.contactList',Response.getReturnValue());
                component.set('v.showSpinner',false);
            }
        });
         $A.enqueueAction(action);

    }
    
})