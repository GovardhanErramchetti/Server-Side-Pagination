({
    doInit : function(component, event, helper) {
        var data = {
            'name' : 'MTX Trainings',
            'email' : 'govardhan@mtxb2b.com'
        };
        component.set('v.jsObject',data);
        component.set('v.myDataType',{'myString' : 'My Type Demo','mytest' : 'testValue'});
    }
})