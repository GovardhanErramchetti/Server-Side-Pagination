({
    doInit : function(component, event, helper) {
        console.log('init event get Called');
    },
    onRender : function(component, event, helper) {
        console.log('Render Event get Called');
        /*var count=component.get("v.mydata");
        count +=1;
        component.set("v.mydate",count);*/
                //do not write dml or attribute updation here may caude infinite loop(rendering)
    },
    handleClick : function(component, event, helper) {
        console.log('Data Updated');
        component.set("v.mydata","LifeCycle Data Updated");
    },
    destroyComponent : function(component, event, helper) {
        var cmp =component.find("myid");
        cmp.destroy();
    }
})