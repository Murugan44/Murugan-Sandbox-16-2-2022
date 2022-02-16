import {
	LightningElement,
	track,
	api,
	wire
} from 'lwc';
// import communityBasePath from '@salesforce/community/basePath';
// import communityId from '@salesforce/community/Id';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
	refreshApex
} from '@salesforce/apex';

import {
	updateRecord
} from 'lightning/uiRecordApi';

import Tax_Type_1 from '@salesforce/label/c.Tax_Type_1';
import Tax_Type_2 from '@salesforce/label/c.Tax_Type_2';
import Tax_Jurisdiction1 from '@salesforce/label/c.Tax_Jurisdiction1';
import Tax_Jurisdiction2 from '@salesforce/label/c.Tax_Jurisdiction2';
import Tax_Jurisdiction3 from '@salesforce/label/c.Tax_Jurisdiction3';

import ppWrapper from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.ppWrapper';
import getPs from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getPsList'

import getPP from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getPP'
import getPolicyTax from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getPolicyTax'
import editPayments from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.editPayments'
import updatePaymentValues from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.updatePaymentValues'
import editTax from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.editTax'
import updateTax from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.updateTax'

import deletePF from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.deletePF'
import deleteTax from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.deleteTax'

import calcGWP from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getcalcGWP'
import getGWPCalc from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getGWPCalc'
import getCheckValidationPS from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getCheckValidationPS'
import getUpdateCheckValidationPS from '@salesforce/apex/VG_PolicyPaymentTaxLWC_Controller.getUpdateCheckValidationPS'

import {
	deleteRecord
} from 'lightning/uiRecordApi';

export default class VG_PolicyPaymetTaxLWC extends LightningElement {
	isActiveMainTab = ""
	showLoadingSpinner = false
	isAddPaymentTab = false
	isTaxTab = false
	//isNoPayment = true
	isActiveTabPayment = ""
	isActiveTabTax = ""
	@track paymentList = []
	@track paymentRetriveList = []
	@track refreshTablePay = []
	@track debetDetailsValueList = []
	@api recordId
	@api page
	ppBtn = false
	isPaymentHasValue = false
	keyIndexpf = 0
	keyIndexpp = 0
	indexpp = ''
	indexpf = ''
	listOfPF = []
	psOption = []
	psOptionForCheck = []
	dateMap = new Map();
	payAmountMap = new Map();
	brokerMap = new Map();
	commentMap = new Map();
	debtDetailsMap = new Map();

	@track taxList = []
	@track taxRetriveList = []
	@track refreshTableTax = []
	keyIndexTax = 0
	keyIndexpt = 0
	indexpt = ''
	indexTax = ''
	taxTypeMap = new Map()
	taxJurisdictionMap = new Map()
	taxAdministeredByMap = new Map()
	taxPaidByMap = new Map()
	taxPercentMap = new Map()
	commentTaxMap = new Map()
	taxIncludedMap = new Map()
	isTaxHasValue = false
	@track taxChecked = false

	@track taxTypeValueList = []
	@track taxJurisdictionValueList = []
	@track taxAdministeredByOption = []
	@track taxPaidByOption = []
	connectedCallback() {
		var taxpaid = ['Broker', 'Insured', 'Insurer', 'N/A']
		taxpaid.forEach(currentItem => {
			this.taxPaidByOption.push({
				"label": currentItem,
				"value": currentItem
			})
			this.taxAdministeredByOption.push({
				"label": currentItem,
				"value": currentItem
			})
		})
		this.taxAdministeredByOption.push({
			"label": 'MGA',
			"value": 'MGA'
		})
		Tax_Type_1.split(';').forEach(currentItem => {
			this.taxTypeValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})
		Tax_Type_2.split(';').forEach(currentItem => {
			this.taxTypeValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})
		console.log('type4::', this.taxTypeValueList)

		Tax_Jurisdiction1.split(';').forEach(currentItem => {
			this.taxJurisdictionValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})
		Tax_Jurisdiction2.split(';').forEach(currentItem => {
			this.taxJurisdictionValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})
		Tax_Jurisdiction3.split(';').forEach(currentItem => {
			this.taxJurisdictionValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})

		var debetDetailsValue = ['Bad Debt Accrual', 'Bad Debt Recognized']
		debetDetailsValue.forEach(currentItem => {
			this.debetDetailsValueList.push({
				"label": currentItem,
				"value": currentItem
			})
		})
	}


	@wire(getPolicyTax, {
		policyId: '$recordId'
	})
	pt(result) {
		console.log(result)
		this.refreshTableTax = result
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					for (let key2 in result.data[key]) {
						this.taxTypeMap.set(key, result.data[key][key2].taxtype)
						this.taxJurisdictionMap.set(key, result.data[key][key2].taxJurisdiction);
						this.taxAdministeredByMap.set(key, result.data[key][key2].taxAdministeredBy)
						this.taxPaidByMap.set(key, result.data[key][key2].taxPaidBy)
						this.commentTaxMap.set(key, result.data[key][key2].comment)
						this.taxIncludedMap.set(key, result.data[key][key2].taxIncluded)
						this.taxPercentMap.set(key, result.data[key][key2].taxPercent)
					}
					console.log('::',this.taxIncludedMap.get(key))
					this.taxRetriveList.push({
						key: key,
						key1: this.taxTypeMap.get(key),
						key2: this.taxJurisdictionMap.get(key),
						key3: this.taxAdministeredByMap.get(key),
						key4: this.taxPaidByMap.get(key),
						comment: this.commentTaxMap.get(key),
						taxIncluded: this.taxIncludedMap.get(key),
						taxPercent : this.taxPercentMap.get(key),
						value: result.data[key]
					})
				}
			}
			if (this.taxRetriveList.length > 0) {
				this.isTaxHasValue = true
				//this.isNoPayment = false
			} else {
				this.isTaxHasValue = false
				//this.isNoPayment = true
			}
			console.log('taxRetriveList::', this.taxRetriveList)
		} else if (result.error) {
			this.error = result.error;
			this.taxRetriveList = undefined;
		}
	}

	@wire(getPP, {
		policyId: '$recordId'
	})
	pp(result) {
		this.refreshTablePay = result
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					for (let key2 in result.data[key]) {
						this.payAmountMap.set(key, result.data[key][key2].policyPaymentAmount)
						this.dateMap.set(key, result.data[key][key2].dueDate);
						this.brokerMap.set(key, result.data[key][key2].broker)
						this.commentMap.set(key, result.data[key][key2].comment)
						this.debtDetailsMap.set(key, result.data[key][key2].debtDetails)
					}
					//this.paymentLabel=`Payment ${this.payAmountMap.get(key)} - Due Date: ${this.dateMap.get(key)}`
					this.paymentRetriveList.push({
						key: key,
						key1: this.payAmountMap.get(key),
						key2: this.dateMap.get(key),
						broker: this.brokerMap.get(key),
						comment: this.commentMap.get(key),
						debtDetails: this.debtDetailsMap.get(key),
						paymentLabel: `Payment (${this.payAmountMap.get(key)}%) - Due Date: (${this.dateMap.get(key)})`,
						value: result.data[key]
					})
				}
			}
			if (this.paymentRetriveList.length > 0)
				this.isPaymentHasValue = true
			else
				this.isPaymentHasValue = false

			console.log('paymentRetriveList::', this.paymentRetriveList)
		} else if (result.error) {
			this.error = result.error;
			this.paymentRetriveList = undefined;
		}
	}
	@wire(getPs, {
		policyId: '$recordId'
	})
	pd(result) {
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					this.psOption.push({
						label: result.data[key].Name,
						value: key
					})
					this.psOptionForCheck.push({
						label: result.data[key].Name,
						value: key
					})
				}
			}
			console.log('this.psOption::', this.psOption)
			console.log('this.psOptionForCheck::', this.psOptionForCheck)
		} else if (result.error) {
			this.error = result.error;
			this.psOption = undefined;
		}
	}

	addPaymentPolicy(e) {
		this.isActiveMainTab = ""
		this.isActiveTabPayment = ""
		this.keyIndexpf = 0
		this.indexpp = this.keyIndexpp++
			this.paymentList.push({
				dueDate: '',
				policyPaymenyAmount: '',
				comment: '',
				broker: '',
				debtDetails: '',
				btnpf: false,
				btnpf1: false,
				counter: this.indexpp,
				pfList: []
			})
		var timev = setTimeout(() => {
			this.isActiveMainTab = "paymentSection"
			var timev = setTimeout(() => {
				this.isActiveTabPayment = "add-payment"
			}, 100)
		}, 100)
		this.isAddPaymentTab = true
		this.ppBtn = true
		this.isPaymentEdit = false
		this.taxList = []
		this.isTaxTab = false
		console.log(this.paymentList)

	}
	policyPaymenyAmount = ''
	async paymentHandler(e) {
		this.policyPaymenyAmount = ''
		var key = ''
		if (e.target.name == 'Due Date')
			this.paymentList[e.target.accessKey].dueDate = e.target.value
		else if (e.target.name == 'Amount')
			this.paymentList[e.target.accessKey].policyPaymenyAmount = e.target.value
		else if (e.target.name == 'Comment')
			this.paymentList[e.target.accessKey].comment = e.target.value
		// else if (e.target.name == 'DebetDetails')
		//     this.paymentList[e.target.accessKey].debtDetails = e.target.value  

		if (e.target.name == 'Amount') {
			if (this.paymentList[e.target.accessKey].policyPaymenyAmount > 100) {
				this.paymentList[e.target.accessKey].btnpf1 = true
				this.paymentList[e.target.accessKey].btnpf = true
				//this.ppBtn = true
			} else {
				this.paymentList[e.target.accessKey].btnpf1 = false
				this.paymentList[e.target.accessKey].btnpf = false
				//this.ppBtn = false
				this.policyPaymenyAmount = this.paymentList[e.target.accessKey].policyPaymenyAmount
				key = e.target.accessKey
				if (this.gwpList.length > 0) {
					console.log('::: inside if')
					var timev = setTimeout(() => {
						console.log("this.gwpList::", this.gwpList, 'this.policyPaymenyAmount::', this.policyPaymenyAmount)
						for (var i = 0; i < this.gwpList.length; i++) {
							this.gwpValue(key, this.gwpList[i].count, this.gwpList[i].ps, this.policyPaymenyAmount)
						}
					}, 2000)
				}

			}
		}

	}

	addPayment(e) {
		this.indexpf = this.keyIndexpf++
			console.log('indexpf: ', this.indexpf)
		this.paymentList[e.target.accessKey].pfList.push({
			ps: '',
			gwp: 0,
			ppcounter: e.target.accessKey,
			pfCounter: this.indexpf,
			validationMsg: false,
			disablePS: false
		})
		console.log('this.psOption::', this.psOption)
		console.log('paymentList::', this.paymentList)
	}

	removePFView(e) {
		// console.log('removePFView::',e.target.accessKey)
		// console.log('paymentList::', this.paymentList)
		console.log('removePFView::',e.target.dataset.name,'::',e.target.name)
		// var psid = e.target.dataset.name
		// for(var i=0; i < this.psOptionForCheck.length; i++) {
		// 	// alert(this.psOptionForCheck[i].value == psid)
		// 	if(this.psOptionForCheck[i].value == psid){
		// 		console.log('label->', this.psOptionForCheck[i].label, 'Value:', this.psOptionForCheck[i].value, i)
		// 		var temp = {label: this.psOptionForCheck[i].label, value:this.psOptionForCheck[i].value}
		// 		// this.psOption.splice(i,0,temp);
		// 		this.psOption.push(temp)
		// 	}
		// }
		// this.psOption = this.psOption.sort()

		// console.log('removePFView::',this.paymentList[e.target.accessKey].pfList)
		this.paymentList[e.target.accessKey].btnpf = false
		this.isDisableSaveCancelBtn = false
		// alert('Hi')
		var removePaymentList = this.paymentList[e.target.accessKey].pfList
		// alert(e.target.name)
		this.paymentList[e.target.accessKey].pfList = []
		// alert(e.target.name)
		// alert(this.paymentList[e.target.accessKey].pfList.length)
		// alert(removePaymentList.length)
		for(var i=0; i < removePaymentList.length; i++) {
			if(i !== e.target.name){
				this.paymentList[e.target.accessKey].pfList.push(removePaymentList[i])
			}
		}
		// alert(this.paymentList[e.target.accessKey].pfList.length)
		// removePayment.splice(e.target.name, 1)
		for (var i = e.target.name; i < this.paymentList[e.target.accessKey].pfList.length; i++) {
			var pfCounter = this.paymentList[e.target.accessKey].pfList[i].pfCounter - 1
			this.paymentList[e.target.accessKey].pfList[i].pfCounter = pfCounter
		}
		var index = this.paymentList[e.target.accessKey].pfList.length
		this.keyIndexpf = index--
		
	}

	ps = ''
	amt
	gwpList = []

	pfHandler(e) {
		// console.log(e.target.value)
		// console.log(e.target.accessKey)
		// console.log(e.target.name)
		this.paymentList[e.target.accessKey].pfList[e.target.name].ps = e.target.value
		//this.paymentList[e.target.accessKey].pfList[e.target.name].disablePS = true
		
		// console.log("psOption::",this.psOption)
		// console.log('ps::',this.paymentList[e.target.accessKey].pfList[e.target.name])
		this.ps = this.paymentList[e.target.accessKey].pfList[e.target.name].ps
		this.amt = this.paymentList[e.target.accessKey].policyPaymenyAmount
		this.gwpList.push({
			count: e.target.name,
			ps: this.ps
		})
		this.gwpValue(e.target.accessKey, e.target.name, this.ps, this.amt)
		// for(var i=0; i < this.psOption.length; i++) {
		// 	if(this.psOption[i].value == this.paymentList[e.target.accessKey].pfList[e.target.name].ps ){
		// 		console.log('label->', this.psOption[i].label, 'Value:', this.psOption[i].value, i)
		// 		this.psOption.splice(i,1);
		// 	}
		// }
		// console.log("psOption::",this.psOption)
	}

	async gwpValue(accessKey, name, ps, amt) {
		try {
			// console.log('29/10 ::', accessKey, '::', name, '::', ps, '::', amt)
			this.paymentList[accessKey].pfList[name].gwp = await calcGWP({
				psId: ps,
				polPayAmt: amt
			});
			// console.log('Method1 result: ' + this.paymentList[accessKey].pfList[name].gwp);
			this.checkValidationPS(accessKey, name, ps, this.paymentList[accessKey].pfList[name].gwp)
		} catch (error) {
			console.log(error);
		} finally {
			console.log('Finally Block');
		}
	}
	isDisableSaveCancelBtn = false
	async checkValidationPS(accessKey, name, ps, gwp){
		try {
			var isCheck = await getCheckValidationPS({
				psId: ps,
				gwp: gwp
			});
			// console.log('isCheck::', isCheck)
			this.paymentList[accessKey].pfList[name].validationMsg = isCheck;
			this.paymentList[accessKey].btnpf = isCheck
			this.isDisableSaveCancelBtn = isCheck
			// console.log('>>>', this.paymentList[accessKey].pfList[name].validationMsg)
		}catch (error) {
			console.log(error);
		} finally {
			console.log('Finally Block -- checkValidationPS');
		}
	}

	addTaxPolicy(e) {
		this.isActiveMainTab = ""
		this.isActiveTabTax = ""
		this.keyIndexTax = 0
		this.indexpt = this.keyIndexpt++
			this.taxList.push({
				taxSelected: '',
				taxJurisdictionListSelected: '',
				taxPaidBySelected: '',
				taxAdministeredBySelected: '',
				comment: '',
				taxPercent: '',
				taxIncluded: false,
				btnTax: false,
				counter: this.indexpt,
				taxWList: []
			})
		var timev = setTimeout(() => {
			this.isActiveMainTab = "taxSection"
			var timev = setTimeout(() => {
				this.isActiveTabTax = "add-Tax"
			}, 100)
		}, 100)
		console.log(this.taxList)
		this.isTaxTab = true
		this.ppBtn = true
		this.paymentList = []
		this.isAddPaymentTab = false
	}

	addTax(e) {
		this.indexTax = this.keyIndexTax++
			this.taxList[e.target.accessKey].taxWList.push({
				psSelected: '',
				taxableAmount: 0,
				ptcounter: e.target.accessKey,
				taxCounter: this.indexTax,
				taxAmount : ''
			})
		console.log('paymentList 2::', this.taxList)
	}

	removeTaxView(e) {
		console.log(e.target.accessKey)
		console.log(e.target.name)
		console.log(this.taxList[e.target.accessKey].taxWList)
		var removeTax = this.taxList[e.target.accessKey].taxWList
		removeTax.splice(e.target.name, 1)
		//this.keyIndexTax-1
		console.log('after remove tax:::', this.taxList[e.target.accessKey].taxWList)
		for (var i = 0; i < this.taxList[e.target.accessKey].taxWList.length; i++) {
			console.log('for::', this.taxList[e.target.accessKey].taxWList[i].taxCounter--)
			this.taxList[e.target.accessKey].taxWList[i].taxCounter = this.taxList[e.target.accessKey].taxWList[i].taxCounter - 1
		}
		console.log(':::::>>', this.taxList[e.target.accessKey].taxWList)
		console.log('Lenght :::::>>', this.taxList[e.target.accessKey].taxWList.length)
		var index = this.taxList[e.target.accessKey].taxWList.length
		this.keyIndexTax = index--
	}


	TaxPaidBy = ''
	TaxAdministeredBy = ''
	taxHandler(e) {
		if (e.target.name == 'Tax Type') {
			this.taxList[e.target.accessKey].taxSelected = e.target.value
		} else if (e.target.name == 'Tax Jurisdiction') {
			this.taxList[e.target.accessKey].taxJurisdictionListSelected = e.target.value
		} else if (e.target.name == 'Tax Paid By') {
			this.taxList[e.target.accessKey].taxPaidBySelected = e.target.value
			this.TaxPaidBy = e.target.value
		} else if (e.target.name == 'Tax Administered By') {
			this.taxList[e.target.accessKey].taxAdministeredBySelected = e.target.value
			this.TaxAdministeredBy = e.target.value
		} else if (e.target.name == 'Comment') {
			this.taxList[e.target.accessKey].comment = e.target.value
		} else if (e.target.name == 'TaxPercent') {
			this.taxList[e.target.accessKey].taxPercent = e.target.value
			if(this.taxList[e.target.accessKey].taxPercent !==''){
				
				if (this.taxCalcList.length > 0) {
					console.log('::: inside if tax')
					// var timev = setTimeout(() => {
						for (var i = 0; i < this.taxCalcList.length; i++) {
							this.taxAmountVal(e.target.accessKey, this.taxCalcList[i].count, this.taxCalcList[i].taxableAmount, this.taxList[e.target.accessKey].taxPercent)
						}
					// }, 2000)
				}
			}
		}

		if (this.TaxPaidBy == 'Insurer' && this.TaxAdministeredBy == 'Insured') {
			this.taxChecked = true
			this.taxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insurer' && this.TaxAdministeredBy == 'Broker') {
			this.taxChecked = true
			this.taxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insured' && this.TaxAdministeredBy == 'Insurer') {
			this.taxChecked = true
			this.taxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insured' && this.TaxAdministeredBy == 'MGA') {
			this.taxChecked = true
			this.taxList[e.target.accessKey].taxIncluded = true
		} else {
			this.taxChecked = false
			this.taxList[e.target.accessKey].taxIncluded = false
		}

		console.log(this.taxList)
	}
	taxCalcList = []
	taxwHandler(e) {
		console.log(e.target.name)
		console.log(e.target.accessKey)
		console.log(e.target.value)
		console.log(e.currentTarget.dataset.name)
		if (e.target.name == 'Select Policy Schedule')
			this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].psSelected = e.target.value
		else if (e.target.name == 'TaxableAmount')
			this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount = e.target.value
		this.taxCalcList.push({
			count: e.target.dataset.name,
			taxableAmount: this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount
		})
		console.log(this.taxList[e.target.accessKey].taxPercent)
		console.log('taxList 2::', this.taxList)
		this.taxAmountVal(e.target.accessKey, e.target.dataset.name, this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount, this.taxList[e.target.accessKey].taxPercent)

	}

	async taxAmountVal(accessKey, name, taxableAmount, taxPercent) {
		try {
			console.log('29/10 ::', accessKey, '::', name, '::', taxableAmount, '::', taxPercent)
			this.taxList[accessKey].taxWList[name].taxAmount = (taxableAmount * (taxPercent / 100)).toFixed(2)
			console.log('Method1 result: ' + this.taxList[accessKey].taxWList[name].taxAmount);
		} catch (error) {
			console.log(error);
		} finally {
			console.log('Finally Block from tax amount calc');
		}
	}

	// insert payment & tax func
	dueDateValidation = false
	paymentInsertValidationMsg = ''
	finish() {
		this.showLoadingSpinner = true
		console.log(this.recordId)
		console.log('this.paymentList::', this.paymentList)
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
		if(this.paymentList.length > 0) {
			if(this.paymentList[0].dueDate == '' || this.paymentList[0].dueDate == null || this.paymentList[0].dueDate == undefined) {
				this.dueDateValidation = true
				this.paymentInsertValidationMsg = 'Please Fill Due Date'
				this.showLoadingSpinner = false
				return null;
			}
			if(this.paymentList[0].policyPaymenyAmount == '' || this.paymentList[0].policyPaymenyAmount == null || this.paymentList[0].policyPaymenyAmount == undefined) {
				this.dueDateValidation = true
				this.paymentInsertValidationMsg = 'Please Fill Policy Payment'
				this.showLoadingSpinner = false
				return null;
			}
		}
		
		ppWrapper({
				ppw: this.paymentList,
				ptw: this.taxList,
				policyId: this.recordId
			}).then(result => {
				console.log(result)
				console.log('this.paymentList::', this.paymentList.length)
				if (this.paymentList.length > 0) {
					this.paymentRetriveList = []
					this.paymentList = []
					this.ppBtn = false
					this.keyIndexpf = 0
					this.keyIndexpp = 0
					this.indexpp = ''
					this.indexpf = ''
					this.isActiveTabPayment = ""
					this.isAddPaymentTab = false
					this.dateMap = new Map();
					this.payAmountMap = new Map();
					this.taxAdministeredByMap = new Map()
					this.taxPaidByMap = new Map()
					this.taxPercentMap = new Map()
					this.isPaymentHasValue = true
					console.log("Payment has value")
					refreshApex(this.refreshTablePay)
				} else if (this.taxList.length > 0) {
					this.taxList = []
					this.taxRetriveList = []
					this.keyIndexTax = 0
					this.keyIndexpt = 0
					this.indexpt = ''
					this.indexTax = ''
					this.isActiveTabTax = ""
					this.isTaxTab = false
					this.taxTypeMap = new Map()
					this.taxJurisdictionMap = new Map()
					this.isTaxHasValue = true
					this.taxPercentMap = new Map()
					this.taxChecked = false
					refreshApex(this.refreshTableTax)
				}
				this.showLoadingSpinner = false;
				this.ppBtn = false
			})
			// }).then(result => {
			//     this.dispatchEvent(
			//         new ShowToastEvent({
			//             title: 'Success!',
			//             message: 'Policy Payment is created',
			//             variant: 'success'
			//         }),
			//     );
			//     this.showLoadingSpinner = false;
			.catch(error => {
				window.console.log(error);
				this.dispatchEvent(
					new ShowToastEvent({
						title: 'Please refresh and create it again or Please contact admin',
						message: error.message,
						variant: 'error',
					}),
				);
				this.ppBtn = false
				this.showLoadingSpinner = false;
			})
	}

	// edit button func & varibles for payment
	editpayAmountMap = new Map();
	editdateMap = new Map();
	editBrokerMap = new Map();
	editBrokerNameMap = new Map();
	editCommentMap = new Map();
	editdebtDetails = new Map();
	@track editPaymentList = []
	@track updatePaymentList = []
	isPaymentEdit = false
	updateAmount = ''
	psListGWP = []
	editPayments(e) {
		this.isAddPaymentTab = false
		this.paymentList = []
		this.updatePaymentList = []
		this.psListGWP = []
		console.log('edit payment::', e.target.value)
		this.editPaymentList = []
		this.isPaymentEdit = false
		this.isActiveTabPayment = ""
		editPayments({
			paymentId: e.target.value
		}).then(result => {
			console.log('edit payment::', result)
			if (result) {
				for (let key in result) {
					if (result.hasOwnProperty(key)) {
						var tempArray = []
						for (let key2 in result[key]) {
							this.editpayAmountMap.set(key, result[key][key2].policyPaymentAmount)
							this.editdateMap.set(key, result[key][key2].dueDate);
							this.editBrokerMap.set(key, result[key][key2].broker)
							this.editBrokerNameMap.set(key, result[key][key2].brokerName)
							this.editCommentMap.set(key, result[key][key2].comment)
							// this.editdebtDetails.set(key, result[key][key2].debtDetails)
							console.log(result[key][key2].pf.VG_Policy_Schedule__c)
							this.psListGWP.push({
								psId: result[key][key2].pf.VG_Policy_Schedule__c
							})
						}
						this.updatePaymentList.push({
							key: key,
							policyPaymenyAmount: this.editpayAmountMap.get(key),
							dueDate: this.editdateMap.get(key),
							broker: this.editBrokerMap.get(key),
							comment: this.editCommentMap.get(key),
							// debtDetails: this.editdebtDetails.get(key)
						})
						this.editPaymentList.push({
							key: key,
							key1: this.editpayAmountMap.get(key),
							key2: this.editdateMap.get(key),
							broker: this.editBrokerMap.get(key),
							brokerName: this.editBrokerNameMap.get(key),
							comment: this.editCommentMap.get(key),
							// debtDetails: this.editdebtDetails.get(key),
							paymentLabel: `Payment (${this.editpayAmountMap.get(key)}%) - Due Date: (${this.editdateMap.get(key)})`,
							value: result[key]
						})
					}
				}
				console.log('editPaymentList::', this.editPaymentList)
				console.log('updatePaymentList::', this.updatePaymentList)
				console.log('this.psListGWP::', this.psListGWP)
			}
			var timev = setTimeout(() => {
				this.isActiveTabPayment = "edit-Payment"
			}, 100)
			this.isPaymentEdit = true
		})

	}

	amtBtn = false
	amtBtn1 = false

	// update payment handler
	editPaymentOnchangeHandler(e) {
		var key = ''
		if (e.target.name == "Due Date") {
			this.updatePaymentList[e.target.accessKey].dueDate = e.target.value
		} else if (e.target.name == "Amount") {
			this.updateAmount = e.target.value
			this.updatePaymentList[e.target.accessKey].policyPaymenyAmount = e.target.value
			if (this.updateAmount > 100) {
				this.amtBtn = true
				this.amtBtn1 = true
				return null
			} else {
				this.amtBtn = false
				this.amtBtn1 = false
				console.log('editPaymentList::', this.editPaymentList[e.target.accessKey].value[0].paymentAmount)
				key = e.target.accessKey
				var paymentAmount = this.updatePaymentList[e.target.accessKey].policyPaymenyAmount
				if (this.psListGWP.length > 0) {
					console.log('::: inside if')
					var timev = setTimeout(() => {
						console.log("this.gwpList::", this.gwpList, 'this.policyPaymenyAmount::', this.policyPaymenyAmount)
						for (var i = 0; i < this.psListGWP.length; i++) {
							this.gwpVal(key, i, this.psListGWP[i].psId, paymentAmount)
						}
					}, 2000)
				}
			}
		} else if (e.target.name == "Comment") {
			this.updatePaymentList[e.target.accessKey].comment = e.target.value
		}
		/*else if (e.target.name == "DebetDetails"){
		           this.updatePaymentList[e.target.accessKey].debtDetails = e.target.value
		       }*/

		console.log('onchange updatePaymentList', this.updatePaymentList)
	}

	// check gwp value for update
	async gwpVal(accessKey, count, ps, amt) {
		try {
			console.log('30/10 ::', accessKey, '::', count, '::', ps, '::', amt)
			this.editPaymentList[accessKey].value[count].paymentAmount = await getGWPCalc({
				psId: ps,
				amt: amt
			});
			console.log('this.editPaymentList[accessKey].value[count].paymentAmount: ' + this.editPaymentList[accessKey].value[count].paymentAmount);
			// this.checkValidationPSupdate(accessKey,count, ps, this.editPaymentList[accessKey].value[count].paymentAmount,amt)
		} catch (error) {
			console.log(error);
		} finally {
			console.log('Finally Block : this.editPaymentList[accessKey].value[count].paymentAmount');
		}
	}

	// check validation for update
	// async checkValidationPSupdate(accessKey, name, ps, gwp,percent){
	// 	try {
	// 		var isCheck = await getUpdateCheckValidationPS({
	// 			psId: ps,
	// 			gwp: gwp,
	// 			percent: percent
	// 		});
	// 		console.log('isCheck::', isCheck)
	// 		this.editPaymentList[accessKey].value[name].validationMsg = isCheck;
	// 		this.amtBtn1 = isCheck
	// 		this.isDisableSaveCancelBtn = isCheck
	// 		console.log('>>>', this.editPaymentList[accessKey].value[name].validationMsg)
	// 	}catch (error) {
	// 		console.log(error);
	// 	} finally {
	// 		console.log('Finally Block -- checkValidationPS');
	// 	}
	// }

	// update payment
	updatePayment(e) {
		this.showLoadingSpinner = true
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
		if(this.updatePaymentList[0].dueDate == null || this.updatePaymentList[0].dueDate == '') {
			this.dueDateValidation = true
			this.paymentInsertValidationMsg = 'Please Fill Due Date'
			this.showLoadingSpinner = false
			return null;
		}
		if(this.updatePaymentList[0].policyPaymenyAmount == '' || this.updatePaymentList[0].policyPaymenyAmount == null || this.updatePaymentList[0].policyPaymenyAmount == undefined) {
			this.dueDateValidation = true
			this.paymentInsertValidationMsg = 'Please Fill Policy Payment'
			this.showLoadingSpinner = false
			return null;
		}
		updatePaymentValues({
			paymentId: e.target.value,
			updatePaymentValuesList: this.updatePaymentList
		}).then(result => {
			console.log(result)
			this.paymentRetriveList = []
			this.editPaymentList = []
			this.isActiveTabPayment = ""
			this.isPaymentEdit = false
			this.updatePaymentList = []
			refreshApex(this.refreshTablePay)
		}).catch(error => {
			window.console.log(error);
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Please refresh and Update it again or Please contact admin',
					message: error.message,
					variant: 'error',
				}),
			);
			this.showLoadingSpinner = false;
		}).finally(() => {
			this.showLoadingSpinner = false;
		})
	}

	// cancel button func for update payment
	cancelPayment() {
		this.isPaymentEdit = false
		this.editPaymentList = []
		this.isActiveTabPayment = ""
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
		this.amtBtn1 = false
	}

	// edit tax button func varibles
	isEditTax = false
	@track editTaxList = []
	@track updateTaxList = []
	editTaxTypeMap = new Map()
	editTaxJurisdictionMap = new Map()
	editTaxAdministeredByMap = new Map()
	editTaxPaidByMap = new Map()
	editCommentTaxMap = new Map()
	editTaxIncludeMap = new Map()
	editTaxPercent = new Map()
	taxCheckedEdit = false

	editTaxes(e) { // edit tax button func
		this.isTaxTab = false
		this.taxList = []
		this.isActiveTabTax = ""
		this.isEditTax = false
		this.editTaxList = []
		editTax({
			taxId: e.target.value,
		}).then(result => {
			console.log('edit tax::', result)
			if (result) {
				for (let key in result) {
					if (result.hasOwnProperty(key)) {
						var tempArray = []
						for (let key2 in result[key]) {
							this.editTaxTypeMap.set(key, result[key][key2].taxtype)
							this.editTaxJurisdictionMap.set(key, result[key][key2].taxJurisdiction);
							this.editTaxAdministeredByMap.set(key, result[key][key2].taxAdministeredBy)
							this.editTaxPaidByMap.set(key, result[key][key2].taxPaidBy)
							this.editCommentTaxMap.set(key, result[key][key2].comment)
							this.editTaxIncludeMap.set(key, result[key][key2].taxIncluded)
							this.editTaxPercent.set(key, result[key][key2].taxPercent)

							tempArray.push({
								//psSelected: result[key][key2].tax.Id,
								taxableAmount: result[key][key2].taxableAmount,
								ptcounter: '',
								taxCounter: result[key][key2].taxCounter,
								taxAmount: result[key][key2].taxAmount,
								taxId: result[key][key2].taxId,
								psSelected: result[key][key2].psSelected
							})

							this.taxCalcUpdateList.push({
								count:result[key][key2].taxCounter,
								taxableAmount: result[key][key2].taxableAmount,
							})
						}
						this.taxCheckedEdit = this.editTaxIncludeMap.get(key)

						this.updateTaxList.push({
							polTax: key,
							taxSelected: this.editTaxTypeMap.get(key),
							taxJurisdictionListSelected: this.editTaxJurisdictionMap.get(key),
							taxAdministeredBySelected: this.editTaxAdministeredByMap.get(key),
							taxPaidBySelected: this.editTaxPaidByMap.get(key),
							comment: this.editCommentTaxMap.get(key),
							taxIncluded: this.editTaxIncludeMap.get(key),
							taxPercent: this.editTaxPercent.get(key),
							taxWList: tempArray
						})
						this.editTaxList.push({
							key: key,
							key1: this.editTaxTypeMap.get(key),
							key2: this.editTaxJurisdictionMap.get(key),
							key3: this.editTaxAdministeredByMap.get(key),
							key4: this.editTaxPaidByMap.get(key),
							comment: this.editCommentTaxMap.get(key),
							taxIncluded: this.editTaxIncludeMap.get(key),
							taxPercent: this.editTaxPercent.get(key),
							taxWList: tempArray,
							value: tempArray
						})
					}
				}

			}
			var timev = setTimeout(() => {
				this.isActiveTabTax = "edit-Tax"
			}, 100)
			this.isEditTax = true
		}).catch(error => {
			window.console.log(error);
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Please contact admin',
					message: error.message,
					variant: 'error',
				}),
			);
		})


	}

	
	editTaxAdministeredByV = ''
	editTaxPaidByV = ''
	editTaxHandler(e) { // onchange handler for policy tax update
		console.log('editTaxHandler', e.target.accessKey)

		if (e.target.name == 'Tax Type') {
			this.updateTaxList[e.target.accessKey].taxSelected = e.target.value
		} else if (e.target.name == 'Tax Jurisdiction') {
			this.updateTaxList[e.target.accessKey].taxJurisdictionListSelected = e.target.value
		} else if (e.target.name == 'Tax Paid By') {
			this.updateTaxList[e.target.accessKey].taxPaidBySelected = e.target.value
			this.editTaxPaidByV = e.target.value
		} else if (e.target.name == 'Tax Administered By') {
			this.updateTaxList[e.target.accessKey].taxAdministeredBySelected = e.target.value
			this.editTaxAdministeredByV = e.target.value
		} else if (e.target.name == 'Comment') {
			this.updateTaxList[e.target.accessKey].comment = e.target.value
		} else if (e.target.name == 'TaxPercent') {
			this.updateTaxList[e.target.accessKey].taxPercent = e.target.value
			console.log('this.taxCalcUpdateList::',this.taxCalcUpdateList)
			if(this.updateTaxList[e.target.accessKey].taxPercent !==''){
				
				if (this.taxCalcUpdateList.length > 0) {
					console.log('::: inside if tax')
					for (var i = 0; i < this.taxCalcUpdateList.length; i++) {
						this.taxAmountValUpdate(e.target.accessKey, i, this.taxCalcUpdateList[i].taxableAmount, this.updateTaxList[e.target.accessKey].taxPercent)
					}
				}
			}
		}

		if (this.editTaxPaidByV == 'Insurer' && this.editTaxAdministeredByV == 'Insured') {
			this.taxCheckedEdit = true
			this.updateTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.editTaxPaidByV == 'Insurer' && this.editTaxAdministeredByV == 'Broker') {
			this.taxCheckedEdit = true
			this.updateTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.editTaxPaidByV == 'Insured' && this.editTaxAdministeredByV == 'Insurer') {
			this.taxCheckedEdit = true
			this.updateTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.editTaxPaidByV == 'Insured' && this.editTaxAdministeredByV == 'MGA') {
			this.taxCheckedEdit = true
			this.updateTaxList[e.target.accessKey].taxIncluded = true
		} else {
			this.taxCheckedEdit = false
			this.updateTaxList[e.target.accessKey].taxIncluded = false
		}
		console.log('updateTaxList::', this.updateTaxList)
	}

	taxCalcUpdateList = [] // this array used for loop tax amount
	taxAmtChangeHandler(e) { // onchange handler for update tax

		console.log(e.target.accessKey)
		console.log(e.target.dataset.value)
		if (e.target.name == 'TaxableAmount') {
			this.updateTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount = e.target.value
			this.taxCalcUpdateList = []
		}
		this.taxCalcUpdateList.push({
			count: e.target.dataset.value,
			taxableAmount: this.updateTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount
		})
		console.log('this.taxCalcUpdateList::', this.taxCalcUpdateList)
		console.log(this.updateTaxList)
		console.log('e.target.dataset.value',parseInt(e.target.dataset.value))
		this.taxAmountValUpdate(e.target.accessKey, parseInt(e.target.dataset.value), parseInt(this.updateTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount), parseInt(this.updateTaxList[e.target.accessKey].taxPercent))

	}

	//calculate tax amount for update
	async taxAmountValUpdate(accessKey, count, taxableAmount, taxPercent) {
		try {
			console.log('30/10 ::', accessKey, '::', count, '::', taxableAmount, '::', taxPercent)
			var val = (taxableAmount * (taxPercent / 100)).toFixed(2)
			this.editTaxList[accessKey].value[count].taxAmount = val
			console.log('this.editPaymentList[accessKey].value[count].taxAmount: ' + this.editTaxList[accessKey].value[count].taxAmount);
		} catch (error) {
			console.log(error);
		} finally {
			console.log('Finally Block : this.editPaymentList[accessKey].value[count].taxAmount');
		}
	}
	
	// update tax function
	updateTax(e) {
		console.log('updateTaxList::', this.updateTaxList)
		this.showLoadingSpinner = true
		updateTax({
			taxlist: this.updateTaxList,
			taxId: e.target.value
		}).then(result => {
			console.log(result)
			this.editTaxList = []
			this.taxRetriveList = []
			this.isActiveTabTax = ""
			this.isEditTax = false
			this.taxCheckedEdit = false
			this.updateTaxList = []
			refreshApex(this.refreshTableTax)
		}).catch(error => {
			window.console.log(error);
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Please contact admin',
					message: error.message,
					variant: 'error',
				}),
			);
			this.showLoadingSpinner = false;
		}).finally(() => {
			this.showLoadingSpinner = false;
		})
	}

	// cancel onclick button function for update - tax
	cancelTax() {
		this.editTaxList = []
		this.isEditTax = false
		this.isActiveTabTax = ""
		this.taxCheckedEdit = false
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
	}

	// cancel onclick button function for insert - tax
	cancelAddTax() {
		this.keyIndexTax = 0
		this.keyIndexpt = 0
		this.indexpt = ''
		this.indexTax = ''
		this.isTaxTab = false
		this.isActiveTabTax = ""
		this.taxList = []
		this.taxCheckedEdit = false
		this.ppBtn = false
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
	}

	// cancel onclick button function for insert - payment
	cancelAddPayment() {
		this.keyIndexpf = 0
		this.keyIndexpp = 0
		this.indexpp = ''
		this.indexpf = ''
		this.isActiveTabPayment = ""
		this.isAddPaymentTab = false
		this.paymentList = []
		this.taxCheckedEdit = false
		this.ppBtn = false
		this.dueDateValidation = false
		this.paymentInsertValidationMsg = ''
		this.isDisableSaveCancelBtn = false
		this.gwpList = []
	}

	// Account lookup varibles
	@track accountName;
	@track accountRecordId;

	// onchange account for insert
	onAccountSelection(event) {
		this.accountName = event.detail.selectedValue;
		this.accountRecordId = event.detail.selectedRecordId;
		console.log('this.accountName::', this.accountName)
		console.log('this.accountRecordId::', this.accountRecordId)
		console.log(event.target.accessKey)
		this.paymentList[event.target.accessKey].broker = event.detail.selectedRecordId;
		this.paymentList[event.target.accessKey].brokerName = event.detail.selectedValue;
	}

	// Onchange account for update
	onAccountSelection1(event) {
		this.accountName = event.detail.selectedValue;
		this.accountRecordId = event.detail.selectedRecordId;
		console.log('this.accountName::', this.accountName)
		console.log('this.accountRecordId::', this.accountRecordId)
		console.log(event.target.accessKey)
		this.updatePaymentList[event.target.accessKey].broker = event.target.selectedRecordId
		this.updatePaymentList[event.target.accessKey].brokerName = event.detail.selectedValue;
		console.log('this.updatePaymentList:: 3,', this.updatePaymentList)
	}

	// Delete PF from Update
	deletePFView(e) {
		this.showLoadingSpinner = true
		console.log('delete pf from view::', e.target.value)
		deletePF({
			pfId: e.target.value
		}).then((result) => {
			console.log('then:::', result)
			this.paymentRetriveList = []
			this.editPaymentList = []
			this.isActiveTabPayment = ""
			this.updatePaymentList = []
			refreshApex(this.refreshTablePay)
		}).catch(error => {
			console.error(error)
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Error deleting record',
					message: error.body.message,
					variant: 'error'
				})
			);
		}).finally(() => {
			console.log('finally')
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Success',
					message: 'Record deleted successfully',
					variant: 'success'
				})
			);
			this.isPaymentEdit = false
			this.showLoadingSpinner = false
		})
	}

	// Delete Tax from Update
	deleteTaxView(e) {
		console.log('delete tax from view::', e.target.value)
		this.showLoadingSpinner = true
		deleteTax({
			taxId: e.target.value
		}).then((result) => {
			console.log('then:::', result)
			this.editTaxList = []
			this.taxRetriveList = []
			this.isActiveTabTax = ""
			this.updateTaxList = []
			refreshApex(this.refreshTableTax)
		}).catch(error => {
			console.error(error)
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Error deleting record',
					message: error.body.message,
					variant: 'error'
				})
			);
		}).finally(() => {
			console.log('finally')
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Success',
					message: 'Record deleted successfully',
					variant: 'success'
				})
			);
			this.isEditTax = false
			this.taxCheckedEdit = false
			this.showLoadingSpinner = false
		})
	}
	sfdcBaseURL
	policyURL
	renderedCallback() {
        this.sfdcBaseURL = window.location.origin;
		console.log(this.sfdcBaseURL)
    }
	backToPolicy(e){
	
		console.log('this.page::',this.page)
		this.policyURL = `${this.sfdcBaseURL}Bridge/s/policy/${e.currentTarget.dataset.id}`
		
	 }
}