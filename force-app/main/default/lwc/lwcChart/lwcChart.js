import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/lwcChartController.getAccount'
import getPol from '@salesforce/apex/lwcChartController.getPol'
export default class LwcChart extends LightningElement {
    pieChartLabels=[]
    pieChartData=[]

    polpieChartLabels=[]
    polpieChartData=[]

    isShowChart = false
    loader = false

    show(){
        this.isShowChart = true
        this.loader = true
        var timev = setTimeout(()=>{
            this.loader = false
        },2000)
    }
    close(){
        this.isShowChart = false
    }
    @wire(getAcc)
    acc({data,error}){
        if(data){
            console.log('acc data:::',data)
            const result = data.reduce((json, val)=>({...json, [val.Industry]:(json[val.Industry]|0)+1}), {}) //1st time json is empty , val.Industry is Key , json[val.Industry] is value, it is store is {} object
            console.log('result::'+result)
            console.log('Object.keys(result).length ::',Object.keys(result).length)
            if(Object.keys(result).length){
                this.pieChartLabels = Object.keys(result)
                console.log('this.pieChartLabels::',this.pieChartLabels)
                this.pieChartData = Object.values(result)
                console.log('this.pieChartData::',this.pieChartData)
            }
        }
        if(error){
            console.error(error)
        }
    }

    @wire(getPol)
    pol({data,error}){
        if(data){
            console.log('pol data:::',data)
            const result = data.reduce((json, val)=>({...json, [val.Policy_Status__c]:(json[val.Policy_Status__c]|0)+1}), {}) //1st time json is empty , val.Industry is Key , json[val.Industry] is value, it is store is {} object
            console.log('result::'+result)
            console.log('Object.keys(result).length ::',Object.keys(result).length)
            if(Object.keys(result).length){
                this.polpieChartLabels = Object.keys(result)
                console.log('this.polpieChartLabels::',this.polpieChartLabels)
                this.polpieChartData = Object.values(result)
                console.log('this.polpieChartData::',this.polpieChartData)
            }
        }
        if(error){
            console.error(error)
        }
    }
}