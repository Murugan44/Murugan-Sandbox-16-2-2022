import { LightningElement,wire } from 'lwc';
import mapAccount from '@salesforce/apex/lwcMapController.accountMap'
import { refreshApex } from '@salesforce/apex';
export default class LwcMap extends LightningElement {
    isopenMap = false
    loader = false
    mapMarkers=[]
    mapTitle="Accounts Location"
    refresinghMap
    @wire(mapAccount)
    accVal(result){
        this.refresinghMap = result;
        if(result.data){
            console.log(result.data)
            this.mapFunction(result)
        }
        if(result.error){
            console.error(result.error)
        }
    }

    openMap(){
        this.isopenMap = true
        this.loader = true
        var timev = setTimeout(()=>{
            this.loader = false
        },3000)
    }
    closeMap(){
        this.isopenMap = false
    }

    refreshMap(){
        return refreshApex(this.refresinghMap)
    }

    mapFunction(result){
        this.mapMarkers = result.data.map(item=>{
            return {
                location: {
                    Street: item.ShippingCity || '',
                    City: item.ShippingCity || '',
                    PostalCode: item.ShippingPostalCode || '',
                    Street: item.ShippingStreet || '',
                    Country: item.ShippingCountry || '',
                },
                icon:'utility:salesforce1',
                title:item.Name,
                value:item.Name,
                //description:item.description
            }
        })
        this.selectedMap = this.mapMarkers.length && this.mapMarkers[0].value
    }

    callMarkerHandler(event){
        this.selectedMap = event.detail.selectedMarkerValue
    }
}