import { LightningElement,api, track } from 'lwc';
import getPricingList from '@salesforce/apex/PricingWrapperController.getPricingList';
export default class PricingWrapperLWC extends LightningElement {
    productValue = ''
    @api productList
    @track productOptions = []
    @track pricingOptionsMap = []
    lableName = 'Product'

    isSpinner = false

    connectedCallback(){
        this.isSpinner = true
        this.productList.split(';').forEach(currentItem => {
            this.productOptions.push({
                "label": currentItem,
                "value": currentItem,
                "class":'slds-icon_container slds-icon-standard-product',
                "icon":'standard:product',
                "variant":"error"
            })
        })
        this.isSpinner = false
    }

    handleSelectOption(e){
        this.isSpinner = true
        this.pricingOptionsMap = []
        this.productValue = e.target.value

        this.getPricingHadler(this.productValue)
    }

    getPricingHadler(product){
        getPricingList({
            product:product
        }).then(res=>{
            console.log('res::', res)
            for (let key in res) {
                if (res.hasOwnProperty(key)) {
                    let tempOptionArray = [];
                    console.log('key::', key,'::', res[key]);
                    for (let key2 in res[key]) {
                        console.log('key2::', res[key][key2].VG_Rating_Factor__c);
                        tempOptionArray.push({
                            label: res[key][key2].VG_Rating_Factor__c,
                            value: res[key][key2].VG_Rate__c,
                            class:'slds-icon_container slds-icon-custom-custom41',
                            icon:'custom:custom41',
                            "variant":"success"
                        });
                    }
                    this.pricingOptionsMap.push({
                        key: key,
                        value: tempOptionArray
                    });
                }
            }
            console.log(' this.pricingOptionsMap:::', this.pricingOptionsMap)
           
            
            var timev = setTimeout(() => {
				this.isSpinner = false
			}, 1000)
        }).catch(e=>{
            console.error('error::', e)
        })
    }

    handleOptionChange(e){
        console.log('rate::', e.target.value)
        console.log('name::', e.target.label)
        console.log('recordid::', e.currentTarget.dataset.recordid)
        //const delIconRatingFactorId = event.currentTarget.dataset.recordid;
    }
}