import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/csvController.getAccount'
export default class MyBuild extends LightningElement {
    isAcc = false
    isCon = false
    isPol = false
    isPS = false
    accData

    @wire(getAcc)
    acc({data, error}){
        if(data){
            console.log(data)
            this.accData = data
        }
        if(error){
            console.error(error)
        }
    }


    openAcc(){
        console.log('yesssss')
        this.isAcc = true
        this.isCon = false
        this.isPol = false
        this.isPS = false
        var re = this.template.querySelector('.red').classList.add('tablinkRed')
        var re = this.template.querySelector('.gre').classList.remove('tablinkGreen')
        var re = this.template.querySelector('.blu').classList.remove('tablinkbule')
        var re = this.template.querySelector('.yel').classList.remove('tablinkyellow')
    }
    openContact(){
        this.isAcc = false
        this.isCon = true
        this.isPol = false
        this.isPS = false
        var re = this.template.querySelector('.red').classList.remove('tablinkRed')
        var re = this.template.querySelector('.gre').classList.add('tablinkGreen')
        var re = this.template.querySelector('.blu').classList.remove('tablinkbule')
        var re = this.template.querySelector('.yel').classList.remove('tablinkyellow')
       
    }
    openPol(){
        this.isAcc = false
        this.isCon = false
        this.isPol = true
        this.isPS = false
        var re = this.template.querySelector('.red').classList.remove('tablinkRed')
        var re = this.template.querySelector('.gre').classList.remove('tablinkGreen')
        var re = this.template.querySelector('.blu').classList.add('tablinkbule')
        var re = this.template.querySelector('.yel').classList.remove('tablinkyellow')
    }
    openPS(){
        this.isAcc = false
        this.isCon = false
        this.isPol = false
        this.isPS = true
        var re = this.template.querySelector('.red').classList.remove('tablinkRed')
        var re = this.template.querySelector('.gre').classList.remove('tablinkGreen')
        var re = this.template.querySelector('.blu').classList.remove('tablinkbule')
        var re = this.template.querySelector('.yel').classList.add('tablinkyellow')
    }
    isAccDetails = false
    accId = ''
    openAccDetailds(event){
        this.accId = event.target.value
        //const delIconRatingFactorId = event.currentTarget.dataset.recordid;
        console.log(this.accId)
        //console.log(che)
        this.isAccDetails = true
    }
    closeModal(){
        this.isAccDetails = false
    }
}