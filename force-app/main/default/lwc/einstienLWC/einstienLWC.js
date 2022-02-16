import { LightningElement,api } from 'lwc';
import readBusinessCardBase64 from '@salesforce/apex/EinsteinOCRService.readBusinessCardBase64';
import createContactRecord from '@salesforce/apex/EinsteinOCRService.createContactRecord';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
export default class EinsteinAPIService extends LightningElement {
    @api recordId
    resultCard;
    fileReader;
    fileContents;
    content;
    file;
    errors = {};
    MAX_FILE_SIZE = 1500000;
    sizeLongMessage;
    isLoading = false;
    isLoadingModal = false;
    fileLabel = 'Upload Image'
    fileName = 'file not selected'
    isBusinessCarrd = false;
    value = 'Contact';
    
    get options() {
        return [
            { label: 'Contact', value: 'Contact' }
        ];
    }

    handleChangePick(event){
        this.value = event.target.value;
    }

    handleChange(event){
        this.isBusinessCarrd = event.target.checked;
    }

    handleFilesChange(event){
        this.file = event.target.files[0];
        this.fileName = event.target.files[0]['name'];
        this.startPrediction()
    }

    startPrediction(){
        if (this.file.size > this.MAX_FILE_SIZE) {
            this.sizeLongMessage = this.file.size+' File Size is to long';
            return ;
        }

        this.isLoading = true;
        this.fileReader= new FileReader();

        this.fileReader.onloadend = (() => {
            this.fileContents = this.fileReader.result;
            let base64 = 'base64,';
            this.content = this.fileContents.indexOf(base64) + base64.length;
            this.fileContents = this.fileContents.substring(this.content);
            if(this.isBusinessCarrd){
                this.readBinaryFile(this.fileContents);
            }else{
                this.readBinaryFile(this.fileContents);
            }
        })
        this.fileReader.readAsDataURL(this.file);        
    }

    tableData = []
    show = false
    
    readBinaryFile(binaryData){
        console.log('recordId::',this.recordId)
        readBusinessCardBase64({
            sampleBusinessCard : binaryData,
            objectName : this.value,
            accountId : this.recordId
        }).then(result => {
            console.log('readBinaryFile::',result)
            let returnedData = JSON.parse(result.response);
            let resultCard1 = result? JSON.stringify(returnedData, undefined, 4): "no prediction found";
            this.resultRecord = result? JSON.stringify(result.record, undefined, 4): "no prediction found";
            console.log('this.resultRecord::',this.resultRecord)

            this.errors = undefined;
            this.tableData.push(result.record);
            if(this.tableData.length > 0) {
                this.show = true
            }else{
                this.show = false
            }
            console.log('table::',this.tableData)
            console.log({
                message : 'Response From Einstin Plarform API',
                data : result
            });
            
        }).catch(error => {
            // console.log('error.body.pageErrors.length',error.body.pageErrors.length)
            // if(error.body.pageErrors.length > 0){
            //     console.log('err',error.body.pageErrors[0].message)
            //     this.errors = error.body.pageErrors[0].statusCode
            // }else if(error.body.duplicateResults.length > 0){
            //     this.errors = error.body.duplicateResults[0].statusCode
            // }else if(error.body.fieldErrors.length > 0){
            //     this.errors = error.body.fieldErrors[0].statusCode
            // }
            this.resultCard = undefined;
            console.error({
                message : 'Error Occured While making callout to Einstein API',
                data : error
            })
            this.dispatchEvent(
                new ShowToastEvent({
                    title: `Please contact admin`,
                    message: this.errors,
                    variant: 'error',
                }),
            );
        })
        .finally(()=>{
            this.isLoading = false;
            this.isOpenModel = true
        })
    }

    isOpenModel = false
    inName = ''
    inPhone = ''
    inEmail = ''
    inAddress = ''

    handleFormChange(e){
        console.log('con::', e.target.name,'=======>', e.target.value)
        if(e.target.name == 'Name'){
            this.inName = e.target.value
        }else if(e.target.name == 'Phone'){
            this.inPhone = e.target.value
        }else if(e.target.name == 'Email'){
            this.inEmail = e.target.value
        }else if(e.target.name == 'Street'){
            this.inAddress = e.target.value
        }
    }

    insertContact(e){
        this.isLoadingModal = true;
        var cont = { 'sobjectType': 'Contact' };
        cont.LastName = this.inName !== '' ? this.inName : this.tableData[0].LastName
        cont.Phone = this.inPhone !== '' ? this.inPhone : this.tableData[0].Phone
        cont.Email = this.inEmail !== '' ? this.inEmail : this.tableData[0].Email
        cont.MailingStreet = this.inAddress !== '' ? this.inAddress : this.tableData[0].MailingStreet
        cont.AccountId = this.recordId

        console.log('contact::', cont)

        createContactRecord({
            newRecord: cont
        })
        .then(result => {
            console.log(result);
            this.isOpenModel = false
            this.tableData = []
            this.show = false
            this.fileName = 'file not selected'
            this.inName = ''
            this.inPhone = ''
            this.inEmail = ''
            this.inAddress = ''
            this.file = ''
        })
        .catch(error => {
            console.log('error.body.pageErrors.length',error.body.pageErrors.length)
            if(error.body.pageErrors.length > 0){
                console.log('err',error.body.pageErrors[0].message)
                this.errors = error.body.pageErrors[0].statusCode
            }else if(error.body.duplicateResults.length > 0){
                this.errors = error.body.duplicateResults[0].statusCode
            }else if(error.body.fieldErrors.length > 0){
                this.errors = error.body.fieldErrors[0].statusCode
            }
        
            this.dispatchEvent(
                new ShowToastEvent({
                    title: `Please contact admin`,
                    message: this.errors,
                    variant: 'error',
                }),
            );
        }).finally(() => {
            this.isLoadingModal = false;
            //window.location.reload()
        })
    }

    closeModal(){
        this.isOpenModel = false
        this.tableData = []
        this.show = false
        this.fileName = 'file not selected'
        this.inName = ''
        this.inPhone = ''
        this.inEmail = ''
        this.inAddress = ''
        this.file = ''
        window.location.reload()
    }
}