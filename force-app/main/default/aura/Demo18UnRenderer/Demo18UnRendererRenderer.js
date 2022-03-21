({

// Your renderer method overrides go here   
unrender:function(){
    this.superUnrender();
    console.log('un rendered component unrender get called ');
}

})