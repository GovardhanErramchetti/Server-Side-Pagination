({
	updateParentAttr : function(component, event, helper) {
		component.set('v.parentAttribute','Updated UnBounded parent Attribute Value');
	},
    changeParentAttribute :  function(component, event, helper) {
    	console.log('===========UnBounded parent component logs');
        console.log('UnBounded Parent attribute Is updated');
        console.log('UnBounded Parent attribute old value'+event.getParam('oldValue'));
        console.log('UnBounded Parent attribute new value '+event.getParam('value'));
    }
})