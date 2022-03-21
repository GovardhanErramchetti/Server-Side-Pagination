import { LightningElement } from 'lwc';

export default class LwcDemo13ContactDetails extends LightningElement {
    contacts =[{
        Id:1,
        Name:'Test Name 1',
        Title :'Title 1'
      },
      {
        Id:2,
        Name:'Test Name 2',
        Title :'Title 2'
      },
      {
        Id:3,
        Name:'Test Name 3',
        Title :'Title 3'
      }];
      selectHandler(event){
        console.log('Div is cliecked and item is'+event.currentTarget.dataset.item);
        var  selectedid = event.currentTarget.dataset.item;
        const selectedEvent = new CustomEvent('selected',{detail : {contactid : selectedid}});
        console.log('>>>>'+JSON.stringify(selectedEvent));
        this.dispatchEvent(selectedEvent);
    }
}