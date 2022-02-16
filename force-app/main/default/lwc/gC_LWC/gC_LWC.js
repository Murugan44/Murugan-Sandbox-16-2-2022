import {
	LightningElement,
	api,
	track,
	wire
} from 'lwc';
import getPS from '@salesforce/apex/VG_editGC.getPS';
import createGC from '@salesforce/apex/VG_editGC.createGC';
import getGC from '@salesforce/apex/VG_editGC.getGC';
import {refreshapex} from '@salesforce/apex'
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import GC_OBJECT from '@salesforce/schema/VG_Governance_Compliance__c';
import BUSINESS_DESCRIPTION from '@salesforce/schema/Account.Business_Description__c';
//import BUSINESS_DESCRIPTION from '@salesforce/schema/Account.Business_Description__c';
/*import SLIPREFERENCENO_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Slip_Reference_No__c';
import LOSSHISTORY_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Loss_History__c';
import PRICINGRATIONALE_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Pricing_Rationale__c';
import UWC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_UW_Consideration__c';
import KCE_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Key_Clauses_Exclusions__c';
import CS_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Conditions_Subjectivites__c';
import REFERRAL_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Referral__c';
import RFR_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Reason_for_Referral__c';
import RCB_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Referral_completed_By__c';
import RTO_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.Referred_to__c';
import RC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Rating_Considerations__c';
import PT_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Proposed_Terms__c';
import RUC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Referral_Underwirter_Comments__c';
import VGRC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Referral_Complete__c';

import PR_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review__c';
import PR1_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Reviewer_1__c';
import PR2_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Reviewer_2__c';
import PRC1_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_1_Comments__c';
import PRC2_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_2_Comments__c';
import PRCOM1_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_1_Complete__c';
import PRCOM2_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_2_Complete__c';
import PRD1_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_1_Date__c';
import PRD2_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Peer_Review_2_Date__c';

import VGCCD_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Contact_Certainty_Date__c';
import VGCC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Contract_Certainty__c';
import VGCCC_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Contract_Certainty_Comments__c';
import VGDA_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Documents_attached__c';

import VGQ1_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_1__c';
import VGQ2_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_2__c';
import VGQ3_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_3__c';
import VGQ4_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_4__c';
import VGQ5_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_5__c';
import VGQ6_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_6__c';
import VGQ7_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_7__c';
import VGQ8_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_8__c';
import VGQ9_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_9__c';
import VGQ10_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_10__c';
import VGQ11_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Question_11__c';
import POLICYINSURANCEDATE_FIELD from '@salesforce/schema/VG_Governance_Compliance__c.VG_Policy_Issuance_Date__c';*/


let i = 0;
//let j = 0;
export default class Governance_Compliance_LWC extends LightningElement {
	@track showLoadingSpinner = false;
	@track gcId = '';
	@track gcsId = '';
	//@track gcRecId = '';
	@api recordId; //this captures polId which is passed from Parent Component
	@track error;
	@track gcRecords = GC_OBJECT;
	/*@track gcRecords =  {
		
		VG_Slip_Reference_No__c: '',
		VG_Loss_History__c: '',
		VG_Pricing_Rationale__c: '',
		VG_UW_Consideration__c: '',
		VG_Key_Clauses_Exclusions__c: '',
		VG_Conditions_Subjectivites__c: '',
		VG_Referral__c: '',
		VG_Reason_for_Referral__c: '',
		VG_Referral_completed_By__c: '',
		Referred_to__c:'',
		VG_Rating_Considerations__c: '',
		VG_Proposed_Terms__c: '',
		VG_Referral_Underwirter_Comments__c: '',
		VG_Referral_Complete__c: '',

		VG_Peer_Review__c: '',
		VG_Peer_Reviewer_1__c: '',
		VG_Peer_Reviewer_2__c: '',
		VG_Peer_Review_1_Comments__c: '',
		VG_Peer_Review_2_Comments__c: '',
		VG_Peer_Review_1_Complete__c: '',
		VG_Peer_Review_2_Complete__c: '',
		VG_Peer_Review_1_Date__c: '',
		VG_Peer_Review_2_Date__c: '',
		VG_Contact_Certainty_Date__c: '',
		VG_Contract_Certainty__c: '',
		VG_Contract_Certainty_Comments__c:'',
		VG_Documents_attached__c: '',

		VG_Question_1__c: '',
		VG_Question_2__c: '',
		VG_Question_3__c: '',
		VG_Question_4__c: '',
		VG_Question_5__c: '',
		VG_Question_6__c: '',
		VG_Question_7__c: '',
		VG_Question_8__c: '',
		VG_Question_9__c: '',
		VG_Question_10__c: '',
		VG_Question_11__c: '',

		VG_Policy_Issuance_Date__c: ''

	};*/

	@wire(getRecord, {
		//recordId: "$recordId",
		fields: [BUSINESS_DESCRIPTION]
	})
    record;

	get BusinessDescription(){
        return getFieldValue(this.record.data, BUSINESS_DESCRIPTION);
    }

	handleChange1(event) {
		this.gcRecords.VG_Slip_Reference_No__c = event.target.value;
		console.log('this.gcRecords.VG_Slip_Reference_No__c::' +this.gcRecords.VG_Slip_Reference_No__c);
		
	}
	handleChange2(event) {
		this.gcRecords.VG_Loss_History__c = event.target.value;
		console.log('this.gcRecords.VG_Loss_History__c::' +this.gcRecords.VG_Loss_History__c);
	}
	handleChange3(event) {
		this.gcRecords.VG_Pricing_Rationale__c = event.target.value;
		console.log('this.gcRecords.VG_Pricing_Rationale__c::' +this.gcRecords.VG_Pricing_Rationale__c);
	}
	handleChange4(event) {
		this.gcRecords.VG_UW_Consideration__c = event.target.value;
		console.log('this.gcRecords.VG_UW_Consideration__c::' +this.gcRecords.VG_UW_Consideration__c);
	}
	handleChange5(event) {
		this.gcRecords.VG_Key_Clauses_Exclusions__c = event.target.value;
		console.log('::this.gcRecords.VG_Key_Clauses_Exclusions__c' +this.gcRecords.VG_Key_Clauses_Exclusions__c);
	}
	handleChange6(event) {
		this.gcRecords.VG_Conditions_Subjectivites__c = event.target.value;
		console.log('this.gcRecords.VG_Conditions_Subjectivites__c::' +this.gcRecords.VG_Conditions_Subjectivites__c);
	}
	handleChange7(event) {
		this.gcRecords.VG_Referral__c = event.target.value;
		console.log('this.gcRecords.VG_Referral__c::' +this.gcRecords.VG_Referral__c);
	}
	handleChange8(event) {
		this.gcRecords.VG_Reason_for_Referral__c = event.target.value;
		console.log('this.gcRecords.VG_Reason_for_Referral__c::' +this.gcRecords.VG_Reason_for_Referral__c);
	}
	handleChange9(event) {
		this.gcRecords.Referred_to__c = event.target.value;
		console.log('this.gcRecords.Referred_to__c::' +this.gcRecords.Referred_to__c);
	}
	handleChange10(event) {
		this.gcRecords.VG_Rating_Considerations__c = event.target.value;
		console.log('this.gcRecords.VG_Rating_Considerations__c::' +this.gcRecords.VG_Rating_Considerations__c);
	}
	handleChange11(event) {
		this.gcRecords.VG_Proposed_Terms__c = event.target.value;
		console.log('this.gcRecords.VG_Proposed_Terms__c::' +this.gcRecords.VG_Proposed_Terms__c);
	}
	handleChange12(event) {
		this.gcRecords.VG_Referral_Underwirter_Comments__c = event.target.value;
		console.log('this.gcRecords.VG_Referral_Underwirter_Comments__c::' +this.gcRecords.VG_Referral_Underwirter_Comments__c);
	}
	handleChange13(event) {
		this.gcRecords.VG_Referral_Complete__c = event.target.value;
		console.log('this.gcRecords.VG_Referral_Complete__c::' +this.gcRecords.VG_Referral_Complete__c);
	}
	handleChange14(event) {
		this.gcRecords.VG_Referral_completed_By__c = event.target.value;
		console.log('this.gcRecords.VG_Referral_completed_By__c::' +this.gcRecords.VG_Referral_completed_By__c);
	}
	
	handleChange15(event) {
		this.gcRecords.VG_Peer_Review__c = event.target.value;
		console.log('0this.gcRecords.VG_Peer_Review__c::' +this.gcRecords.VG_Peer_Review__c);
	}
	handleChange16(event) {
		this.gcRecords.VG_Peer_Reviewer_1__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Reviewer_1__c::' +this.gcRecords.VG_Peer_Reviewer_1__c);
	}
	handleChange17(event) {
		this.gcRecords.VG_Peer_Reviewer_2__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Reviewer_2__c::' +this.gcRecords.VG_Peer_Reviewer_2__c);
	}
	handleChange18(event) {
		this.gcRecords.VG_Peer_Review_1_Comments__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Review_1_Comments__c::' +this.gcRecords.VG_Peer_Review_1_Comments__c);
	}
	handleChange19(event) {
		this.gcRecords.VG_Peer_Review_2_Comments__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Review_2_Comments__c::' +this.gcRecords.VG_Peer_Review_2_Comments__c);
	}
	handleChange20(event) {
		this.gcRecords.VG_Peer_Review_1_Complete__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Review_1_Complete__c::' +this.gcRecords.VG_Peer_Review_1_Complete__c);
	}
	handleChange21(event) {
		this.gcRecords.VG_Peer_Review_2_Complete__c = event.target.value;
		console.log('this.gcRecords.VG_Peer_Review_2_Complete__c::' +this.gcRecords.VG_Peer_Review_2_Complete__c);
	}
	handleChange22(event) {
			this.gcRecords.VG_Peer_Review_1_Date__c = event.target.value;
			console.log('this.gcRecords.VG_Peer_Review_1_Date__c::' +this.gcRecords.VG_Peer_Review_1_Date__c);
		}
	handleChange23(event) {
			this.gcRecords.VG_Peer_Review_2_Date__c = event.target.value;
			console.log('this.gcRecords.VG_Peer_Review_2_Date__c::' +this.gcRecords.VG_Peer_Review_2_Date__c);
	}
	handleChange24(event) {
			this.gcRecords.VG_Question_1__c = event.target.value;
			console.log('this.gcRecords.VG_Question_1__c::' +this.gcRecords.VG_Question_1__c);
	}
	handleChange25(event) {
			this.gcRecords.VG_Question_6__c = event.target.value;
			console.log('this.gcRecords.VG_Question_6__c::' +this.gcRecords.VG_Question_6__c);
	}
	handleChange26(event) {
			this.gcRecords.VG_Question_2__c = event.target.value;
			console.log('this.gcRecords.VG_Question_2__c::' +this.gcRecords.VG_Question_2__c);
	}
	handleChange27(event) {
			this.gcRecords.VG_Question_7__c = event.target.value;
			console.log('this.gcRecords.VG_Question_7__c::' +this.gcRecords.VG_Question_7__c);
	}
	handleChange28(event) {
			this.gcRecords.VG_Question_3__c = event.target.value;
			console.log('this.gcRecords.VG_Question_3__c::' +this.gcRecords.VG_Question_3__c);
	}
	handleChange29(event) {
			this.gcRecords.VG_Question_8__c = event.target.value;
			console.log('this.gcRecords.VG_Question_8__c::' +this.gcRecords.VG_Question_8__c);
	}
	handleChange30(event) {
			this.gcRecords.VG_Question_4__c = event.target.value;
			console.log('this.gcRecords.VG_Question_4__c::' +this.gcRecords.VG_Question_4__c);
	}
	handleChange31(event) {
			this.gcRecords.VG_Question_9__c = event.target.value;
			console.log('this.gcRecords.VG_Question_9__c ::' +this.gcRecords.VG_Question_9__c );
	}
	handleChange32(event) {
			this.gcRecords.VG_Question_5__c = event.target.value;
			console.log('this.gcRecords.VG_Question_5__c::' +this.gcRecords.VG_Question_5__c);
	}
	handleChange33(event) {
			this.gcRecords.VG_Question_10__c = event.target.value;
			console.log('this.gcRecords.VG_Question_10__c::' +this.gcRecords.VG_Question_10__c);
	}
	handleChange34(event) {
			this.gcRecords.VG_Question_11__c = event.target.value;
			console.log('this.gcRecords.VG_Question_11__c::' +this.gcRecords.VG_Question_11__c);
	}
	handleChange35(event) {
			this.gcRecords.VG_Contract_Certainty__c = event.target.value;
			console.log('this.gcRecords.VG_Contract_Certainty__c::' +this.gcRecords.VG_Contract_Certainty__c);
	}
	handleChange36(event) {
			this.gcRecords.VG_Documents_attached__c = event.target.value;
			console.log('this.gcRecords.VG_Documents_attached__c::' +this.gcRecords.VG_Documents_attached__c);
	}
	handleChange37(event) {
			this.gcRecords.VG_Contact_Certainty_Date__c = event.target.value;
			console.log('this.gcRecords.VG_Contact_Certainty_Date__c::' +this.gcRecords.VG_Contact_Certainty_Date__c);
	}
	
	handleChange38(event) {
			this.gcRecords.VG_Contract_Certainty_Comments__c = event.target.value;
			console.log('this.gcRecords.VG_Contract_Certainty_Comments__c::' +this.gcRecords.VG_Contract_Certainty_Comments__c);
	}
	
	handleChange39(event){
	    this.gcRecords.VG_Policy_Issuance_Date__c = event.target.value;
		console.log('this.gcRecords.VG_Policy_Issuance_Date__c::' +this.gcRecords.VG_Policy_Issuance_Date__c);
	}

	handleCreateGC() {
		//this.isGCOpen = true;
		createGC({
				polId: this.recordId,
				gcRec: this.gcRecords
			})
			.then(result => {
				// Clear the user enter values
				//this.gcRecords = {}
				//console.log('this.gcRecord::'+this.gcRecords);
				this.gcId = result.Id;
				console.log('id::' + this.gcId);
				
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
			
		this.isGCOpen = false;
	}
	
	/*@track gcRec = {
		
		VG_Slip_Reference_No__c: SLIPREFERENCENO_FIELD,
		VG_Loss_History__c: LOSSHISTORY_FIELD,
		VG_Pricing_Rationale__c: PRICINGRATIONALE_FIELD,
		VG_UW_Consideration__c: UWC_FIELD,
		VG_Key_Clauses_Exclusions__c: KCE_FIELD,
		VG_Conditions_Subjectivites__c: CS_FIELD,
		VG_Referral__c: REFERRAL_FIELD,
		VG_Reason_for_Referral__c: RFR_FIELD,
		VG_Referral_completed_By__c: RCB_FIELD,
		Referred_to__c: RTO_FIELD,
		VG_Rating_Considerations__c: RC_FIELD,
		VG_Proposed_Terms__c: PT_FIELD,
		VG_Referral_Underwirter_Comments__c: RUC_FIELD,
		VG_Referral_Complete__c: VGRC_FIELD,

		VG_Peer_Review__c: PR_FIELD,
		VG_Peer_Reviewer_1__c: PR1_FIELD,
		VG_Peer_Reviewer_2__c: PR2_FIELD,
		VG_Peer_Review_1_Comments__c: PRC1_FIELD,
		VG_Peer_Review_2_Comments__c: PRC2_FIELD,
		VG_Peer_Review_1_Complete__c: PRCOM1_FIELD,
		VG_Peer_Review_2_Complete__c: PRCOM2_FIELD,
		VG_Peer_Review_1_Date__c: PRD1_FIELD,
		VG_Peer_Review_2_Date__c: PRD2_FIELD,
		VG_Contact_Certainty_Date__c: VGCCD_FIELD,
		VG_Contract_Certainty__c: VGCC_FIELD,
		VG_Contract_Certainty_Comments__c: VGCCC_FIELD,
		VG_Documents_attached__c: VGDA_FIELD,

		VG_Question_1__c: VGQ1_FIELD,
		VG_Question_2__c: VGQ2_FIELD,
		VG_Question_3__c: VGQ3_FIELD,
		VG_Question_4__c: VGQ4_FIELD,
		VG_Question_5__c: VGQ5_FIELD,
		VG_Question_6__c: VGQ6_FIELD,
		VG_Question_7__c: VGQ7_FIELD,
		VG_Question_8__c: VGQ8_FIELD,
		VG_Question_9__c: VGQ9_FIELD,
		VG_Question_10__c: VGQ10_FIELD,
		VG_Question_11__c: VGQ11_FIELD,

		VG_Policy_Issuance_Date__c: POLICYINSURANCEDATE_FIELD

	};*/
	
	handleViewGC() {
		
		this.isGCOpen = true;
		
		getGC({
			policyId: this.recordId,
			gcRec: this.gcRec
		})
		.then(result => {
			this.gcsId = result.Id;
			console.log('idss::' + this.gcsId);
		})
		//this.dispatchEvent(toastEvent);
		
		//this.isGCOpen = true;
	}

	
	/*handleSRNLoad(event){
		var record = event.detail.records;
		var fields = record[this.gcId].fields;
		console.log('1::' + this.gcsId +'::' +fields);
		

	}*/


	OpenGC() {
		this.isGCOpen = true;
	}
	closeGC() {
		this.isGCOpen = false;
	}
	


	/** Id of record to display. */
	
	@track error; //this holds errors

	@track items = []; //this holds the array for records with value & label

	@track value = ''; //this displays selected value of combo box

	@track psId = '';


	@track isGCOpen = false;

	@wire(getPS, {
		polId: '$recordId'
	})
	wiredPS({
		error,
		data
	}) {
		if (data) {
			for (i = 0; i < data.length; i++) {
				this.items = [...this.items, {
					value: data[i].Id,
					label: data[i].Name,
					label2: data[i].VG_Total_Layer_Premium__c,
					label3: data[i].Product__c,
					label4: data[i].Limit__c,
					label5: data[i].Share__c,
					label6: data[i].Sum_Insured__c,
					label7: data[i].Attachment__c,
					label8: data[i].Gross_Written_Premium__c,
					label9: data[i].VG_Brokerage_Amount__c
				}];
				//console.log('id0=' + data[i].Id + '::' + 'Name::' + data[i].Name + '::' + 'layer::' + data[i].VG_Total_Layer_Premium__c + '::' +
					//'product=' + data[i].Product__c + '::' + 'Limit__c::' + data[i].Limit__c + '::' + 'Share__c::' + data[i].Share__c + '::' +
					//'Sum_Insured__c=' + data[i].Sum_Insured__c + '::' + 'Attachment__c::' + data[i].Attachment__c + '::' + 'Gross_Written_Premium__c::' + data[i].Gross_Written_Premium__c + '::' + 'VG_Brokerage_Amount__c::' + data[i].VG_Brokerage_Amount__c);

			}
			this.error = undefined;
		} else if (error) {
			this.error = error;
			this.ps = undefined;
		}
	}

	//getter property from statusOptions which return the items array
	get statusOptions() {
		//console.log('status::' + this.items);
		return this.items;
	}

	handleChange(event) {
		// Get the string of the "value" attribute on the selected option
		
		const selectedOption = event.detail.value;
		//console.log('selectedOption=' + selectedOption);

		this.psId = selectedOption;
		//console.log('psid::' + this.psId);
		var record = event.detail.records;
		var fields = record[this.psId].fields;
		//console.log('0::' + psId + '::' + fields);
		const product = Product__c.value;
		const layer = VG_Total_Layer_Premium__c.value;
		const limit = Limit__c.value;
		const share = Share__c.value;
		const sumInsured = Sum_Insured__c.value;
		const attachment = Attachment__c.value;
		const gwp = Gross_Written_Premium__c.value;
		const broAccount = VG_Brokerage_Amount__c.value;
		

		//This is for event propagation
		const filterChangeEvent = new CustomEvent('filterchange', {
			detail: {
				selectedOption
			},

		});
		//console.log('fire::' + filterChangeEvent);

		// Fire the custom event
		this.dispatchEvent(filterChangeEvent);
		//console.log('fire1::' + filterChangeEvent);
	}


	

	handleOnLoad(event) {

		var record = event.detail.records;
		var fields = record[this.recordId].fields;
		//console.log('1::' + recordId + '::' + fields);
		//alert(recordId);

		const accName = fields.Insured__c.value;
		const broName = fields.Broker_Name__c.value;
		const lineofBusiness = fields.Line_Of_Business__c.value;
		const inceptionDate = fields.VG_Inception_Date__c.value;
		const expiryDate = fields.VG_Expiry_Date__c.value;
		const typeofInsurance = fields.Type_of_Insurance__c.value;
		const leadOrfollow = fields.VG_Lead_or_Follow__c.value;
		const wording = fields.VG_Wording__c.value;
		const territoryLimit = fields.VG_Territorial_Limits__c.value;
		const policyCurrency = fields.VG_Policy_Currency__c.value;
		const createdDate = fields.CreatedDate.value;

	}


}