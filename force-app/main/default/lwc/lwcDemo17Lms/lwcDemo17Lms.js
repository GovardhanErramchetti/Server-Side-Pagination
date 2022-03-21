import { LightningElement ,wire} from 'lwc';
import {APPLICATION_SCOPE,MessageContext,publish,subscribe,unsubscribe} from 'lightning/messageService';
import lmsDemo17 from '@salesforce/messageChannel/Demolms__c'


export default class LwcDemo17Lms extends LightningElement {
    receivedMessage;
    passedmessage;
    channel;
  
    @wire(MessageContext)messageContext;
  
    handleMessageChange(event){
        this.passedmessage = event.target.value;
    }
  
    handlePublish(){
        const payload = { message: this.passedmessage , source : 'Sent FROM LWC'};
        publish(this.messageContext, lmsDemo17, payload);
    }
    handleSubscribe(){
      //  this.channel = subscribe(this.messageContext,lmsDemo17,function(event){});
      if (!this.channel) {
        this.channel = subscribe(
            this.messageContext,
            lmsDemo17,
            (data) => this.handleMessage(data),
            { scope: APPLICATION_SCOPE }
        );
    }
    }
  
    handleMessage(data) {
        this.receivedMessage = 'Message is '+ data.message + 'and source is :'+data.source;
    }
  
    handleUnsubscribe(){
        unsubscribe(this.channel);
    }
 
}