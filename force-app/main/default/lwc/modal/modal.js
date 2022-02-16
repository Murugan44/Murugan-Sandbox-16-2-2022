import { LightningElement } from 'lwc';

export default class Modal extends LightningElement {

    handleFooterChange(){
        const footerelement = this.template.querySelector('.slds-modal__footer')
        if(footerelement){
            footerelement.classList.remove('slds-hide')
        }
    }
    handleSlotHeaderChange(){
        const headerElement = this.template.querySelector('.slds-modal__header')
        if(headerElement){
            headerElement.classList.remove('remove_header')
        }
    }
}