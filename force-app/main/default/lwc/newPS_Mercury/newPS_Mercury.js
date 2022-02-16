import {
    LightningElement,
    api,
    track,
    wire
} from 'lwc';
//import getRFList from '@salesforce/apex/newPS.getRFList';
import getRFoptionList from '@salesforce/apex/newPS.getRFoptionList';
import IndustryLabel from '@salesforce/label/c.Industry';

export default class New_Policy_Schedule extends LightningElement {

    @api recordId
    @api hazardLevel
    @api listingTerritory
    @api years
    @api ilf

    industry = IndustryLabel

    isOpen = false
    @track isStep1 = false
    @track isStep2 = false
    @track isStep3 = false
    @track isStep4 = false

    keyIndex = 0
    @track factorList = []

    faIndex
    @track facList

    @track selectedoption


    @track mapData = []
    @track options
    @track optionsMap = []


    @wire(getRFoptionList)
    retrieveRatingFactor({
        error,
        data
    }) {

        for (let key in data) { // we get value in data
            if (data.hasOwnProperty(key)) { // check values if this is true it allow inside
                let tempOptionArray = []; //  array
                for (let key2 in data[key]) { //  we split index(0,1,2,..etc) list of option in key2
                    tempOptionArray.push({
                        label: data[key][key2],
                        value: data[key][key2]
                    }); // we store options from apex in array
                }
                this.optionsMap.push({
                    key: key,
                    value: tempOptionArray
                }); // we push array to track optionMap
            }
        }
        console.log('options::' + this.optionsMap);
    }

    handleOptionChange(event) {
        console.log('index:::::::' + event.target.accessKey)
        this.selectedoption = event.target.value;
        console.log('selectedoption:::::' + this.selectedoption);
        //this.template.querySelector("[data-id='selectId']").value = this.selectedoption;
    }

    closeModal() {
        this.isStep1 = false;
        this.isStep2 = false;
        this.isStep3 = false;
        this.isStep4 = false;
        this.isOpen = false;
    }
    industryOptions = []
    indstryHazardLevelOptions = []
    Step1() {
        this.isStep1 = true;
        this.isOpen =true

        this.industryOptions =this.industry.split(',').map(function(currentItem){
            return {"label":currentItem, "value":currentItem}
        })
        console.log('this.industryOptions::',this.industryOptions)

        if(this.hazardLevel != null){
            this.indstryHazardLevelOptions = this.hazardLevel.split(',').map(function(currentItem){
                return {"label":currentItem, "value":currentItem}
            })
            console.log('this.hazardLevel::',this.indstryHazardLevelOptions)
        }

        if(this.listingTerritory != null){
            this.listingTerritoryOptions = this.listingTerritory.split(',').map(function(currentItem){
                return {"label":currentItem, "value":currentItem}
            })
            console.log('this.listingTerritory::',this.listingTerritoryOptions)
        }

        if(this.years != null){
            this.yearOptions = this.years.split(',').map(function(currentItem){
                return {"label":currentItem, "value":currentItem}
            })
            console.log('this.yearOptions::',this.yearOptions)
        }
      
    }
    Step2() {
        this.isStep2 = true;
        this.isStep1 = false;
    }
    Previous1() {
        this.isStep1 = true;
        this.isStep2 = false;
        this.factorList = [];
        this.isFactor = false;
    }
    Step3() {
        this.isStep3 = true;
        this.isStep2 = false;
        if(this.ilf != null){
            this.iLFOptions = this.ilf.split(',').map(function(currentItem){
                return {"label":currentItem, "value":currentItem}
            })
            console.log('this.iLFOptions::',this.iLFOptions)
        }
    }
    Previous2() {
        this.isStep2 = true;
        this.isStep3 = false;

    }
    Finish() {
        this.isStep3 = false;
        this.factorList = [];
        this.isFactor = false;
        this.isOpen = false;
    }
    @track isFactor = false;
    addFactor() {
        this.isFactor = true;
        this.keyIndex + 1;
        this.factorList.push({
            VG_Endorsement_Details__c: '',
            VG_Sub_limit__c: '',
            VG_Premium__c: '',
            VG_IsTempDelete__c: ''
        })
    }
    removeFactor(event) {
        console.log('Access key2:' + event.target.accessKey);
        console.log('>>' + event.target.id.split('-')[0]);
        if (this.factorList.length >= 0) {
            this.factorList.splice(event.target.accessKey, 1); //splice - is remove method in js
            console.log('remove::' + event.target.accessKey);
        }
    }
    value = '--None--';
    valueHL = '--None--';
    valueLT = '--None--';
    valueILF = '--None--';
    valueLC = '--None--';
    
    value1 = '--None--';
    get territoryOptions() {
        return [{
                label: '--None--',
                value: '--None--'
            },
            {
                label: 'Cyprus',
                value: 'Cyprus'
            },
            {
                label: 'United Kingdom',
                value: 'United Kingdom'
            },
            {
                label: 'Unites States',
                value: 'Unites States'
            },
            {
                label: 'China',
                value: 'China'
            },

        ];
    }

    valueMT = '--None--';
    get mappedTerritoryOptions() {
        return [{
                label: '--None--',
                value: '--None--'
            },
            {
                label: 'Europe',
                value: 'Europe'
            },
            {
                label: 'United Kingdom',
                value: 'United Kingdom'
            },
            {
                label: 'Unites States',
                value: 'Unites States'
            },
            {
                label: 'China',
                value: 'China'
            },
        ];
    }

    steps = [{
            label: 'Company Information',
            value: 'step1',
        },
        {
            label: 'Exposure',
            value: 'step2'
        },
        {
            label: 'Layers',
            value: 'step3'
        },
    ];
}