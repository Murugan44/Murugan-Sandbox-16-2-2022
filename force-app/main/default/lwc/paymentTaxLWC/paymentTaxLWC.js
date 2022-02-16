import {
    LightningElement,
    track,
    api,
    wire
} from 'lwc';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
    refreshApex
} from '@salesforce/apex';

import Tax_Type_1 from '@salesforce/label/c.Tax_Type_1';
import Tax_Type_2 from '@salesforce/label/c.Tax_Type_2';
import Tax_Jurisdiction1 from '@salesforce/label/c.Tax_Jurisdiction1';
import Tax_Jurisdiction2 from '@salesforce/label/c.Tax_Jurisdiction2';
import Tax_Jurisdiction3 from '@salesforce/label/c.Tax_Jurisdiction3';

import ppWrapper from '@salesforce/apex/PolicyPaymentTaxLWC.ppWrapper';
import getPs from '@salesforce/apex/PolicyPaymentTaxLWC.getPsList'
import calcGWP from '@salesforce/apex/PolicyPaymentTaxLWC.getcalcGWP'
import getPP from '@salesforce/apex/PolicyPaymentTaxLWC.getPP'
import getPolicyTax from '@salesforce/apex/PolicyPaymentTaxLWC.getPolicyTax'
import editPayments from '@salesforce/apex/PolicyPaymentTaxLWC.editPayments'
import updatePaymentValues from '@salesforce/apex/PolicyPaymentTaxLWC.updatePaymentValues'
import editTax from '@salesforce/apex/PolicyPaymentTaxLWC.editTax'
import updateTax from '@salesforce/apex/PolicyPaymentTaxLWC.updateTax'

export default class PaymetTaxLWC extends LightningElement {
    showLoadingSpinner = false
    isAddPaymentTab = false
    isTaxTab = false
    isActiveTabPayment = ""
    isActiveTabTax = ""
    @track paymentList = []
    @track paymentRetriveList = []
    @track refreshTablePay = []
    //@track refreshTablePS = []
    @api recordId
    ppBtn = false
    isPaymentHasValue = false
    keyIndexpf = 0
    keyIndexpp = 0
    indexpp = ''
    indexpf = ''
    psOption = []
    dateMap = new Map();
    payAmountMap = new Map();

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
    isTaxHasValue = false

    @track taxTypeValueList = []
    @track taxJurisdictionValueList = []
    @track taxAdministeredByOption = []
    @track taxPaidByOption =  []
    connectedCallback(){
        var taxpaid = ['Broker','Insured','Insurer','N/A']
        taxpaid.forEach(currentItem =>{
            this.taxPaidByOption.push({"label":currentItem, "value":currentItem})
            this.taxAdministeredByOption.push({"label":currentItem, "value":currentItem})
        })
        Tax_Type_1.split(';').forEach(currentItem =>{
            this.taxTypeValueList.push({"label":currentItem, "value":currentItem})
        })
        Tax_Type_2.split(';').forEach(currentItem =>{
            this.taxTypeValueList.push({"label":currentItem, "value":currentItem})
        })
        console.log('type4::',this.taxTypeValueList)

        Tax_Jurisdiction1.split(';').forEach(currentItem =>{
            this.taxJurisdictionValueList.push({"label":currentItem, "value":currentItem})
        })
        Tax_Jurisdiction2.split(';').forEach(currentItem =>{
            this.taxJurisdictionValueList.push({"label":currentItem, "value":currentItem})
        })
        Tax_Jurisdiction3.split(';').forEach(currentItem =>{
            this.taxJurisdictionValueList.push({"label":currentItem, "value":currentItem})
        })
    }
    

    @wire(getPolicyTax,{
        policyId: '$recordId'
    })
    pt(result){
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
                    }
                    this.taxRetriveList.push({
                        key: key,
                        key1: this.taxTypeMap.get(key),
                        key2: this.taxJurisdictionMap.get(key),
                        key3: this.taxAdministeredByMap.get(key),
                        key4: this.taxPaidByMap.get(key),
                        value: result.data[key]
                    })
                }
            }
            if (this.taxRetriveList.length > 0)
                this.isTaxHasValue = true
            else
                this.isTaxHasValue = false

            console.log('taxRetriveList::', this.taxRetriveList)    
        }else if (result.error) {
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
                    }
                    //this.paymentLabel=`Payment ${this.payAmountMap.get(key)} - Due Date: ${this.dateMap.get(key)}`
                    this.paymentRetriveList.push({
                        key: key,
                        key1: this.payAmountMap.get(key),
                        key2: this.dateMap.get(key),
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
        //this.refreshTablePS = result
        if (result.data) {
            for (let key in result.data) {
                if (result.data.hasOwnProperty(key)) {
                    this.psOption.push({
                        label: result.data[key].Name,
                        value: key
                    })
                }
            }
            console.log('this.psOption::', this.psOption)
        } else if (result.error) {
            this.error = result.error;
            this.psOption = undefined;
        }
    }

    addPaymentPolicy(e) {
        this.keyIndexpf = 0
        this.indexpp = this.keyIndexpp++
        this.paymentList.push({
            dueDate: '',
            policyPaymenyAmount: '',
            btnpf: false,
            counter: this.indexpp,
            pfList: []
        })
        var timev = setTimeout(()=>{
			this.isActiveTabPayment = "add-payment"
		},100)
        this.isAddPaymentTab = true
        this.isPaymentEdit = false
        console.log(this.paymentList)

    }
    paymentHandler(e) {
        if (e.target.name == 'Due Date')
            this.paymentList[e.target.accessKey].dueDate = e.target.value
        else if (e.target.name == 'Amount')
            this.paymentList[e.target.accessKey].policyPaymenyAmount = e.target.value

        if (e.target.name == 'Amount') {
            if (this.paymentList[e.target.accessKey].policyPaymenyAmount > 100) {
                this.paymentList[e.target.accessKey].btnpf = true
                this.ppBtn = true
            } else {
                this.paymentList[e.target.accessKey].btnpf = false
                this.ppBtn = false
            }
        }

    }

    addPayment(e) {
        this.indexpf = this.keyIndexpf++
        this.paymentList[e.target.accessKey].pfList.push({
            ps: '',
            gwp: 0,
            ppcounter: e.target.accessKey,
            pfCounter: this.indexpf
        })
        console.log('paymentList 2::', this.paymentList)
    }
    gwp = ''
    pfHandler(e) {
        console.log(e.target.value)
        console.log(e.target.accessKey)
        console.log(e.target.name)
        this.paymentList[e.target.accessKey].pfList[e.target.name].ps = e.target.value
        var ps = this.paymentList[e.target.accessKey].pfList[e.target.name].ps
        var amt = this.paymentList[e.target.accessKey].policyPaymenyAmount

        this.gwpValue(e.target.accessKey, e.target.name, this.gwp, ps, amt)
    }

    async gwpValue(accessKey, name, gwp, ps, amt) {
        console.log('accessKey::', accessKey)
        console.log('name::', name)
        console.log('gwp::', gwp)
        console.log('ps::', ps)
        console.log('amt::', amt)
        try {
            this.paymentList[accessKey].pfList[name].gwp = await calcGWP({
                psId: ps,
                polPayAmt: amt
            });
            console.log('Method1 result: ' + this.paymentList[accessKey].pfList[name].gwp);
        } catch (error) {
            console.log(error);
        } finally {
            console.log('Finally Block');
        }

    }

    pfHandler1(e) {
        console.log('gwp', e.target.value)
    }

    addTaxPolicy(e){
        this.keyIndexTax = 0
        this.indexpt = this.keyIndexpt++
        this.taxList.push({
            taxSelected: '',
            taxJurisdictionListSelected: '',
            taxPaidBySelected: '',
            taxAdministeredBySelected: '',
            btnTax: false,
            counter: this.indexpt,
            taxWList: []
        })
        var timev = setTimeout(()=>{
			this.isActiveTabTax = "add-Tax"
		},100)
        console.log(this.taxList)
        this.isTaxTab = true
    }

    addTax(e) {
        this.indexTax = this.keyIndexTax++
        this.taxList[e.target.accessKey].taxWList.push({
            psSelected: '',
            taxAmount: 0,
            ptcounter: e.target.accessKey,
            taxCounter: this.indexTax
        })
        console.log('paymentList 2::', this.taxList)
    }

    taxHandler(e){
        if(e.target.name == 'Tax Type')
            this.taxList[e.target.accessKey].taxSelected = e.target.value
        else if(e.target.name == 'Tax Jurisdiction')
            this.taxList[e.target.accessKey].taxJurisdictionListSelected = e.target.value
        else if(e.target.name == 'Tax Paid By')
            this.taxList[e.target.accessKey].taxPaidBySelected = e.target.value
        else if(e.target.name == 'Tax Administered By')
            this.taxList[e.target.accessKey].taxAdministeredBySelected = e.target.value
    }

    taxwHandler(e){
        console.log(e.target.name)
        console.log(e.target.accessKey)
        console.log(e.target.value)
        console.log(e.currentTarget.dataset.name)
        if(e.target.name == 'Select Policy Schedule')
            this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].psSelected = e.target.value
        else if(e.target.name == 'Tax Amount')
            this.taxList[e.target.accessKey].taxWList[e.target.dataset.name].taxAmount = e.target.value
        
        console.log('taxList 2::', this.taxList)
    }

    finish() {
        this.showLoadingSpinner = true
        console.log(this.recordId)
        ppWrapper({
            ppw: this.paymentList,
            ptw: this.taxList,
            policyId: this.recordId
        }).then(result => {
            console.log(result)
            console.log('this.paymentList::', this.paymentList.length)
            if(this.paymentList.length > 0){
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
                refreshApex(this.refreshTablePay)
            } else if(this.taxList.length > 0){
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
                refreshApex(this.refreshTableTax)
            }

        }).then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success!',
                    message: 'Policy Payment is created',
                    variant: 'success'
                }),
            );
            this.showLoadingSpinner = false;
        }).catch(error => {
            window.console.log(error);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Please refresh and create it again or Please contact admin',
                    message: error.message,
                    variant: 'error',
                }),
            );
            this.showLoadingSpinner = false;
        })
    }

    editpayAmountMap = new Map();
    editdateMap = new Map();
    @track editPaymentList = []
    isPaymentEdit = false
    updateAmount = ''
    updateDueDate = ''

    editPayments(e){
        console.log('edit payment::',e.target.value)
        editPayments({
            paymentId: e.target.value
        }).then(result => {
            console.log('edit payment::',result)
            if (result) {
                for (let key in result) {
                    if (result.hasOwnProperty(key)) {
                        for (let key2 in result[key]) {
                            this.editpayAmountMap.set(key, result[key][key2].policyPaymentAmount)
                            this.editdateMap.set(key, result[key][key2].dueDate);
                        }
                        this.editPaymentList.push({
                            key: key,
                            key1: this.editpayAmountMap.get(key),
                            key2: this.editdateMap.get(key),
                            paymentLabel: `Payment (${this.editpayAmountMap.get(key)}%) - Due Date: (${this.editdateMap.get(key)})`,
                            value: result[key]
                        })
                    }
                }
                console.log('editPaymentList::', this.editPaymentList)
            }
        })
        var timev = setTimeout(()=>{
			this.isActiveTabPayment = "edit-Payment"
		},100)
        this.isPaymentEdit = true
    }
    
    amtBtn = false
    editPaymentOnchangeHandler(e){
        if(e.target.name == "Due Date"){
            this.updateDueDate = e.target.value
        }else if(e.target.name == "Amount"){
            this.updateAmount = e.target.value
            if ( this.updateAmount > 100) {
                this.amtBtn = true
            } else {
                this.amtBtn = false
            }
        }
    }

    updatePayment(e){
        console.log('e.target.dataset.name::',e.target.dataset.name)
        console.log('e.target.dataset.value::',e.target.dataset.value)

        if(this.updateAmount == '')
            this.updateAmount = e.target.dataset.value
        if(this.updateDueDate == '')
            this.updateDueDate = e.target.dataset.name

        console.log('updatePayment::',this.updateDueDate,'Amount::',this.updateAmount)
        console.log('update btn::',e.target.value)
        this.showLoadingSpinner = true
        updatePaymentValues({
            paymentId: e.target.value,
            updateDueDate: this.updateDueDate,
            updateAmount: this.updateAmount
        }).then(result => {
            console.log(result)
            this.paymentRetriveList = []
            this.editPaymentList = []
            this.isActiveTabPayment = ""
            this.isPaymentEdit = false
            //this.showLoadingSpinner = false
            refreshApex(this.refreshTablePay)
        }).then(() =>{
            this.showLoadingSpinner = false
        })
    }

    cancelPayment(){
        this.isPaymentEdit = false
        this.editPaymentList = []
        this.isActiveTabPayment = ""
    }

    isEditTax = false
    @track editTaxList = []
    @track updateTaxList = []
    editTaxTypeMap = new Map()
    editTaxJurisdictionMap = new Map()
    editTaxAdministeredByMap = new Map()
    editTaxPaidByMap = new Map()

    editTaxes(e){
        console.log('edit tax::',e.target.value)
        console.log('edit tax::',e.target.dataset.name)
        console.log('edit tax::',e.target.dataset.value)
        console.log('edit tax::',e.target.dataset.title)
        console.log('edit tax::',e.target.dataset.element)
        editTax({
            taxId: e.target.value,
        }).then(result => {
            console.log('edit tax::',result)
            if (result) {
                for (let key in result) {
                    if (result.hasOwnProperty(key)) {
                        var tempArray = []
                        for (let key2 in result[key]) {
                            this.editTaxTypeMap.set(key, result[key][key2].taxtype)
                            this.editTaxJurisdictionMap.set(key, result[key][key2].taxJurisdiction);
                            this.editTaxAdministeredByMap.set(key, result[key][key2].taxAdministeredBy)
                            this.editTaxPaidByMap.set(key, result[key][key2].taxPaidBy)

                            tempArray.push({
                                psSelected: result[key][key2].tax.Id,
                                taxAmount: result[key][key2].taxAmount,
                                ptcounter: '',
                                taxCounter: result[key][key2].taxCounter
                            })
                        }
                        this.updateTaxList.push({
                            polTax: key,
                            taxSelected: this.editTaxTypeMap.get(key),
                            taxAdministeredBySelected: this.editTaxJurisdictionMap.get(key),
                            taxAdministeredBySelected: this.editTaxAdministeredByMap.get(key),
                            taxPaidBySelected: this.editTaxPaidByMap.get(key),
                            taxWList: tempArray
                        })
                        this.editTaxList.push({
                            key: key,
                            key1: this.editTaxTypeMap.get(key),
                            key2: this.editTaxJurisdictionMap.get(key),
                            key3: this.editTaxAdministeredByMap.get(key),
                            key4: this.editTaxPaidByMap.get(key),  
                            value: result[key]
                        })

                        
                    }
                }
                console.log('updateTaxList wire::',this.updateTaxList)
                console.log('editTaxList::', this.editTaxList)
            }
        })
        var timev = setTimeout(()=>{
			this.isActiveTabTax = "edit-Tax"
		},100)
        this.isEditTax = true

        
    }

    taxTypeVal =''
    taxJurisdictionVal =''
    taxPaidBySelectedVal =''
    taxAdministeredBySelectedVal = ''

    editTaxHandler(e){
        console.log('editTaxHandler',e.target.accessKey)
        
        if(e.target.name == 'Tax Type')
            this.updateTaxList[e.target.accessKey].taxSelected = e.target.value
        else if(e.target.name == 'Tax Jurisdiction')
            this.updateTaxList[e.target.accessKey].taxJurisdictionListSelected = e.target.value
        else if(e.target.name == 'Tax Paid By')
            this.updateTaxList[e.target.accessKey].taxPaidBySelected = e.target.value
        else if(e.target.name == 'Tax Administered By')
            this.updateTaxList[e.target.accessKey].taxAdministeredBySelected = e.target.value

        console.log(this.updateTaxList)
    }

    taxAmtChangeHandler(e){

        console.log(e.target.accessKey)
        console.log(e.target.dataset.value)
        if(e.target.name == 'Tax Amount'){
            this.updateTaxList[e.target.accessKey].taxWList[e.target.dataset.value].taxAmount = e.target.value

            console.log(this.updateTaxList)
        }
    }

    updateTax(e){
        console.log(this.updateTaxList)
        this.showLoadingSpinner = true
        updateTax({
            taxlist: this.updateTaxList,
            taxId: e.target.value
        }).then(result =>{
            console.log(result)
            this.editTaxList =[]
            this.taxRetriveList = []
            this.isActiveTabTax = ""
            this.isEditTax = false
            refreshApex(this.refreshTableTax)
        }).then(() =>{
            this.showLoadingSpinner = false
        })
    }

    cancelTax(){
        this.editTaxList =[]
        this.isEditTax = false
        this.isActiveTabTax = ""
    }

    cancelAddTax(){
        this.isTaxTab = false
        this.isActiveTabTax = ""
        this.taxList = []
    }

    cancelAddPayment(){
        this.isActiveTabTax = ""
        this.isAddPaymentTab = false
        this.paymentList = []
    }

    @track accountName;  
   @track accountRecordId;  

   onAccountSelection(event){  
   this.accountName = event.detail.selectedValue;  
   this.accountRecordId = event.detail.selectedRecordId;  
   } 
}