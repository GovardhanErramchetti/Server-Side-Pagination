import { LightningElement ,wire,track} from 'lwc';
import getAccountList from '@salesforce/apex/LwcDemo22Controller.getAccountList';
import getContactList from '@salesforce/apex/LwcDemo22Controller.getContactList';

export default class LwcDemo22CallingApex extends LightningElement {
    value= 'none';
    @track options =[];
    @wire(getAccountList) wiredAccount({error,data}){
        if(data){
            console.log(JSON.stringify(data));
            let tempArray=[];
            const temp={label :'None' ,value :'none'};
            tempArray.push(temp);
            for(var acc of data){
                var tempacc={label: acc.Name ,value:acc.Id};
                tempArray.push(tempacc);

            }
            this.options=tempArray;
            console.log('$$$$$'+JSON.stringify(this.options));


        }
        else if(error){
            //error Handling
        }
    }
    handleChange(event){
        this.value=event.target.value;
    }

    @wire(getContactList,{selectedAccountId :'$value'}) allcontacts;
}