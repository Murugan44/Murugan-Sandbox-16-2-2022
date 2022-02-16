import { LightningElement } from 'lwc';

export default class LwcGoogleMap extends LightningElement {

    Street
    pCode
    City
    Country
    State
    isSectionOpen = false
    openSection(){
        this.isSectionOpen = true
    }
    closeSection(){
        this.isSectionOpen = false
    }

    onchangeHandler(event) {
        if(event.target.name == 'Street'){
            this.Street = event.target.value
            console.log('street:::'+this.Street)
        }
        if(event.target.name == 'Postal Code'){
            this.pCode = event.target.value
            console.log('Pin code:::'+this.pCode)
        }
        if(event.target.name == 'State'){
            this.State = event.target.value
            console.log('State:::'+this.State)
        }
        if(event.target.name == 'City'){
            this.City = event.target.value
            console.log('City:::'+this.City)
        }
        if(event.target.name == 'Country'){
            this.Country = event.target.value
            console.log('Country:::'+this.Country)
        }
    }

    mapMarkers=[]
    isMap = false
    loader = false
    map(){
        this.isMap = true
        this.loader = true
        var timev = setTimeout(()=>{
            this.loader = false
        },3000)
        this.mapMarkers =[{
            location:{
                City: this.City,
                Country: this.Country,
                PostalCode: this.pCode,
                State: this.State,
                Street: this.Street
            }
        }]
    }

    closeMap(){
        this.isMap = false
    }
}