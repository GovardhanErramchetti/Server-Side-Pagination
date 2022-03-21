({
    fireEvent : function(component, event, helper) {
        var cmpevent= component.getEvent("cmpEvent");
        var msg=component.get("v.messageString");
        cmpevent.setParams({
            message: msg
        });
        cmpevent.fire();

    }
})