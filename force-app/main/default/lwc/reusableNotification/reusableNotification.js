import { LightningElement, api } from 'lwc';
import { reduceErrors  } from 'c/errorHandlingUtils'
export default class ReusableNotification extends LightningElement {
    @api error;
    viewDetails = false;

    connectedCallback(){
        console.log('::::>>',this.error)
        this.error = reduceErrors(this.error)
        console.log('::::>>',this.error)
    }

    handleShowDetailsClick() {
        this.viewDetails = !this.viewDetails;
    }
}