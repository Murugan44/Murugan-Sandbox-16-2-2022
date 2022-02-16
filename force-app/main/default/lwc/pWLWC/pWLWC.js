import { LightningElement, track } from 'lwc';
import {loadScript} from 'lightning/platformResourceLoader';
import lottieJS from '@salesforce/resourceUrl/lottie';

import getPricingList from '@salesforce/apex/PricingWrapperController.getPricingList';
import getNetBasePremium from '@salesforce/apex/PricingWrapperController.getNetBasePremium';

export default class PWLWC extends LightningElement {
    @track selectedProductName
    @track pricingOptionsMap = []

    @track typeOfOperation = []
    @track crimeOptions = []
    rateList=[]

    rateValue = ''

    isStepOne = true
    isStepTwo = false
    isStepThree = false
    isSpinner = false

    loaded = false;
     renderedCallback() {
        if(!this.loaded) {
            loadScript(this, lottieJS).then(() => {
                // this.firstUpdated();
                console.log('lottieJS loaded succesfully')
                this.loaded = true;
                this.load()
                this.isSpinner = true
            })
        }
    }

    load(){
        console.log('lottie::',lottie)
        var container = this.template.querySelector('.animation');
        var options = {
            container: container,
            loop: true,
            autoplay: true,
            renderer: "svg",
            rendererSettings: {
                preserveAspectRatio: "xMidYMid meet",
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src = 'https://assets2.lottiefiles.com/packages/lf20_t4m6huub.json'
        var srcParsed = this.parseSrc(src);
        console.log('srcParsed::', srcParsed)
        var srcAttrib = typeof srcParsed === "string" ? "path" : "animationData";
        lottie.loadAnimation({
            ...options,[srcAttrib]: srcParsed
        });

        var container1 = this.template.querySelector('.ani');
        var options1 = {
            container: container1,
            loop: true,
            autoplay: true,
            renderer: "svg",
            rendererSettings: {
                preserveAspectRatio: "xMidYMid meet",
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src1 = 'https://assets1.lottiefiles.com/datafiles/HN7OcWNnoqje6iXIiZdWzKxvLIbfeCGTmvXmEm1h/data.json'
        var srcParsed1 = this.parseSrc(src1);
        var srcAttrib1 = typeof srcParsed1 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
            ...options1,[srcAttrib1]: srcParsed1
        });

        var container2 = this.template.querySelector('.profile');
        var options2 = {
            container: container2,
            loop: true,
            autoplay: true,
            renderer: "svg",
            rendererSettings: {
                preserveAspectRatio: "xMidYMid meet",
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src2 = 'https://assets9.lottiefiles.com/packages/lf20_ibrxdnnn.json'
        var srcParsed2 = this.parseSrc(src2);
        var srcAttrib2 = typeof srcParsed2 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
            ...options2,[srcAttrib2]: srcParsed2
        });

         var container3 = this.template.querySelector('.book');
        var options3 = {
            container: container3,
            loop: true,
            autoplay: true,
            renderer: "svg",
            rendererSettings: {
                preserveAspectRatio: "xMidYMid meet",
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src3 = 'https://assets4.lottiefiles.com/packages/lf20_wqepljpj.json'
        var srcParsed3 = this.parseSrc(src3);
        var srcAttrib3 = typeof srcParsed3 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
            ...options3,[srcAttrib3]: srcParsed3
        });

         var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
    }

    parseSrc(src) {
        if (typeof src === "object") {
            return src;
        }
        try {
            return JSON.parse(src);
            console.log('inside try'+src);
        } catch (e) {
            console.log('inside catch'+e);
            const srcUrl = new URL(src, window.location.href);
            return srcUrl.toString();
        }
    }

    handleSetChange(e){
         this.isSpinner = true
        this.pricingOptionsMap = []
        this.typeOfOperation = []
        this.crimeOptions = []
        this.selectedProductName = e.target.value
        console.log('this.selectedProductName::',this.selectedProductName)
        this.getPricingHadler(this.selectedProductName)
        
    }
    isFooter = false

     getPricingHadler(product){
        getPricingList({
            product:product
        }).then(res=>{
            console.log('res::', res)
            for (let key in res) {
                if (res.hasOwnProperty(key)) {
                    console.log('key::', key,'::', res[key]);
                    if(product == 'Crime'){
                        if(key == 'Type of operation'){
                            let tempOptionArray = [];
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
                            this.typeOfOperation = tempOptionArray
                        }else if(key == 'Territory Risk' || key == 'Risk Management' || key == 'Number of Locations' || key == 'Financial Health' || key == 'Decentralised Organisation' || key == 'Acquisition History' || key == 'Time in Business' || key == 'Full Retro-cover' || key == 'Control Procedures' || key == 'Claims History'){
                            let tempOptionArray = [];
                            for (let key2 in res[key]) {
                                var val = `crime${String(key).replace(/\s+/g, '')}`
                                var section = `${String(res[key][key2].VG_Rating_Factor__c).replace(/\s+/g, '')}${String(key).replace(/\s+/g, '')}`
                                tempOptionArray.push({
                                    label: res[key][key2].VG_Rating_Factor__c,
                                    // value: `${res[key][key2].VG_Rate__c} ${val}`,
                                    value: res[key][key2].VG_Rate__c,
                                    class:`btn ${val} ${section}`,
                                    name: val,
                                    section: section
                                    
                                });
                            }
                            this.crimeOptions.push({
                                key: key,
                                value: tempOptionArray
                            });
                        }
                    }else if(product == 'PI'){
                        // this.typeOfOperation = []
                        if(key == 'Type of operation'){
                            let tempOptionArray = [];
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
                                this.typeOfOperation = tempOptionArray
                        } else if(key == 'Claims History' || key == 'Retroexposure exposure factor:' || key == 'Limitation in Contract' || key == 'US Turnover (% of total):' || key == 'Adjustment for large contracts:' || key == 'Adjustment factor for own design:' || key == 'Use of sub-contractors'){
                            let tempOptionArray = [];
                            for (let key2 in res[key]) {
                               var val = `PI${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                var section = `${String(res[key][key2].VG_Rating_Factor__c).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                tempOptionArray.push({
                                    label: res[key][key2].VG_Rating_Factor__c,
                                    value: res[key][key2].VG_Rate__c,
                                    class:`btn ${val} ${section}`,
                                    name: val,
                                    section: section
                                });
                            }
                            this.crimeOptions.push({
                                key: key,
                                value: tempOptionArray
                            });
                        }
                    } else if(product == 'D&O'){
                        if(key == 'Type of operation'){
                            let tempOptionArray = [];
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
                                this.typeOfOperation = tempOptionArray
                        } else if(key == 'Claims History' || key == 'ADR Programme (Level 1 or 2**)' || key == 'Full Retro Cover' || key == 'Time in Business' || key == 'Hazardous Activities' || key == 'Risk Management' || key == 'US Exposure (% of total):' || key == 'Publicly Traded' || key == 'Financial Health:' || key == 'Acqusition History'){
                            let tempOptionArray = [];
                            for (let key2 in res[key]) {
                                var val = `DO${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                var section = `${String(res[key][key2].VG_Rating_Factor__c).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                tempOptionArray.push({
                                    label: res[key][key2].VG_Rating_Factor__c,
                                    value: res[key][key2].VG_Rate__c,
                                    class:`btn ${val} ${section}`,
                                    name: val,
                                    section: section
                                    
                                });
                            }
                            this.crimeOptions.push({
                                key: key,
                                value: tempOptionArray
                            });
                        }
                    }else if(product == 'Clinical Trials'){
                        if(key == 'Type of operation'){
                            let tempOptionArray = [];
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
                                this.typeOfOperation = tempOptionArray
                        } else if(key == 'Geography' || key == 'Hazardous Product' || key == 'Risk Management' || key == 'First In Class' || key == 'Phase'){
                            let tempOptionArray = [];
                            for (let key2 in res[key]) {
                               var val = `ClinicalTrials${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                var section = `${String(res[key][key2].VG_Rating_Factor__c).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}${String(key).replace(/\s+/g, '').replaceAll(/[^a-zA-Z0-9]/g, "")}`
                                tempOptionArray.push({
                                    label: res[key][key2].VG_Rating_Factor__c,
                                    value: res[key][key2].VG_Rate__c,
                                    class:`btn ${val} ${section}`,
                                    name: val,
                                    section: section
                                });
                            }
                            this.crimeOptions.push({
                                key: key,
                                value: tempOptionArray
                            });
                        }
                    }
                        
                }
                    // this.pricingOptionsMap
                
            }
            console.log('crimeOptions::', this.crimeOptions)
            console.log(' this.typeOfOperation:::', this.typeOfOperation)
           
            this.isFooter = true
            var timev = setTimeout(() => {
				this.isSpinner = false
                this.isStepOne = false
                this.isStepTwo = true
                this.isStepThree = false
			}, 1000)
        }).catch(e=>{
            console.error('error::', e)
        })
    }

    handleCancel(){
        location.reload()
    }

    handleStepOne(){
        this.isSpinner = true
        this.isStepOne = true
        this.isStepTwo = false
        this.isStepThree = false
        this.isStepFour = false
         loadScript(this, lottieJS).then(() => {
            // this.firstUpdated();
            console.log('lottieJS loaded succesfully')
            this.loaded = true;
            this.load()
        })
        var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
    }

    handleStepTwo(){
        this.isSpinner = true
        this.isStepOne = false
        this.isStepTwo = true
        this.isStepThree = false
        this.isStepFour = false
        var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
    }
    

    handleStepThree(){
        this.totalNBP = []
        this.isSpinner = true
        this.isStepOne = false
        this.isStepTwo = false
        this.isStepThree = true
        this.isStepFour = false
        var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
    }

    handleChange(e){
        this.rateList = []
        console.log('e::', e.detail.value)
        console.log('e::', e.detail.label)
        this.rateValue = e.target.value
        this.handleRateCalc(e.target.value)
        this.rateList.push(this.rateValue)
    }

    check = ''
    rateHandle(e){
        
        // console.log('e.target.name >>:::', e.target.name)
        // console.log('e.target.dataset.name >>:::', e.target.dataset.name)
        // console.log('e.target.value >>:::', e.target.value, e.target.classList)
        if(e.target.classList.contains(`${e.target.name}`)){
            if(e.target.classList.contains(`${e.target.dataset.name}`)){
                var btn = this.template.querySelectorAll(`.${e.target.name}`)
                btn.forEach((b)=>b.classList.remove('butn'))
                btn.forEach((b)=>b.classList.add('btn'))
                // console.log('e.target.dataset.name >>:::', e.target.dataset.name)
                e.target.classList.remove('btn')
                e.target.classList.add('butn')

                // if(this.rateList.includes(e.target.value)){
                    
                //         var arr = this.rateList.filter(e => e !== e.target.value);
                //         console.log('arr::', arr)
                //     // this.rateList.forEach(function(currentValue,Index,ActuallArray){
                //     //     console.log(currentValue, Index, ActuallArray.splice(Index,1))
                //     //     // this.rateList.splice(Index,1)
                //     // })
                // }else{
                //     this.rateList.push(e.target.value)
                //     console.log('this.rateList::', this.rateList)
                // }


                // var tempArray = []
                // if(this.check =='' || this.check == null){
                //     this.check = e.target.name
                //     console.log('check::', this.check)
                //     this.rateList.push(e.target.value)
                //     console.log('rateList::', this.rateList)
                //     tempArray.push(e.target.value)
                // }else{
                //     // this.check = this.check +';'+ e.target.name
                //     this.rateList.push(e.target.value)
                //     // console.log('check else::', this.check)
                //     if(this.check.includes(e.target.name)){
                //         console.log('check else::', this.check)
                //         this.rateList.forEach(function(currentValue,Index,ActuallArray){
                //             console.log(currentValue, Index)
                //             if(currentValue != e.target.value)
                //                 tempArray.splice(Index,1)
                //             else
                //                 tempArray.push(currentValue)
                //             console.log('tempArray::', tempArray)
                //         })
                //     }else{
                //         this.check = ''
                //     }
                    
                // }
                
                var rate = e.target.value
                this.handleRateCalc(rate)
            }
        }
      
    }

    turnOverHandler(e){
        this.turnoverValue = e.target.value
    }

    totalNBP = []
    handleRateCalc(rate){
        console.log('this.turnoverValue::', this.turnoverValue)
        console.log('rate::', rate)
        console.log('this.selectedProductName::', this.selectedProductName)
        getNetBasePremium({
            Turnover_Converted: this.turnoverValue,
            TOPRate: rate,
            Product: this.selectedProductName
        }).then(res=>{
            console.log('res::', res)
            this.totalNBP.push(res)
            console.log('totalNBP::', this.totalNBP)
        }).catch(e=>{
            console.error(e)
        })
    }

    totalNetBasePremium
    handleStepFour(){
         this.isSpinner = true
        this.isStepOne = false
        this.isStepTwo = false
        this.isStepThree = false
        this.isStepFour = true
        this.totalNetBasePremium = this.totalNBP.reduce((a, b) => a + b, 0)
        this.totalNetBasePremium = this.totalNetBasePremium.toFixed(2)
        console.log('totalNetBasePremium::', this.totalNetBasePremium)
        var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
    }
    isStripePayment = false
    fetchValue( event ) {
         this.isSpinner = true
        this.isStepOne = false
        this.isStepTwo = false
        this.isStepThree = false
        this.isStepFour = false
        var timev = setTimeout(() => {
            this.isSpinner = false
        }, 1000)
        console.log( 'Value from Child LWC is ' + event.detail );
        this.isStripePayment = event.detail;
    }
    allDone
    allDoneHandler(event) {
        this.allDone = event.detail
        console.log('allDone::',this.allDone)
    }

}