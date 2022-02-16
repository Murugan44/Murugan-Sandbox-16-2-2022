import {
	LightningElement,
	api,
	track
} from 'lwc';
import getAttch from '@salesforce/apex/DocRepoController.getPolicyAttachments';
import {
	NavigationMixin
} from 'lightning/navigation';

import FORM_FACTOR from '@salesforce/client/formFactor'
export default class File_Attachment_LWC extends NavigationMixin(LightningElement) {
	
	@api recordId
	@track isSubmissionRec = false
	@track isUnderwritingRec = false
	@track isPolicyDocRec = false
	@track isClaimsRec = false
	@track isFinanceRec = false
	@track isReinsuranceRec = false
	@track isPricingSpreadsheetRec = false

	@track submission = 'Submission'
	@track underwriting = 'Underwriting'
	@track PolicyDocument = 'Policy Documentation'
    @track attList

    @track folderName=''

	@track length
	@track loader

	@track fileURL
	@track sfdcBaseURL

	
	SubmissionRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.length = result.length
			this.attList = result
			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}
			});
		})
		
		
		this.isSubmissionRec = true
	}

	UnderwritingRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)

			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isUnderwritingRec = true
	}

	PolicyDocRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)
			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isPolicyDocRec = true
	}

	ClaimsRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)
			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isClaimsRec = true
	}

	FinanceRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)
			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isFinanceRec = true
	}

	ReinsuranceRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)

			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isReinsuranceRec = true
	}

	PricingSpreadsheetRec(e) {
		this.loader = true
		var timev = setTimeout(()=>{
			this.loader = false
		},2000)
		console.log("recordId::",this.recordId)
        this.folderName = e.target.name
        console.log("Folder Name::",this.folderName)
        getAttch({
			polid: this.recordId,
			fName: this.folderName
		})
		.then(result => {
            console.log('result::', result)
			this.attList = result
			this.length = result.length
			console.log('idss::' , this.attList)

			result.forEach(function (element) {
				console.log('Value is', element.ContentDocument.FileType)
				if(element.ContentDocument.FileType === 'WORD_X' || element.ContentDocument.FileType === 'WORD'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:word";
				}else if(element.ContentDocument.FileType === 'PDF'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:pdf"
				}else if(element.ContentDocument.FileType === 'PNG' || element.ContentDocument.FileType === 'JPG'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:image"
				}else if(element.ContentDocument.FileType === 'EXCEL_X'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:excel"
				}else if(element.ContentDocument.FileType === 'ZIP'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:zip"
				}else if(element.ContentDocument.FileType === 'UNKNOWN'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}else if(element.ContentDocument.FileType === 'TEXT'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:txt"
				}else if(element.ContentDocument.FileType === 'CSV'){
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:csv"
				}else{
					console.log(element.ContentDocument.FileType)
					element.icon = "doctype:unknown"
				}
			});
		})
		this.isPricingSpreadsheetRec = true
	}
	
	closeModal() {
		this.isSubmissionRec = false
		this.isUnderwritingRec = false
		this.isPolicyDocRec = false
		this.isClaimsRec = false
		this.isFinanceRec = false
		this.isReinsuranceRec = false
		this.isPricingSpreadsheetRec = false
		this.lenght =''
	}

	navigateToFiles(event) {
		console.log('event.currentTarget.dataset.id',event.currentTarget.dataset.id)
        // Naviagation Service to the show preview
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state : {
                // assigning ContentDocumentId to show the preview of file
                selectedRecordId:event.currentTarget.dataset.id
            }
          })
    }

    renderedCallback() {
        this.sfdcBaseURL = window.location.origin;
		console.log(this.sfdcBaseURL)
    }

	downloadDoc(e){
		console.log('e.currentTarget.dataset.id',e.currentTarget.dataset.id)
		this.fileURL = `${this.sfdcBaseURL}/sfc/servlet.shepherd/document/download/${e.currentTarget.dataset.id}?operationContext=S1`
	}
}