({
	messageUtility : function(component,event,title,cssclass) {
        //alert('called message utility');
        var msg=event.getParam('arguments').message;
        var msgDiv=component.find("messagediv");
        $A.createComponents([
            [
                "lightning:card",{
                    "title":title,
                    "class":cssclass
            }],
            [
                "lightning:formattedText",
                {
                    "value" :msg
            }]
        ],function(components,status){
            if(status === 'SUCCESS'){
                // alert('hello'+components);
                var lccard=components[0];
                var formattedtext = components[1];
                lccard.set("v.body",formattedtext);
                msgDiv.set("v.body",lccard);
            }
        });
		
	},
     
     removeMessageutility :function(component){
         //   alert('hi remove');
            var msgDiv=component.find("messagediv");
            msgDiv.set("v.body",[]);
     }
})