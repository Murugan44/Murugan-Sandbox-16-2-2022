import {
	LightningElement,
	api,
	track,
	wire
} from 'lwc';
import getPs from '@salesforce/apex/PT_LWController.getPsList'
import getPP from '@salesforce/apex/PT_LWController.getPP'
import insertUpdatePolicyPayment from '@salesforce/apex/PT_LWController.insertPolicyPayment'
import calcGWP from '@salesforce/apex/PT_LWController.getcalcGWP'
import deletePF from '@salesforce/apex/PT_LWController.deletePF'
import getCheckValidationPS from '@salesforce/apex/PT_LWController.getCheckValidationPS'

import insertPolicyTax from '@salesforce/apex/PT_LWController.insertPolicyTax'
import getPolicyTax from '@salesforce/apex/PT_LWController.getPolicyTax'
import deleteTax from '@salesforce/apex/PT_LWController.deleteTax'

import Tax_Type_1 from '@salesforce/label/c.Tax_Type_1';
import Tax_Type_2 from '@salesforce/label/c.Tax_Type_2';
import Tax_Jurisdiction1 from '@salesforce/label/c.Tax_Jurisdiction1';
import Tax_Jurisdiction2 from '@salesforce/label/c.Tax_Jurisdiction2';
import Tax_Jurisdiction3 from '@salesforce/label/c.Tax_Jurisdiction3';

import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
	refreshApex
} from '@salesforce/apex';

export default class NewPTLWC extends LightningElement {
	errors
	// Common Declarations
	@api recordId
	psOption = []
	isOpenPaymentTaxModal = false
	spinnerMessage = ''
	isLoading = false
	isFooter = false
	// Tab Declarations
	isActiveMainTab = ''
	isActiveTabPayment = ''
	// Payment Declarations
	isFooterPaymetBnt = false
	isPaymentHasValue = false
	isInsertPayment = false
	InsertPaymentList = []
	@track paymentList = []
	@track PFCounterV = 0
	isPFloading = false
	spinnerPFMessage = ''
	PFTableheadings = ["Select Policy Schedule", "GWP", "Remove"]
	paymentInsertEditTabName = ''
	paymetInsertEditTabValue = ''
	// View Payment
	@track paymentViewList = []
	@track refreshPayment = []
	dateMap = new Map();
	payAmountMap = new Map();
	brokerMap = new Map();
	commentMap = new Map();
	brokerIdMap = new Map();
	isPaymentHasValue = false
	// Edit Payment
	isEditPayment = false
	isFooterUpdatePaymetBnt = false
	@track editPaymentList = []
	// Account lookup varibles
	@track accountName;
	@track accountRecordId;

	@wire(getPs, {
		policyId: '$recordId'
	})
	pd(result) {
		if (result.data) {
			try{
				for (let key in result.data) {
					if (result.data.hasOwnProperty(key)) {
						this.psOption.push({
							label: result.data[key].Name,
							value: key
						})
					}
				}
				console.log('this.psOption::', this.psOption)
			}catch(e){
				this.error = e
			}
		} else if (result.error) {
			this.psOption = undefined;
			this.error = result.error
		}
	}

	@wire(getPP, {
		policyId: '$recordId'
	})
	pp(result) {
		this.isLoading = true
		this.spinnerMessage = 'Refreshing Payment....'
		this.refreshPayment = result
		console.log(result)
		if (result.data) {
			try{
			for (let key in result.data) {
				var tempList = []
				for (let key2 in result.data[key]) {
					console.log('broker::', key, result.data[key][key2].VG_Broker__r)
					this.payAmountMap.set(key, result.data[key][key2].VG_Payment_Percent__c)
					this.dateMap.set(key, result.data[key][key2].VG_Due_Date__c);
					if(result.data[key][key2].VG_Broker__r !== undefined) {
						this.brokerMap.set(key, result.data[key][key2].VG_Broker__r.Name)
					}
					this.brokerIdMap.set(key, result.data[key][key2].VG_Broker__c)
					this.commentMap.set(key, result.data[key][key2].VG_Comment__c)
					tempList.push({
						ps: result.data[key][key2].VG_Policy_Schedule__c,
						gwp: result.data[key][key2].VG_GWP_This_Time__c,
						psName: result.data[key][key2].VG_Policy_Schedule__r.Name,
						pfId: result.data[key][key2].Id,
					})
				}
				this.paymentViewList.push({
					key: key,
					paymentPercent: this.payAmountMap.get(key),
					dueDate: this.dateMap.get(key),
					broker: this.brokerMap.get(key),
					brokerId: this.brokerIdMap.get(key),
					comment: this.commentMap.get(key),
					paymentLabel: `Payment (${this.payAmountMap.get(key)}%) - Due Date: (${this.dateMap.get(key)})`,
					temp: tempList,
					value: result.data[key]
				})
			}
			if (this.paymentViewList.length > 0)
				this.isPaymentHasValue = true
			else
				this.isPaymentHasValue = false
			console.log('::', this.paymentViewList)
		}catch(e){
			this.error = e
		}
		} else if (result.error) {
			this.error = result.error
		}
		var timev = setTimeout(() => {
			this.isLoading = false
			this.spinnerMessage = ''
		}, 1000)
	}

	openPaymentTaxModal() {
		this.isOpenPaymentTaxModal = true
		this.isLoading = true
		var timev = setTimeout(() => {
			// refreshApex(this.refreshPayment)
			// var timev = setTimeout(() => {
			// 	refreshApex(this.refreshTableTax)
			// 	var timev = setTimeout(() => {
					this.isLoading = false
			// 	},1000)
			// },1000)
		},1000)
	}

	addPayment() {
		try {
			this.isLoading = true
			this.isAddPaymentTaxButton = true
			this.paymentInsertEditTabName = 'Add Payment'
			this.paymetInsertEditTabValue = 'add-payment'
			this.spinnerMessage = 'Add Payment Tab Loading....'
			var timev = setTimeout(() => {
				this.isActiveMainTab = "paymentSection"
				var timev = setTimeout(() => {
					this.isActiveTabPayment = this.paymetInsertEditTabValue
					this.isLoading = false
					this.InsertPaymentList = {
						dueDate: '',
						counter: '0',
						policyPaymenyPercent: '',
						comment: '',
						broker: '',
						btnpf: false,
						btnAddAllPS: false,
						pfList: []
					}
					this.paymentList = [this.InsertPaymentList]
					console.log(this.paymentList)
					this.isFooter = true
					this.isFooterPaymetBnt = true
				}, 600)
			}, 100)
			this.isInsertPayment = true
		} catch (error) {
			// this.showToast('Error', error, "error")
			this.error = error
		}
	}

	// onchange account for insert
	onAccountSelection(event) {
		try {
			this.accountName = event.detail.selectedValue;
			this.accountRecordId = event.detail.selectedRecordId;
			console.log('this.accountName::', this.accountName)
			console.log('this.accountRecordId::', this.accountRecordId)
			console.log(event.target.accessKey)
			this.paymentList[event.target.accessKey].broker = event.detail.selectedRecordId;
			// this.paymentList[event.target.accessKey].brokerName = event.detail.selectedValue;
		} catch (error) {
			// this.showToast('Error', error, "error")
			this.error = error
		}
	}

	addPaymentFrequencies(e) {
		try {
			this.isPFloading = true
			this.spinnerPFMessage = 'Adding New Payment Frequency....'
			this.paymentList[e.target.accessKey].pfList.push({
				ps: '',
				gwp: 0,
				ppcounter: e.target.accessKey,
				pfCounter: this.PFCounterV++
			})
			var timev = setTimeout(() => {
				this.isPFloading = false
			}, 700)
			console.log(this.paymentList)
		} catch (error) {
			// this.showToast('Error', error, "error")
			this.error = error
		}

	}
	addAllPS(e){
		console.log(e.target.accessKey, this.psOption)
		this.isPFloading = true
		this.spinnerPFMessage = 'Adding All Policy Schedule....'
		if (this.paymentList.length > 0) {
			if (this.paymentList[0].policyPaymenyPercent == '' || this.paymentList[0].policyPaymenyPercent == null || this.paymentList[0].policyPaymenyPercent == undefined) {
				this.showToast('Please Fill Policy Payment', '', "warning")
				this.isPFloading = false
				this.spinnerPFMessage = ''
				return null;
			}
		}
		for(var i=0; i<this.psOption.length; i++){
			this.paymentList[e.target.accessKey].pfList.push({
				ps: this.psOption[i].value,
				gwp: 0,
				ppcounter: e.target.accessKey,
				pfCounter: i
			})
			this.gwpList.push({
				count: i,
				ps: this.psOption[i].value,
				psName: this.psOption[i].label
			})
			
			this.paymentList[e.target.accessKey].pfList[i].ps = this.psOption[i].value
			this.gwpValue(e.target.accessKey, i, this.psOption[i].value, this.paymentList[e.target.accessKey].policyPaymenyPercent, this.psOption[i].label)
		}
		console.log(this.paymentList)
		
		this.paymentList[e.target.accessKey].btnAddAllPS = true
		this.paymentList[e.target.accessKey].btnpf = true
		var timev = setTimeout(() => {
				this.isPFloading = false
				this.spinnerPFMessage = ''
		}, 700)
	}
	policyPaymenyAmount
	paymentHandler(e) {
		try {
			console.log(e.target.accessKey)
			if (e.target.name == 'Due Date')
				this.paymentList[e.target.accessKey].dueDate = e.target.value
			else if (e.target.name == 'Policy Percent')
				this.paymentList[e.target.accessKey].policyPaymenyPercent = e.target.value
			else if (e.target.name == 'Comment')
				this.paymentList[e.target.accessKey].comment = e.target.value

			if (e.target.name == 'Policy Percent') {
				if (this.paymentList[e.target.accessKey].policyPaymenyPercent > 100) {
					this.isAddPaymentTaxButton = true
					this.paymentList[e.target.accessKey].btnpf = true
					this.isPaymentSaveBtn = true
					this.showToast('Cant add new Payment Frequency because sum of Payment (%) reached 100 ..', '', "error")
					return null
				} else {
					this.isAddPaymentTaxButton = true
					this.paymentList[e.target.accessKey].btnpf = false
					this.isPaymentSaveBtn = false

					this.policyPaymenyAmount = this.paymentList[e.target.accessKey].policyPaymenyPercent
					var key = e.target.accessKey
					if (this.gwpList.length > 0) {
						console.log('::: inside if')
						var timev = setTimeout(() => {
							console.log("this.gwpList::", this.gwpList, 'this.policyPaymenyAmount::', this.policyPaymenyAmount)
							for (var i = 0; i < this.gwpList.length; i++) {
								this.gwpValue(key, this.gwpList[i].count, this.gwpList[i].ps, this.policyPaymenyAmount, this.gwpList[i].psName)
							}
						}, 2000)
					}

				}
			}
		} catch (error) {
			//this.showToast('Error', error, "error")
			// console.error(error)
			this.error = error
		}

	}
	gwpList = []
	isPaymentSaveBtn = false
	pfHandler(e) {
		try {
			this.paymentList[e.target.accessKey].pfList[e.target.name].ps = e.target.value
			var psName = e.target.options.find(opt => opt.value === e.detail.value).label;

			var ps = this.paymentList[e.target.accessKey].pfList[e.target.name].ps
			var amt = this.paymentList[e.target.accessKey].policyPaymenyPercent
			this.gwpList.push({
				count: e.target.name,
				ps: ps,
				psName: psName
			})
			this.gwpValue(e.target.accessKey, e.target.name, ps, amt, psName)
		} catch (error) {
			// this.showToast('Error', error, "error")
			console.error(error)
			this.error = error
		}
	}

	async gwpValue(accessKey, name, ps, amt, psName) {
		this.isPFloading = true
		this.spinnerPFMessage = 'GWP is Calculating....'
		try {
			this.paymentList[accessKey].pfList[name].gwp = await calcGWP({
				psId: ps,
				polPayAmt: amt
			});
			this.checkValidationPS(accessKey, name, ps, this.paymentList[accessKey].pfList[name].gwp, psName)
		} catch (error) {
			// this.showToast('Error', error.message, "error")
			console.error(error)
			this.error = error
			this.isPFloading = false
			this.spinnerPFMessage = ''
		} finally {
			console.log('Finally Block');
		}
	}

	async checkValidationPS(accessKey, name, ps, gwp, psName) {
		try {
			this.spinnerPFMessage = 'Checking Validation....'
			var isCheck = await getCheckValidationPS({
				psId: ps,
				gwp: gwp
			});
			// console.log('isCheck::',isCheck)
			this.paymentList[accessKey].btnpf = isCheck
			this.isPaymentSaveBtn = isCheck
		} catch (error) {
			// this.showToast('Error', error.message, "error")
			console.error(error)
			this.error = error
			this.isPFloading = false
			this.spinnerPFMessage = ''
		} finally {
			// console.log('Finally Block -- checkValidationPS');
			this.isPFloading = false
			this.spinnerPFMessage = ''
			if (this.paymentList[accessKey].btnpf)
				this.showToast(`Payment Frequency GWP should be Less than or equal to PS GWP : [ ${psName} ]`, '', "warning", 'sticky')
			if(this.paymentList[accessKey].btnAddAllPS)
				this.paymentList[accessKey].btnpf = true
		}
	}

	removePFView(e) {
		this.isPFloading = true
		this.spinnerPFMessage = 'Removing Payment Frequency...'
		this.paymentList[e.target.accessKey].btnpf = false
		this.isPaymentSaveBtn = false
		var removePaymentList = this.paymentList[e.target.accessKey].pfList
		removePaymentList.splice(e.target.name, 1)
		// console.log("removePaymentList::",removePaymentList)
		for (var i = e.target.name; i < this.paymentList[e.target.accessKey].pfList.length; i++) {
			var pfCounter = this.paymentList[e.target.accessKey].pfList[i].pfCounter - 1
			this.paymentList[e.target.accessKey].pfList[i].pfCounter = pfCounter
		}
		// console.log('paymentList::', this.paymentList)
		var index = this.paymentList[e.target.accessKey].pfList.length
		this.PFCounterV = index--

		var timev = setTimeout(() => {
			this.isPFloading = false
			this.spinnerPFMessage = ''
		}, 1000)
	}


	insertPPPF() {
		this.isLoading = true
		this.spinnerMessage = 'Please wait...'
		if (this.paymentList.length > 0) {
			if (this.paymentList[0].dueDate == '' || this.paymentList[0].dueDate == null || this.paymentList[0].dueDate == undefined) {
				this.showToast('Please Fill Due Date', '', "warning", 'sticky')
				this.isLoading = false
				return null;
			}
			if (this.paymentList[0].policyPaymenyPercent == '' || this.paymentList[0].policyPaymenyPercent == null || this.paymentList[0].policyPaymenyPercent == undefined) {
				this.showToast('Please Fill Policy Payment', '', "warning", 'sticky')
				this.isLoading = false
				return null;
			}
		}
		insertUpdatePolicyPayment({
				policypaymentList: this.paymentList,
				policyId: this.recordId
			})
			.then(result => {
				console.log(result)

				this.isFooter = false
				this.isFooterPaymetBnt = false
				this.InsertPaymentList = []
				this.paymentList = []
				this.paymentInsertEditTabName = ''
				this.paymetInsertEditTabValue = ''
				this.isInsertPayment = false
				this.isActiveMainTab = ''
				this.isActiveTabPayment = ''
				this.spinnerMessage = ''
				this.PFCounterV = 0
				this.spinnerPFMessage = ''
				this.isPFloading = false
				this.isAddPaymentTaxButton = false
				this.gwpList = []
				this.isPaymentSaveBtn = false
				this.paymentViewList = []
				this.dateMap = new Map();
				this.payAmountMap = new Map();
				this.brokerMap = new Map();
				this.commentMap = new Map();
				this.brokerIdMap = new Map();
				this.isEditPayment = false
				refreshApex(this.refreshPayment)
				var timev = setTimeout(() => {
					this.isLoading = false
					this.showToast('Success', 'Policy Payment record is created', 'success', 'sticky')
				}, 1000)
			}).catch(err => {
				console.error(err)
				this.showToast('Error', err.message, 'error', 'sticky')
				this.error = err
				this.isLoading = false
				//this.isAddPaymentTaxButton = false
			})
	}

	editPayments(e) {
		this.editPaymentList = []
		this.gwpList = []
		var EditPaymentList = []
		this.isLoading = true
		this.isAddPaymentTaxButton = true
		this.paymentInsertEditTabName = 'Edit Payment'
		this.paymetInsertEditTabValue = 'edit-payment'
		this.spinnerMessage = 'Edit Payment Tab Loading....'
		for (let i = 0; i < this.paymentViewList.length; i++) {
			if (this.paymentViewList[i].key === e.target.value) {
				var pftempList = []
				for (let j = 0; j < this.paymentViewList[i].temp.length; j++) {
					console.log('j::', this.paymentViewList[i].temp[j])
					pftempList.push({
						ps: this.paymentViewList[i].temp[j].ps,
						gwp: this.paymentViewList[i].temp[j].gwp,
						psName: this.paymentViewList[i].temp[j].psName,
						pfId: this.paymentViewList[i].temp[j].pfId,
						ppcounter: i,
						pfCounter: j
					})
					this.gwpList.push({
						count: j,
						ps: this.paymentViewList[i].temp[j].ps,
						psName: this.paymentViewList[i].temp[j].psName
					})
				}

				EditPaymentList = {
					ppId: this.paymentViewList[i].key,
					dueDate: this.paymentViewList[i].dueDate,
					counter: '0',
					policyPaymenyPercent: this.paymentViewList[i].paymentPercent,
					comment: this.paymentViewList[i].comment,
					broker: this.paymentViewList[i].brokerId,
					btnpf: false,
					pfList: pftempList
				}
				this.editPaymentList = [EditPaymentList]
			}
		}
		console.log('gwp::', this.gwpList)
		try {
			var timev = setTimeout(() => {
				this.isActiveMainTab = "paymentSection"
				var timev = setTimeout(() => {
					this.isActiveTabPayment = this.paymetInsertEditTabValue
					this.isLoading = false
					this.isFooter = true
					this.isFooterUpdatePaymetBnt = true
				}, 600)
			}, 100)
			this.isEditPayment = true

		} catch (error) {
			this.showToast('Error', error, "error", 'sticky')
			this.error = error
		}
	}

	UpdatePaymentHandler(e) {
		try {
			console.log(e.target.accessKey)
			if (e.target.name == 'Due Date')
				this.editPaymentList[e.target.accessKey].dueDate = e.target.value
			else if (e.target.name == 'Policy Percent')
				this.editPaymentList[e.target.accessKey].policyPaymenyPercent = e.target.value
			else if (e.target.name == 'Comment')
				this.editPaymentList[e.target.accessKey].comment = e.target.value

			if (e.target.name == 'Policy Percent') {
				if (this.editPaymentList[e.target.accessKey].policyPaymenyPercent > 100) {
					this.isAddPaymentTaxButton = true
					this.editPaymentList[e.target.accessKey].btnpf = true
					this.isPaymentSaveBtn = true
					this.showToast('Cant add new Payment Frequency because sum of Payment (%) reached 100 ..', '', "error", 'sticky')
					return null
				} else {
					this.isAddPaymentTaxButton = true
					this.editPaymentList[e.target.accessKey].btnpf = false
					this.isPaymentSaveBtn = false

					this.policyPaymenyAmount = this.editPaymentList[e.target.accessKey].policyPaymenyPercent
					var key = e.target.accessKey
					if (this.gwpList.length > 0) {
						console.log('::: inside if')
						var timev = setTimeout(() => {
							console.log("this.gwpList::", this.gwpList, 'this.policyPaymenyAmount::', this.policyPaymenyAmount)
							for (var i = 0; i < this.gwpList.length; i++) {
								this.gwpValueUpdate(key, this.gwpList[i].count, this.gwpList[i].ps, this.policyPaymenyAmount, this.gwpList[i].psName)
							}
						}, 2000)
					}

				}
			}
			console.log('this.editPaymentList::', this.editPaymentList)
		} catch (error) {
			//this.showToast('Error', error, "error")
			console.error(error)
			this.error = error
		}
	}
	async gwpValueUpdate(accessKey, name, ps, amt, psName) {
		this.isPFloading = true
		this.spinnerPFMessage = 'GWP is Calculating....'
		try {
			this.editPaymentList[accessKey].pfList[name].gwp = await calcGWP({
				psId: ps,
				polPayAmt: amt
			});
		} catch (error) {
			// this.showToast('Error', error.message, "error")
			console.error(error)
			this.error = error
			this.isPFloading = false
			this.spinnerPFMessage = ''
		} finally {
			console.log('Finally Block');
			var timev = setTimeout(() => {
				this.isPFloading = false
			}, 1000)

		}
	}

	// Onchange account for update
	onAccountSelection1(event) {
		this.accountName = event.detail.selectedValue;
		this.accountRecordId = event.detail.selectedRecordId;

		this.editPaymentList[event.target.accessKey].broker = event.target.selectedRecordId
		//this.editPaymentList[event.target.accessKey].brokerName = event.detail.selectedValue;
		console.log('this.updatePaymentList:: 3,', this.editPaymentList)
	}

	updatePPPF() {
		this.isLoading = true
		this.spinnerMessage = 'Please wait...'
		if (this.editPaymentList.length > 0) {
			if (this.editPaymentList[0].dueDate == '' || this.editPaymentList[0].dueDate == null || this.editPaymentList[0].dueDate == undefined) {
				this.showToast('Please Fill Due Date', '', "warning", 'sticky')
				this.isLoading = false
				return null;
			}
			if (this.editPaymentList[0].policyPaymenyPercent == '' || this.editPaymentList[0].policyPaymenyPercent == null || this.editPaymentList[0].policyPaymenyPercent == undefined) {
				this.showToast('Please Fill Policy Payment', '', "warning", 'sticky')
				this.isLoading = false
				return null;
			}
		}
		insertUpdatePolicyPayment({
				policypaymentList: this.editPaymentList,
				policyId: this.recordId
			})
			.then(result => {
				console.log(result)
				this.isFooter = false
				this.isFooterPaymetBnt = false
				this.InsertPaymentList = []
				this.paymentList = []
				this.paymentInsertEditTabName = ''
				this.paymetInsertEditTabValue = ''
				this.isInsertPayment = false
				this.isActiveMainTab = ''
				this.isActiveTabPayment = ''
				this.spinnerMessage = ''
				this.PFCounterV = 0
				this.spinnerPFMessage = ''
				this.isPFloading = false
				this.isAddPaymentTaxButton = false
				this.gwpList = []
				this.isPaymentSaveBtn = false
				this.paymentViewList = []
				this.dateMap = new Map();
				this.payAmountMap = new Map();
				this.brokerMap = new Map();
				this.commentMap = new Map();
				this.brokerIdMap = new Map();
				this.isEditPayment = false
				this.isFooterUpdatePaymetBnt = false
				this.editPaymentList = []
				refreshApex(this.refreshPayment)
				var timev = setTimeout(() => {
					this.isLoading = false
					this.showToast('Success', 'Policy Payment record is Updated', 'success', 'sticky')
				}, 1000)
			}).catch(err => {
				console.log(err)
				this.showToast('Error', err.message, 'error', 'sticky')
				this.error = err
				this.isLoading = false
				//this.isAddPaymentTaxButton = false
			})

	}

	deletePFUpdate(e) {
		console.log('e::', e.target.name)
		this.isLoading = true
		this.spinnerMessage = 'Deleting Payment....'
		deletePF({
			pfId: e.target.name
		}).then((result) => {
			this.isFooter = false
			this.isFooterPaymetBnt = false
			this.InsertPaymentList = []
			this.paymentList = []
			this.paymentInsertEditTabName = ''
			this.paymetInsertEditTabValue = ''
			this.isInsertPayment = false
			this.isActiveMainTab = ''
			this.isActiveTabPayment = ''
			this.spinnerMessage = ''
			this.PFCounterV = 0
			this.spinnerPFMessage = ''
			this.isPFloading = false
			this.isAddPaymentTaxButton = false
			this.gwpList = []
			this.isPaymentSaveBtn = false
			this.paymentViewList = []
			this.dateMap = new Map();
			this.payAmountMap = new Map();
			this.brokerMap = new Map();
			this.commentMap = new Map();
			this.brokerIdMap = new Map();
			this.isEditPayment = false
			this.isFooterUpdatePaymetBnt = false
			this.editPaymentList = []
			refreshApex(this.refreshPayment)
			var timev = setTimeout(() => {
				this.isLoading = false
				this.showToast('Success', ' Record is Deleted', 'success', 'sticky')
			}, 1000)
		}).catch(err => {
			console.log(err)
			this.showToast('Error', err.message, 'error', 'sticky')
			this.error = err
			this.isLoading = false
			//this.isAddPaymentTaxButton = false
		})
		this.isEditPayment = false
	}

	// Tax Section
	isActiveTabTax = ''
	isTaxHasValue = false
	isInsertTax = false
	taxInsertEditTabName = ''
	taxInsertEditTabValue = ''
	isFooterTaxBnt = false
	isTaxSaveBtn = false
	isTaxloading = false
	spinnerTaxMessage = ''
	taxCounterV = 0
	@track refreshTableTax = []
	@track policyInsertTaxList=[]
	@track taxTypeValueList = []
	@track taxJurisdictionValueList = []
	@track taxAdministeredByOption = []
	@track taxPaidByOption = []
	@track taxViewList = []

	taxTypeMap = new Map()
	taxJurisdictionMap = new Map()
	taxAdministeredByMap = new Map()
	taxPaidByMap = new Map()
	taxPercentMap = new Map()
	commentTaxMap = new Map()
	taxIncludedMap = new Map()

	connectedCallback() {
		try{
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

		// var debetDetailsValue = ['Bad Debt Accrual', 'Bad Debt Recognized']
		// debetDetailsValue.forEach(currentItem => {
		// 	this.debetDetailsValueList.push({
		// 		"label": currentItem,
		// 		"value": currentItem
		// 	})
		// })
	} catch (e) {
		this.error = e
	}
	}

	@wire(getPolicyTax, {
		policyId: '$recordId'
	})
	pt(result) {
		console.log(result)
		this.refreshTableTax = result
		this.isLoading = true
		this.spinnerMessage = 'Refreshing Tax....'
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					var tempList = []
					for (let key2 in result.data[key]) {
						this.taxTypeMap.set(key, result.data[key][key2].VG_Tax_Type__c)
						this.taxJurisdictionMap.set(key, result.data[key][key2].VG_Tax_Jurisdiction__c);
						this.taxAdministeredByMap.set(key, result.data[key][key2].VG_Tax_Administered_By__c)
						this.taxPaidByMap.set(key, result.data[key][key2].VG_Tax_Paid_By__c)
						this.commentTaxMap.set(key, result.data[key][key2].VG_Comment__c)
						this.taxIncludedMap.set(key, result.data[key][key2].VG_Override__c)
						// this.taxPercentMap.set(key, result.data[key][key2].VG_Tax_Percent__c)
						tempList.push({
							psSelected: result.data[key][key2].VG_Policy_Schedule__r.Name,
							psid: result.data[key][key2].VG_Policy_Schedule__c,
							taxableAmount: result.data[key][key2].VG_Taxable_Amount__c,
							taxAmount : result.data[key][key2].VG_Tax_Amount__c,
							taxId:result.data[key][key2].Id,
							taxPercent: result.data[key][key2].VG_Tax_Percent__c
						})
					}
					this.taxViewList.push({
						key: key,
						taxtype: this.taxTypeMap.get(key),
						taxJurisdiction: this.taxJurisdictionMap.get(key),
						taxAdministeredBy: this.taxAdministeredByMap.get(key),
						taxPaidBy: this.taxPaidByMap.get(key),
						comment: this.commentTaxMap.get(key),
						taxIncluded: this.taxIncludedMap.get(key),
						taxPercent : this.taxPercentMap.get(key),
						temp: tempList,
						value: result.data[key]
					})
				}
			}
			if (this.taxViewList.length > 0)
				this.isTaxHasValue = true
			else
				this.isTaxHasValue = false
			console.log('taxxxxxx___::', this.taxViewList)
		} else if (result.error) {
			// this.error = result.error;
			this.showToast('Error', result.error, "error", 'sticky')
			this.error = result.error
		}
		var timev = setTimeout(() => {
			this.isLoading = false
			this.spinnerMessage = ''
		}, 1000)
	}

	addPolicyTax(){
		try{
			this.isLoading = true
			this.isAddPaymentTaxButton = true
			this.taxInsertEditTabName = 'Add Tax'
			this.taxInsertEditTabValue = 'add-tax'
			this.spinnerMessage = 'Add Tax Tab Loading....'
			
			var timev = setTimeout(() => {
				this.isActiveMainTab = "taxSection"
				var timev = setTimeout(() => {
					this.isActiveTabTax = this.taxInsertEditTabValue
					this.isLoading = false
					var insertPT = {
						taxType:'',
						taxJurisdiction: '',
						taxPaidBy: '',
						taxAdministeredBy: '',
						comment: '',
						// taxPercent: '',
						taxIncluded: false,
						counter:'0',
						btntax: false,
						btnAllPStax: false,
						taxWList: []
					}
					this.policyInsertTaxList = [insertPT]
					
					this.isFooter = true
					this.isFooterTaxBnt = true
				}, 600)
			}, 100)
			this.isInsertTax = true
		} catch (error) {
			this.showToast('Error', error, "error", 'sticky')
			this.error = error
		}
		
	}

	addTax(e) {
		try {
			this.isTaxloading = true
			this.spinnerTaxMessage = 'Adding New Tax....'
			this.policyInsertTaxList[e.target.accessKey].taxWList.push({
				psSelected: '',
				taxableAmount: 0,
				ptcounter: e.target.accessKey,
				taxCounter: this.taxCounterV++,
				taxAmount : '',
				taxPercent: '',
			})
			var timev = setTimeout(() => {
				this.isTaxloading = false
				this.spinnerTaxMessage = ''
			}, 700)
			console.log(this.policyInsertTaxList)
		} catch (error) {
			this.showToast('Error', error, "error", 'sticky')
			this.error = error
		}

	}
	addAllPSTax(e){
		for(var i=0; i<this.psOption.length; i++){
			this.policyInsertTaxList[e.target.accessKey].taxWList.push({
				psSelected: this.psOption[i].value,
				taxableAmount: 0,
				ptcounter: e.target.accessKey,
				taxCounter: i,
				taxAmount : '',
				taxPercent: '',
			})
		}

		this.policyInsertTaxList[e.target.accessKey].btntax = true
		this.policyInsertTaxList[e.target.accessKey].btnAllPStax = true
	}

	removeTaxView(e){
		this.isTaxloading = true
		this.spinnerTaxMessage = 'Removing Tax....'
		var removeTax = this.policyInsertTaxList[e.target.accessKey].taxWList
		removeTax.splice(e.target.name, 1)

		for (var i = e.target.name; i < this.policyInsertTaxList[e.target.accessKey].taxWList.length; i++) {
			this.policyInsertTaxList[e.target.accessKey].taxWList[i].taxCounter = this.policyInsertTaxList[e.target.accessKey].taxWList[i].taxCounter - 1
		}
		var index = this.policyInsertTaxList[e.target.accessKey].taxWList.length
		this.taxCounterV = index--

		console.log(this.policyInsertTaxList)
		var timev = setTimeout(() => {
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
		}, 700)
	}

	taxCalcList = []
	TaxPaidBy = ''
	TaxAdministeredBy = ''
	taxHandler(e){
		if (e.target.name == 'Tax Type') {
			this.policyInsertTaxList[e.target.accessKey].taxType = e.target.value
		} else if (e.target.name == 'Tax Jurisdiction') {
			this.policyInsertTaxList[e.target.accessKey].taxJurisdiction = e.target.value
		} else if (e.target.name == 'Tax Paid By') {
			this.policyInsertTaxList[e.target.accessKey].taxPaidBy = e.target.value
			 this.TaxPaidBy = e.target.value
		} else if (e.target.name == 'Tax Administered By') {
			this.policyInsertTaxList[e.target.accessKey].taxAdministeredBy = e.target.value
			 this.TaxAdministeredBy = e.target.value
		} else if (e.target.name == 'Comment') {
			this.policyInsertTaxList[e.target.accessKey].comment = e.target.value
		} 
		// else if (e.target.name == 'TaxPercent') {
		// 	this.policyInsertTaxList[e.target.accessKey].taxPercent = e.target.value
		// 	if(this.policyInsertTaxList[e.target.accessKey].taxPercent !==''){
		// 		if (this.taxCalcList.length > 0) {
		// 			for (var i = 0; i < this.taxCalcList.length; i++) {
		// 				this.taxAmountVal(e.target.accessKey, this.taxCalcList[i].count, this.taxCalcList[i].taxableAmount, this.policyInsertTaxList[e.target.accessKey].taxPercent)
		// 			}
		// 		}
		// 	}
		// } 
		if (this.TaxPaidBy == 'Insurer' && this.TaxAdministeredBy == 'Insured') {
			this.policyInsertTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insurer' && this.TaxAdministeredBy == 'Broker') {
			this.policyInsertTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insured' && this.TaxAdministeredBy == 'Insurer') {
			this.policyInsertTaxList[e.target.accessKey].taxIncluded = true
		} else if (this.TaxPaidBy == 'Insured' && this.TaxAdministeredBy == 'MGA') {
			this.policyInsertTaxList[e.target.accessKey].taxIncluded = true
		} else {
			this.policyInsertTaxList[e.target.accessKey].taxIncluded = false
		}
	}

	taxwHandler(e) {
		if (e.target.name == 'Select Policy Schedule'){
			this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].psSelected = e.target.value
			var psName = e.target.options.find(opt => opt.value === e.detail.value).label;
		}else if (e.target.name == 'TaxableAmount'){
			this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount = e.target.value
		}else if(e.target.name == 'TaxPercent'){
			this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].taxPercent = e.target.value
		}
		// this.taxCalcList.push({
		// 	count: e.target.dataset.name,
		// 	taxableAmount: this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount
		// })
		this.taxAmountVal(e.target.accessKey, e.target.dataset.name, this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].taxableAmount, this.policyInsertTaxList[e.target.accessKey].taxWList[e.target.dataset.name].taxPercent)
	}

	async taxAmountVal(accessKey, name, taxableAmount, taxPercent) {
		try {
			this.isTaxloading = true
			this.spinnerTaxMessage = 'Tax Amount is Calculating....'
			this.policyInsertTaxList[accessKey].taxWList[name].taxAmount = (taxableAmount * (taxPercent / 100)).toFixed(2)
		} catch (error) {
			console.log(error);
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
			this.error = error
		} finally {
			console.log('Finally Block from tax amount calc');
			var timev = setTimeout(() => {
				this.isTaxloading = false
				this.spinnerTaxMessage = ''
			}, 1000)
		}
	}

	insertPPTax(){
		this.isLoading = true
		this.spinnerMessage = 'Please wait...'
		insertPolicyTax({
			policyTaxList: this.policyInsertTaxList,
			policyId: this.recordId
		}).then(result => {
			this.isActiveTabTax = ''
			this.isTaxHasValue = false
			this.isInsertTax = false
			this.taxInsertEditTabName = ''
			this.taxInsertEditTabValue = ''
			this.isFooterTaxBnt = false
			this.isTaxSaveBtn = false
			this.policyInsertTaxList = []
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
			this.taxCalcList = []
			this.TaxPaidBy = ''
			this.TaxAdministeredBy = ''
			this.spinnerMessage = ''
			this.taxCounterV = 0
			this.isAddPaymentTaxButton = false
			this.taxViewList = []
			this.isFooter = false
			//refreshApex(this.refreshPayment)
			var timev = setTimeout(() => {
				refreshApex(this.refreshTableTax)
				var timev = setTimeout(() => {
					this.isLoading = false
					this.showToast('Success', 'Policy Tax record is created', 'success', 'sticky')
				}, 1000)
			}, 1000)
		})
		.catch(err => {
			console.log(err)
			this.showToast('Error', err.message, 'error', 'sticky')
			this.isLoading = false
			this.error = error
			//this.isAddPaymentTaxButton = false
		})
		
	}

	isEditTax = false
	isFooterUpdateTaxBnt = false
	@track editTaxList = []
	editTaxes(e){
			console.log(e.target.value)
			var editTaxList = []
			this.taxCalcList = []
			this.isLoading = true
			this.isAddPaymentTaxButton = true
			this.taxInsertEditTabName = 'Edit Tax'
			this.taxInsertEditTabValue = 'edit-tax'
			this.spinnerMessage = 'Edit Tax Tab Loading....'
			for (let i = 0; i < this.taxViewList.length; i++) {
				if (this.taxViewList[i].key === e.target.value) {
					console.log(this.taxViewList[i].key, e.target.value)
					var taxtempList = []
					for (let j = 0; j < this.taxViewList[i].temp.length; j++) {
						taxtempList.push({
							taxId: this.taxViewList[i].temp[j].taxId,
							psSelected: this.taxViewList[i].temp[j].psid,
							psName: this.taxViewList[i].temp[j].psSelected,
							taxableAmount: this.taxViewList[i].temp[j].taxableAmount,
							ptcounter: i,
							taxCounter: j,
							taxAmount : this.taxViewList[i].temp[j].taxAmount,
							taxPercent : this.taxViewList[i].temp[j].taxPercent
						})
						// this.taxCalcList.push({
						// 	count: j,
						// 	taxableAmount: this.taxViewList[i].temp[j].taxableAmount
						// })
					}
					editTaxList = {
						pTaxId:this.taxViewList[i].key,
						taxType:this.taxViewList[i].taxtype,
						taxJurisdiction: this.taxViewList[i].taxJurisdiction,
						taxPaidBy: this.taxViewList[i].taxPaidBy,
						taxAdministeredBy: this.taxViewList[i].taxAdministeredBy,
						comment: this.taxViewList[i].comment,
						taxPercent: this.taxViewList[i].taxPercent,
						taxIncluded: this.taxViewList[i].taxIncluded,
						counter:'0',
						taxWList: taxtempList
					}
					this.editTaxList = [editTaxList]
				}
			}
			console.log('this.editTaxList ::', this.editTaxList )
			console.log('this.taxCalcList ::', this.taxCalcList )
			try {
				var timev = setTimeout(() => {
					this.isActiveMainTab = "taxSection"
					var timev = setTimeout(() => {
						this.isActiveTabTax = this.taxInsertEditTabValue
						this.isLoading = false
						this.isFooter = true
						this.isFooterUpdateTaxBnt = true
						this.isFooterTaxBnt = false
					}, 600)
				}, 100)
				this.isEditTax = true
			} catch (error) {
				this.showToast('Error', error, "error", 'sticky')
				this.error = error
			}
	}

	editTaxAdministeredByV = ''
	editTaxPaidByV = ''
	editTaxHandler(e) { // onchange handler for policy tax update
		console.log('editTaxHandler', e.target.accessKey)
		var isOverride = false
		if (e.target.name == 'Tax Type') {
			this.editTaxList[e.target.accessKey].taxType = e.target.value
		} else if (e.target.name == 'Tax Jurisdiction') {
			this.editTaxList[e.target.accessKey].taxJurisdiction = e.target.value
			
		} else if (e.target.name == 'Tax Paid By') {
			this.editTaxList[e.target.accessKey].taxPaidBy = e.target.value
			this.editTaxPaidByV = e.target.value
			isOverride = true
		} else if (e.target.name == 'Tax Administered By') {
			this.editTaxList[e.target.accessKey].taxAdministeredBy = e.target.value
			this.editTaxAdministeredByV = e.target.value
			isOverride = true
		} else if (e.target.name == 'Comment') {
			this.editTaxList[e.target.accessKey].comment = e.target.value
		} 
		// else if (e.target.name == 'TaxPercent') {
		// 	this.editTaxList[e.target.accessKey].taxPercent = e.target.value
		// 	console.log('this.taxCalcList::',this.taxCalcList)
		// 	if(this.editTaxList[e.target.accessKey].taxPercent !==''){
		// 		if (this.taxCalcList.length > 0) {
		// 			console.log('::: inside if tax')
		// 			for (var i = 0; i < this.taxCalcList.length; i++) {
		// 				this.taxAmountValUpdate(e.target.accessKey, i, this.taxCalcList[i].taxableAmount, this.editTaxList[e.target.accessKey].taxPercent)
		// 			}
		// 		}
		// 	}
		// }
		if(isOverride){
			if (this.editTaxPaidByV == 'Insurer' && this.editTaxAdministeredByV == 'Insured') {
				this.editTaxList[e.target.accessKey].taxIncluded = true
			} else if (this.editTaxPaidByV == 'Insurer' && this.editTaxAdministeredByV == 'Broker') {
				this.editTaxList[e.target.accessKey].taxIncluded = true
			} else if (this.editTaxPaidByV == 'Insured' && this.editTaxAdministeredByV == 'Insurer') {
				this.editTaxList[e.target.accessKey].taxIncluded = true
			} else if (this.editTaxPaidByV == 'Insured' && this.editTaxAdministeredByV == 'MGA') {
				this.editTaxList[e.target.accessKey].taxIncluded = true
			} else {
				// this.taxCheckedEdit = false
				this.editTaxList[e.target.accessKey].taxIncluded = false
			}
		}
		
		console.log('editTaxList::', this.editTaxList)
	}

	taxAmtChangeHandler(e) { // onchange handler for update tax
		if (e.target.name == 'TaxableAmount') {
			this.editTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount = e.target.value
			this.taxCalcList = []
		}
		if (e.target.name == 'TaxPercent') {
			this.editTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxPercent = e.target.value
		}
		// this.taxCalcList.push({
		// 	count: e.target.dataset.value,
		// 	taxableAmount: this.editTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount
		// })
		this.taxAmountValUpdate(e.target.accessKey, parseInt(e.target.dataset.value), parseInt(this.editTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxableAmount), parseInt(this.editTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxPercent))
	}

	//calculate tax amount for update
	async taxAmountValUpdate(accessKey, count, taxableAmount, taxPercent) {
		try {
			this.isTaxloading = true
			this.spinnerTaxMessage = 'Tax Amount is Calculating....'
			// console.log('30/10 ::', accessKey, '::', count, '::', taxableAmount, '::', taxPercent)
			var val = (taxableAmount * (taxPercent / 100)).toFixed(2)
			this.editTaxList[accessKey].taxWList[count].taxAmount = val
			// console.log('this.editPaymentList[accessKey].value[count].taxAmount: ' + this.editTaxList[accessKey].value[count].taxAmount);
		} catch (error) {
			console.error(error);
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
			this.error = error
		} finally {
			console.log('Finally Block from tax amount calc');
			var timev = setTimeout(() => {
				this.isTaxloading = false
				this.spinnerTaxMessage = ''
			}, 1000)
		}
	}

	updatePPTax(){
		this.isLoading = true
		this.spinnerMessage = 'Please wait...'
		insertPolicyTax({
			policyTaxList: this.editTaxList,
			policyId: this.recordId
		}).then(result => {
			this.isActiveTabTax = ''
			this.isInsertTax = false
			this.taxInsertEditTabName = ''
			this.taxInsertEditTabValue = ''
			this.isFooterTaxBnt = false
			this.isTaxSaveBtn = false
			this.policyInsertTaxList = []
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
			this.taxCalcList = []
			this.TaxPaidBy = ''
			this.isTaxHasValue = false
			this.TaxAdministeredBy = ''
			this.taxCounterV = 0
			this.taxViewList = []
			this.taxTypeMap = new Map()
			this.taxJurisdictionMap = new Map()
			this.taxAdministeredByMap = new Map()
			this.taxPaidByMap = new Map()
			this.taxPercentMap = new Map()
			this.commentTaxMap = new Map()
			this.taxIncludedMap = new Map()
			this.isEditTax = false
			this.isFooterUpdateTaxBnt = false
			this.isAddPaymentTaxButton = false
			this.isFooter = false
			//refreshApex(this.refreshPayment)
			var timev = setTimeout(() => {
				refreshApex(this.refreshTableTax)
				var timev = setTimeout(() => {
					this.isLoading = false
					this.showToast('Success', 'Policy Tax record is Updated', 'success', 'sticky')
				}, 1000)
			}, 1000)
		})
		.catch(err => {
			console.log(err)
			this.showToast('Error', err.message, 'error', 'sticky')
			this.isLoading = false
			this.error = err
			//this.isAddPaymentTaxButton = false
		})
	}

	deleteTaxUpdate(e){
		console.log(e.target.value)
		this.isLoading = true
		this.spinnerMessage = 'Deleting Tax...'
		deleteTax({
			taxId: e.target.value
		}).then((result) => {
			this.isActiveTabTax = ''
			this.isInsertTax = false
			this.taxInsertEditTabName = ''
			this.taxInsertEditTabValue = ''
			this.isFooterTaxBnt = false
			this.isTaxSaveBtn = false
			this.policyInsertTaxList = []
			this.isTaxloading = false
			this.spinnerTaxMessage = ''
			this.taxCalcList = []
			this.TaxPaidBy = ''
			this.TaxAdministeredBy = ''
			this.taxCounterV = 0
			this.taxViewList = []
			this.taxTypeMap = new Map()
			this.taxJurisdictionMap = new Map()
			this.taxAdministeredByMap = new Map()
			this.taxPaidByMap = new Map()
			this.taxPercentMap = new Map()
			this.commentTaxMap = new Map()
			this.taxIncludedMap = new Map()
			this.isEditTax = false
			this.isFooterUpdateTaxBnt = false
			this.isAddPaymentTaxButton = false
			//refreshApex(this.refreshPayment)
			var timev = setTimeout(() => {
				refreshApex(this.refreshTableTax)
				var timev = setTimeout(() => {
					this.isLoading = false
					this.showToast('Success', 'Policy Tax record is Updated', 'success', 'sticky')
				}, 1000)
			}, 1000)
		}).catch(err => {
			console.log(err)
			this.showToast('Error', err.message, 'error', 'sticky')
			this.isLoading = false
			this.error = err
			//this.isAddPaymentTaxButton = false
		})
	}

	showToast(title, message, variant, mode) {
		const evt = new ShowToastEvent({
			title: title,
			message: message,
			variant: variant,
			mode: mode
		});
		this.dispatchEvent(evt);
	}

	cancelInsetPF(e) {
		console.log(e.target.name)
		this.isLoading = true
		if(e.target.name == 'Cancel Payment')
			this.spinnerMessage = 'Canceling Payment.....'
		else if(e.target.name == 'Cancel Tax')
			this.spinnerMessage = 'Canceling Tax.....'

		this.isFooter = false
		this.InsertPaymentList = []
		this.paymentList = []
		this.paymentInsertEditTabName = ''
		this.paymetInsertEditTabValue = ''
		this.isInsertPayment = false
		this.isActiveMainTab = ''
		this.isActiveTabPayment = ''
		// this.spinnerMessage = ''
		this.PFCounterV = 0
		this.spinnerPFMessage = ''
		this.isPFloading = false
		this.isAddPaymentTaxButton = false
		this.gwpList = []
		this.isPaymentSaveBtn = false
		this.isFooterPaymetBnt = false
		this.dateMap = new Map();
		this.payAmountMap = new Map();
		this.brokerMap = new Map();
		this.commentMap = new Map();
		this.brokerIdMap = new Map();
		this.isEditPayment = false
		this.isFooterUpdatePaymetBnt = false
		this.editPaymentList = []

		// Tax Section
		this.isActiveTabTax = ''
		// this.isTaxHasValue = false
		this.isInsertTax = false
		this.taxInsertEditTabName = ''
		this.taxInsertEditTabValue = ''
		this.isFooterTaxBnt = false
		this.isTaxSaveBtn = false
		this.policyInsertTaxList = []
		this.isTaxloading = false
		this.spinnerTaxMessage = ''
		this.taxCalcList = []
		this.TaxPaidBy = ''
		this.TaxAdministeredBy = ''
		this.taxCounterV = 0
		// this.refreshTableTax =[]
		// this.taxViewList = []
		this.taxTypeMap = new Map()
		this.taxJurisdictionMap = new Map()
		this.taxAdministeredByMap = new Map()
		this.taxPaidByMap = new Map()
		this.taxPercentMap = new Map()
		this.commentTaxMap = new Map()
		this.taxIncludedMap = new Map()
		this.isEditTax = false
		this.isFooterUpdateTaxBnt = false

		var timev = setTimeout(() => {
			this.isLoading = false
			this.spinnerMessage = ''
		}, 1000)
	}

	closePaymentTaxModal(){
		this.isLoading = true
		this.spinnerMessage = 'Please wait Closing Payment/Tax...'
		this.paymentInsertEditTabName = ''
		this.paymetInsertEditTabValue = ''
		this.isInsertPayment = false
		this.isActiveMainTab = ''
		this.isActiveTabPayment = ''
		//this.spinnerMessage = ''
		this.PFCounterV = 0
		this.spinnerPFMessage = ''
		this.isPFloading = false
		this.isFooter = false
		this.isAddPaymentTaxButton = false
		this.gwpList = []
		this.isPaymentSaveBtn = false
		this.isFooterPaymetBnt = false
		this.dateMap = new Map();
		this.payAmountMap = new Map();
		this.brokerMap = new Map();
		this.commentMap = new Map();
		this.brokerIdMap = new Map();
		this.isEditPayment = false
		this.isFooterUpdatePaymetBnt = false
		this.editPaymentList = []

		// Tax Section
		this.isActiveTabTax = ''
		this.isTaxHasValue = false
		this.isInsertTax = false
		this.taxInsertEditTabName = ''
		this.taxInsertEditTabValue = ''
		this.isFooterTaxBnt = false
		this.isTaxSaveBtn = false
		this.policyInsertTaxList = []
		this.isTaxloading = false
		this.spinnerTaxMessage = ''
		this.taxCalcList = []
		this.TaxPaidBy = ''
		this.TaxAdministeredBy = ''
		this.taxCounterV = 0
		// this.refreshTableTax =[]
		//this.taxViewList = []
		this.taxTypeMap = new Map()
		this.taxJurisdictionMap = new Map()
		this.taxAdministeredByMap = new Map()
		this.taxPaidByMap = new Map()
		this.taxPercentMap = new Map()
		this.commentTaxMap = new Map()
		this.taxIncludedMap = new Map()
		this.isEditTax = false
		this.isFooterUpdateTaxBnt = false
		window.location.reload()
		var timev = setTimeout(() => {
			this.isLoading = false
			this.spinnerMessage = ''
			this.isOpenPaymentTaxModal = false
		}, 3000)
	}
}