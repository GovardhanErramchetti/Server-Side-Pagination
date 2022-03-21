import { LightningElement } from 'lwc';

export default class Demo14EventDemo extends LightningElement {
   selectedContact={};
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
      constructor(){
          super();
      }
      connectedCallback(){
          this.template.addEventListener('selected',event =>{
              const selectedContactId =event.detail;
              this.selectedContact =this.contacts.find(contact => contact.Id === selectedContactId)
          });
      }
}