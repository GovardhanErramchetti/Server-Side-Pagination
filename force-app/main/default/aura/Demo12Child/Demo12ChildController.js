({
	updateChildAttr : function(component, event, helper) {
		component.set('v.childAttribute','Updated child Attribute Value');
	},
    changeChildAttribute :  function(component, event, helper) {
    	console.log('===========child component logs');
        console.log('child attribute Is updated');
        console.log('child attribute old value'+event.getParam('oldValue'));
        console.log('child attribute new value '+event.getParam('value'));
    }
})