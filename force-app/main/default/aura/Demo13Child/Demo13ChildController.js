({
    updateChildAttr : function(component, event, helper) {
        component.set('v.childAttribute','Child Attribute changed ');

    },
    changeChildAttribute : function(component, event, helper) {
        console.log('=======child componen logs=====');
        console.log('child attribute is Updated');
        console.log('child attribute old value is'+event.getParam('oldValue'));
        console.log('child attribute new value'+event.getParam('value'));
    }


})