import {
	LightningElement,
	track,
	api
} from 'lwc';
import uploadFile from '@salesforce/apex/uploadFileLWCControlller.uploadFile';
import { CloseActionScreenEvent } from 'lightning/actions';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';

export default class ModalPopupLWC extends(LightningElement) {
	@api recordId
	@api acceptedFormats = '.csv,.doc,.xsl,.pdf,.png,.jpg,.jpeg,.docx,.doc'
	@track isModalOpen = false
	// acceptedFormats = '.xlsx, .xls, .csv, .png, .doc, .docx, .pdf'
    disabled = true
    btnDisabled = true
	fileList = []
    loader = false

	value = 'Policy Documentation';
	get options() {
		return [{
				label: 'Submission',
				value: 'Submission'
			},
			{
				label: 'Underwriting',
				value: 'Underwriting'
			},
			{
				label: 'Policy Documentation',
				value: 'Policy Documentation'
			},
			{
				label: 'Pricing Spreadsheet',
				value: 'Pricing Spreadsheet'
			},
			{
				label: 'Finance',
				value: 'Finance'
			},
			{
				label: 'Reinsurance',
				value: 'Reinsurance'
			},
			{
				label: 'Claims',
				value: 'Claims'
			},
		];
	}

	handleUploadFinished(event) {
        // Get the list of uploaded files
		//this.fileList = event.detail.files
		let files = event.detail.files
		if(files.length > 0){
			for (let i = 0; i < files.length; i++) {
				let file = files[i];
				this.fileList.push({
					name: file.name,
					contentVersionId: file.contentVersionId,
					documentId: file.documentId
				})
			}
		}

		console.log('this.fileList::::',this.fileList)
        if(this.fileList.length !== 0) {
            this.btnDisabled = false
        }
    }

	handleChange(event) {
		this.fileDes = event.detail.value;
		console.log('this.fileDescription00::' + this.fileDes);
        this.disabled = false
	}
	
	Step1() {
		this.isModalOpen = true;
	}
	closeModal() {
		this.isModalOpen = false;
		this.fileDes=''
        this.fileList = []
        this.disabled = true
        this.btnDisabled = true
	}
	closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
	doneModal() {
		this.isModalOpen = false;
	}
   
    

	saveToFile() {
        console.log('this.fileList.length::',this.fileList.length)
        if(this.fileList.length !== 0) {
            uploadFile({
                    idParent: this.recordId,
                    strFileDescription: this.fileDes,
                    //filesToInsert: this.filesUploaded
                    fileList: this.fileList
                })
            .then(result => {
                    console.log('result >>>> ' + result.Title);
                    console.log('result ====> ' + result.length);
                    this.loader = true
                    var timev = setTimeout(()=>{
                        this.showToast('Success!!','success',result.length + ' Files - Uploaded Successfully!!!')
                    },2000)
                    
                    
                })
                .catch(error => {
                    window.console.log(error);
                    this.showToast('Error while uploading File','error',error.message)
                    
                });
        }else{
            this.showToast('Info!!','info','Please Select Doc Folder and Upload Files!!!')
        }
        this.fileDes=''
        this.disabled = true
	}
	

	showToast(title, variant, message) {
        const event = new ShowToastEvent({
            title: title,
            variant: variant,
            message: message,
        });
        this.dispatchEvent(event);
		this.loader = false
        this.isModalOpen = false
        this.fileList = []
        this.fileDes=''
        this.btnDisabled = true
    }
}