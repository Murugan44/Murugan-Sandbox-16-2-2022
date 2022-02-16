import {
	LightningElement,
	track,
	api
} from 'lwc';
// import BOOTSTRAP from '@salesforce/resourceUrl/Bootstrap'
// import {loadStyle} from 'lightning/platformResourceLoader'
import uploadFile from '@salesforce/apex/FileUploaderController.uploadFile';
import { CloseActionScreenEvent } from 'lightning/actions';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';

export default class ModalPopupLWC extends(LightningElement) {
	//Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
	@api recordId
	@api acceptedFormats = '.csv,.doc,.xsl,.pdf,.png,.jpg,.jpeg,.docx,.doc'
	@track isModalOpen = false
	@track showLoadingSpinner = false
	@track fileName = ''
	@track UploadFile = 'Attach'
	// acceptedFormats = '.xlsx, .xls, .csv, .png, .doc, .docx, .pdf'
	filesUploaded = []
	up=[]
	// file=[];
	 fileContents

	progress = 0;
    processStatus = 'In Progress';

	fileList = []
	// fileReader;
	// content;
	// MAX_FILE_SIZE = 1500000;

	// renderedCallback(){
	//     loadStyle(this, BOOTSTRAP+'/Bootstrap/bootstrap.min.css').then(()=>{
	//         console.log('Loaded....')
	//     }).catch(error =>{
	//         console.error('Error')
	//     })
	// }

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
		this.fileList = event.detail.files
		console.log('this.fileList::::',this.fileList)
    }

	handleChange(event) {
		this.fileDes = event.detail.value;
		console.log('this.fileDescription00::' + this.fileDes);
	}
	
	Step1() {
		this.isModalOpen = true;
	}
	closeModal() {
		this.isModalOpen = false;
		this.fileName = ''
        this.fileContents=''
		this.fileDes=''
		this.filesUploaded = []

	}
	closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
	doneModal() {
		this.isModalOpen = false;
	}
	_interval
	// handleFilesChange(event) {
    //     let files = event.detail.files;
	// 	console.log('files::', files)
    //     if(files.length > 0){
    //         let filesName = '';

    //         for (let i = 0; i < files.length; i++) {
    //             let file = files[i];

    //             filesName = filesName + file.name + ', ';
	// 			console.log('filesName::', filesName, file.size)

	// 			this.up.push({
	// 				Name: file.name,
	// 				Size: file.size
	// 			})

	// 			// this._interval = setInterval(() => {
	// 			// 	this.progress = this.progress + 5;
	// 			// 	this.processStatus = `Uploading => ${this.progress} %`;
	// 			// 	if(this.progress === 100) {
	// 			// 		clearInterval(this._interval);
	// 			// 		this.processStatus = 'Uploaded';
	// 			// 	}
	// 			// }, 200);

	// 			console.log('up::', this.up)
				
    //             let freader = new FileReader();
    //             freader.onload = f => {
    //                 let base64 = 'base64,';
    //                 let content = freader.result.indexOf(base64) + base64.length;
    //                 this.fileContents = freader.result.substring(content);
    //                 this.filesUploaded.push({
    //                     Title: file.name,
    //                     VersionData: this.fileContents
    //                 });
					
    //             };
    //             freader.readAsDataURL(file);
    //         }
	// 		console.log('Upload::',this.filesUploaded)
	// 		// this.items.push({
	// 		// 	label: filesName,
	// 		// 	name: filesName
	// 		// })
    //         this.fileName = filesName.slice(0, -1);
    //     }else{
	// 		this.fileName = 'Please select file to upload!!';
	// 	}
    // }
	 loader = false
	
	// 	this.loader0 = true
    //     var timev = setTimeout(()=>{
    //         this.loader0 = false
    //     },3000)
	saveToFile() {
		uploadFile({
				idParent: this.recordId,
				strFileDescription: this.fileDes,
				//filesToInsert: this.filesUploaded
				fileList: this.fileList
			})
		.then(result => {
				console.log('result ====> ' + result.length);
				this.fileName = null;
				this.loader = true
				var timev = setTimeout(()=>{
					this.showToast('Success!!','success',result.length + ' Files - Uploaded Successfully!!!')
				},2000)
				
				
			})
			.catch(error => {
				window.console.log(error);
				this.showToast('Error while uploading File','error',error.message)
				
			});
	}
	
	// removeReceiptImage (event) {
	// 	const name = event.detail.item.name;
	// 	alert(name + ' pill was removed!');
	// 	const index = event.detail.index;
	// 	this.items.splice(index, 1);
	// 	this.fileName = []
    //     this.fileContents=''
	// 	this.fileDes=''
	// 	this.filesUploaded = []
	// }

	showToast(title, variant, message) {
        const event = new ShowToastEvent({
            title: title,
            variant: variant,
            message: message,
        });
        this.dispatchEvent(event);
		this.loader = false
    }

	//getting file 
	// handleFilesChange(event) {
	// 	alert(event.detail.files.length)
	// 	if (event.detail.files.length > 0) {
	// 		this.filesUploaded = event.detail.files
	// 		//this.filesUploaded = event.target.files; //fetch file content
	// 		console.log('this.filesUploaded :', this.filesUploaded)
	// 		// this.fileName = event.detail.files.name;
	// 		// console.log('this.fileName :', this.fileName);

	// 		if (this.filesUploaded.length > 0) {
	// 			if (this.filesUploaded.size > this.MAX_FILE_SIZE) {
	// 				console.log('File Size is to long')
	// 				return
	// 			}
	// 			let filesName = ''
	// 			for (let i = 0; i < this.filesUploaded.length; i++) {
	// 				var file = this.filesUploaded[i]
	// 				console.log('inside for::',file)
					
	// 				filesName = filesName + file.name + ','
	// 				console.log('filesName::',filesName)

	// 			}
	// 		} else {
	// 			this.fileName = 'Please select file to upload!!';
	// 		}
	// 	}
	// }

	// handleSave() {
	// 	if (this.filesUploaded.length > 0) {
	// 		this.uploadHelper();
	// 		//console.log('this.uploadHelper:' + this.uploadHelper);
	// 	} else {
	// 		this.fileName = 'Please select file to upload!!';
	// 	}
	// }

	// uploadHelper() {
	// 	this.file = this.filesUploaded;
	// 	console.log('file::',this.file)

	// 	if (this.file.size > this.MAX_FILE_SIZE) {
	// 		console.log('File Size is to long');
	// 		return;
	// 	}
	// 	let filesName = '';
	// 	for (let i = 0; i < this.file.length; i++) {
	// 		this.file = this.filesUploaded[i];
	// 		console.log('inside for::',this.file)

	// 		filesName = filesName + this.file.name + ',';
	// 		console.log('filesName::',filesName)
	// 		// create a FileReader object 
	// 		this.fileReader = new FileReader(); //Constructor file reader - this is help for read the content of the file store in computer or blog object
	// 		// set onload function of FileReader object  
	// 		this.fileReader.onloadend = (() => {
	// 			this.fileContents = this.fileReader.result;
	// 			let base64 = 'base64,';
	// 			this.content = this.fileContents.indexOf(base64) + base64.length;
	// 			this.fileContents = this.fileContents.substring(this.content);

	// 			// call the uploadProcess method 
	// 			//this.saveToFile();
	// 			//console.log('::' + this.saveToFile);
	// 			//this.getfiles();
	// 		});
	// 		console.log(this.fileContents)
	// 		this.fileReader.readAsDataURL(this.file); //It is converted to binary encoded base64 format
	// 	}
	// 	this.fileName = filesName.slice(0, -1);
	// 	console.log('Name::',this.fileName)
	// }

	// Calling apex class to insert the file

	


}