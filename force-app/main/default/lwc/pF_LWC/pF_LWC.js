import { LightningElement, track ,api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import addPF from '@salesforce/apex/PaymentFrequencyLWC.addPF';
//import uploadPF from '@salesforce/apex/PaymentFrequencyLWC.uploadPF';
import clactotalpercent from '@salesforce/apex/PaymentFrequencyLWC.clactotalpercent';
import caltotalGWP from '@salesforce/apex/PaymentFrequencyLWC.caltotalGWP';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
//import PF_OBJECT from '@salesforce/schema/VG_Payment_Frequency__c';
import GWP_FIELD from "@salesforce/schema/Policy_Schedule__c.Gross_Written_Premium__c";caltotalGWP
import NAME_FIELD from "@salesforce/schema/Policy_Schedule__c.Name";
//import addPF from '@salesforce/apex/PaymentFrequencyLWC.addPF';

export default class PF extends LightningElement {
    @api recordId;
    @track isModalOpen = false;
    @track isPF = false;
    @track isPFf = true;
    @track isPFupload = false;
    @track isShowBtn = true;
   
    @track totalPayment = '';
    @track duedate = '';
    @track paymentpercent = '';
    @track totpay = '';
    @track GWPthis = '';
    @track gwp = '';
    @track pfId = '';

    @wire(getRecord, {
		recordId: "$recordId",
		fields: [GWP_FIELD,NAME_FIELD]
	})
    record;

    get name(){
        return getFieldValue(this.record.data, NAME_FIELD);
    }


    // Total GWP calc
    /*get gwps() {
        this.gwp = getFieldValue(this.record.data, GWP_FIELD);
        //console.log('this.gwp::'+this.gwp);
        this.GWPthis = this.gwp*(this.totalPayment/100);
        console.log('gwpthis::'+this.GWPthis);
        this.gwpValue = this.GWPthis;
        console.log('this.gwpValue::'+this.gwpValue);
        //console.log('pp::'+this.paymentpercent);
        return this.GWPthis;
    }*/

    keyIndex = 0;
    @track pfList = [];

    /*@track pfRecords = {
		
		VG_Due_Date__c: DUEDATE_FIELD,
		VG_Payment_Percent__c: PAYMENTPERCENT_FIELD,
		//VG_Pricing_Rationale__c: PRICINGRATIONALE_FIELD,
		VG_Comment__c: COMMENT_FIELD,
		VG_Broker__c: BROKER_FIELD,
        VG_Is_Temp_Delete__c: DEL_FIELD
    };*/

  
    handleChange1(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pfList[event.target.accessKey].VG_Due_Date__c = event.target.value;
		//console.log('this.pfRecords.VG_Due_Date__c::' +this.pfList[event.target.accessKey].VG_Due_Date__c);
        this.duedate = this.pfList[event.target.accessKey].VG_Due_Date__c;
		
	}
    
	handleChange2(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pfList[event.target.accessKey].VG_Payment_Percent__c = event.target.value;
		//console.log('this.pfRecords.VG_Payment_Percent__c::' +this.pfList[event.target.accessKey].VG_Payment_Percent__c);
        this.totalpercent();
        this.totalPayment = this.pfList[event.target.accessKey].VG_Payment_Percent__c;
        console.log('paymentpercent::::::'+this.totalPayment); 
	}
    @track totpercent = 0;
    totalpercent(){
        clactotalpercent({
			pfList: this.pfList
		})
		.then(result => {
			this.totpercent = result;
			console.log('tot::'+result+'::'+result.value);
            this.totGWP();
		})
        if(this.totpercent === '100'){
            this.isShowBtn = false;
        }
    } 

    @track gWPs = 0;
    totGWP(){
        caltotalGWP({
            Valgwp: this.totalPayment,
            psid: this.recordId

        })
        .then(result => {
			this.gWPs = result;
			console.log('tot::'+result+'::'+result.value);
		})
    }
    

	/*handleChange3(event) {
		this.pfList[event.target.accessKey].VG_GWP_This_Time__c = event.target.value;
		console.log('this.pfList.VG_GWP_This_Time__c::' +this.pfList.VG_GWP_This_Time__c);
	}*/
	handleChange4(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pfList[event.target.accessKey].VG_Comment__c = event.target.value;
		console.log('this.pfRecords.VG_Comment__c::' +this.pfList[event.target.accessKey].VG_Comment__c);
	}
	handleChange5(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pfList[event.target.accessKey].VG_Broker__c = event.target.value;
		console.log('::this.pfRecords.VG_Broker__c' +this.pfList[event.target.accessKey].VG_Broker__c);
	}
    handleChange6(event) {
        console.log('index:::::::'+event.target.accessKey)
		this.pfList[event.target.accessKey].VG_Is_Temp_Delete__c = event.target.value;
		console.log('::this.pfRecords.VG_Is_Temp_Delete__c' +this.pfList[event.target.accessKey].VG_Is_Temp_Delete__c);
	}


    addPF() {
        
        this.isPF = true;
        this.isPFupload = false;
        this.isPFf = false;
        //this.isPFf = false;

        if(this.totpercent < 100 && (this.keyIndex < 1 || this.totalPayment != '' || this.duedate != '')){
            this.keyIndex+1;
            if(this.keyIndex  < 1){
                this.pfList.push({
                    VG_Due_Date__c: '',
                    VG_Payment_Percent__c:'',
                    VG_GWP_This_Time__c:'',
                    VG_Comment__c:'',
                    VG_Broker__c:'',
                    VG_IsTempDelete__c:''
                }) 
            }else{
                this.pfList.push({
                    VG_Due_Date__c: '',
                    VG_Payment_Percent__c:'',
                    VG_GWP_This_Time__c:'',
                    VG_Comment__c:'',
                    VG_Broker__c:'',
                    VG_IsTempDelete__c:''
                })
            }
                
        } else{
            const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Due date and Payment Frequency field must be filled all Payment Frequencies...',
                variant: 'error',
            });
            this.dispatchEvent(evt);
        }

        if(this.totpercent >= 100){
            //console.log('check if:::'+this.totalPayment);
            const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Cant add new Payment Frequency because sum of Payment (%) reached 100 ...',
                variant: 'error',
            });
            this.dispatchEvent(evt);
        }

        /*if((this.keyIndex >= 0) && (this.totalPayment == '' && this.duedate == '')){
           // console.log('check iffff:::'+this.paymentpercent + '::::'+ this.duedate);
            const evt = new ShowToastEvent({
                title: 'Error:',
                message: 'Due date and Payment Frequency field must be filled all Payment Frequencies...',
                variant: 'error',
            });
            this.dispatchEvent(evt);
        }*/
            
        /*addPF({
            psId: this.recordId,
            pfRec: this.pfRecords,
            totalPayment: this.totalPayment
        })
        .then(result => {
			this.pfId = result.Id;
			console.log('idss::' + this.pfId);
		})
		this.dispatchEvent(toastEvent);*/
    }

    removePf(event){
        console.log('Access key2:'+event.target.accessKey);
        console.log('>>'+event.target.id.split('-')[0]);
		if(this.pfList.length >= 1){
            console.log('pflist::'+this.pfList.length);
			this.pfList.splice(event.target.accessKey,1);  //splice - is remove method in js //e.target.accesskey - it is accessing index of row
			console.log('remove::'+event.target.accessKey);
            console.log('pflistRe::'+this.pfList.length);
            //this.keyIndex-1;
		}
	}
    
   

    OpenPF() {
		this.isModalOpen = true;
        this.isPFf = true;
	}

    closeModal() {
        this.isModalOpen = false;
        this.isPF = false;
        this.isPFupload = false;
    }

    
    uploadPF() {
        this.isPF = false;
        this.isPFf = false;
        this.isPFupload = true;
    }

    Finish(){
      if(this.totalPayment <= 100){  
        addPF({
			psId: this.recordId,
			pfList: this.pfList
		})
        .then(result => {
            // Clear the user enter values
            //this.gcRecords = {}
            //console.log('this.gcRecord::'+this.gcRecords);
            this.pfId = result.Id;
            console.log('id::' + this.pfId);
            
            this.dispatchEvent(
              new ShowToastEvent({
                title: 'Success!',
                message: 'G&C Record is created',
                variant: 'success'
            }),
            );
            //this.dispatchEvent(toastEvent);
            //return refreshapex(this.gcId);
        })
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
      }else{
        const evt = new ShowToastEvent({
            title: 'Error:',
            message: 'Cant add new Payment Frequency because sum of Payment (%) reached 100 ...',
            variant: 'error',
        });
        this.dispatchEvent(evt);
      }
    }

    @track fileName = '';
    @track body = '';
	@track UploadFile = 'Save';
	filesUploaded = [];
    file;
    fileContents;
    fileReader;
    content;
	MAX_FILE_SIZE = 1500000;

    // getting file 
    handleFilesChange(event) {
        if(event.target.files.length > 0) {
            this.filesUploaded = event.target.files;                 //fetch file content
            console.log('this.filesUploaded :', this.filesUploaded );
            this.fileName = event.target.files[0].name;
            console.log('this.fileName :', this.fileName);
            this.body = event.target.files.body;
            console.log('body::'+ body);
            
        }
    }

    handleSave() {
        if(this.filesUploaded.length > 0) {
            this.uploadHelper();
            //console.log('this.uploadHelper:'+this.uploadHelper);
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
            console.log('File Contents::'+this.fileContents);
            let base64 = 'base64,';
            this.content = this.fileContents.indexOf(base64) + base64.length;
            console.log('Content::'+this.content);
            this.fileContents = this.fileContents.substring(this.content);
            console.log('file Contents::'+this.fileContents);
            
            // call the uploadProcess method 
            //this.saveToFile();
            console.log('::'+this.saveToFile);
            this.getfiles();
        });
        console.log(this.fileContents)
        this.fileReader.readAsDataURL(this.file);                //It is converted to binary encoded base64 format
        console.log('File::'+this.file);
    }
    
   

    saveToFile(){
        uploadPF({ psId: this.recordId, nameFile: this.file.name,  base64Data: encodeURIComponent(this.fileContents)}) //shorthand for create a variable
        .then(result => {
            console.log('result ====> ' +result);
            // refreshing the datatable
            //this.fileName = null;
            //this.fileName = this.fileName + ' - Uploaded Successfully';
            //this.UploadFile = 'File Uploaded Successfully';
            //this.isTrue = true;
           // this.showLoadingSpinner = false;
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