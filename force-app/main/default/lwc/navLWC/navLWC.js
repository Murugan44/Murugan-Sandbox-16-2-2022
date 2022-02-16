import { LightningElement,track,api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
export default class NavLWC extends NavigationMixin(LightningElement) {

@api recordId

 Nav(){
    this[NavigationMixin.Navigate]({ 
        type:'standard__navItemPage',
        attributes:{ 
            apiName:'My_App',
            recordId: this.recordId
        }
    })
    console.log(this.recordId)

 }
}