import {
	LightningElement,
	track,
	wire,
	api
} from 'lwc';
//import FIDO_LoydsProduct_FI_D_O from '@salesforce/label/c.FIDO_LoydsProduct_FI_D_O';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import RD_OBJECT from '@salesforce/schema/Risk_Capture__c';
import RD_OBJECTFI from '@salesforce/schema/Risk_Capture__c';
import RD_OBJECTDO from '@salesforce/schema/Risk_Capture__c';
import RD_OBJECTPI from '@salesforce/schema/Risk_Capture__c';
import RD_OBJECTWI from '@salesforce/schema/Risk_Capture__c';
import RD_OBJECTCC from '@salesforce/schema/Risk_Capture__c';
import PS_OBJECT from '@salesforce/schema/Policy_Schedule__c';
import CURRENCY_FIELD from '@salesforce/schema/Policy__c.VG_Policy_Currency__c';
import CURRENCYISO_FIELD from '@salesforce/schema/Policy__c.CurrencyIsoCode';
import getElList from '@salesforce/apex/New_ps.getElList';
import getEndorsList from '@salesforce/apex/New_ps.getEndorsList';
import psFinish from '@salesforce/apex/New_ps.psFinish';
import calcProRata from '@salesforce/apex/New_ps.calcProRata';
import calcEndorementPremium from '@salesforce/apex/New_ps.calcEndorementPremium';
import calcRiskPremium from '@salesforce/apex/New_ps.calcRiskPremium';
import calcNetModelPremium from '@salesforce/apex/New_ps.calcNetModelPremium';
import calcTechnicalUWPremium from '@salesforce/apex/New_ps.calcTechnicalUWPremium';
import calcgrossWrittenPremium100 from '@salesforce/apex/New_ps.calcgrossWrittenPremium100';
import calcSumInsured from '@salesforce/apex/New_ps.calcSumInsured';
import calcGWP from '@salesforce/apex/New_ps.calcGWP';
import calcBrokerAmount from '@salesforce/apex/New_ps.calcBrokerAmount';
import calcactualPremium from '@salesforce/apex/New_ps.calcactualPremium';
import calcDeminimis from '@salesforce/apex/New_ps.calcDeminimis';
import calcRetension from '@salesforce/apex/New_ps.calcRetension';
import calcFeeAmount from '@salesforce/apex/New_ps.calcFeeAmount';
import calcBasePremiumRate from '@salesforce/apex/New_ps.calcBasePremiumRate';
import calcBasePremium from '@salesforce/apex/New_ps.calcBasePremium';
import calcBasePremiumTotal from '@salesforce/apex/New_ps.calcBasePremiumTotal';
//import calcgenerateReinstatement from '@salesforce/apex/New_ps.calcgenerateReinstatement';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
//import NAME_FIELD from "@salesforce/schema/Endorsement_Library__c.Name";
//import ENDORSMENT_TITLE_FIELD from "@salesforce/schema/Endorsement_Library__c.Endorsement_Title__c";
/*const columns = [
    { label: 'Number', fieldName: 'Name' },
    { label: 'Title', fieldName: 'Endorsement_Title__c' },
    
];*/
const fields = [CURRENCYISO_FIELD];
export default class ModalPopupLWC extends(LightningElement) {
	//Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
	@api recordId;
	//sublimits values
    /*columns = columns;
     @wire(getElList)
    contacts;*/

	@track data = [];
    @track error;
	//@track selectedCons;
	// Getting sublimits using Wire Service
    @wire(getElList)
    subLimits(result) {
        if (result.data) {
            this.data = result.data;
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }
	// Getting Endors using Wire Service
	@track dataEndors = [];
	@wire(getEndorsList)
    Endors(result) {
        if (result.data) {
            this.dataEndors = result.data;
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            this.dataEndors = undefined;
        }
    }

	@track isModalOpen = false;
	isStep2 = false;
	isStep3 = false;
	isStep4 = false;
	isStep5 = false;
	isStep6 = false;
	isStep7 = false;
	isfinish = false;
	isSublimit = false;
	isSelectedSublimit = false;
	isEndors = false;
	isCheckedEndors = false;
	//isAddEndors = false;
	isPSE = false;
	isRententions = false;
	//Risk detail pages Based on product selection
	isFIProductRC = false;
	isDOProductRC = false;
	isPIProductRC = false;
	isCCProductRC = false;
	isWIProductRC = false;
	//Risk Rating pages Based on product selection
	isFIandDOProductsRR = false;
	isPTProductsRR = false;
	@track product ='';
	@track lProduct='';
	/*@wire(getPicklistValues,
        {
            recordTypeId: "$recordId", //pass id dynamically
            fieldApiName: CURRENCY_FIELD
        }
    )
    currencyValues;*/
	@track selectedOption; 
    @track options;

	/*@wire(getRecord, {recordId:'$recordId', fields})
    account({error, data}) {
        if (data) {
            let currValue = getFieldValue(data, CURRENCYISO_FIELD);

            if (!this.options) {
                this.options = [{label:currValue, value:currValue}];
				console.log(':::'+this.options)
            }

            let currIsValid = options.some(function(item) {
                return item.value === currValue;
            }, this);

            if (currIsValid) {
                this.selectedOption = currValue;
            }
        } else if (error) {
            console.log(error);
        }
	}*/
	@wire(getPicklistValues, { recordTypeId: '0120O000000L9je', fieldApiName: CURRENCY_FIELD })
    setPicklistOptions({error, data}) {
        if (data) {
            this.options = data.values;

            if (this.selectedOption) {
                let optionIsValid = this.options.some(function(item) {
                    return item.value === this.selectedOption;
                }, this);

                if (!optionIsValid) {
                    this.selectedOption = data.defaultValue;
                }
            } else {
                this.selectedOption = data.defaultValue;
            }
        } else if (error) {
            console.log(error);
        }
    }

	

	@wire(getRecord, {
		recordId: "$recordId",
		fields
	})
    record1;

    get curr(){
		console.log('recordvsl::'+this.record1);
        return getFieldValue(this.record1.data, CURRENCYISO_FIELD);
    }

	
	@track elList = [];

	@track endorsList = [];

	keyIndex = 0;
    @track itemList = [
		{
			VG_Coverage_Type__c: '',
				VG_Territorial_Limits__c:'',
				VG_Share__c:'',
				VG_Deductible__c:'',
				VG_Sub_limit__c:'',
				VG_Premium__c:'',
				VG_IsTempDelete__c:''
		}
	];

	keyIndexPI = 0;
    @track itemPIList = [
		{
			VG_Profession__c: '',
			VG_Fee_Amounts__c:'',
			VG_Base_Premium_Rate__c:'',
			VG_Base_Premium__c:'',
			VG_Deductible__c:'',
			VG_Sub_limit__c:'',
			VG_IsTempDelete__c:''
		}
	];

	keyIndexpse = 0;
	//@track pseList = [];

	
	//Product selection
	value = '--None--';
    	get productOptions() {
        return [
			{ label: '--None--', value: '--None--' },
            { label: 'FI - D&O', value: 'FI - D&O' },
            { label: 'FI - PI', value: 'FI - PI' },
            { label: 'FI - Crime', value: 'FI - Crime' },
            { label: 'FI - Fiduciary', value: 'FI - Fiduciary' },
            { label: 'FI - Cyber', value: 'FI - Cyber' },
            { label: 'FI - Blend', value: 'FI - Blend' },
			{ label: 'Directors & Officers', value: 'Directors & Officers' },
			{ label: 'Pre-paid D&O Run-off', value: 'Pre-paid D&O Run-off' },
			{ label: 'D&O Run-off', value: 'D&O Run-off' },
			{ label: 'Professional Indemnity', value: 'Professional Indemnity' },
			{ label: 'Commercial Crime', value: 'Commercial Crime' },
			{ label: 'Warranty & Indemnity', value: 'Warranty & Indemnity' },
        ];

    }
	
	value = 'Side A';
	get doprodOptions() {
			return [
				{ label: 'Side A', value: 'Side A' },
				{ label: 'A Side DIC', value: 'A Side DIC' },
				{ label: 'AB', value: 'AB' },
				{ label: 'ABC', value: 'ABC' },
				{ label: 'POSI', value: 'POSI' },
			
			];
	}
	@track doproduct = '';
	doProductSelected(e){
		const doselectedOption = e.detail.value;
		this.doproduct = doselectedOption;
		//this.productOptions = this.product;
		console.log('this.doproduct>>>'+this.doproduct);
	}
	@track SideBRentention = '';
	@track SideBRentention1 = '';
	Side_B_Rentention(e){
		this.SideBRentention = e.detail.value;
		console.log('this.SideBRentention>>>'+this.SideBRentention);
	}
	Side_B_Rentention2(e){
		this.SideBRentention1 = e.detail.value;
		console.log('this.SideBRentention1>>>'+this.SideBRentention1);
	}

	@track SideCRentention = '';
	@track SideCRentention1 = '';
	Side_C_Rentention1(e){
		this.SideCRentention = e.detail.value;
		console.log('this.SideCRentention>>>'+this.SideCRentention);
	}
	Side_C_Rentention2(e){
		this.SideCRentention1 = e.detail.value;
		console.log('this.SideCRentention1>>>'+this.SideCRentention1);
	}
	@track SideBCurrencys = '' ;
	SideBCurrency(e){
		this.SideBCurrencys = e.detail.value;
		console.log('this.SideBCurrencys>>>'+this.SideBCurrencys);
	}
	@track SideCCurrencys = '' ;
	SideCCurrency(e){
		this.SideCCurrencys = e.detail.value;
		console.log('this.SideCCurrencys>>>'+this.SideCCurrencys);
	}
	//onchange event for product select
	handleChange(e){
		const selectedOption = e.detail.value;
		this.product = selectedOption;
		//this.productOptions = this.product;
		console.log('this.productOptions>>>'+this.product);

		if(this.product =='Directors & Officers' || this.product == 'Pre-paid D&O Run-off' || this.product == 'D&O Run-off' || this.product == 'FI - D&O'){
			this.isRententions = true;
		}else{
			this.isRententions = false;
		}
		/*if(this.isRententions == true){
			console.log('check if::'+this.isRententions);
			if(this.product != 'Directors & Officers'){
				console.log('check if::'+this.product);
				this.SideBRentention = '';
				this.SideBRentention1 = '';
				this.SideCRentention = '';
				this.SideCRentention1 = '';
				this.SideBCurrencys = '';
				this.SideCCurrencys = '';
			}
		}*/
		if(this.product =='Directors & Officers' || this.product == 'Pre-paid D&O Run-off' || this.product == 'D&O Run-off'){
			this.isDOProductRC = true;
		}
		else{
			this.isDOProductRC = false;
		}

		if(this.product == 'FI - D&O' || this.product == 'FI - PI' || this.product == 'FI - Crime' || this.product == 'FI - Fiduciary' || this.product == 'FI - Cyber' || this.product == 'FI - Blend'){
			this.isFIProductRC = true;
		}else{
			this.isFIProductRC = false;
		}

		if(this.product == 'Professional Indemnity'){
			this.isPIProductRC = true;
			this.isPTProductsRR = true;
		}else{
			this.isPIProductRC = false;
			this.isPTProductsRR = false;
		}

		if(this.product == 'Commercial Crime'){
			this.isCCProductRC = true;
		}else{
			this.isCCProductRC = false;
		}

		if(this.product == 'Warranty & Indemnity'){
			this.isWIProductRC = true;
		}else{
			this.isWIProductRC = false;
		}

		if(this.product == 'Commercial Crime' || this.product =='Directors & Officers' || this.product == 'Pre-paid D&O Run-off' || this.product == 'D&O Run-off'|| this.product == 'FI - D&O' || this.product == 'FI - PI' || this.product == 'FI - Crime' || this.product == 'FI - Fiduciary' || this.product == 'FI - Cyber' || this.product == 'FI - Blend'){
			this.isFIandDOProductsRR = true;
		}else{
			this.isFIandDOProductsRR = false;
		}
		
		if(this.product != 'FI - D&O' || this.product != 'FI - PI' || this.product != 'FI - Crime' || this.product != 'FI - Fiduciary' || this.product != 'FI - Cyber' || this.product != 'FI - Blend'){
			this.rdRecordsFI = [];
		}
		if(this.product !='Directors & Officers' || this.product != 'Pre-paid D&O Run-off' || this.product != 'D&O Run-off'){
			this.rdRecordsDO =[];
		}
		if(this.product != 'Commercial Crime'){
			this.rdRecordsCC = [];
		}
		if(this.product != 'Professional Indemnity'){
			this.rdRecordsPI = [];
		}
		if(this.product != 'Warranty & Indemnity'){
			this.rdRecordsWI = [];
		}
	}
	/*----------------------------------------------------------------label = {
        FIDO_LoydsProduct_FI_D_O
    };*/
	
	//Lloyds Product selection based on product select
	value = '--None--';
    	get lloydsProductOptions() {
			if(this.product == 'FI - D&O'){
				return [
					{ label: 'D4-D&O FI incl USA', value: 'D4-D&O FI incl USA' },
					{ label: 'D5-D&O FI excl USA', value: 'D5-D&O FI excl USA' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'FI - PI'){
				return [
					{ label: 'F2-PI FI incl USA', value: 'F2-PI FI incl USA' },
					{ label: 'F3-PI FI excl USA', value: 'F3-PI FI excl USA' },
					{ label: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA', value: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA' },
					{ label: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA', value: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'FI - Crime'){
				return [
					{ label: 'BB-Crime', value: 'BB-Crime' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'FI - Fiduciary'){
				return [
					{ label: 'FI - Fiduciary', value: 'FI - Fiduciary' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'FI - Cyber'){
				return [
					{ label: 'CY-Cyber', value: 'CY-Cyber' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'FI - Blend'){
				return [
					{ label: 'BB-Crime', value: 'BB-Crime' },
					{ label: 'F2-PI FI incl USA', value: 'F2-PI FI incl USA' },
					{ label: 'F3-PI FI excl USA', value: 'F3-PI FI excl USA' },
					{ label: 'D4-D&O FI incl USA', value: 'D4-D&O FI incl USA' },
					{ label: 'D5-D&O FI excl USA', value: 'D5-D&O FI excl USA' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					{ label: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA', value: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA' },
					{ label: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA', value: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA' },
					{ label: 'CY-Cyber', value: 'CY-Cyber' },
					{ label: 'FI - Fiduciary', value: 'FI - Fiduciary' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },

				];
			}else if(this.product == 'Directors & Officers' || this.product == 'Pre-paid D&O Run-off' || this.product == 'D&O Run-off'){
				return [
					{ label: 'D2-D&O excl FI incl USA', value: 'D2-D&O excl FI incl USA' },
					{ label: 'D3-D&O excl FI excl USA', value: 'D3-D&O excl FI excl USA' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
				];
			}else if(this.product == 'Professional Indemnity'){
				return [
					{ label: 'E3-PI Legal excl USA', value: 'E3-PI Legal excl USA' },
					{ label: 'E5-PI Acc excl USA', value: 'E5-PI Acc excl USA' },
					{ label: 'E7-PI Arch/ Eng excl USA', value: 'E7-PI Arch/ Eng excl USA' },
					{ label: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA', value: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
				];
			}else if(this.product == 'Commercial Crime'){
				return [
					{ label: 'D4-D&O FI incl USA', value: 'D4-D&O FI incl USA' },
					{ label: 'D5-D&O FI excl USA', value: 'D5-D&O FI excl USA' },
					{ label: 'F2-PI FI incl USA', value: 'F2-PI FI incl USA' },
					{ label: 'F3-PI FI excl USA', value: 'F3-PI FI excl USA' },
					{ label: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA', value: 'E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA' },
					{ label: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA', value: 'E9-PI excl Legal/ Acc / Arch/ Eng/ FI excl USA' },
					{ label: 'BB-Crime', value: 'BB-Crime' },
					{ label: 'CY-Cyber', value: 'CY-Cyber' },
					{ label: '7T-Terrorism TPL', value: '7T-Terrorism TPL' },
					{ label: 'D6-EPL incl USA', value: 'D6-EPL incl USA' },
					{ label: 'D7-EPL excl USA', value: 'D7-EPL excl USA' },
					
				];
			}else if(this.product == 'Warranty & Indemnity'){
				return [
					{ label: 'D8-TL incl USA', value: 'D8-TL incl USA' },
					{ label: 'D9-TL excl USA', value: 'D9-TL excl USA' },
					
				];
			}
    }

	lloydsProductSelected(e){
		const selectedOptions = e.detail.value;
		this.lProduct = selectedOptions;
		console.log('Lproduct::>>'+this.lProduct);
	}

	@track psId = '';
	loader0 = false
	Step1() {
		this.loader0 = true
        var timev = setTimeout(()=>{
            this.loader0 = false
        },3000)
		// to open modal set isModalOpen tarck value as true
		this.isModalOpen = true;
		
	}

	closeModal() {
		// to close modal set isModalOpen tarck value as false
		this.isModalOpen = false;
		this.isStep2 = false;
		this.isStep3 = false;
		this.isStep4 = false;
		this.isStep5 = false;
		this.isStep6 = false;
		this.isStep7 = false;
		this.isfinish = false;
		this.isRententions = false;
			  this.product = [];
			  this.lProduct = [];
			  this.doproduct = [];
			  this.rdRecords = [];
			  this.itemPIList = [];
			  this.itemList = [];
			  this.elList = [];
			  this.endorsList = [];
			  this.psRecords = [];
	}

	loader1 = false
	step2() {
		//loader1 = false
		this.loader1 = true
		this.loader0 = false
        var timev = setTimeout(()=>{
            this.loader1 = false
        },3000)
		if(this.product == '--None--' || this.product == ''){
			this.isModalOpen = true;
			const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Please Choose Product...',
                variant: 'error',
            });
            this.dispatchEvent(evt);
		}else if(this.lProduct == '--None--' || this.lProduct == ''){
			this.isModalOpen = true;
			const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Please Choose Lloyds Product...',
                variant: 'error',
            });
            this.dispatchEvent(evt);
		}else{
			this.isStep2 = true;
			this.isModalOpen = false;
		}
		//eval("$A.get('e.force:refreshView').fire();");
	}

	Previous() {
		this.isModalOpen = true;
		this.isStep2 = false;
		
		//return refreshApex(this.rdRecords);
	}
	step3() {
		// to close modal set isModalOpen tarck value as false
		if(this.product != 'Warranty & Indemnity'){
			this.isStep3 = true;
			this.isStep2 = false;
		}else{
			this.isfinish = true;
			this.isWIproduct = true;
		}
		
	}
	Previous1() {
		this.isStep2 = true;
		this.isStep3 = false;
	}

	@track proRata;
	step4() {
		// to close modal set isModalOpen tarck value as false
		if(this.product == 'Professional Indemnity'){
			this.isStep6 = true;
		}
		if(this.itemList.length >= 0){
			const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Please add atleast one asset to the policy schedule....',
                variant: 'error',
            });
            this.dispatchEvent(evt);
			this.isStep3 = true;
			this.isStep4 = false;
		}else{
			this.isStep4 = true;
			this.isStep3 = false;
			if(this.data.length >= 0){
				this.isSublimit = true;
			}else{
				this.isSublimit = false;
			}
			
		}
		if(this.itemPIList.length <= 0){
			const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Please add atleast one asset to the policy schedule....',
                variant: 'error',
            });
            this.dispatchEvent(evt);
			this.isStep3 = true;
			this.isStep4 = false;
		}else{
			this.isStep4 = true;
			this.isStep3 = false;
			if(this.data.length >= 0){
				this.isSublimit = true;
			}else{
				this.isSublimit = false;
			}
		}
	
		// for Prorata calc - fetch value from apex
		calcProRata({
			polId: this.recordId,
			prorata: this.proRata
		})
		.then(result => {
			this.proRata = result;
			console.log('tot::'+result+'::'+result.value);
			
		})
		//this.dispatchEvent(toastEvent1);
	}
	Previous2() {
		
		this.isStep3 = true;
		this.isStep4 = false;
	}

	step5() {
		// to close modal set isModalOpen tarck value as false
	
		if(this.product != 'Warranty & Indemnity'){
		this.isStep5 = true;
		if(this.elList.length >= 0){
			this.isSelectedSublimit = true;
		}else{
			this.isSelectedSublimit = false;
		}
		this.isStep4 = false;
		}
        let selectedRows = this.template.querySelectorAll('lightning-input');
			//console.log('row select===='+selectedRows);
        // based on selected row getting values of the endorsment
        for(let i = 0; i < selectedRows.length; i++) {
				//console.log('selectedRows.length>>>'+selectedRows.length);
            if(selectedRows[i].checked && selectedRows[i].type === 'checkbox') {
				//console.log('row select11===='+selectedRows[i].checked);
				//console.log('row select12===='+selectedRows[i].type);
				
                this.elList.push({
					VG_Endorsement_Details__c: '',
					VG_Premium__c: 0,
					VG_Sub_limit__c: 0
                })
            }
        }
	}

	//Sublimit values pass to controller
	handleChangeSL1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.elList[event.target.accessKey].VG_Endorsement_Details__c = event.target.value;
		console.log('VG_Endorsement_Details__c::' +this.elList[event.target.accessKey].VG_Endorsement_Details__c);		
	}
	handleChangeSL2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.elList[event.target.accessKey].VG_Premium__c = event.target.value;
		console.log('VG_Premium__c::' +this.elList[event.target.accessKey].VG_Premium__c);		
	}
	handleChangeSL3(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.elList[event.target.accessKey].VG_Sub_limit__c = event.target.value;
		console.log('VG_Sub_limit__c::' +this.elList[event.target.accessKey].VG_Sub_limit__c);		
	}
	
	// Select the all rows
	allSelected(event) {
		let selectedRows = this.template.querySelectorAll('lightning-input');
		
		for(let i = 0; i < selectedRows.length; i++) {
			if(selectedRows[i].type === 'checkbox') {
				selectedRows[i].checked = event.target.checked;
			}
		}
	}

	Previous3() {
		this.elList = [];
		this.isStep4 = true;
		this.isStep5 = false;
	}

	@track totalRiskPremium;
	@track riskPre = '';
	step6() {
		// to close modal set isModalOpen tarck value as false
		if(this.product != 'Warranty & Indemnity'){
		this.isStep6 = true;
		this.isStep5 = false;
		this.isEndors = true;
		}
		// for total Risk Premium - fetch value from apex
		calcRiskPremium({
			rrList: this.itemList,
			rrPIList: this.itemPIList,
			psProduct: this.product,
			proRata: this.proRata
		})
		.then(result => {
			this.totalRiskPremium = result;
			console.log('tot::'+result+'::'+result.value);
			this.riskPre = this.totalRiskPremium;
			console.log('this.riskpremium:::'+this.riskPre);
		})
		//this.dispatchEvent(toastEvent1);

	}
	Previous4() {

		
		if(this.product == 'Professional Indemnity'){
			this.isStep3 = true;
			this.isStep4 = false;
			this.isStep5 = false;
			this.isStep6 = false;
		}else{
			this.isStep5 = true;
			this.isStep6 = false;
		}
	}
	step7() {
		// to close modal set isModalOpen tarck value as false
		if(this.product != 'Warranty & Indemnity'){
		this.isStep7 = true;
		this.isStep6 = false;
		}
		let selectedRows = this.template.querySelectorAll('lightning-input');
		//console.log('row select===='+selectedRows);
		// based on selected row getting values of the endorsment
		for(let i = 0; i < selectedRows.length; i++) {
				//console.log('selectedRows.length>>>'+selectedRows.length);
			if(selectedRows[i].checked && selectedRows[i].type === 'checkbox') {
				//console.log('row select11===='+selectedRows[i].checked);
				//console.log('row select12===='+selectedRows[i].type);
				this.isCheckedEndors = true;
				this.endorsList.push({
					VG_Title__c : selectedRows[i].value,
					VG_Endorsement_Details__c: selectedRows[i].value,
					VG_Premium__c: 0,
					VG_Sub_limit__c: 0
				})
			}
		}
	}

	
	//Endorsment values are passed through 
	handleChangeEndors1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.endorsList[event.target.accessKey].VG_Title__c = event.target.value;
		console.log('VG_Title__c::' +this.endorsList[event.target.accessKey].VG_Title__c);		
	}
	handleChangeEndors2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.endorsList[event.target.accessKey].VG_Endorsement_Details__c = event.target.value;
		console.log('VG_Endorsement_Details__c::' +this.endorsList[event.target.accessKey].VG_Endorsement_Details__c);		
	}
	handleChangeEndors3(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.endorsList[event.target.accessKey].VG_Premium__c = event.target.value;
		console.log('VG_Premium__c::' +this.endorsList[event.target.accessKey].VG_Premium__c);

		//this.netModelPremium = parseInt(this.riskPremium) + parseInt(this.endorsementPremium);	
		//console.log('netModelPremium::'+this.netModelPremium);	
	}
	handleChangeEndors4(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.endorsList[event.target.accessKey].VG_Sub_limit__c = event.target.value;
		console.log('VG_Sub_limit__c::' +this.endorsList[event.target.accessKey].VG_Sub_limit__c);		
	}

	//Add endorsement button functionality
	addpseRow(){
		this.isCheckedEndors = true;
			this.keyIndexpse+1;
			this.endorsList.push({
				VG_Endorsement_Details__c: '',
				VG_Sub_limit__c: 0,
				VG_Premium__c: 0
			}) 		
	}

	removePse(e){

		if(this.endorsList.length >= 1){
			this.endorsList.splice(e.target.accessKey,1);  //splice - is remove method in js
			this.keyIndexpse-1;
		}
	}
	//Add endorsement button functionality value passed to controller
	/*changePse1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pseList[event.target.accessKey].VG_Title__c = event.target.value;
		console.log('VG_Title__c::' +this.pseList[event.target.accessKey].VG_Title__c);		
	}
	changePse2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pseList[event.target.accessKey].VG_Endorsement_Details__c = event.target.value;
		console.log('VG_Endorsement_Details__c::' +this.pseList[event.target.accessKey].VG_Endorsement_Details__c);		
	}
	changePse3(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pseList[event.target.accessKey].VG_Premium__c = event.target.value;
		console.log('VG_Premium__c::' +this.pseList[event.target.accessKey].VG_Premium__c);
		this.endorsementPremium =+ this.pseList[event.target.accessKey].VG_Premium__c;
		console.log('endorsementPremiumPSE::'+this.endorsementPremium);	

			
	}
	changePse4(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pseList[event.target.accessKey].VG_Sub_limit__c = event.target.value;
		console.log('VG_Sub_limit__c::' +this.pseList[event.target.accessKey].VG_Sub_limit__c);		
	}*/

	Previous5() {
		this.endorsList = [];
		this.isStep6 = true;
		this.isStep7 = false;
		this.isPSE = false;
	}
	@track totalendPremium = 0;
	@track valueNetModelPremium;
	@track psRecords = PS_OBJECT;
	@track isWIproduct = false;
	@track isNonWIproduct = false;
	step8() {
		// to close modal set isModalOpen tarck value as false
		
		this.isfinish = true;
		this.isStep7 = false;
		if(this.product == 'Warranty & Indemnity'){
			this.isWIproduct = true;
			this.isNonWIproduct = false;
		}else{
			this.isWIproduct = false;
			this.isNonWIproduct = true;
		}
				// for total endorsement Premium - fetch value from apex
		calcEndorementPremium({
			//pseList: this.pseList,
			pseList: this.endorsList,
			psProduct: this.product,
			proRata: this.proRata
			//endorsementPremium: this.totalendPremium
		})
		.then(result => {
			this.totalendPremium = result;
			console.log('tot::'+result+'::'+result.value);
			
			this.netModelPremium()
			console.log('method call::'+this.netModelPremium);
		})
		//this.dispatchEvent(toastEvent2);
		
	}

	netModelPremium(){

		calcNetModelPremium({
			endmentValue: this.totalendPremium,
			riskPreValue: this.totalRiskPremium
		})
		.then(result => {
			this.valueNetModelPremium = result;
			console.log('tot::'+result+'::'+result.value);
			this.techUWPremium = this.valueNetModelPremium;
			this.technicalUWPremium();
			console.log('method call::'+this.technicalUWPremium);
		})
		//this.dispatchEvent(toastEvent3);
		
		
	}

	
	@track techUWPremium;
	@track technicalUWPremiumValues;
	@track grossWrittenPremium100Values;
	premiumAdjustment(e){
		this.psRecords.Premium_Adjustment__c = e.detail.value;
		console.log('premiumAdjustment::'+this.psRecords.Premium_Adjustment__c);
		this.technicalUWPremium();
			console.log('method call1::'+this.technicalUWPremium);
	}

	technicalUWPremium(){
		calcTechnicalUWPremium({
			netModelPremiumValue: this.valueNetModelPremium,
			premiumAdjustmentValue: this.psRecords.Premium_Adjustment__c
		})
		.then(result => {
			this.technicalUWPremiumValues = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent4);
	}
    
	premiumAdjustment2(e){
		this.psRecords.Premium_Adjustment_2__c = e.detail.value;
		console.log('commercialAdjustment::'+this.psRecords.Premium_Adjustment_2__c);
		if(this.product != 'Warranty & Indemnity'){
			this.grossWrittenPremium100();
			console.log('method call1::'+this.grossWrittenPremium100);
		}else{
			this.grossWrittenPre();
			console.log('method call1::'+this.grossWrittenPre);
		}
		
	}
    
    grossWrittenPremium100(){
		calcgrossWrittenPremium100({
			commercialAdjustmentValue: this.psRecords.Premium_Adjustment_2__c,
			technicalUWPremiumValue: this.technicalUWPremiumValues
		})
		.then(result => {
			this.grossWrittenPremium100Values = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent5);
	}
    
    value = 'Primary';
	get layerOptions() {
			return [
				{ label: 'Primary', value: 'Primary' },
				{ label: '1st XS', value: '1st XS' },
				{ label: '2st XS', value: '2st XS' },
				{ label: '3st XS', value: '3st XS' },
				{ label: '4st XS', value: '4st XS' },
				{ label: '5st XS', value: '5st XS' },
				{ label: '6st XS', value: '6st XS' }
			
			];
	}
    @track layerValues='';
	layer(e){
		const selectedLayerOption = e.detail.value;
		this.layerValues = selectedLayerOption;
		console.log('layer::'+this.layerValues);
	}
    
	limit(e){
		this.psRecords.Limit__c = e.detail.value;
		console.log('limit::'+this.psRecords.Limit__c);
	}
    
	attachment(e){
		this.psRecords.Attachment__c = e.detail.value;
		console.log('attachmentValues::'+this.psRecords.Attachment__c);
	}
    
	splitType(e){
		this.psRecords.Split_Type__c = e.detail.value;
		console.log('splitTypeValues::'+this.psRecords.Split_Type__c);
	}

	writtenShare(e){
		this.psRecords.Written_share__c = e.detail.value;
		console.log('writtenShareValues::'+this.psRecords.Written_share__c);
		
	}

	signedShare(e){
		this.psRecords.Share__c = e.detail.value;
		console.log('signedShareValues::'+this.psRecords.Share__c);
		this.sumInsured();
		console.log('apex call3::'+this.sumInsured);
			
	}

	@track sumInsuredValues; 
	sumInsured(){
		calcSumInsured({
			limitValue: this.psRecords.Limit__c,
			signedShareValue: this.psRecords.Share__c
		})
		.then(result => {
			this.sumInsuredValues = result;
			console.log('tot::'+result+'::'+result.value);
			this.grossWrittenPre();
			console.log('apex call3::'+this.grossWrittenPre);
		})
		//this.dispatchEvent(toastEvent6);
	}

	@track grossWrittenPremiumValues;
	grossWrittenPre(){
		calcGWP({
			gwp100Value: this.grossWrittenPremium100Values,
			signedShareVal: this.psRecords.Share__c,
			psProduct: this.product,
			//for WI product
			riskPreWI: this.psRecords.Risk_Premium_Pro__c,
			endorsementPreWI: this.psRecords.Endorsement_Premium_Pro__c,
			uwPreWI: this.psRecords.Premium_Adjustment__c,
			adjustment: this.psRecords.Premium_Adjustment_2__c
		})
		.then(result => {
			this.grossWrittenPremiumValues = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent7);
	}
	
	BrokeragePercent(e){
		this.psRecords.VG_Brokerage_Percent__c = e.detail.value;
		console.log('BrokeragePercent::'+this.psRecords.VG_Brokerage_Percent__c);
		this.brokerageAmount();
		console.log('apex call3::'+this.brokerageAmount);
	}

	@track brokerageValues;
	brokerageAmount(){
		calcBrokerAmount({
			gwpValue: this.grossWrittenPremiumValues,
			brokeragepercentVal: this.psRecords.VG_Brokerage_Percent__c
		})
		.then(result => {
			this.brokerageValues = result;
			console.log('tot::'+result+'::'+result.value);
			this.actualPremium();
			console.log('apex call3::'+this.actualPremium);
		})
		//this.dispatchEvent(toastEvent8);
	}

	rateChange(e){
		this.psRecords.VG_Rate_Change__c = e.detail.value;
		console.log('rateChange::'+this.psRecords.VG_Rate_Change__c);
	}

	@track actualPremiumValue;
	actualPremium(){
		calcactualPremium({
			gwpValue: this.grossWrittenPremiumValues,
			brokerageAmtVal: this.brokerageValues
		})
		.then(result => {
			this.actualPremiumValue = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent9);
	}

	grossorNet(e){
		this.psRecords.Gross_or_Net_Premium__c = e.detail.value;
		console.log('grossorNet::'+this.psRecords.Gross_or_Net_Premium__c);
	}

	capacityPaper(e){
		this.psRecords.VG_Capacity_Paper__c = e.detail.value;
		console.log('capacityPaper::'+this.psRecords.VG_Capacity_Paper__c);
	}

	volanteEntities(e){
		this.psRecords.VG_Volante_Entities__c = e.detail.value;
		console.log('volanteEntities::'+this.psRecords.VG_Volante_Entities__c);
	}
	// W&I product finish page calculations
	RiskPremiumWI(e){
		this.psRecords.Risk_Premium_Pro__c = e.detail.value;
		console.log('RiskPremiumWI::WI::'+this.psRecords.Risk_Premium_Pro__c);
	}
	premiumAdjustmentWI(e){
		this.psRecords.Premium_Adjustment__c = e.detail.value;
		console.log('UW Adjustment::WI::'+this.psRecords.Premium_Adjustment__c);
	}
	EndoresPremiumWI(e){
		this.psRecords.Endorsement_Premium_Pro__c = e.detail.value;
		console.log('EndoresPremiumWI::WI::'+this.psRecords.Endorsement_Premium_Pro__c);
	}

	Previous6() {
		if(this.product != 'Warranty & Indemnity'){
			this.isStep7 = true;
			this.isfinish = false;
			this.isPSE = false;
		}else{
			this.isStep2 = true;
			this.isfinish = false;
		}
		
	}
	AddRR() {

	}

	// finish button
	Finish(){
		//step1 values are passed to apex class 
		psFinish({
			polId: this.recordId,
			psProduct: this.product,
			psLloydsProduct: this.lProduct,
			psDOProduct: this.doproduct,
			rCRec: this.rdRecords,
			rrList: this.itemList,
			rrPIList: this.itemPIList,
			slList: this.elList,
			endorsList: this.endorsList,
			endorsementPremium: this.totalendPremium,
			riskPremium: this.totalRiskPremium,
			netModelPremium: this.valueNetModelPremium,
			technicalUWPremium: this.technicalUWPremiumValues,
			grossWrittenPremium100: this.grossWrittenPremium100Values,
			sumInsured: this.sumInsuredValues,
			grossWrittenPremium: this.grossWrittenPremiumValues,
			brokerageAmt: this.brokerageValues,
			actualPremium: this.actualPremiumValue,
			psRec: this.psRecords,
			psLayer: this.layerValues
		})
		.then(result => {
			this.psId = result.Id;
			console.log('idss::' + this.psId);
			
			this.dispatchEvent(
				new ShowToastEvent({
				  title: 'Success!',
				  message: 'Policy Schedyle Record is created',
				  variant: 'success'
			  }),
			  );
			  this.isfinish = false;
			  this.product = [];
			  this.lProduct = [];
			  this.doproduct = [];
			  this.rdRecords = [];
			  this.itemPIList = [];
			  this.itemList = [];
			  this.elList = [];
			  this.endorsList = [];
			  this.psRecords = [];
		})
		//this.dispatchEvent(toastEvent);
		.catch(error => {
			window.console.log(error);
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Error while creating. Please contact admin',
					message: error.message,
					variant: 'error',
				}),
			);
			//this.showLoadingSpinner = false;
		});
		
	}

	addEndorsement() {
		this.isPSE = true;
	}

	@track rdRecords = RD_OBJECT;
	@track rdRecordsFI = RD_OBJECTFI;
	@track rdRecordsDO = RD_OBJECTDO;
	@track rdRecordsPI = RD_OBJECTPI;
	@track rdRecordsCC = RD_OBJECTCC;
	@track rdRecordsWI = RD_OBJECTWI;

	handleChange1(event) {
		this.rdRecordsFI.VG_Company_Domicile__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Company_Domicile__c::' +this.rdRecordsFI.VG_Company_Domicile__c);
	}
	handleChange2(event) {
		this.rdRecordsFI.VG_Industry__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Industry__c::' +this.rdRecordsFI.VG_Industry__c);
	}
	handleChange3(event) {
		this.rdRecordsFI.VG_Revenue__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Revenue__c::' +this.rdRecordsFI.VG_Revenue__c);
	}
	handleChange4(event) {
		this.rdRecordsFI.VG_Total_Assets__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Total_Assets__c::' +this.rdRecordsFI.VG_Total_Assets__c);
	}
	handleChange5(event) {
		this.rdRecordsFI.VG_Market_Cap__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Market_Cap__c::' +this.rdRecordsFI.VG_Market_Cap__c);
	}
	handleChange6(event) {
		this.rdRecordsFI.VG_Net_Profit__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Net_Profit__c::' +this.rdRecordsFI.VG_Net_Profit__c);
	}
	handleChange7(event) {
		this.rdRecordsFI.VG_Net_Equity__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Net_Equity__c::' +this.rdRecordsFI.VG_Net_Equity__c);
	}
	handleChange8(event) {
		this.rdRecordsFI.VG_Headcount__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Headcount__c::' +this.rdRecordsFI.VG_Headcount__c);
	}
	handleChange9(event) {
		this.rdRecordsFI.VG_Proposal_form_date__c = event.target.value;
		console.log('this.rdRecordsFI.VG_Proposal_form_date__c::' +this.rdRecordsFI.VG_Proposal_form_date__c);
	}
	@track NOIList=[];
	handleChangeNORFI(event) {
		this.rdRecordsFI.VG_No_of_Reinstatements__c = event.target.value;
		console.log('this.rdRecordsFI.VG_No_of_Reinstatements__c::' +this.rdRecordsFI.VG_No_of_Reinstatements__c);
		this.generateReinstatement();
	}
	//@track generateReinstatementVal;
	generateReinstatement(){
		this.NOIList.push({
			VG_No_of_Reinstatements__c:'',
		})
		/*calcgenerateReinstatement({
			generateReinstatement: this.rdRecords.VG_No_of_Reinstatements__c,
		})
		.then(result => {
			this.NOIList = result;
			console.log('tot::'+result+'::'+result.value);
		})*/
	}
	// CC PRODUCT----------------------
	handleChangeCC1(event) {
		this.rdRecordsCC.VG_Company_Domicile__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Company_Domicile__c::' +this.rdRecordsCC.VG_Company_Domicile__c);
	}
	handleChangeCC2(event) {
		this.rdRecordsCC.VG_Industry__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Industry__c::' +this.rdRecordsCC.VG_Industry__c);
	}
	handleChangeCC3(event) {
		this.rdRecordsCC.VG_Revenue__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Revenue__c::' +this.rdRecordsCC.VG_Revenue__c);
	}
	handleChangeCC4(event) {
		this.rdRecordsCC.VG_Total_Assets__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Total_Assets__c::' +this.rdRecordsCC.VG_Total_Assets__c);
	}
	handleChangeCC5(event) {
		this.rdRecordsCC.VG_Market_Cap__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Market_Cap__c::' +this.rdRecordsCC.VG_Market_Cap__c);
	}
	handleChangeCC6(event) {
		this.rdRecordsCC.VG_Net_Profit__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Net_Profit__c::' +this.rdRecordsCC.VG_Net_Profit__c);
	}
	handleChangeCC7(event) {
		this.rdRecordsCC.VG_Net_Equity__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Net_Equity__c::' +this.rdRecordsCC.VG_Net_Equity__c);
	}
	handleChangeCC8(event) {
		this.rdRecordsCC.VG_Headcount__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Headcount__c::' +this.rdRecordsCC.VG_Headcount__c);
	}
	handleChangeCC9(event) {
		this.rdRecordsCC.VG_Proposal_form_date__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Proposal_form_date__c::' +this.rdRecordsCC.VG_Proposal_form_date__c);
	}
	handleChangeCC10(event) {
		this.rdRecordsCC.VG_Company_Type__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Company_Type__c::' +this.rdRecordsCC.VG_Company_Type__c);
	}
	handleChangeCC11(event) {
		this.rdRecordsCC.VG_Class_1_Employees__c = event.target.value;
		console.log('this.rdRecordsCC.VG_Class_1_Employees__c::' +this.rdRecordsCC.VG_Class_1_Employees__c);
	}
	//DO PRODUCT -----------------------------
	handleChangeDO1(event) {
		this.rdRecordsDO.VG_Company_Domicile__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Company_Domicile__c::' +this.rdRecordsDO.VG_Company_Domicile__c);
	}
	handleChangeDO2(event) {
		this.rdRecordsDO.VG_Industry__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Industry__c::' +this.rdRecordsDO.VG_Industry__c);
	}
	handleChangeDO3(event) {
		this.rdRecordsDO.VG_Revenue__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Revenue__c::' +this.rdRecordsDO.VG_Revenue__c);
	}
	handleChangeDO4(event) {
		this.rdRecordsDO.VG_Total_Assets__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Total_Assets__c::' +this.rdRecordsDO.VG_Total_Assets__c);
	}
	handleChangeDO5(event) {
		this.rdRecordsDO.VG_Market_Cap__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Market_Cap__c::' +this.rdRecordsDO.VG_Market_Cap__c);
	}
	handleChangeDO6(event) {
		this.rdRecordsDO.VG_Net_Profit__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Net_Profit__c::' +this.rdRecordsDO.VG_Net_Profit__c);
	}
	handleChangeDO7(event) {
		this.rdRecordsDO.VG_Net_Equity__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Net_Equity__c::' +this.rdRecordsDO.VG_Net_Equity__c);
	}
	
	handleChangeDO9(event) {
		this.rdRecordsDO.VG_Proposal_form_date__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Proposal_form_date__c::' +this.rdRecordsDO.VG_Proposal_form_date__c);
	}
	handleChangeDO10(event) {
		this.rdRecordsDO.VG_Company_Type__c = event.target.value;
		console.log('this.rdRecordsDO.VG_Company_Type__c::' +this.rdRecordsDO.VG_Company_Type__c);
	}
	handleChange11(event) {
		this.rdRecords.VG_Profession__c = event.target.value;
		console.log('this.rdRecords.VG_Profession__c::' +this.rdRecords.VG_Profession__c);
	}
	handleChange12(event) {
		this.rdRecords.VG_Fees_Current_Year__c = event.target.value;
		console.log('this.rdRecords.VG_Fees_Current_Year__c::' +this.rdRecords.VG_Fees_Current_Year__c);
	}
	handleChange13(event) {
		this.rdRecords.VG_Fees_Year_1__c = event.target.value;
		console.log('this.rdRecords.VG_Fees_Year_1__c::' +this.rdRecords.VG_Fees_Year_1__c);
	}
	handleChange14(event) {
		this.rdRecords.VG_Fees_Year_2__c = event.target.value;
		console.log('this.rdRecords.VG_Fees_Year_2__c::' +this.rdRecords.VG_Fees_Year_2__c);
	}
	handleChange15(event) {
		this.rdRecords.VG_Fees_Year_3__c = event.target.value;
		console.log('this.rdRecords.VG_Fees_Year_3__c::' +this.rdRecords.VG_Fees_Year_3__c);
	}
	handleChange16(event) {
		this.rdRecords.VG_Dispute_Clause__c = event.target.value;
		console.log('this.rdRecords.VG_Dispute_Clause__c::' +this.rdRecords.VG_Dispute_Clause__c);
	}
	handleChange17(event) {
		this.rdRecords.VG_Buyer__c = event.target.value;
		console.log('this.rdRecords.VG_Buyer__c::' +this.rdRecords.VG_Buyer__c);
	}
	handleChange18(event) {
		this.rdRecords.VG_Seller__c = event.target.value;
		console.log('this.rdRecords.VG_Seller__c::' +this.rdRecords.VG_Seller__c);
	}
	handleChange19(event) {
		this.rdRecords.VG_Target__c = event.target.value;
		console.log('this.rdRecords.VG_Target__c::' +this.rdRecords.VG_Target__c);
	}
	handleChange20(event) {
		this.rdRecords.VG_Enterprise_Value__c = event.target.value;
		console.log('this.rdRecords.VG_Enterprise_Value__c::' +this.rdRecords.VG_Enterprise_Value__c);
	}
	handleChange21(event) {
		this.rdRecords.VG_Retention_Amount__c = event.target.value;
		console.log('this.rdRecords.VG_Retention_Amount__c::' +this.rdRecords.VG_Retention_Amount__c);
		this.retension();
	}
	handleChangeWI9(event) {
		this.rdRecordsWI.VG_Proposal_form_date__c = event.target.value;
		console.log('this.rdRecordsWI.VG_Proposal_form_date__c::' +this.rdRecordsWI.VG_Proposal_form_date__c);
	}
	handleChangePI9(event) {
		this.rdRecordsPI.VG_Proposal_form_date__c = event.target.value;
		console.log('this.rdRecordsPI.VG_Proposal_form_date__c::' +this.rdRecordsPI.VG_Proposal_form_date__c);
	}
	@track retensionVal;
	retension(){
		calcRetension({
			retensionAmt: this.rdRecords.VG_Retention_Amount__c,
			enterpriseValue: this.rdRecords.VG_Enterprise_Value__c
		})
		.then(result => {
			this.retensionVal = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent9);
	}
	handleChange22(event) {
		this.rdRecords.VG_Retention_description__c = event.target.value;
		console.log('this.rdRecords.VG_Retention_description__c::' +this.rdRecords.VG_Retention_description__c);
	}
	handleChange24(event) {
		this.rdRecords.VG_De_Minimis_Amount__c = event.target.value;
		console.log('this.rdRecords.VG_De_Minimis_Amount__c::' +this.rdRecords.VG_De_Minimis_Amount__c);
		this.deminimis();
	}
	@track deminimisVal;
	deminimis(){
		calcDeminimis({
			deminimisAmt: this.rdRecords.VG_De_Minimis_Amount__c,
			enterpriseValue: this.rdRecords.VG_Enterprise_Value__c
		})
		.then(result => {
			this.deminimisVal = result;
			console.log('tot::'+result+'::'+result.value);
		})
		//this.dispatchEvent(toastEvent9);
	}
	handleChange25(event) {
		this.rdRecords.De_Minimis_description__c = event.target.value;
		console.log('this.rdRecords.De_Minimis_description__c::' +this.rdRecords.De_Minimis_description__c);
	}
	handleChange27(event) {
		this.rdRecords.VG_Completion_Date__c = event.target.value;
		console.log('this.rdRecords.VG_Completion_Date__c::' +this.rdRecords.VG_Completion_Date__c);
	}
	handleChange28(event) {
		this.rdRecords.VG_Sector__c = event.target.value;
		console.log('this.rdRecords.VG_Sector__c::' +this.rdRecords.VG_Sector__c);
	}
	handleChange29(event) {
		this.rdRecords.VG_Governing_Law_of_Sale_Agreement__c = event.target.value;
		console.log('this.rdRecords.VG_Governing_Law_of_Sale_Agreement__c::' +this.rdRecords.VG_Governing_Law_of_Sale_Agreement__c);
	}
	handleChange30(event) {
		this.rdRecords.VG_Endorsed__c = event.target.value;
		console.log('this.rdRecords.VG_Endorsed__c::' +this.rdRecords.VG_Endorsed__c);
	}
	handleChange31(event) {
		this.rdRecords.VG_Expense_Agreement_Amount__c = event.target.value;
		console.log('this.rdRecords.VG_Expense_Agreement_Amount__c::' +this.rdRecords.VG_Expense_Agreement_Amount__c);
	}
	handleChange32(event) {
		this.rdRecords.VG_Expense_Agreement_t_Amount_Tax__c = event.target.value;
		console.log('this.rdRecords.VG_Expense_Agreement_t_Amount_Tax__c::' +this.rdRecords.VG_Expense_Agreement_t_Amount_Tax__c);
	}

	addRow() {
		if(this.product != 'Professional Indemnity'){
			this.keyIndex+1;
			this.itemList.push({
				VG_Coverage_Type__c: '',
					VG_Territorial_Limits__c:'',
					VG_Share__c:'',
					VG_Deductible__c:'',
					VG_Sub_limit__c:'',
					VG_Premium__c:'',
					VG_IsTempDelete__c:''
			}) 
		}else{
			this.keyIndexPI+1;
			this.itemPIList.push({
				VG_Profession__c: '',
				VG_Fee_Amounts__c:0,
				VG_Base_Premium_Rate__c:0,
				VG_Base_Premium__c:0,
				VG_Deductible__c:'',
				VG_Sub_limit__c:'',
				VG_IsTempDelete__c:''
			}) 
		}	
        //this.itemList = this.itemList.concat(newItem);
    }

	removeRow(event){
		if(this.product != 'Professional Indemnity'){
			console.log('Access key2:'+event.target.accessKey);
        	console.log('>>'+event.target.id.split('-')[0]);
			if(this.itemList.length >= 0){
				this.itemList.splice(event.target.accessKey,1);  //splice - is remove method in js
				console.log('remove::'+event.target.accessKey);
				//console.log('remove1x::'+this.itemList.splice(e.target.accessKey,1));
				//this.keyIndex-1;
				//console.log('remove2::'+this.keyIndex);
			}
		}else{
			console.log('Access key2:'+event.target.accessKey);
        	console.log('>>'+event.target.id.split('-')[0]);
			if(this.itemPIList.length >= 0){
				//console.log('re::'+this.itemPIList.length)
				this.itemPIList.splice(event.target.accessKey,1);  //splice - is remove method in js
				console.log('remove::'+event.target.accessKey);
				//console.log('remove1x::'+this.itemPIList.splice(e.target.accessKey,1));
				//this.keyIndex-1;
				//console.log('remove2::'+this.keyIndex);
			}
		}
	}
	//@track rrRecords = RR_OBJECT;

	handleChangeRR1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemList[event.target.accessKey].VG_Territorial_Limits__c = event.target.value;
		console.log('VG_Territorial_Limits__c::' +this.itemList[event.target.accessKey].VG_Territorial_Limits__c);	
	}
	handleChangeRR2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemList[event.target.accessKey].VG_Share__c = event.target.value;
		console.log('VG_Share__c::' +this.itemList[event.target.accessKey].VG_Share__c);		
	}
	handleChangeRR3(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemList[event.target.accessKey].VG_Deductible__c = event.target.value;
		console.log('VG_Deductible__c::' +this.itemList[event.target.accessKey].VG_Deductible__c);		
	}
	handleChangeRR4(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemList[event.target.accessKey].VG_Sub_limit__c = event.target.value;
		console.log('VG_Sub_limit__c::' +this.itemList[event.target.accessKey].VG_Sub_limit__c);		
	}
	handleChangeRR5(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemList[event.target.accessKey].VG_Premium__c = event.target.value;
		console.log('VG_Premium__c::' +this.itemList[event.target.accessKey].VG_Premium__c);
	
	}

	// for PI Product
	handleChangeRRpi1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Profession__c = event.target.value;
		console.log('VG_Profession__c::' +this.itemPIList[event.target.accessKey].VG_Profession__c);		
	}
	handleChangeRRpi2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Fee_Amounts__c = event.target.value;
		console.log('VG_Fee_Amounts__c::' +this.itemPIList[event.target.accessKey].VG_Fee_Amounts__c);	
		this.feeAmount();
		console.log('apex ::'+this.feeAmount);

	}

	@track feeAmtTotal = 0;
	feeAmount(){
		calcFeeAmount({
			rrPIList: this.itemPIList
		})
		.then(result => {
			this.feeAmtTotal = result;
			console.log('tot::'+result+'::'+result.value);
		})
	}
	
	handleChangeRRpi3(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Base_Premium_Rate__c = event.target.value;
		console.log('VG_Base_Premium_Rate__c::' +this.itemPIList[event.target.accessKey].VG_Base_Premium_Rate__c);
		this.BasePremiumRate();
			
	}
	@track basePreRateTotal = 0;
	BasePremiumRate(){
		calcBasePremiumRate({
			totalbasepremium: this.basePreTotal,
			totalFeeAmount: this.feeAmtTotal
		})
		.then(result => {
			this.basePreRateTotal = result;
			console.log('tot::'+result+'::'+result.value);
			this.BasePremium();	
		})
	}

	@track basePre = 0;
	BasePremium(){
		calcBasePremium({
			rrPIList: this.itemPIList
		})
		.then(result => {
			this.basePre = result;
			console.log('tot::'+result+'::'+result.value);
			this.BasePremiumTotal();
		})
	}
	@track basePreTotal = 0;
	BasePremiumTotal(){
		calcBasePremiumTotal({
			rrPIList: this.itemPIList
		})
		.then(result => {
			this.basePreTotal = result;
			console.log('tot::'+result+'::'+result.value);
		})
	}
	handleChangeRRpi4(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Base_Premium__c = event.target.value;
		console.log('VG_Base_Premium__c::' +this.itemPIList[event.target.accessKey].VG_Base_Premium__c);
				
	}
	handleChangeRRpi5(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Deductible__c = event.target.value;
		console.log('VG_Deductible__c::' +this.itemPIList[event.target.accessKey].VG_Deductible__c);		
	}
	handleChangeRRpi6(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.itemPIList[event.target.accessKey].VG_Sub_limit__c = event.target.value;
		console.log('VG_Sub_limit__c::' +this.itemPIList[event.target.accessKey].VG_Sub_limit__c);		
	}
	


	steps = [{
			label: 'Select Product',
			value: 'step1',
			
		},
		{
			label: 'Risk Detail',
			value: 'step2'
		},
		{
			label: 'Risk Rating',
			value: 'step3'
		},
		{
			label: 'SubLimits Library',
			value: 'step4'
		},
		{
			label: 'Update Sub-Limit Details',
			value: 'step5'
		},
		{
			label: 'Endorsement Library',
			value: 'step6'
		},
		{
			label: 'Update Endorsement Details',
			value: 'step7'
		},
		{
			label: 'Summary',
			value: 'step8'
		},
	];
    

	/*handleSuccess(event) {
	    this.Policy_Schedule__r.Policy__c = event.detail.id;
	}*/
}