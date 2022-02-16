import { LightningElement,wire, track } from 'lwc';
import {
	refreshApex
} from '@salesforce/apex';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
import getApexLog from '@salesforce/apex/DeleteApexLog.getApexLog';
import delApexLog from '@salesforce/apex/DeleteApexLog.delApexLog';
export default class DeleteDebugLogLWC extends LightningElement {
    @track apexLenght

    loader = false
    @track refreshTable = [];

    @wire(getApexLog)
    apex(result) {
        this.refreshTable = result
        if(result.data){
            this.apexLenght = `Total Apex Debug log Records are ${result.data.length}`
            this.loader = false
        }
        if(result.error){
            console.error(result.error)
        }
    }

    delLogs(){
        this.loader = true
        delApexLog({})
        .then(result =>{
            console.log(result)
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
					this.loader = false;
				}, 3000)
			}, 3000)
        })
        .catch(error =>{
            console.error(error)
        })
    }
}