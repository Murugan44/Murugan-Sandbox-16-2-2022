/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 02-23-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
* Modifications Log 
* Ver   Date         Author                               Modification
* 1.0   02-23-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class VG_editGC {
    @AuraEnabled (cacheable=true)
    public static List<Policy_schedule__c> getPS(String polId){
        system.debug('polId::'+polId);
        Policy__c pol =[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:polId];
        system.debug('pol::'+pol);
        
        return [SELECT Id, Name, VG_Total_Layer_Premium__c, Limit__c, Share__c,Sum_Insured__c ,Attachment__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c, Product__c ,Policy__c FROM Policy_schedule__c where Policy__c = :polId];
        
    }
    
    @AuraEnabled 
    public static VG_Governance_Compliance__c createGC(String polId, VG_Governance_Compliance__c gcRec){
        system.debug('id::'+polId+'gcrec::'+gcRec);
        
        Policy__c pol =[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:polId];
        
        if(pol.VG_Governance_Compliance__c !=null){
            system.debug('ifGC::');
            VG_Governance_Compliance__c gc =  [select id,VG_Referral__c,VG_Referral_completed_By__c,VG_Peer_Review__c,VG_Policy_Issuance_Date__c,VG_Deadline__c,VG_Contact_Certainty_Date__c,VG_Reason_for_Referral__c,VG_Referred_to__c,Referred_to__c,VG_Rating_Considerations__c,VG_Proposed_Terms__c,VG_Referral_Underwirter_Comments__c,VG_Referral_Complete__c,VG_Documents_attached__c,VG_Contract_Certainty_Comments__c,VG_Contract_Certainty__c,Name,VG_Question_1__c,VG_Question_2__c,VG_Question_3__c,VG_Question_4__c,VG_Question_5__c,VG_Question_6__c,VG_Question_7__c,VG_Question_8__c,VG_Question_9__c,VG_Question_10__c,VG_Question_11__c,VG_Peer_Reviewer_2__c,VG_Peer_Reviewer_1__c,VG_Peer_Review_1_Comments__c,VG_Peer_Review_2_Comments__c,VG_Peer_Review_1_Complete__c,VG_Peer_Review_2_Complete__c,VG_Peer_Review_1_Date__c,VG_Peer_Review_2_Date__c,VG_Slip_Reference_No__c,VG_Loss_History__c,VG_Pricing_Rationale__c,VG_UW_Consideration__c,VG_Key_Clauses_Exclusions__c,VG_Conditions_Subjectivites__c from VG_Governance_Compliance__c where id=:pol.VG_Governance_Compliance__c];
            system.debug('beforeupdate::'+gc);
            VG_Governance_Compliance__c tmpgc = new VG_Governance_Compliance__c();
            gcRec.Id = gc.Id;
            system.debug(';;'+gcRec.Id);
            tmpgc.Id = gcRec.Id;
            system.debug(';;:::'+gcRec.Id);
            if(gcRec.VG_Referral__c != null){
                tmpgc.VG_Referral__c = gcRec.VG_Referral__c;
            }else{
                tmpgc.VG_Referral__c = gc.VG_Referral__c;
            }
            if(gcRec.VG_Referral_completed_By__c != null){
                tmpgc.VG_Referral_completed_By__c = gcRec.VG_Referral_completed_By__c;
            }else{
                tmpgc.VG_Referral_completed_By__c = gc.VG_Referral_completed_By__c;
            }
            if(gcRec.VG_Slip_Reference_No__c != null){
                tmpgc.VG_Slip_Reference_No__c = gcRec.VG_Slip_Reference_No__c;
                system.debug('gcRec::'+tmpgc.VG_Slip_Reference_No__c);
            }else{
                tmpgc.VG_Slip_Reference_No__c = gc.VG_Slip_Reference_No__c;
                system.debug('gc::'+tmpgc.VG_Slip_Reference_No__c);
            }
            if(gcRec.VG_Reason_for_Referral__c != null){
                tmpgc.VG_Reason_for_Referral__c = gcRec.VG_Reason_for_Referral__c;
                system.debug('gcRec::'+tmpgc.VG_Reason_for_Referral__c);
            }else{
                tmpgc.VG_Reason_for_Referral__c = gc.VG_Reason_for_Referral__c;
                system.debug('gc::'+tmpgc.VG_Reason_for_Referral__c);
            }
            if(gcRec.VG_UW_Consideration__c != null){
                tmpgc.VG_UW_Consideration__c = gcRec.VG_UW_Consideration__c;
                system.debug('gcRec::'+tmpgc.VG_UW_Consideration__c);
            }else{
                tmpgc.VG_UW_Consideration__c = gc.VG_UW_Consideration__c;
                system.debug('gc::'+tmpgc.VG_UW_Consideration__c);
            }
            if(gcRec.VG_Pricing_Rationale__c != null){
                tmpgc.VG_Pricing_Rationale__c = gcRec.VG_Pricing_Rationale__c;
                system.debug('gcRec::'+tmpgc.VG_Pricing_Rationale__c);
            }else{
                tmpgc.VG_Pricing_Rationale__c = gc.VG_Pricing_Rationale__c;
                system.debug('gc::'+tmpgc.VG_Pricing_Rationale__c);
            }
            if(gcRec.VG_Key_Clauses_Exclusions__c != null){
                tmpgc.VG_Key_Clauses_Exclusions__c = gcRec.VG_Key_Clauses_Exclusions__c;
                system.debug('gcRec::'+tmpgc.VG_Key_Clauses_Exclusions__c);
            }else{
                tmpgc.VG_Key_Clauses_Exclusions__c = gc.VG_Key_Clauses_Exclusions__c;
                system.debug('gc::'+tmpgc.VG_Key_Clauses_Exclusions__c);
            }
            if(gcRec.VG_Loss_History__c != null){
                tmpgc.VG_Loss_History__c = gcRec.VG_Loss_History__c;
                system.debug('gcRec::'+tmpgc.VG_Loss_History__c);
            }else{
                tmpgc.VG_Loss_History__c = gc.VG_Loss_History__c;
                system.debug('gc::'+tmpgc.VG_Loss_History__c);
            }
            if(gcRec.VG_Conditions_Subjectivites__c != null){
                tmpgc.VG_Conditions_Subjectivites__c = gcRec.VG_Conditions_Subjectivites__c;
                system.debug('gcRec::'+tmpgc.VG_Conditions_Subjectivites__c);
            }else{
                tmpgc.VG_Conditions_Subjectivites__c = gc.VG_Conditions_Subjectivites__c;
                system.debug('gc::'+tmpgc.VG_Conditions_Subjectivites__c);
            }
            if(gcRec.Referred_to__c != null){
                tmpgc.Referred_to__c = gcRec.Referred_to__c;
                system.debug('gcRec::'+tmpgc.Referred_to__c);
            }else{
                tmpgc.Referred_to__c = gc.Referred_to__c;
                system.debug('gc::'+tmpgc.Referred_to__c);
            }
            if(gcRec.VG_Rating_Considerations__c != null){
                tmpgc.VG_Rating_Considerations__c = gcRec.VG_Rating_Considerations__c;
                system.debug('gcRec::'+tmpgc.VG_Rating_Considerations__c);
            }else{
                tmpgc.VG_Rating_Considerations__c = gc.VG_Rating_Considerations__c;
                system.debug('gc::'+tmpgc.VG_Rating_Considerations__c);
            }
            if(gcRec.VG_Proposed_Terms__c != null){
                tmpgc.VG_Proposed_Terms__c = gcRec.VG_Proposed_Terms__c;
                system.debug('gcRec::'+tmpgc.VG_Proposed_Terms__c);
            }else{
                tmpgc.VG_Proposed_Terms__c = gc.VG_Proposed_Terms__c;
                system.debug('gc::'+tmpgc.VG_Proposed_Terms__c);
            }
            if(gcRec.VG_Referral_Underwirter_Comments__c != null){
                tmpgc.VG_Referral_Underwirter_Comments__c = gcRec.VG_Referral_Underwirter_Comments__c;
                system.debug('gcRec::'+tmpgc.VG_Referral_Underwirter_Comments__c);
            }else{
                tmpgc.VG_Referral_Underwirter_Comments__c = gc.VG_Referral_Underwirter_Comments__c;
                system.debug('gc::'+tmpgc.VG_Referral_Underwirter_Comments__c);
            }
            if(gcRec.VG_Referral_Complete__c != null){
                tmpgc.VG_Referral_Complete__c = gcRec.VG_Referral_Complete__c;
                system.debug('gcRec::'+tmpgc.VG_Referral_Complete__c);
            }else{
                tmpgc.VG_Referral_Complete__c = gc.VG_Referral_Complete__c;
                system.debug('gc::'+tmpgc.VG_Referral_Complete__c);
            }
            if(gcRec.VG_Peer_Review__c != null){
                tmpgc.VG_Peer_Review__c = gcRec.VG_Peer_Review__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review__c);
            }else{
                tmpgc.VG_Peer_Review__c = gc.VG_Peer_Review__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review__c);
            }
            if(gcRec.VG_Peer_Reviewer_1__c != null){
                tmpgc.VG_Peer_Reviewer_1__c = gcRec.VG_Peer_Reviewer_1__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Reviewer_1__c);
            }else{
                tmpgc.VG_Peer_Reviewer_1__c = gc.VG_Peer_Reviewer_1__c;
                system.debug('gc::'+tmpgc.VG_Peer_Reviewer_1__c);
            }
            if(gcRec.VG_Peer_Reviewer_2__c != null){
                tmpgc.VG_Peer_Reviewer_2__c = gcRec.VG_Peer_Reviewer_2__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Reviewer_2__c);
            }else{
                tmpgc.VG_Peer_Reviewer_2__c = gc.VG_Peer_Reviewer_2__c;
                system.debug('gc::'+tmpgc.VG_Peer_Reviewer_2__c);
            }
            if(gcRec.VG_Peer_Review_1_Comments__c != null){
                tmpgc.VG_Peer_Review_1_Comments__c = gcRec.VG_Peer_Review_1_Comments__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review_1_Comments__c);
            }else{
                tmpgc.VG_Peer_Review_1_Comments__c = gc.VG_Peer_Review_1_Comments__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review_1_Comments__c);
            }
            if(gcRec.VG_Peer_Review_2_Comments__c != null){
                tmpgc.VG_Peer_Review_2_Comments__c = gcRec.VG_Peer_Review_2_Comments__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review_2_Comments__c);
            }else{
                tmpgc.VG_Peer_Review_2_Comments__c = gc.VG_Peer_Review_2_Comments__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review_2_Comments__c);
            }
            if(gcRec.VG_Peer_Review_1_Complete__c != null){
                tmpgc.VG_Peer_Review_1_Complete__c = gcRec.VG_Peer_Review_1_Complete__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review_1_Complete__c);
            }else{
                tmpgc.VG_Peer_Review_1_Complete__c = gc.VG_Peer_Review_1_Complete__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review_1_Complete__c);
            }
            if(gcRec.VG_Peer_Review_2_Complete__c != null){
                tmpgc.VG_Peer_Review_2_Complete__c = gcRec.VG_Peer_Review_2_Complete__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review_2_Complete__c);
            }else{
                tmpgc.VG_Peer_Review_2_Complete__c = gc.VG_Peer_Review_2_Complete__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review_2_Complete__c);
            }
            if(gcRec.VG_Peer_Review_1_Date__c != null){
                tmpgc.VG_Peer_Review_1_Date__c = gcRec.VG_Peer_Review_1_Date__c;
                system.debug('gcRec::'+tmpgc.VG_Peer_Review_1_Date__c);
            }else{
                tmpgc.VG_Peer_Review_1_Date__c = gc.VG_Peer_Review_1_Date__c;
                system.debug('gc::'+tmpgc.VG_Peer_Review_1_Date__c);
            }
            if(gcRec.VG_Question_1__c != null){
                tmpgc.VG_Question_1__c = gcRec.VG_Question_1__c;
                system.debug('gcRec::'+tmpgc.VG_Question_1__c);
            }else{
                tmpgc.VG_Question_1__c = gc.VG_Question_1__c;
                system.debug('gc::'+tmpgc.VG_Question_1__c);
            }
            if(gcRec.VG_Question_2__c != null){
                tmpgc.VG_Question_2__c = gcRec.VG_Question_2__c;
                system.debug('gcRec::'+tmpgc.VG_Question_2__c);
            }else{
                tmpgc.VG_Question_2__c = gc.VG_Question_2__c;
                system.debug('gc::'+tmpgc.VG_Question_2__c);
            }
            if(gcRec.VG_Question_3__c != null){
                tmpgc.VG_Question_3__c = gcRec.VG_Question_3__c;
                system.debug('gcRec::'+tmpgc.VG_Question_3__c);
            }else{
                tmpgc.VG_Question_3__c = gc.VG_Question_3__c;
                system.debug('gc::'+tmpgc.VG_Question_3__c);
            }
            if(gcRec.VG_Question_4__c != null){
                tmpgc.VG_Question_4__c = gcRec.VG_Question_4__c;
                system.debug('gcRec::'+tmpgc.VG_Question_4__c);
            }else{
                tmpgc.VG_Question_4__c = gc.VG_Question_4__c;
                system.debug('gc::'+tmpgc.VG_Question_4__c);
            }
            if(gcRec.VG_Question_5__c != null){
                tmpgc.VG_Question_5__c = gcRec.VG_Question_5__c;
                system.debug('gcRec::'+tmpgc.VG_Question_5__c);
            }else{
                tmpgc.VG_Question_5__c = gc.VG_Question_5__c;
                system.debug('gc::'+tmpgc.VG_Question_5__c);
            }
            if(gcRec.VG_Question_6__c != null){
                tmpgc.VG_Question_6__c = gcRec.VG_Question_6__c;
                system.debug('gcRec::'+tmpgc.VG_Question_6__c);
            }else{
                tmpgc.VG_Question_6__c = gc.VG_Question_6__c;
                system.debug('gc::'+tmpgc.VG_Question_6__c);
            }
            if(gcRec.VG_Question_7__c != null){
                tmpgc.VG_Question_7__c = gcRec.VG_Question_7__c;
                system.debug('gcRec::'+tmpgc.VG_Question_7__c);
            }else{
                tmpgc.VG_Question_7__c = gc.VG_Question_7__c;
                system.debug('gc::'+tmpgc.VG_Question_7__c);
            }
            if(gcRec.VG_Question_8__c != null){
                tmpgc.VG_Question_8__c = gcRec.VG_Question_8__c;
                system.debug('gcRec::'+tmpgc.VG_Question_8__c);
            }else{
                tmpgc.VG_Question_8__c = gc.VG_Question_8__c;
                system.debug('gc::'+tmpgc.VG_Question_8__c);
            }
            if(gcRec.VG_Question_9__c != null){
                tmpgc.VG_Question_9__c = gcRec.VG_Question_9__c;
                system.debug('gcRec::'+tmpgc.VG_Question_9__c);
            }else{
                tmpgc.VG_Question_9__c = gc.VG_Question_9__c;
                system.debug('gc::'+tmpgc.VG_Question_9__c);
            }
            if(gcRec.VG_Question_10__c != null){
                tmpgc.VG_Question_10__c = gcRec.VG_Question_10__c;
                system.debug('gcRec::'+tmpgc.VG_Question_10__c);
            }else{
                tmpgc.VG_Question_10__c = gc.VG_Question_10__c;
                system.debug('gc::'+tmpgc.VG_Question_10__c);
            }
            if(gcRec.VG_Question_11__c != null){
                tmpgc.VG_Question_11__c = gcRec.VG_Question_11__c;
                system.debug('gcRec::'+tmpgc.VG_Question_11__c);
            }else{
                tmpgc.VG_Question_11__c = gc.VG_Question_11__c;
                system.debug('gc::'+tmpgc.VG_Question_11__c);
            }
            if(gcRec.VG_Contract_Certainty__c != null){
                tmpgc.VG_Contract_Certainty__c = gcRec.VG_Contract_Certainty__c;
                system.debug('gcRec::'+tmpgc.VG_Contract_Certainty__c);
            }else{
                tmpgc.VG_Contract_Certainty__c = gc.VG_Contract_Certainty__c;
                system.debug('gc::'+tmpgc.VG_Contract_Certainty__c);
            }
            if(gcRec.VG_Contact_Certainty_Date__c != null){
                tmpgc.VG_Contact_Certainty_Date__c = gcRec.VG_Contact_Certainty_Date__c;
                system.debug('gcRec::'+tmpgc.VG_Contact_Certainty_Date__c);
            }else{
                tmpgc.VG_Contact_Certainty_Date__c = gc.VG_Contact_Certainty_Date__c;
                system.debug('gc::'+tmpgc.VG_Contact_Certainty_Date__c);
            }
            if(gcRec.VG_Contract_Certainty_Comments__c != null){
                tmpgc.VG_Contract_Certainty_Comments__c = gcRec.VG_Contract_Certainty_Comments__c;
                system.debug('gcRec::'+tmpgc.VG_Contract_Certainty_Comments__c);
            }else{
                tmpgc.VG_Contract_Certainty_Comments__c = gc.VG_Contract_Certainty_Comments__c;
                system.debug('gc::'+tmpgc.VG_Contract_Certainty_Comments__c);
            }
            if(gcRec.VG_Documents_attached__c != null){
                tmpgc.VG_Documents_attached__c = gcRec.VG_Documents_attached__c;
                system.debug('gcRec::'+tmpgc.VG_Documents_attached__c);
            }else{
                tmpgc.VG_Documents_attached__c = gc.VG_Documents_attached__c;
                system.debug('gc::'+tmpgc.VG_Documents_attached__c);
            }
            if(gcRec.VG_Policy_Issuance_Date__c != null){
                tmpgc.VG_Policy_Issuance_Date__c = gcRec.VG_Policy_Issuance_Date__c;
                system.debug('gcRec::'+tmpgc.VG_Policy_Issuance_Date__c);
            }else{
                tmpgc.VG_Policy_Issuance_Date__c = gc.VG_Policy_Issuance_Date__c;
                system.debug('gc::'+tmpgc.VG_Policy_Issuance_Date__c);
            }
            //tmpgc.VG_Referral__c = gcRec.VG_Referral__c;
            //tmpgc.VG_Referral_completed_By__c = gcRec.VG_Referral_completed_By__c;
            //tmpgc.VG_Reason_for_Referral__c = gcRec.VG_Reason_for_Referral__c;
            //tmpgc.VG_UW_Consideration__c = gcRec.VG_UW_Consideration__c;
            //tmpgc.VG_Pricing_Rationale__c = gcRec.VG_Pricing_Rationale__c;
            //tmpgc.VG_Key_Clauses_Exclusions__c = gcRec.VG_Key_Clauses_Exclusions__c;
            //tmpgc.VG_Slip_Reference_No__c = gcRec.VG_Slip_Reference_No__c;
            
            //tmpgc.VG_Loss_History__c = gcRec.VG_Loss_History__c;
            //tmpgc.VG_Conditions_Subjectivites__c = gcRec.VG_Conditions_Subjectivites__c;
            //tmpgc.Referred_to__c = gcRec.Referred_to__c;
            //tmpgc.VG_Rating_Considerations__c = gcRec.VG_Rating_Considerations__c;
            //tmpgc.VG_Proposed_Terms__c = gcRec.VG_Proposed_Terms__c;
            //system.debug('pt::'+tmpgc.VG_Proposed_Terms__c);
            //tmpgc.VG_Referral_Underwirter_Comments__c = gcRec.VG_Referral_Underwirter_Comments__c;
            //tmpgc.VG_Referral_Complete__c = gcRec.VG_Referral_Complete__c;
            //tmpgc.VG_Peer_Review__c = gcRec.VG_Peer_Review__c;
            //tmpgc.VG_Peer_Reviewer_1__c = gcRec.VG_Peer_Reviewer_1__c;
            //tmpgc.VG_Peer_Reviewer_2__c = gcRec.VG_Peer_Reviewer_2__c;
            //tmpgc.VG_Peer_Review_1_Comments__c = gcRec.VG_Peer_Review_1_Comments__c;
            //tmpgc.VG_Peer_Review_2_Comments__c = gcRec.VG_Peer_Review_2_Comments__c;
            //tmpgc.VG_Peer_Review_1_Complete__c = gcRec.VG_Peer_Review_1_Complete__c;
            //tmpgc.VG_Peer_Review_2_Complete__c = gcRec.VG_Peer_Review_2_Complete__c;
            //tmpgc.VG_Peer_Review_1_Date__c = gcRec.VG_Peer_Review_1_Date__c;
            /*tmpgc.VG_Question_1__c = gcRec.VG_Question_1__c;
            tmpgc.VG_Question_2__c = gcRec.VG_Question_2__c;
            tmpgc.VG_Question_3__c = gcRec.VG_Question_3__c;
            tmpgc.VG_Question_4__c = gcRec.VG_Question_4__c;
            tmpgc.VG_Question_5__c = gcRec.VG_Question_5__c;
            tmpgc.VG_Question_6__c = gcRec.VG_Question_6__c;
            tmpgc.VG_Question_7__c = gcRec.VG_Question_7__c;
            tmpgc.VG_Question_8__c = gcRec.VG_Question_8__c;
            tmpgc.VG_Question_9__c = gcRec.VG_Question_9__c;
            tmpgc.VG_Question_10__c = gcRec.VG_Question_10__c;
            tmpgc.VG_Question_11__c = gcRec.VG_Question_11__c;*/
            //tmpgc.VG_Contract_Certainty__c = gcRec.VG_Contract_Certainty__c;
            //tmpgc.VG_Contact_Certainty_Date__c = gcRec.VG_Contact_Certainty_Date__c;
            //tmpgc.VG_Contract_Certainty_Comments__c = gcRec.VG_Contract_Certainty_Comments__c;
            //tmpgc.VG_Documents_attached__c = gcRec.VG_Documents_attached__c;
            //tmpgc.VG_Policy_Issuance_Date__c = gcRec.VG_Policy_Issuance_Date__c;
            update tmpgc;
            
        }else{
            system.debug('elseGC::');
            //VG_Governance_Compliance__c tmpgc1 = new VG_Governance_Compliance__c();
            gcRec.Name='Governance Compliance for policy '+pol.Name;
            //if(gcRec.VG_Peer_Review_1_Complete__c)
            //  gcRec.VG_Peer_Review_1_Date__c=System.today();
            //if(gcRec.VG_Peer_Review_2_Complete__c)
            //  gcRec.VG_Peer_Review_2_Date__c=System.today();
            //if(gcRec.VG_Contract_Certainty__c)
                //gcRec.VG_Contact_Certainty_Date__c=System.today();
            /*tmpgc1.Name = gcRec.Name;
            tmpgc1.VG_Referral__c = gcRec.VG_Referral__c;
            tmpgc1.VG_Referral_completed_By__c = gcRec.VG_Referral_completed_By__c;
            tmpgc1.VG_Reason_for_Referral__c = gcRec.VG_Reason_for_Referral__c;
            tmpgc1.VG_UW_Consideration__c = gcRec.VG_UW_Consideration__c;
            //tmpgc1.VG_Pricing_Rationale__c = gcRec.VG_Pricing_Rationale__c;
            tmpgc1.VG_Key_Clauses_Exclusions__c = gcRec.VG_Key_Clauses_Exclusions__c;
            tmpgc1.VG_Slip_Reference_No__c = gcRec.VG_Slip_Reference_No__c;
            tmpgc1.VG_Loss_History__c = gcRec.VG_Loss_History__c;
            tmpgc1.VG_Conditions_Subjectivites__c = gcRec.VG_Conditions_Subjectivites__c;
            tmpgc1.Referred_to__c = gcRec.Referred_to__c;
            tmpgc1.VG_Rating_Considerations__c = gcRec.VG_Rating_Considerations__c;
            tmpgc1.VG_Proposed_Terms__c = gcRec.VG_Proposed_Terms__c;
            tmpgc1.VG_Referral_Underwirter_Comments__c = gcRec.VG_Referral_Underwirter_Comments__c;
            tmpgc1.VG_Referral_Complete__c = gcRec.VG_Referral_Complete__c;
            tmpgc1.VG_Peer_Review__c = gcRec.VG_Peer_Review__c;
            tmpgc1.VG_Peer_Reviewer_1__c = gcRec.VG_Peer_Reviewer_1__c;
            tmpgc1.VG_Peer_Reviewer_2__c = gcRec.VG_Peer_Reviewer_2__c;
            //tmpgc1.VG_Peer_Review_1_Comments__c = gcRec.VG_Peer_Review_1_Comments__c;
            //tmpgc1.VG_Peer_Review_2_Comments__c = gcRec.VG_Peer_Review_2_Comments__c;
            tmpgc1.VG_Peer_Review_1_Complete__c = gcRec.VG_Peer_Review_1_Complete__c;
            tmpgc1.VG_Peer_Review_2_Complete__c = gcRec.VG_Peer_Review_2_Complete__c;
            tmpgc1.VG_Peer_Review_1_Date__c = gcRec.VG_Peer_Review_1_Date__c;
            tmpgc1.VG_Peer_Review_2_Date__c = gcRec.VG_Peer_Review_2_Date__c;
            tmpgc1.VG_Question_1__c = gcRec.VG_Question_1__c;
            tmpgc1.VG_Question_2__c = gcRec.VG_Question_2__c;
            tmpgc1.VG_Question_3__c = gcRec.VG_Question_3__c;
            tmpgc1.VG_Question_4__c = gcRec.VG_Question_4__c;
            tmpgc1.VG_Question_5__c = gcRec.VG_Question_5__c;
            tmpgc1.VG_Question_6__c = gcRec.VG_Question_6__c;
            tmpgc1.VG_Question_7__c = gcRec.VG_Question_7__c;
            tmpgc1.VG_Question_8__c = gcRec.VG_Question_8__c;
            tmpgc1.VG_Question_9__c = gcRec.VG_Question_9__c;
            tmpgc1.VG_Question_10__c = gcRec.VG_Question_10__c;
            tmpgc1.VG_Question_11__c = gcRec.VG_Question_11__c;
            tmpgc1.VG_Contract_Certainty__c = gcRec.VG_Contract_Certainty__c;
            tmpgc1.VG_Contact_Certainty_Date__c = gcRec.VG_Contact_Certainty_Date__c;
            tmpgc1.VG_Contract_Certainty_Comments__c = gcRec.VG_Contract_Certainty_Comments__c;
            tmpgc1.VG_Documents_attached__c = gcRec.VG_Documents_attached__c;
            tmpgc1.VG_Policy_Issuance_Date__c = gcRec.VG_Policy_Issuance_Date__c;
            insert tmpgc1;*/
            insert gcRec;
            
        }
        return gcRec;
        
    } 
    /*@AuraEnabled (cacheable=true)
    public static List<VG_Governance_Compliance__c> getGC(String policyId){
        system.debug('polgcId::'+policyId);
        Policy__c pol =[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:policyId];
        system.debug('pol1::'+pol);
        if(pol.VG_Governance_Compliance__c != null){
            system.debug('chekcGCLoad::'+pol.VG_Governance_Compliance__c);
            return [select id,VG_Referral__c,VG_Referral_completed_By__c,VG_Peer_Review__c,VG_Policy_Issuance_Date__c,VG_Deadline__c,VG_Contact_Certainty_Date__c,VG_Reason_for_Referral__c,VG_Referred_to__c,Referred_to__c,VG_Rating_Considerations__c,VG_Proposed_Terms__c,VG_Referral_Underwirter_Comments__c,VG_Referral_Complete__c,VG_Documents_attached__c,VG_Contract_Certainty_Comments__c,VG_Contract_Certainty__c,Name,VG_Question_1__c,VG_Question_2__c,VG_Question_3__c,VG_Question_4__c,VG_Question_5__c,VG_Question_6__c,VG_Question_7__c,VG_Question_8__c,VG_Question_9__c,VG_Question_10__c,VG_Question_11__c,VG_Peer_Reviewer_2__c,VG_Peer_Reviewer_1__c,VG_Peer_Review_1_Comments__c,VG_Peer_Review_2_Comments__c,VG_Peer_Review_1_Complete__c,VG_Peer_Review_2_Complete__c,VG_Peer_Review_1_Date__c,VG_Peer_Review_2_Date__c,VG_Slip_Reference_No__c,VG_Loss_History__c,VG_Pricing_Rationale__c,VG_UW_Consideration__c,VG_Key_Clauses_Exclusions__c,VG_Conditions_Subjectivites__c from VG_Governance_Compliance__c where id=:pol.VG_Governance_Compliance__c];
            
        }else{
            return [select id,VG_Referral__c,VG_Referral_completed_By__c,VG_Peer_Review__c,VG_Policy_Issuance_Date__c,VG_Deadline__c,VG_Contact_Certainty_Date__c,VG_Reason_for_Referral__c,VG_Referred_to__c,Referred_to__c,VG_Rating_Considerations__c,VG_Proposed_Terms__c,VG_Referral_Underwirter_Comments__c,VG_Referral_Complete__c,VG_Documents_attached__c,VG_Contract_Certainty_Comments__c,VG_Contract_Certainty__c,Name,VG_Question_1__c,VG_Question_2__c,VG_Question_3__c,VG_Question_4__c,VG_Question_5__c,VG_Question_6__c,VG_Question_7__c,VG_Question_8__c,VG_Question_9__c,VG_Question_10__c,VG_Question_11__c,VG_Peer_Reviewer_2__c,VG_Peer_Reviewer_1__c,VG_Peer_Review_1_Comments__c,VG_Peer_Review_2_Comments__c,VG_Peer_Review_1_Complete__c,VG_Peer_Review_2_Complete__c,VG_Peer_Review_1_Date__c,VG_Peer_Review_2_Date__c,VG_Slip_Reference_No__c,VG_Loss_History__c,VG_Pricing_Rationale__c,VG_UW_Consideration__c,VG_Key_Clauses_Exclusions__c,VG_Conditions_Subjectivites__c from VG_Governance_Compliance__c where id=:pol.VG_Governance_Compliance__c];
        }
        //return [select id,VG_Referral__c,VG_Referral_completed_By__c,VG_Peer_Review__c,VG_Policy_Issuance_Date__c,VG_Deadline__c,VG_Contact_Certainty_Date__c,VG_Reason_for_Referral__c,VG_Referred_to__c,Referred_to__c,VG_Rating_Considerations__c,VG_Proposed_Terms__c,VG_Referral_Underwirter_Comments__c,VG_Referral_Complete__c,VG_Documents_attached__c,VG_Contract_Certainty_Comments__c,VG_Contract_Certainty__c,Name,VG_Question_1__c,VG_Question_2__c,VG_Question_3__c,VG_Question_4__c,VG_Question_5__c,VG_Question_6__c,VG_Question_7__c,VG_Question_8__c,VG_Question_9__c,VG_Question_10__c,VG_Question_11__c,VG_Peer_Reviewer_2__c,VG_Peer_Reviewer_1__c,VG_Peer_Review_1_Comments__c,VG_Peer_Review_2_Comments__c,VG_Peer_Review_1_Complete__c,VG_Peer_Review_2_Complete__c,VG_Peer_Review_1_Date__c,VG_Peer_Review_2_Date__c,VG_Slip_Reference_No__c,VG_Loss_History__c,VG_Pricing_Rationale__c,VG_UW_Consideration__c,VG_Key_Clauses_Exclusions__c,VG_Conditions_Subjectivites__c from VG_Governance_Compliance__c where id=:pol.VG_Governance_Compliance__c];
        //return null;
    }*/
    @AuraEnabled
    public static VG_Governance_Compliance__c getGC(String policyId, VG_Governance_Compliance__c gcRecs){
        system.debug('polgcId::'+policyId + '::::'+gcRecs);
        Policy__c pol =[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:policyId];
        system.debug('pol1::'+pol);
        gcRecs = [select id,VG_Referral__c,VG_Referral_completed_By__c,VG_Peer_Review__c,VG_Policy_Issuance_Date__c,VG_Deadline__c,VG_Contact_Certainty_Date__c,VG_Reason_for_Referral__c,VG_Referred_to__c,Referred_to__c,VG_Rating_Considerations__c,VG_Proposed_Terms__c,VG_Referral_Underwirter_Comments__c,VG_Referral_Complete__c,VG_Documents_attached__c,VG_Contract_Certainty_Comments__c,VG_Contract_Certainty__c,Name,VG_Question_1__c,VG_Question_2__c,VG_Question_3__c,VG_Question_4__c,VG_Question_5__c,VG_Question_6__c,VG_Question_7__c,VG_Question_8__c,VG_Question_9__c,VG_Question_10__c,VG_Question_11__c,VG_Peer_Reviewer_2__c,VG_Peer_Reviewer_1__c,VG_Peer_Review_1_Comments__c,VG_Peer_Review_2_Comments__c,VG_Peer_Review_1_Complete__c,VG_Peer_Review_2_Complete__c,VG_Peer_Review_1_Date__c,VG_Peer_Review_2_Date__c,VG_Slip_Reference_No__c,VG_Loss_History__c,VG_Pricing_Rationale__c,VG_UW_Consideration__c,VG_Key_Clauses_Exclusions__c,VG_Conditions_Subjectivites__c from VG_Governance_Compliance__c where id=:pol.VG_Governance_Compliance__c];
        system.debug('check values::'+gcRecs);
        if(pol.VG_Governance_Compliance__c != null){
            system.debug('checkkkkkIF::');
            return gcRecs;
        }else{
            system.debug('checkElse Null::');
            return null;
        }
        
    }
}