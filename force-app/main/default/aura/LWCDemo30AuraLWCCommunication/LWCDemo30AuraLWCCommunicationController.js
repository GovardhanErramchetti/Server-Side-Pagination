({
    handleEvent : function(component, event, helper) {
        var aurapubsub = component.find('aurapubsubmodule');
        var callbackMethod = $A.getCallback(function(payload){
            component.set("v.selectedContact",payload.Name);
        });
        aurapubsub.registerListener('pubsubselected',callbackMethod);
  
    }
 
})