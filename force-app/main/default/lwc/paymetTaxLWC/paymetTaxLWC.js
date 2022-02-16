import { LightningElement,track } from 'lwc';

export default class PaymetTaxLWC extends LightningElement {
    @track paymentList = [];
    keyIndex = 0;

    addPaymentPolicy(){
        console.log('addPaymentPolicy')
        this.keyIndex+1;
        this.paymentList.push({
            dueDate: '',
            amt: '',
            // pfList: {
            //     ps:'',
            //     gwp:''
            // }
        }) 
        console.log(this.paymentList)
    }
}