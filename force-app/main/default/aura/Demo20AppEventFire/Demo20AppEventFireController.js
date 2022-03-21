({
    fireEvent : function(component, event, helper) {
        var appevent= $A.get("e.c:appevent");
        var msg=component.get("v.messageString");
        appevent.setParams({
            message: msg
        });
        appevent.fire();

    }
})