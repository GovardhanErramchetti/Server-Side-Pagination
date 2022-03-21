import { LightningElement,api,wire } from 'lwc';
import {fireEvent} from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';
 
 
export default class LwcDemo15ContactDetails extends LightningElement {
   @api contactdetails;
 
   @wire(CurrentPageReference)pageRef;
 
   selectHandler(event){
       fireEvent(this.pageRef,'pubsubselected',this.contactdetails);
   }
}