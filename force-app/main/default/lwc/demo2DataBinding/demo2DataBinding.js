import { LightningElement } from 'lwc';

export default class Demo2DataBinding extends LightningElement {

    greeting ='welcome to MTX Salesforce trainings';
    firstName='';
    lastName='';
    fullName={fname:'',lname:''}
    handleChange(event){
        this.greeting=event.target.value;
    }
    handleNameChange(event){
        var field =event.target.name;
        if(field ==='firstname'){
            this.firstName=event.target.value;

        }
        else if(field === 'lastname'){
            this.lastName =event.target.value;
        }
        this.fullName={fname:this.firstName,lname:this.lastName};
    }
}