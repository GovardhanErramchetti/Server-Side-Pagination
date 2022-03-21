({
    updateBoundedParentAttr : function(component, event, helper) {
        component.set('v.boundedParentAttribute','UnBounded Parent Attribute changed ');

    },
    changeBoundedParentAttribute : function(component, event, helper) {
        console.log('=======UnBounded Parent component logs=====');
        console.log('UnBounded Parent attribute is Updated');
        console.log('UnBounded Parent attribute old value is'+event.getParam('oldValue'));
        console.log('UnBounded Parent attribute new value'+event.getParam('value'));
    }


})