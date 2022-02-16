/**
* @description       : 
* @author            : Murugan
* @group             : 
* @last modified on  : 07-06-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
* Modifications Log 
* Ver   Date         Author                               Modification
* 1.0   06-20-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class csvController {
    @AuraEnabled(cacheable = true)
    public static List<Policy__c> getPolicies(){
        try {
            return [SELECT Actual_GWP__c,Underwriter__r.Name,RecordType.Name,VG_Programme_Reference_Number__r.Name,Broker_Name__r.Name,Adjustment_Reason__c,Am_I_Underwriter__c,AP_TP__c,Bound_Probability__c,Broker_Contact__c,Broker_Name__c,Commercial_Adjustment__c,CreatedById,CreatedDate,CurrencyIsoCode,Declaration_Type__c,Deductible_or_Excess_Amount__c,Deductible_or_Excess_Basis__c,Description__c,Earned_Aggregate_Balance__c,Endorsement_GWP__c,Extended_Reporting__c,Formula_Sum_Insured_Share__c,Gross_Written_Premium_Rollup__c,Gross_Written_Premium__c,GWP_Predicted__c,Id,Inception_Expiry_Time__c,Insured__c,IPT__c,IsApproved_External__c,IsDeleted,Jurisdiction__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Lead_insurer_Policy_No__c,Lead_Insurer__c,Levies__c,Line_Of_Business__c,Loss_Ratio__c,MTA_Cancel_List__c,Name,NTUorDeclined__c,NTU_Declined_Score__c,NTU_Or_Declined__c,NTU_Score__c,Original_Currency__c,OwnerId,Paid_Aggregate_Balance__c,Payment_Frequency__c,Policy_Basis__c,Policy_Status__c,Premium_Adjustment__c,RecordTypeId,Referral_Required__c,Retroactive_Date__c,Risk_Assessor__c,Risk_Premium__c,Sum_Insured_Share__c,SystemModstamp,Technical_GWP__c,Technical_Model_Premium__c,Technical_UW_Premium__c,Terms_of_Trade_Days__c,Total_Aggregate_Balance__c,Total_claims_o_s__c,Total_claims_paid__c,Total_claims_reserve__c,Total_Sum_Insured__c,Transaction_GWP__c,Type_of_Insurance__c,Underwriter__c,VG_Additional_Insureds__c,VG_Aggregate_Limit__c,VG_Booked_Time__c,VG_Bound_Booked__c,VG_Bound_Time__c,VG_Brokerage_Amount__c,VG_Brokerage_Percent__c,VG_Continuous_Cover_Date__c,VG_Current_Insurer__c,VG_Deadline__c,VG_Expiry_Date__c,VG_Fee_Income__c,VG_Governance_Compliance__c,VG_Ignore_Validation__c,VG_Inception_Date__c,VG_IsApproved__c,VG_Is_Renewal__c,VG_Is_Temp__c,VG_Lead_or_Follow__c,VG_Lloyds_Products__c,VG_Local_Policies__c,VG_LTA_Comments__c,VG_LTA_Expiry_Date__c,VG_LTA_Start_Date__c,VG_LTA__c,VG_Manuscript_Wording__c,VG_MGA_Commission_Amount__c,VG_NAIC_Code__c,VG_Plan_Rate__c,VG_Policy_Currency__c,VG_Programme_Reference_Number__c,VG_Prospect_Premium__c,VG_Quoted_Bound__c,VG_Quoted_Time__c,VG_ReInsured__c,VG_Renewal_Policy_Id__c,VG_Retroactive_Date_Applicable__c,VG_State_of_Filing__c,VG_Sub_Broker__c,VG_Sub_Status__c,VG_Surplus_Broker__c,VG_Territorial_Limits__c,VG_Terrorism_Acceptance_Date__c,VG_Terrorism_Declination_Date__c,VG_US_Classification__c,VG_Volante_Entities__c,VG_Wording__c FROM Policy__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccount(){
        try {
            return[SELECT AccountNumber,AccountSource,Account_Loss_Ratio__c,Account_Priority__c,AnnualRevenue,Bank_Account_Number__c,Bank_IBAN_No__c,Bank_Name__c,Bank_Sort_Code__c,Bank_Swift_Code__c,BillingAddress,BillingCity,BillingCountry,BillingCountryCode,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStateCode,BillingStreet,Billing_E_mail__c,Billing_Phone__c,Broker_Distribution__c,Broker_Type__c,Business_Description__c,ChannelProgramLevelName,ChannelProgramName,City__c,Company_Registration_Number__c,Comply_Advantage_Match_Status__c,Comply_Advantage_Search_Id__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Customer_Size_GBP_Revenue__c,Description,E_mail_address__c,Fax,Id,Industry,Intermediary_Role__c,IsCustomerPortal,IsDeleted,IsPartner,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Loss_Ratio__c,Marketing_Consent__c,MasterRecordId,Name,NumberOfEmployees,OwnerId,Ownership,ParentId,Phone,PhotoUrl,Post_Code_Zip_Code__c,Rating,Rating_Agency__c,RecordTypeId,Regulatory_Check__c,Sanction_Check__c,ShippingAddress,ShippingCity,ShippingCountry,ShippingCountryCode,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStateCode,ShippingStreet,Sic,SicDesc,Site,Stock_Code__c,Street__c,SystemModstamp,Terms__c,Test_Record__c,TickerSymbol,Total_Account_Claims__c,Total_claims_o_s__c,Total_claims_paid__c,Total_claims_reserve__c,Type,VG_Bankgiro__c,VG_Credit_Score__c,VG_Date_of_Cancellation__c,VG_Exchange_List__c,VG_Insured_Policyholder_Type__c,VG_Intermediary_Number__c,VG_Surplus_Lines_Broker_License_No__c,VG_TOBA_Uploaded__c,VG_Total_MGA_Commission__c,VG_Total_Premium__c,VG_Trading_Name__c,VG_Volante_Entities__c,Website FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id,Name,Industry,ShippingCountry,Comply_Advantage_Match_Status__c FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContact(){
        try {
            return[SELECT AccountId,AssistantName,AssistantPhone,Asst_E_mail__c,Birthdate,City__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Department,Description,DoNotCall,Email,EmailBouncedDate,EmailBouncedReason,Fax,FirstName,HasOptedOutOfEmail,HasOptedOutOfFax,HomePhone,Id,IndividualId,IsDeleted,IsEmailBounced,Jigsaw,JigsawContactId,Landline__c,LastActivityDate,LastCURequestDate,LastCUUpdateDate,LastModifiedById,LastModifiedDate,LastName,LastReferencedDate,LastViewedDate,Last_Contact_Date__c,LeadSource,MailingAddress,MailingCity,MailingCountry,MailingCountryCode,MailingGeocodeAccuracy,MailingLatitude,MailingLongitude,MailingPostalCode,MailingState,MailingStateCode,MailingStreet,MasterRecordId,MiddleName,MobilePhone,Name,Next_Contact_Date__c,Notes__c,OtherAddress,OtherCity,OtherCountry,OtherCountryCode,OtherGeocodeAccuracy,OtherLatitude,OtherLongitude,OtherPhone,OtherPostalCode,OtherState,OtherStateCode,OtherStreet,OwnerId,Phone,PhotoUrl,Position__c,Postcode_Zip_Code__c,Primary_or_Secondary_Contact__c,ReportsToId,Salutation,Street_Address__c,Suffix,SystemModstamp,Title FROM Contact];        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable = true)
    public static List<Policy_Schedule__c> getPS(){
        try {
            return[SELECT Account_Id__c,Actual_GWP__c,Attachment__c,Base_Creation_End_Date__c,Base_Creation_Start_Date__c,Bordereaux_Override__c,Commission__c,CreatedById,CreatedDate,CurrencyIsoCode,Declaration_Date__c,Endorsement_GWP__c,Endorsement_Premium_Pro__c,Gross_Base_Premium__c,Gross_or_Net_Premium__c,Gross_Written_Premium__c,Id,ILF_Factor__c,ILF_Layer__c,ILF_Premium__c,Insured_Id__c,IPT_Percent__c,IPT__c,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Levies__c,Limit__c,MID_Check_Box__c,MID__c,MTA_Parent_Policy_Schedule__c,MTA_Reason_for_Cancellation__c,Name,Net_Premium__c,ORC_Amount__c,ORC__c,Policy__c,Premium_Adjustment_2__c,Premium_Adjustment__c,Product__c,Rate_On_Line__c,Rate_Per_Mil__c,RecordTypeId,Risk_Premium_Pro__c,Share__c,Split_Type__c,Sum_Insured__c,SystemModstamp,Technical_GWP__c,Technical_Layer_Premium__c,Technical_UW_Premium__c,Transaction_GWP__c,Underwriting_Premium__c,VG_Adjusted_BI_Base_Rate__c,VG_Adjusted_PD_Base_Rate__c,VG_Adjustment_Factor__c,VG_Adjustment_Reason__c,VG_Auto_acquisition_Threshold__c,VG_Base_Policy__c,VG_BI_Base_Rate__c,VG_Booked_Time__c,VG_Bridge_Selected_Asset__c,VG_Brokerage_Amount__c,VG_Brokerage_Percent__c,VG_Capacity_Paper__c,VG_Coverages__c,VG_Co_Insurance_Parent__c,VG_Co_Insurance_type__c,VG_CREDIT_Augur_SCORE__c,VG_Current_Plan_Rate__c,VG_Declaration_Type_percent__c,VG_Declaration_Type__c,VG_Deductible__c,VG_D_O_Product__c,VG_Endorsement_Premium_Calc__c,VG_Entity_Share__c,VG_Entity_Split_Required__c,VG_Experience_Premium__c,VG_Exposure_Premium__c,VG_Extended_Reporting_Period_AP__c,VG_Extended_Reporting_Period__c,VG_Fee_Income__c,VG_Financials_Created__c,VG_Gross_Written_Premium_100__c,VG_IsTempDelete__c,VG_IsTemp__c,VG_Is_Co_Insurance__c,VG_Is_MTA__c,VG_Last_Tax_Modified__c,VG_Lloyds_Product__c,VG_Location_of_Risk__c,VG_Loss_Limit__c,VG_Machinery_Breakdown_BI_Cover__c,VG_Machinery_Breakdown_Cover__c,VG_MGA_Commission_Amount__c,VG_MTA_Cancellation_Date__c,VG_MTA_End_Date__c,VG_MTA_Reduction_Date__c,VG_MTA_Start_Date__c,VG_MTA_Status__c,VG_MTA_Type__c,VG_Municipality_Code__c,VG_Net_Base_Premium__c,VG_Net_Premium_Due__c,VG_Net_Premium_Receivable__c,VG_Net_Premium_Received__c,VG_Non_Taxable_Premium__c,VG_Number_Of_vehicle__c,VG_Occupancy__c,VG_Overider_Amount__c,VG_Overider_Percent__c,VG_Payment_Due_Date__c,VG_PD_Base_Rate__c,VG_Plan_Rate__c,VG_Pre_MTA_Expiry_Date__c,VG_Rate_Change__c,VG_Reinsurance_Type__c,VG_Reporting_Date__c,VG_Retired_Directors_Additional_Premium__c,VG_Retired_Directors_Year__c,VG_Risk_End_Date__c,VG_Risk_Premium__c,VG_Risk_Start_Date__c,VG_Risk_Transaction_Type__c,VG_Selected_Weight__c,VG_Side_C_Rentention__c,VG_Status__c,VG_Structure__c,VG_Sub_Structure__c,VG_Tax_Not_Applicable__c,VG_Technical_Loss_Ratio__c,VG_Technical_Model_Premium__c,VG_Total_Layer_Premium__c,VG_Transaction_Type__c,VG_Turn_Over__c,VG_Type_Of_Operation__c,VG_VAT_Amount__c,VG_VAT__c,VG_Volante_Entities__c,VG_Witholding_Tax_Amount__c,VG_Wording__c,Written_share__c FROM Policy_Schedule__c];        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}