import { LightningElement } from 'lwc';
export default class Checkout extends LightningElement {
    strInput = true
    passToParent() {
        console.log( 'Input is ' + this.strInput );
        this.dispatchEvent( new CustomEvent( 'pass', {
            detail: this.strInput
        } ) );
    }
}