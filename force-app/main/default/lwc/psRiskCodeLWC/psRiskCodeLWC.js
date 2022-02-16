import {
	LightningElement,
	track,
	wire,
	api
} from 'lwc';

import getRiskCode from '@salesforce/apex/RiskCodeController.getRiskCodeList1'
import Finish from '@salesforce/apex/RiskCodeController.finish'
import DeleteRiskCode from '@salesforce/apex/RiskCodeController.deleteRiskCode'
import {
	refreshApex
} from '@salesforce/apex';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
export default class PsRiskCodeLWC extends LightningElement {
	@api teamList
	@api cobList
	@api proportionalOptionsList

	@api alphaProductList
	@api bridgeProductList
	@api horizonProductList
	@api gentiumProductList
	@api vclProductList
	@api vdlProductList
	@api sapiProductList
	@api cCProductList
	@api isShowError

	@track refreshTable = [];

	errors;

	spinnerMessage = ''
	isRc = false
	showLoadingSpinner = false
	isFacultativeTreaty = false
	isCOB = false
	isCommercialCombinedProduct = false

	team = ''
	selectedProduct = ''
	textarea = ''
	reinsurance = ''
	cob = ''
	cCproducts = ''
	optionsProduct
	optionsTeam = []
	optionsFT = []
	optionsCOB = []
	optionsCCProduct = []

	horizonProductMap = new Map()
	alphaProductMap = new Map()
	vclProductMap = new Map()
	vdlProductMap = new Map()
	gentiumProductMap = new Map()
	bridgeProductMap = new Map()
	sapiProductMap = new Map()

	@track riskcodeList = []
	isActiveMainTab = ''

	connectedCallback() {
		try {
			this.teamList.split(';').forEach(currentItem => {
				this.optionsTeam.push({
					"label": currentItem,
					"value": currentItem
				})
			})

			this.proportionalOptionsList.split(';').forEach(currentItem => {
				this.optionsFT.push({
					"label": currentItem,
					"value": currentItem
				})
			})

			this.cobList.split(';').forEach(currentItem => {
				this.optionsCOB.push({
					"label": currentItem,
					"value": currentItem
				})
			})

			this.cCProductList.split(';').forEach(currentItem => {
				this.optionsCCProduct.push({
					"label": currentItem,
					"value": currentItem
				})
			})
		} catch (e) {
			this.errors = e
		}
	}


	@wire(getRiskCode)
	bridge1(result) {
		this.refreshTable = result;
		this.showLoadingSpinner = true
		this.spinnerMessage = 'Refreshing Risk Code....'
		console.log('getRiskCode1::', this.refreshTable)
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					if (key == 'Bridge') {
						for (let key2 in result.data[key]) {
							if (this.bridgeProductMap.has(result.data[key][key2].Product)) {
								this.bridgeProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.bridgeProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
							// console.log('ne:::', result.data[key][key2])
						}
						var tempProductList = []
						for (const [key, value] of this.bridgeProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						// console.log('this.bridgeProductMap::',this.bridgeProductMap)
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
					if (key == 'VIM') {
						for (let key2 in result.data[key]) {
							if (this.gentiumProductMap.has(result.data[key][key2].Product)) {
								this.gentiumProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.gentiumProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.gentiumProductMap::',this.gentiumProductMap)
						var tempProductList = []
						for (const [key, value] of this.gentiumProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
					if (key == 'Horizon') {
						for (let key2 in result.data[key]) {
							if (this.horizonProductMap.has(result.data[key][key2].Product)) {
								this.horizonProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.horizonProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.horizonProductMap::',this.horizonProductMap)
						var tempProductList = []
						for (const [key, value] of this.horizonProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
					if (key == 'Alpha') {
						for (let key2 in result.data[key]) {
							if (this.alphaProductMap.has(result.data[key][key2].Product)) {
								this.alphaProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.alphaProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.alphaProductMap::',this.alphaProductMap)
						var tempProductList = []
						for (const [key, value] of this.alphaProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
					if (key == 'VCL') {
						for (let key2 in result.data[key]) {
							if (this.vclProductMap.has(result.data[key][key2].Product)) {
								this.vclProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.vclProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.vclProductMap::',this.vclProductMap)
						var tempProductList = []
						for (const [key, value] of this.vclProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
					if (key == 'VDL') {
						for (let key2 in result.data[key]) {
							if (this.vdlProductMap.has(result.data[key][key2].Product)) {
								this.vdlProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.vdlProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.vdlProductMap::',this.vdlProductMap)
						var tempProductList = []
						for (const [key, value] of this.vdlProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}

					if (key == 'SAPI') {
						for (let key2 in result.data[key]) {
							if (this.sapiProductMap.has(result.data[key][key2].Product)) {
								this.sapiProductMap.get(result.data[key][key2].Product).push(result.data[key][key2])
							} else {
								this.sapiProductMap.set(result.data[key][key2].Product, new Array(result.data[key][key2]))
							}
						}
						// console.log('this.vdlProductMap::',this.vdlProductMap)
						var tempProductList = []
						for (const [key, value] of this.sapiProductMap.entries()) {
							// console.log('checks::',key, value)
							tempProductList.push({
								product: key,
								RiskCode: value
							})
						}
						this.riskcodeList.push({
							key: key,
							value: tempProductList
						});
					}
				}
			}
			var timev = setTimeout(() => {
				this.showLoadingSpinner = false
				this.spinnerMessage = ''
			}, 1000)
			console.log('this.riskcodeList::', this.riskcodeList)
		} else if (result.error) {
			console.error(error)
			this.errors = result.error
		}
	}


	instertRC() {
		this.isRc = true
	}
	closeModal() {
		this.isRc = false
		this.isFacultativeTreaty = false
		this.team = ''
		this.selectedProduct = ''
		this.textarea = ''
		this.reinsurance = ''
		this.cCproducts = ''
		this.isCommercialCombinedProduct = false
	}

	handleTeamChange(e) {
		try {
			this.team = e.target.value
			if (this.team == 'Bridge') {
				this.optionsProduct = this.bridgeProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isFacultativeTreaty = false
				this.isCOB = false
			}
			if (this.team == 'Horizon') {
				this.optionsProduct = this.horizonProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isCOB = false
				this.isFacultativeTreaty = false
			}
			if (this.team == 'Alpha') {
				this.optionsProduct = this.alphaProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isFacultativeTreaty = true
				this.isCOB = false
			}
			if (this.team == 'VIM') {
				this.optionsProduct = this.gentiumProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isFacultativeTreaty = false
				this.isCOB = false
			}
			if (this.team == 'VCL') {
				this.optionsProduct = this.vclProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isCOB = true
				this.isFacultativeTreaty = false
			}
			if (this.team == 'VDL') {
				this.optionsProduct = this.vdlProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isCOB = false
				this.isFacultativeTreaty = false
			}
			if (this.team == 'SAPI') {
				this.optionsProduct = this.sapiProductList.split(';').map(function (currentItem) {
					return {
						"label": currentItem,
						"value": currentItem
					}
				})
				this.isCOB = false
				this.isFacultativeTreaty = false
			}
			if (this.team == '--None--') {
				this.isCOB = false
				this.isFacultativeTreaty = false
				this.isCommercialCombinedProduct = false
			}
		} catch (e) {
			this.errors = e
		}
	}
	handleproductChange(e) {
		this.isCommercialCombinedProduct = false
		this.selectedProduct = e.target.value;
		if (this.selectedProduct == 'Commercial Combined')
			this.isCommercialCombinedProduct = true
	}
	handleTextareaChnage(e) {
		this.textarea = e.target.value
		console.log(this.textarea)
	}
	handleFTChange(e) {
		if (e.target.name == 'Non-Proportional/Proportional')
			this.reinsurance = e.target.value;
		if (e.target.name == 'Class of Business')
			this.cob = e.target.value
		if (e.target.name == 'Commercial Combined Product')
			this.cCproducts = e.target.value
	}

	Finish() {
		this.showLoadingSpinner = true;
		this.spinnerMessage = 'Creating Risk Code...'
		Finish({
				team: this.team,
				product: this.selectedProduct,
				riskcode: this.textarea,
				reinsurance: this.reinsurance,
				cob: this.cob,
				ccProduct: this.cCproducts
			}).then(result => {
				console.log(result);
				console.log(this.team)
				this.riskcodeList = []
				this.horizonProductMap = new Map()
				this.alphaProductMap = new Map()
				this.vclProductMap = new Map()
				this.vdlProductMap = new Map()
				this.gentiumProductMap = new Map()
				this.bridgeProductMap = new Map()
				this.sapiProductMap = new Map()
				var timev = setTimeout(() => {
					refreshApex(this.refreshTable)
					var timev = setTimeout(() => {
						this.dispatchEvent(
							new ShowToastEvent({
								title: 'Success!',
								message: 'Risk Code is created',
								variant: 'success'
							}),
						);
						this.showLoadingSpinner = false;
						this.spinnerMessage = ''
					}, 5000)
				}, 2000)
			})
			.catch(error => {
				window.console.log(error);
				this.spinnerMessage = 'There is an error. Please contact the administrator...'
				this.dispatchEvent(
					new ShowToastEvent({
						title: 'Please refresh and create it again or Please contact admin',
						message: error.body.message,
						variant: 'error',
					}),
				);
				this.errors = error
			})
		this.isRc = false
		this.isActiveMainTab = this.team

	}

	del(e) {
		console.log(e.target.value)
		console.log(e.currentTarget.dataset.recordid)
		console.log(e.target.name)
		this.showLoadingSpinner = true;
		this.spinnerMessage = 'Deleting Risk Code....'
		this.deleteTeam = e.target.name

		DeleteRiskCode({
			rcId: e.target.value
		}).then(result => {
			console.log(result);
			console.log(this.deleteTeam)
			this.riskcodeList = []
			this.horizonProductMap = new Map()
			this.alphaProductMap = new Map()
			this.vclProductMap = new Map()
			this.vdlProductMap = new Map()
			this.gentiumProductMap = new Map()
			this.bridgeProductMap = new Map()
			this.sapiProductMap = new Map()
			var timev = setTimeout(() => {
				refreshApex(this.refreshTable)
				var timev = setTimeout(() => {
					this.dispatchEvent(
						new ShowToastEvent({
							title: 'Success!',
							message: 'Risk Code is Deleted',
							variant: 'success'
						}),
					);
					this.showLoadingSpinner = false;
					this.spinnerMessage = ''
				}, 4000)
			}, 3000)
		}).catch(error => {
			this.spinnerMessage = 'There is an error. Please contact the administrator...'
			console.error(error);
			this.dispatchEvent(
				new ShowToastEvent({
					title: 'Please refresh and delete it again or Please contact admin',
					message: error.body.message,
					variant: 'error',
				}),
			);
			this.errors = error
		})
		this.isActiveMainTab = this.deleteTeam
	}

}