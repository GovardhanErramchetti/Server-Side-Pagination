({
    doInit : function(component, event, helper) {
        var action= component.get("c.getAccountDetails");
        action.setParams({
            accountId :component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state ==="SUCCESS"){
                component.set('v.accountRec',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    handleClick : function(component, event, helper) {
        var action= component.get("c.updateAccountDetails");
        action.setParams({
            acc : component.get('v.accountRec')
        });
        action.setCallback(this,function(response){
            // alert('called save');
            var state=response.getState();
            alert(state);
            if(state ==="SUCCESS"){
                var result= respose.getReturnValue();
                alert(result);
                if(result ==='success'){
                    alert("success");
                    var toastEvent =$A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title":"SUCCESS!",
                        "message":"the Record has been updated successfully!."
                    });
                    toastEvent.fire();
                }
            }
        });
        $A.enqueueAction(action);
    }

})