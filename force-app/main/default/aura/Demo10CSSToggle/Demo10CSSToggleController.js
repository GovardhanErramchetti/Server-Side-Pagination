({
	handleClick : function(component, event, helper) {
   
		var toggleText=component.find("mytext");
        $A.util.toggleClass(toggleText,"toggle");
        if($A.util.hasClass(toggleText,"toggle"))
        {
            alert("true");
            component.find("mybutton").set('v.label','Show');
            
        }else{
                 alert("fasle");
                        component.find("mybutton").set('v.label','Hide');

        }
	}
})