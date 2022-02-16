import { LightningElement } from 'lwc';

export default class AluminiDuesLWC extends LightningElement {
    bntValue = 'Pay'
    amt
    check
    onAnnual(e){
        console.log('e::', e.target.name)
        if(e.target.name == 'Annual'){
            this.template.querySelector('.Annual').classList.remove('slds-button_neutral')
            this.template.querySelector('.Annual').classList.add('slds-button_success')

            this.template.querySelector('.Lifetime').classList.remove('slds-button_success')
            this.template.querySelector('.Lifetime').classList.add('slds-button_neutral')

            this.template.querySelector('.Young').classList.remove('slds-button_success')
            this.template.querySelector('.Young').classList.add('slds-button_neutral')
        }else if(e.target.name == 'Lifetime'){
            this.template.querySelector('.Annual').classList.remove('slds-button_success')
            this.template.querySelector('.Annual').classList.add('slds-button_neutral')

            this.template.querySelector('.Lifetime').classList.remove('slds-button_neutral')
            this.template.querySelector('.Lifetime').classList.add('slds-button_success')

            this.template.querySelector('.Young').classList.remove('slds-button_success')
            this.template.querySelector('.Young').classList.add('slds-button_neutral')
        }else{
            this.template.querySelector('.Annual').classList.remove('slds-button_success')
            this.template.querySelector('.Annual').classList.add('slds-button_neutral')
    
            this.template.querySelector('.Lifetime').classList.remove('slds-button_success')
            this.template.querySelector('.Lifetime').classList.add('slds-button_neutral')
    
            this.template.querySelector('.Young').classList.remove('slds-button_neutral')
            this.template.querySelector('.Young').classList.add('slds-button_success')
        }
        
    }

    onCheck(e){
        console.log('e::', e.target.name)
        this.amt = 0
        if(e.target.name == 'fifty'){
            this.amt = 50
            this.check = false
            this.template.querySelector('.fifty').classList.remove('slds-button_neutral')
            this.template.querySelector('.fifty').classList.add('slds-button_success')

            this.template.querySelector('.hundered').classList.remove('slds-button_success')
            this.template.querySelector('.hundered').classList.add('slds-button_neutral')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_success')
            this.template.querySelector('.oneFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_success')
            this.template.querySelector('.twoFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_success')
            this.template.querySelector('.fivehundered').classList.add('slds-button_neutral')

            this.template.querySelector('.other').classList.remove('slds-button_success')
            this.template.querySelector('.other').classList.add('slds-button_neutral')

        }else if(e.target.name == 'hundered'){
            this.amt = 100
            this.check = false
            this.template.querySelector('.fifty').classList.remove('slds-button_success')
            this.template.querySelector('.fifty').classList.add('slds-button_neutral')

            this.template.querySelector('.hundered').classList.remove('slds-button_neutral')
            this.template.querySelector('.hundered').classList.add('slds-button_success')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_success')
            this.template.querySelector('.oneFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_success')
            this.template.querySelector('.twoFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_success')
            this.template.querySelector('.fivehundered').classList.add('slds-button_neutral')

            this.template.querySelector('.other').classList.remove('slds-button_success')
            this.template.querySelector('.other').classList.add('slds-button_neutral')

        }else if(e.target.name == 'oneFifty'){
            this.amt = 150
            this.check = false
            this.template.querySelector('.fifty').classList.remove('slds-button_success')
            this.template.querySelector('.fifty').classList.add('slds-button_neutral')

            this.template.querySelector('.hundered').classList.remove('slds-button_success')
            this.template.querySelector('.hundered').classList.add('slds-button_neutral')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_neutral')
            this.template.querySelector('.oneFifty').classList.add('slds-button_success')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_success')
            this.template.querySelector('.twoFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_success')
            this.template.querySelector('.fivehundered').classList.add('slds-button_neutral')

            this.template.querySelector('.other').classList.remove('slds-button_success')
            this.template.querySelector('.other').classList.add('slds-button_neutral')

        }else if(e.target.name == 'twoFifty'){
            this.amt = 250
            this.check = false
           this.template.querySelector('.fifty').classList.remove('slds-button_success')
            this.template.querySelector('.fifty').classList.add('slds-button_neutral')

            this.template.querySelector('.hundered').classList.remove('slds-button_success')
            this.template.querySelector('.hundered').classList.add('slds-button_neutral')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_success')
            this.template.querySelector('.oneFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_neutral')
            this.template.querySelector('.twoFifty').classList.add('slds-button_success')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_success')
            this.template.querySelector('.fivehundered').classList.add('slds-button_neutral')

            this.template.querySelector('.other').classList.remove('slds-button_success')
            this.template.querySelector('.other').classList.add('slds-button_neutral')

        } else if(e.target.name == 'fivehundered'){
            this.amt = 500
            this.check = false
            this.template.querySelector('.fifty').classList.remove('slds-button_success')
            this.template.querySelector('.fifty').classList.add('slds-button_neutral')

            this.template.querySelector('.hundered').classList.remove('slds-button_success')
            this.template.querySelector('.hundered').classList.add('slds-button_neutral')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_success')
            this.template.querySelector('.oneFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_success')
            this.template.querySelector('.twoFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_neutral')
            this.template.querySelector('.fivehundered').classList.add('slds-button_success')

            this.template.querySelector('.other').classList.remove('slds-button_success')
            this.template.querySelector('.other').classList.add('slds-button_neutral')

        } else{
            this.amt = 0
            this.check = false
            this.template.querySelector('.fifty').classList.remove('slds-button_success')
            this.template.querySelector('.fifty').classList.add('slds-button_neutral')

            this.template.querySelector('.hundered').classList.remove('slds-button_success')
            this.template.querySelector('.hundered').classList.add('slds-button_neutral')

            this.template.querySelector('.oneFifty').classList.remove('slds-button_success')
            this.template.querySelector('.oneFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.twoFifty').classList.remove('slds-button_success')
            this.template.querySelector('.twoFifty').classList.add('slds-button_neutral')

            this.template.querySelector('.fivehundered').classList.remove('slds-button_success')
            this.template.querySelector('.fivehundered').classList.add('slds-button_neutral')

            this.template.querySelector('.other').classList.remove('slds-button_neutral')
            this.template.querySelector('.other').classList.add('slds-button_success')
        }

    }
    checkBoxLabel = 'Yes, I would like to add $4.76 in credit card fees so that 100% of my donation goes to the Endowmwnt Fund'

    payHandle(e){
        console.log(e.target.checked)
        this.check = e.target.checked
        if(e.target.checked == true){
            var amt = this.amt+4.76
            this.bntValue = `Pay $${amt}`
        }else{
            this.bntValue = `Pay`
        }
    }
}