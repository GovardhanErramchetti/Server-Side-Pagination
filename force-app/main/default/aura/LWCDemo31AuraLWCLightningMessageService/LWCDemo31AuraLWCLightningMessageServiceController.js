({
    
    handleReceivedMessage : function(component, event, helper) {
        if(event !=null){
            const message = event.getParam("message");
            const source = event.getParam("source");
            component.set("v.receivedMessage",'Message is >>> '+message+' from source '+source);
        }
  
    },
  
    handleClick : function(component, event, helper) {
        let myMessage = component.get("v.myMessage");
        const payload = { message: myMessage , source : 'Sent FROM Aura'};
        component.find("lmsDemochannel").publish(payload);
    }
 
})