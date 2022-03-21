import { LightningElement, wire,api } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurretPageReference } from 'lightning/navigation' ;

export default class Demo15ContactDetails extends LightningElement {
    @api contactdetails ;
    @wire(CurretPageReference)pageRef ;
    selectHandler(event){

        fireEvent(this.pageRef,'pubsubselected',this.contactdetails)
    }
}