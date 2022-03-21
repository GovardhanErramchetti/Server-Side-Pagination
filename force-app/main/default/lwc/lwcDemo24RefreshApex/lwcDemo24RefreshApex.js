import { LightningElement ,wire,track} from 'lwc';
import getTotalRecords from '@salesforce/apex/LWCDemo24Controller.getTotalAccountRecords';
import getAccountList from '@salesforce/apex/LWCDemo24Controller.getAccountList';
import updateAccountList from '@salesforce/apex/LWCDemo24Controller.updateAccountList';
import {refreshApex} from '@salesforce/apex';
export default class LwcDemo24RefreshApex extends LightningElement {
    // @wire(getTotalRecords) totalrecords;
 
    @track totalrecords ;
    @track recordPerPage =10;
    @track startIndex ='';
    @track endIndex ='';
    @track action ='';
    @track allAccounts =[];

//    handleClick(event){
//        updateAccountList().then(data =>{
//            alert('Record updated');
//         //    return refreshApex(this.allAccounts);
//        }).catch(error=>{
 
//        });
//    }
connectedCallback(){
    getTotalRecords(
    ).then(result =>{
        this.totalrecords = result;
        console.log('totalrecords',JSON.stringify(this.totalrecords));
    }).catch(error =>{
        console.log('error',JSON.stringify(error));
    })
    this.fetchAccounts();
}
   get showPagination(){
       return this.totalrecords > 10;
   }
   fetchAccounts(){
       console.log(this.recordPerPage ,JSON.stringify(this.recordPerPage));
       getAccountList({
            'recordPerPage': this.recordPerPage,
            'startIndex' : this.startIndex ,
            'endIndex' : this.endIndex,
            'action' : this.action
        }).then(result =>{
            this.allAccounts = [...result];
            // this.allAccounts = JSON.parse(JSON.stringify(result));
            console.log('allAccounts',JSON.stringify(result));

            console.log('allAccounts',JSON.stringify(this.allAccounts));


            this.startIndex = this.allAccounts[0].index;
            let lastIndex = this.allAccounts.length-1;
            this.endIndex = this.allAccounts[lastIndex].index; 
            // this.template.querySelector('c-vr-custom-pagination').reloadPages();
            if(this.template.querySelector('c-vr-custom-pagination')){
                this.template.querySelector('c-vr-custom-pagination').reloadPages();
            }

        }).catch(error =>{
            console.log('error',JSON.stringify(error));
        })
   }
   handleNext(){
    this.action = 'next';
    this.fetchAccounts();
}

handlePrevious(){
    this.action = 'prev';
    this.fetchAccounts(); 
}

}
