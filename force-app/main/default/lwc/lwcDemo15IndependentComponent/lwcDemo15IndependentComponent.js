import { LightningElement,wire } from 'lwc';
import {  registerListener,unregisterAllListeners} from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';
 
export default class LwcDemo15IndependentComponentComm extends LightningElement {
   selectedcontact =  {
       Id : 0,
       Name : 'NA',
       Title : 'NA'
   };
 
   @wire(CurrentPageReference)pageRef;
 
   connectedCallback(){
       registerListener('pubsubselected',this.contactSelectHandler,this);
   }
 
   contactSelectHandler(data){
       this.selectedcontact = data;
   }
 
   disconnectedCallback(){
       unregisterAllListeners(this);
   }
 
}