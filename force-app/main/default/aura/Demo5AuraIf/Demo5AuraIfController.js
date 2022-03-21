({
    handleClick : function(component, event, helper) {
            var bolval= component.get('v.show');
            component.set('v.show',!bolval);
            if(!bolval){
                component.set('v.label',"Show False");
            }else{
                component.set('v.label','Show True');
            }
    }
})