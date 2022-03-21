import { LightningElement ,api} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';

export default class LwcDemo20CreateRecord extends LightningElement {
    @api recordId;
    fields=[NAME_FIELD];
    accountId;
    handlesuccess(event){
        console.log('....'+JSON.stringify(event.detail));
        this.accountId = event.detail.id;
        console.log('>>>>>>>>'+this.accountId);
        eval("$A.get('e.force:refreshView').fire()");
    }
}