import { LightningElement,api,wire,track } from 'lwc'
import getPol from '@salesforce/apex/pdf_ms_docs.getPolicy'
import generatePDF from '@salesforce/apex/pdf_ms_docs.generatePDF'
export default class Pdf_ms_LWC extends LightningElement {
    docss ='https://volante--murugan--c.documentforce.com/servlet/servlet.ImageServer?id=0155r000000HDK0&oid=00D5r0000004fpi&lastMod=1620130429000'
    @api recordId
    @track polValue
    @track isShow = false

    PDF(){
        this.isShow = true
    }
    closeModal(){
        this.isShow = false
    }
    @wire(getPol,{polId:'$recordId'})
    wiredpol({ error, data }) {
        if (data) {
            this.polValue = data
            this.error = undefined
        } else if (error) {
            this.error = error
            this.polValue = undefined
        }
        console.log('test::'+this.polvalue)
    }
   
    pdfHandler(){
        //this.isShow = true
        let pdfValue = this.template.querySelector('.container')
        console.log(pdfValue.outerHTML)
        generatePDF({ recordId:this.recordId, htmlData:pdfValue.outerHTML}).then(result=>{
            console.log("attachment id", result)
            window.open(`https://volante--murugan--c.documentforce.com/servlet/servlet.FileDownload?file=${result.Id}`)
            //this.isShow = false
        }).catch(error=>{
            console.error(error)
        })
    }
}