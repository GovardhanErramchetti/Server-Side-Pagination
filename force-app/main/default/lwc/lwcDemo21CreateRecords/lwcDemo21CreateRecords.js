import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACTIVE_FIELD from '@salesforce/schema/Account.Active__c';
 
export default class LwcDemo21CreateRecords extends LightningElement {
   accountId;
   accountname = '';
 
   handlenamechange(event){
       this.accountname = event.target.value;
   }  
  
   handleClick(){
       const fields = {};
       fields[NAME_FIELD.fieldApiName] = this.accountname;
       fields[ACTIVE_FIELD.fieldApiName] = 'Yes';
       // const fields = {'Name' : this.accountname , 'Active__c' : 'Yes'};
      
       const recordinput = {apiName : ACCOUNT_OBJECT.objectApiName,fields};
     //  createRecord(recordinput).then(account =>{}).catch(error => {});
     console.log('@@@@>>>'+JSON.stringify(recordinput));
       createRecord(recordinput).then(account =>{
                   console.log('@@@@'+JSON.stringify(account));
                   this.accountId = account.id;
                   const toastevent = new ShowToastEvent({
                       title: 'Success',
                       message: 'Record is Created',
                       variant : 'success',
                   });
                   this.dispatchEvent(toastevent);
        }).catch(error => {
           console.log('@@@@'+JSON.stringify(error));
           const toastevent = new ShowToastEvent({
               title: 'FAilure',
               message: error.body.message,
               variant : 'error',
           });
           this.dispatchEvent(toastevent);
       });
 
   }
}