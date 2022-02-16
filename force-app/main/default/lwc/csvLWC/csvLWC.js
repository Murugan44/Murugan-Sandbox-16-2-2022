import { LightningElement,wire } from 'lwc';
import getpol from '@salesforce/apex/csvController.getPolicies'
import getPS from '@salesforce/apex/csvController.getPS'
import getAcc from '@salesforce/apex/csvController.getAccount'
import getContact from '@salesforce/apex/csvController.getContact'
import { exportCSVFile } from 'c/utils'
export default class CsvLWC extends LightningElement {
    isCSV = false
    polData
    psData
    accData
    contactData

    // variableName={
     //       key:"Value"
    //     keyValue:"value for that key"
    // }

    polHeaders={
        Id:"Policy Id",
        Name:"Policy Name",
        Broker_Name__c: "Broker Id",
        VG_Brokerage_Amount__c:"Brokerage Amount",
        CurrencyIsoCode:"Currency"
        // Broker_Name__c:{
        //     Name:"Broker Name"
        // }
    }

    psHeaders={
        Id:"Id",
        Name:"Name",
        Policy__c: "Policy__c",
        Base_Creation_Start_Date__c:"Base_Creation_Start_Date__c",
        Base_Creation_End_Date__c:"Base_Creation_End_Date__c"
    }

    accHeaders={
        Id:"Id",
        Name:"Name",
        AccountNumber: "AccountNumber",
        VG_Volante_Entities__c:"VG_Volante_Entities__c",
        Country__c:"Country__c"
    }

    contactHeaders={
        Id:"Id",
        Name:"Name",
        AccountId: "AccountId",
        Email:"Email",
        MobilePhone:"MobilePhone"
    }
    exit
    opneCSV(){
        this.isCSV = true

        if(this.exit === 'Close CSV'){
            this.closeCSV()
        }else{
            let button = this.template.querySelector(".btn").classList.remove("slds-button_brand")
            let add = this.template.querySelector(".btn").classList.add('slds-button_destructive')
            this.exit = this.template.querySelector(".btn").innerText = 'Close CSV'
        }
    }

    closeCSV(){
        this.isCSV = false

        let button = this.template.querySelector(".btn").classList.remove("slds-button_destructive")
        let add = this.template.querySelector(".btn").classList.add('slds-button_brand')
        this.exit = this.template.querySelector(".btn").innerText = 'Open CSV'
    }

    

    @wire(getpol)
    pol({data, error}){
        if(data){
            console.log('Pol Data:::',data)
            this.polData = data
        }
        if(error){
            console.error(error)
        }
    }

    @wire(getPS)
    ps({data, error}){
        if(data){
            console.log(data)
            this.psData = data
        }
        if(error){
            console.error(error)
        }
    }
    @wire(getAcc)
    acc({data, error}){
        if(data){
            console.log(data)
            this.accData = data
        }
        if(error){
            console.error(error)
        }
    }
    @wire(getContact)
    cont({data, error}){
        if(data){
            console.log(data)
            this.contactData = data
        }
        if(error){
            console.error(error)
        }
    }

    csvGenPol(){
        //headers, totalPolData, fileTitle passing these things to utils
        console.log('this.polHeaders'+this.polHeaders)
        console.log('this.polData'+this.polData)
        // console.log('Policy_Records'+Policy_Records)
        exportCSVFile(this.polHeaders, this.polData, "Policy_Records")
        
    }

    csvGenPS(){
        exportCSVFile(this.psHeaders, this.psData, "Policy_Schedule_Records")
    }

    csvGenAcc(){
        exportCSVFile(this.accHeaders, this.accData, "Account_Records")
    }

    csvGenCont(){
        exportCSVFile(this.contactHeaders, this.contactData, "Contact_Records")
    }
}