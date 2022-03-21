import { LightningElement } from 'lwc';

export default class Demo9GetterSetter extends LightningElement {
    firstName='';
    lastName='';
    fullName='';
    
    handleNameChange(event){
        var field =event.target.name;
        if(field ==='firstname'){
            this.firstName=event.target.value;

        }
        else if(field === 'lastname'){
            this.lastName =event.target.value;
        }
        this.fullName=this.firstName+' '+this.lastName;
    }
    get uppercasename(){
        return this.fullName.toUpperCase();
    }
    set uppercasename(value){
        this.fullName=value;
    }
}