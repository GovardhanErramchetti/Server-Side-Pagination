import { LightningElement,track } from 'lwc';
import getAccountList from '@salesforce/apex/LwcDemo22Controller.getAccountList';
import getContactList from '@salesforce/apex/LwcDemo22Controller.getContactList';

export default class LwcDemo23ImperativeCallingApex extends LightningElement {
    value = 'none';
    @track options = [];
    allcontacts;
  
    renderedCallback(){
        if(this.options.length == 0){
            getAccountList().then(data => {
                if(data){
                    let tempArray = [];
                    const temp =  { label: 'None', value: 'none' };
                    tempArray.push(temp);
                    for(var acc of data){
                        var tempacc = { label: acc.Name, value:acc.Id };
                        tempArray.push(tempacc);
                    }
                    this.options = tempArray;
                }
            }).catch(error => {
                 // error handling
            });
        }
    }
  
    handleChange(event){
        console.log('hello iam called');
        this.value = event.target.value;
        getContactList({selectedAccountId : this.value}).then(data =>{
            this.allcontacts = data;
            console.log('MY WORK DONE');
        }).catch(error=>{
            // error handling
            console.log('i got probelm');
        });
    }
  
 

}