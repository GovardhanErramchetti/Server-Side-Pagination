import { LightningElement } from 'lwc';

export default class LwcDemo13EventDemoParent extends LightningElement {
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
  contactSelected(event)
  {
    const selectedContactId=event.detail.contactid;
    console.log('@@@@@'+JSON.stringify(selectedContactId));
    this.selectedContact=this.contacts.find(contacts=>contacts.Id==selectedContactId);
    console.log('@@@@@'+JSON.stringify(this.selectedContact));
  }
}