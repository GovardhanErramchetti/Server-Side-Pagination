({
	showMessage : function(component, event, helper) {
         helper.messageUtility(component,event,'Success','green');
       // alert('called show');
    },
    showErrorMessage : function(component, event, helper) {
         helper.messageUtility(component,event,'ERROR','red');
       // alert('called error');
    },
    removeMessage : function(component, event, helper) {
        //alert('called remove');
         helper.removeMessageutility(component);
    }
})