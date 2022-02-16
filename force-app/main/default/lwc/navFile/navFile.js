import {
	LightningElement,
	track,
	api
} from 'lwc';
// import BOOTSTRAP from '@salesforce/resourceUrl/Bootstrap'
// import {loadStyle} from 'lightning/platformResourceLoader'
import uploadFile from '@salesforce/apex/FileUploaderController.uploadFile';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ModalPopupLWC extends(LightningElement) {
	//Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
	@api recordId;
	@track isModalOpen = false;
    @track showLoadingSpinner = false;
	@track fileName = '';
	@track UploadFile = 'Attach';
	filesUploaded = [];
    file;
    fileContents;
    fileReader;
    content;
	MAX_FILE_SIZE = 1500000;

    // renderedCallback(){
    //     loadStyle(this, BOOTSTRAP+'/Bootstrap/bootstrap.min.css').then(()=>{
    //         console.log('Loaded....')
    //     }).catch(error =>{
    //         console.error('Error')
    //     })
    // }

    value = 'Policy Documentation';
    get options() {
        return [
            { label: 'Submission', value: 'Submission' },
            { label: 'Underwriting', value: 'Underwriting' },
            { label: 'Policy Documentation', value: 'Policy Documentation' },
            { label: 'Pricing Spreadsheet', value: 'Pricing Spreadsheet' },
            { label: 'Finance', value: 'Finance' },
            { label: 'Reinsurance', value: 'Reinsurance' },
            { label: 'Claims', value: 'Claims' },
        ];
    }

    handleChange(event) {
        this.fileDes = event.detail.value;
        console.log('this.fileDescription00::'+this.fileDes);
    }

	Step1() {
		// to open modal set isModalOpen tarck value as true
		this.isModalOpen = true;
	}
	closeModal() {
		// to close modal set isModalOpen tarck value as false
		this.isModalOpen = false;
		
	}
    doneModal(){
        this.isModalOpen = false;
    }
    
    // getting file 
    handleFilesChange(event) {
        if(event.target.files.length > 0) {
            this.filesUploaded = event.target.files;                 //fetch file content
            console.log('this.filesUploaded :', this.filesUploaded );
            this.fileName = event.target.files[0].name;
            console.log('this.fileName :', this.fileName);
        }
    }

	handleSave() {
        if(this.filesUploaded.length > 0) {
            this.uploadHelper();
            console.log('this.uploadHelper:'+this.uploadHelper);
        }
        else {
            this.fileName = 'Please select file to upload!!';
        }
    }
	uploadHelper() {
        this.file = this.filesUploaded[0];
       if (this.file.size > this.MAX_FILE_SIZE) {
            console.log('File Size is to long');
            return ;
        }
        this.showLoadingSpinner = true;
        // create a FileReader object 
        this.fileReader= new FileReader();                  //Constructor file reader - this is help for read the content of the file store in computer or blog object
        // set onload function of FileReader object  
        this.fileReader.onloadend = (() => {
            this.fileContents = this.fileReader.result;
            let base64 = 'base64,';
            this.content = this.fileContents.indexOf(base64) + base64.length;
            this.fileContents = this.fileContents.substring(this.content);
            
            // call the uploadProcess method 
            this.saveToFile();
            console.log('::'+this.saveToFile);
            //this.getfiles();
        });
        console.log(this.fileContents)
        this.fileReader.readAsDataURL(this.file);                //It is converted to binary encoded base64 format
    }
	// Calling apex class to insert the file
    saveToFile() {
        uploadFile({ idParent: this.recordId, strFileName: this.file.name, strFileDescription: this.fileDes, base64Data: encodeURIComponent(this.fileContents)}) //shorthand for create a variable
        .then(result => {
            console.log('result ====> ' +result);
            // refreshing the datatable
            this.fileName = null;
            //this.fileName = this.fileName + ' - Uploaded Successfully';
            //this.UploadFile = 'File Uploaded Successfully';
            //this.isTrue = true;
            this.showLoadingSpinner = false;
            // Showing Success message after file insert
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success!!',
                    message: this.file.name + ' - Uploaded Successfully!!!',
                    variant: 'success',
                }),
            );

        })
        .catch(error => {
            // Showing errors if any while inserting the files
            window.console.log(error);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error while uploading File',
                    message: error.message,
                    variant: 'error',
                }),
            );
			this.showLoadingSpinner = false;
        });
    }
   
    
}