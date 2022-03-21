import { LightningElement } from 'lwc';

export default class Demo3ConditionalRendering extends LightningElement {
    isDetailsVisible=true;
    handleChange(event){
        this.isDetailsVisible=event.target.checked;
    }
}