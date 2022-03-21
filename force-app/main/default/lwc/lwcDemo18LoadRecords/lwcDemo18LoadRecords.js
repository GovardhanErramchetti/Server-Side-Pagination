import { LightningElement,api,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { getRecord,getFieldValue} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';


export default class LwcDemo18LoadRecords extends LightningElement {
    @api recordId;
 
    handlesubmit(event){
        const toastevent = new ShowToastEvent({
            title: 'Success',
            message: 'Record is udpated',
        });
        this.dispatchEvent(toastevent);
    }
  
  
    @wire(getRecord , {recordId : '$recordId' , fields : [NAME_FIELD,REVENUE_FIELD,INDUSTRY_FIELD]}) myRecord;
  
    get nameValue(){
        console.log('>>>>>>'+JSON.stringify(this.myRecord));
        return this.myRecord.data ? getFieldValue(this.myRecord.data,NAME_FIELD) : '';
    }
  
    get industryValue(){
        return this.myRecord.data ? getFieldValue(this.myRecord.data,INDUSTRY_FIELD) : '';
    }
  
    get revenueValue(){
        return this.myRecord.data ? getFieldValue(this.myRecord.data,REVENUE_FIELD) : '';
    }
  
    /* >>>>>>{"data":{"apiName":"Account","childRelationships":{},
    "fields":{"AnnualRevenue":{"displayValue":"USD 350,000,000.00","value":350000000},
    "Industry":{"displayValue":"Construction","value":"Construction"},
    "Name":{"displayValue":null,"value":"Burlington Textiles Corp of America1"}},
    "id":"0015g00000EdLr1AAF","lastModifiedById":"0055g000009UR5bAAG",
    "lastModifiedDate":"2021-06-01T07:10:12.000Z","recordTypeId":"012000000000000AAA",
    "recordTypeInfo":null,"systemModstamp":"2021-06-01T07:10:12.000Z"}}*/
 
 
}