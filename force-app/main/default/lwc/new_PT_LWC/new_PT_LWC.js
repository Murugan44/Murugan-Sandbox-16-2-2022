import { LightningElement, api } from 'lwc';

export default class New_PT_LWC extends LightningElement{
    @api recordId

    connectedCallback(){
        console.log('record id::', this.recordId);
    }
}