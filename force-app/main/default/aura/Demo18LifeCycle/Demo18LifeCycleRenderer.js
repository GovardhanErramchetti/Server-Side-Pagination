({

// Your renderer method overrides go here
render : function(cmp,helper){
    var ret=this.superRender();
    console.log('render method get Called');
    return ret;
},
 rerender :function(cmp,helper){
     this.superRerender();
     console.log('Rerender method get Called');

 },
 afterRender :function(cmp,helper){
    this.superAfterRender();
    console.log('AfterRerender method get Called');

}


})