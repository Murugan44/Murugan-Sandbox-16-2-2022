import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi'
import CAR_OBJ from'@salesforce/schema/Car__c'
import CATEGORY_FIELD from'@salesforce/schema/Car__c.Category__c'
import MAKE_FIELD from'@salesforce/schema/Car__c.Make__c'

const CATEGORY_ERROR = 'Error loading categories'
const MAKE_ERROR = 'Error loading Make Types'

import { publish,MessageContext } from 'lightning/messageService'
import CARS_FILTERED_MESSAGE from'@salesforce/messageChannel/CarsFiltered__c'
export default class CarFilter extends LightningElement {
    categoryError=CATEGORY_ERROR
    makeError = MAKE_ERROR
    timer
    filter={
        searchKey:'',
        maxPrice:999999
    }

    @wire(MessageContext)
    messagecontext

    @wire(getObjectInfo,{objectApiName:CAR_OBJ})
    carObjectInfo

    @wire(getPicklistValues, {
        recordTypeId:'$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName:CATEGORY_FIELD
    })categories

    @wire(getPicklistValues, {
        recordTypeId:'$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName:MAKE_FIELD
    })makeType

    handleSearchKeyChange(event){
        console.log(event.target.value)
        this.filter = {...this.filter,"searchKey":event.target.value} // this is way to update object
        this.sendDataToCarList()
    }

    handleMaxPriceChange(event){
        console.log(event.target.value)
        this.filter = {...this.filter,"maxPrice":event.target.value}
        this.sendDataToCarList()
    }

    handleCheckbox(event){
        if(!this.filter.categories){
            const categories = this.categories.data.values.map(item=>item.value)
            const makeType = this.makeType.data.values.map(item=>item.value)
            this.filter = {...this.filter, categories, makeType}
            console.log('this.filter::',this.filter)
        }
        const {name,value} = event.target.dataset
        console.log('Name::',name)
        console.log('Value::',value)

        if(event.target.checked){
            if(!this.filter[name].includes(value)){
                this.filter[name] = [...this.filter[name], value]
                console.log('this.filter[name]::',this.filter[name])
            }
        }else{
            this.filter[name] =  this.filter[name].filter(item=>item !==value)
            console.log('else this.filter[name]::',this.filter[name])
        }
        this.sendDataToCarList()
    }

    sendDataToCarList(){
        window.clearTimeout(this.timer)
        this.timer = window.setTimeout(()=>{
            publish(this.messagecontext, CARS_FILTERED_MESSAGE, {
                filters:this.filter
            })
        },400)
        
    }
}