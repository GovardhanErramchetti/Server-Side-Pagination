({
    doInit : function(component, event, helper) {
        var action = component.get("c.getAccountDeatailsWithRelatedData");
        var accId= component.get("v.recordId");
        action.setParams({
            accountId : accId
        });
        action.setCallback(this,function(response){
            var state= response.getState();
            if(state ==='SUCCESS'){
                var responseObj =JSON.parse(response.getReturnValue());
                component.set('v.view',responseObj);
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    editRecords :function(component, event, helper) {
        component.set('v.isEdit',true);
    },

    saveRecords :function(component, event, helper) {
        //alert("hello iam called");
         var action =component.get("c.saveDatatoDatabase");
         var jsonData= JSON.stringify(component.get("v.view"));
         action.setParams({
            jsonString :jsonData
         });
         action.setCallback(this,function(response){
            var state= response.getState();
            if(state ==='SUCCESS'){
                //var responseObj =JSON.parse(response.getReturnValue());
                component.set('v.isEdit',false);
                alert("hello anil");
                //console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
     },
     addNewContact : function(component, event, helper) {
        var _newContact={
            "type":"Contact",
            "FirstName":"",
            "Phone":"",
            "Email":"",
            "AccountId": component.get("v.recordId")
        };
        var _contactList = component.get("v.view.wrapperContactList");
        _contactList.push(_newContact);
        component.set("v.view.wrapperContactList",_contactList);
    }

})