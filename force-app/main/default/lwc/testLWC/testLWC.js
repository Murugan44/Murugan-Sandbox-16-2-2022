import { LightningElement, api } from 'lwc';

export default class TestLWC extends LightningElement {
    @api objectName
    @api isCheck
    text = ''
    checkTest(){
        console.log('objectName::', this.objectName)
        console.log('isCheck::', this.isCheck)
        if(this.isCheck){
            this.text= 'New String'
        }else{
            this.text= ''
        }
    }
}