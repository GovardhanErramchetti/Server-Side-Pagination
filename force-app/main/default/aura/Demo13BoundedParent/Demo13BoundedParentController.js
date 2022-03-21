({
    updateBoundedParentAttr : function(component, event, helper) {
        component.set('v.boundedParentAttribute','Bounded Parent Attribute changed ');

    },
    changeBoundedParentAttribute : function(component, event, helper) {
        console.log('=======Bounded Parent component logs=====');
        console.log('Bounded Parent attribute is Updated');
        console.log('Bounded Parent attribute old value is'+event.getParam('oldValue'));
        console.log('Bounded Parent attribute new value'+event.getParam('value'));
    }


})