({
    handleClick : function(component, event, helper) {
        var cmp=component.find('demo1input');
        console.log('local id is '+cmp.getLocalId());
        console.log('inout value is '+cmp.get('v.value'));
        console.log('local id is '+cmp.getGlobalId());

        console.log('label  is '+cmp.get('v.label'));
        cmp.set('v.value','MTX Group Inc');
        cmp.set('v.label','my changes input');
        console.log('label  is '+cmp.get('v.label'));

    },
    showMultipleIds : function(component, event, helper) {
        var cmp= component.find('demo2input');
        cmp.forEach(function(item,index){
            console.log('item ---'+index+ '   local id is '+item.getLocalId());
            console.log('item ---'+index+ '   global id is '+item.getGlobalId());
            var myval= item.get('v.value');
            if(myval !==''){
                item.set('v.readonly',true);
            }
        });

    },
    reset : function(component, event, helper) {
        var cmp= component.find('demo2input');
        cmp.forEach(function(item,index){
          item.set('v.value','');
          item.set('v.readonly',false);

        });
    }

    

})