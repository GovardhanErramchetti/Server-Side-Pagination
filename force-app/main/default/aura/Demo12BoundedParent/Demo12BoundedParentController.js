({
	updateParentAttr : function(component, event, helper) {
		component.set('v.parentAttribute','Updated Bounded parent Attribute Value');
	},
    changeParentAttribute :  function(component, event, helper) {
    	console.log('===========Bounded parent component logs');
        console.log('Bounded Parent attribute Is updated');
        console.log('Bounded Parent attribute old value'+event.getParam('oldValue'));
        console.log('Bounded Parent attribute new value '+event.getParam('value'));
    }
})