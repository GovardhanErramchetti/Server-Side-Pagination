({
	handleClick : function(component, event, helper) {
		component.set('v.isBounded',!component.get('v.isBounded'));
        component.set('v.label',component.get('v.isBounded') ? "Show Unbounded" :"Show Bounded");
	}
})