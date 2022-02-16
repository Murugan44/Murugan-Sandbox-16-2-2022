/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-20-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-20-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class pdf_ms_docs {
    public String pdfText{get;set;}
    public pdf_ms_docs() {
        pdfText = String.escapeSingleQuotes(
            ApexPages.currentPage().getParameters().get('pdfText')
        );
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Policy__c> getPolicy(Id polId) {
        system.debug('PolID::'+polId);
        //Policy__c pol = [SELECT Actual_GWP__c,Adjustment_Reason__c,Am_I_Underwriter__c,AP_TP__c,Bound_Probability__c,Broker_Contact__c,Broker_Name__c,Commercial_Adjustment__c,CreatedById,CreatedDate,CurrencyIsoCode,Declaration_Type__c,Deductible_or_Excess_Amount__c,Deductible_or_Excess_Basis__c,Description__c,Earned_Aggregate_Balance__c,Endorsement_GWP__c,Extended_Reporting__c,Formula_Sum_Insured_Share__c,Gross_Written_Premium_Rollup__c,Gross_Written_Premium__c,GWP_Predicted__c,Id,Inception_Expiry_Time__c,Insured__c,IPT__c,IsApproved_External__c,IsDeleted,Jurisdiction__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Lead_insurer_Policy_No__c,Lead_Insurer__c,Levies__c,Line_Of_Business__c,Loss_Ratio__c,MTA_Cancel_List__c,Name,NTUorDeclined__c,NTU_Declined_Score__c,NTU_Or_Declined__c,NTU_Score__c,Original_Currency__c,OwnerId,Paid_Aggregate_Balance__c,Payment_Frequency__c,Policy_Basis__c,Policy_Status__c,Premium_Adjustment__c,RecordTypeId,Referral_Required__c,Retroactive_Date__c,Risk_Assessor__c,Risk_Premium__c,Sum_Insured_Share__c,SystemModstamp,Technical_GWP__c,Technical_Model_Premium__c,Technical_UW_Premium__c,Terms_of_Trade_Days__c,Total_Aggregate_Balance__c,Total_claims_o_s__c,Total_claims_paid__c,Total_claims_reserve__c,Total_Sum_Insured__c,Transaction_GWP__c,Type_of_Insurance__c,Underwriter__c,VG_Additional_Insureds__c,VG_Aggregate_Limit__c,VG_Booked_Time__c,VG_Bound_Booked__c,VG_Bound_Time__c,VG_Brokerage_Amount__c,VG_Brokerage_Percent__c,VG_Continuous_Cover_Date__c,VG_Current_Insurer__c,VG_Deadline__c,VG_Expiry_Date__c,VG_Fee_Income__c,VG_Governance_Compliance__c,VG_Ignore_Validation__c,VG_Inception_Date__c,VG_IsApproved__c,VG_Is_Renewal__c,VG_Is_Temp__c,VG_Lead_or_Follow__c,VG_Lloyds_Products__c,VG_Local_Policies__c,VG_LTA_Comments__c,VG_LTA_Expiry_Date__c,VG_LTA_Start_Date__c,VG_LTA__c,VG_Manuscript_Wording__c,VG_MGA_Commission_Amount__c,VG_NAIC_Code__c,VG_Plan_Rate__c,VG_Policy_Currency__c,VG_Programme_Reference_Number__c,VG_Prospect_Premium__c,VG_Quoted_Bound__c,VG_Quoted_Time__c,VG_ReInsured__c,VG_Renewal_Policy_Id__c,VG_Retroactive_Date_Applicable__c,VG_State_of_Filing__c,VG_Sub_Broker__c,VG_Sub_Status__c,VG_Surplus_Broker__c,VG_Territorial_Limits__c,VG_Terrorism_Acceptance_Date__c,VG_Terrorism_Declination_Date__c,VG_US_Classification__c,VG_Volante_Entities__c,VG_Wording__c FROM Policy__c WHERE Id=:polId];
        //system.debug('pol::'+pol);
        return [SELECT Actual_GWP__c,Underwriter__r.Name,RecordType.Name,VG_Programme_Reference_Number__r.Name,Broker_Name__r.Name,Adjustment_Reason__c,Am_I_Underwriter__c,AP_TP__c,Bound_Probability__c,Broker_Contact__c,Broker_Name__c,Commercial_Adjustment__c,CreatedById,CreatedDate,CurrencyIsoCode,Declaration_Type__c,Deductible_or_Excess_Amount__c,Deductible_or_Excess_Basis__c,Description__c,Earned_Aggregate_Balance__c,Endorsement_GWP__c,Extended_Reporting__c,Formula_Sum_Insured_Share__c,Gross_Written_Premium_Rollup__c,Gross_Written_Premium__c,GWP_Predicted__c,Id,Inception_Expiry_Time__c,Insured__c,IPT__c,IsApproved_External__c,IsDeleted,Jurisdiction__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Lead_insurer_Policy_No__c,Lead_Insurer__c,Levies__c,Line_Of_Business__c,Loss_Ratio__c,MTA_Cancel_List__c,Name,NTUorDeclined__c,NTU_Declined_Score__c,NTU_Or_Declined__c,NTU_Score__c,Original_Currency__c,OwnerId,Paid_Aggregate_Balance__c,Payment_Frequency__c,Policy_Basis__c,Policy_Status__c,Premium_Adjustment__c,RecordTypeId,Referral_Required__c,Retroactive_Date__c,Risk_Assessor__c,Risk_Premium__c,Sum_Insured_Share__c,SystemModstamp,Technical_GWP__c,Technical_Model_Premium__c,Technical_UW_Premium__c,Terms_of_Trade_Days__c,Total_Aggregate_Balance__c,Total_claims_o_s__c,Total_claims_paid__c,Total_claims_reserve__c,Total_Sum_Insured__c,Transaction_GWP__c,Type_of_Insurance__c,Underwriter__c,VG_Additional_Insureds__c,VG_Aggregate_Limit__c,VG_Booked_Time__c,VG_Bound_Booked__c,VG_Bound_Time__c,VG_Brokerage_Amount__c,VG_Brokerage_Percent__c,VG_Continuous_Cover_Date__c,VG_Current_Insurer__c,VG_Deadline__c,VG_Expiry_Date__c,VG_Fee_Income__c,VG_Governance_Compliance__c,VG_Ignore_Validation__c,VG_Inception_Date__c,VG_IsApproved__c,VG_Is_Renewal__c,VG_Is_Temp__c,VG_Lead_or_Follow__c,VG_Lloyds_Products__c,VG_Local_Policies__c,VG_LTA_Comments__c,VG_LTA_Expiry_Date__c,VG_LTA_Start_Date__c,VG_LTA__c,VG_Manuscript_Wording__c,VG_MGA_Commission_Amount__c,VG_NAIC_Code__c,VG_Plan_Rate__c,VG_Policy_Currency__c,VG_Programme_Reference_Number__c,VG_Prospect_Premium__c,VG_Quoted_Bound__c,VG_Quoted_Time__c,VG_ReInsured__c,VG_Renewal_Policy_Id__c,VG_Retroactive_Date_Applicable__c,VG_State_of_Filing__c,VG_Sub_Broker__c,VG_Sub_Status__c,VG_Surplus_Broker__c,VG_Territorial_Limits__c,VG_Terrorism_Acceptance_Date__c,VG_Terrorism_Declination_Date__c,VG_US_Classification__c,VG_Volante_Entities__c,VG_Wording__c FROM Policy__c WHERE Id=:polId];
        
    }


    @AuraEnabled
    public static Attachment generatePDF(Id recordId, String htmlData){
        system.debug(recordId+'::'+htmlData);
        Pagereference page = Page.pfd_MS_page;
        page.getParameters().put('pdfText', htmlData);
        
        Policy__c pol = new Policy__c(Id=recordId);
        Attachment objAttachment = new Attachment();
        objAttachment.Name='invoice.pdf';
        objAttachment.ParentId = pol.Id;
        objAttachment.Body = page.getContentaspdf();
        objAttachment.IsPrivate = false;
        insert objAttachment;
        return objAttachment;
        
    }
}