import { LightningElement,wire } from 'lwc';
import getCars from '@salesforce/apex/carController.getCars'
import {publish, subscribe, MessageContext} from 'lightning/messageService'
import CARS_FILTERED_MESSAGE from'@salesforce/messageChannel/CarsFiltered__c'
import CAR_SELECTED_MESSAGE from '@salesforce/messageChannel/CarSelected__c'
export default class CarTileList extends LightningElement {
    cars=[]
    error
    filters ={}
    carFilterSubscription
    @wire(getCars,{filters:'$filters'})
    car({data,error}){
        if(data){
            console.log(data)
            this.cars = data
        }
        if(error){
            console.error(error)
            this.error = error
        }
    }

    @wire(MessageContext)
    messagecontext

    connectedCallback(){
        this.subscribeHandler()
    }

    subscribeHandler(){
        this.carFilterSubscription = subscribe(this.messagecontext, CARS_FILTERED_MESSAGE, (message)=>this.handleFilterChanges(message))
    }
    handleFilterChanges(message){
        console.log(message.filters)
        this.filters ={...message.filters}
    }

    handleCarSelected(event){
        console.log("selected car Id", event.detail)
        publish(this.messagecontext, CAR_SELECTED_MESSAGE, {
           carId:event.detail
        })
    }

    disconnectedCallback(){
        unsubscribe(this.carFilterSubscription)
        this.carFilterSubscription = null
    }

}