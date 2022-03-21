import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class lwcDemo27NavigationService extends  NavigationMixin(LightningElement)  {
 
   navigatetohomepage(){
       this[NavigationMixin.Navigate]({
           type: 'standard__objectPage',
           attributes: {
               objectApiName: 'Account',
               actionName: 'home',
           },
       });
   }
 
   navigatetorecord(){
       this[NavigationMixin.Navigate]({
           type: 'standard__recordPage',
           attributes: {
               recordId: '0015g00000G7kPUAAZ',
               actionName: 'view',
           },
       });
   }
 
   navigatetotab(){
       this[NavigationMixin.Navigate]({
           type: 'standard__navItemPage',
           attributes: {
               apiName: 'LWC_Demo1'
           },
       });
   }
 
   createnewrecord(){
       this[NavigationMixin.Navigate]({
           type: 'standard__objectPage',
           attributes: {
               objectApiName: 'Account',
               actionName: 'new'
           },
       });
 
   }
 
   gotoexternalurl(){
       this[NavigationMixin.Navigate]({
           type: 'standard__webPage',
           attributes: {
               url: 'http://salesforce.com'
           },
       });
   }
}