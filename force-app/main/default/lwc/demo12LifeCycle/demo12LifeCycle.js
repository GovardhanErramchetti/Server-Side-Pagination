import { LightningElement } from 'lwc';

export default class Demo12LifeCycle extends LightningElement {
   message="MTX Training";
   count=0;
    handleClick(){
        this.message="Updated message";
    }
    constructor(){
        super();
        console.log("constructor get Called");
    }
    connectedCallback(){
        console.log("ConnectedCallBack get Called");

    }
    renderedCallback(){
        if(this.count== 0){
        console.log("renderedCallback get Called");
            this.count+=1;
            this.message ="This is Called "+this.count+' times' ;
        }

    }
    disconnectedCallback(){
        console.log("DisconnectedCallBack get Called");

    }
}