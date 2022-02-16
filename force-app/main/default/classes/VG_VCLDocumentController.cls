Public Class VG_VCLDocumentController{
    Public String PSId{get;set;}  
    Public String polId{get;set;} 
     Public String CurrISO{get;set;} 
    Public Policy_Schedule__c ps{get;set;}
    public Risk_Capture__c rc{get;set;}
    public String Sign_Url{get;set;}
    public String Liability_Sign_Url{get;set;}
    public List<RCWrapper> riskDetailList {get; set;}
    Public List<Asset__c> assList{get;set;} 
    Public List<Policy_Schedule__c> psList{get;set;}
    Public List<VG_Policy_Schedule_Endorsement__c> pseList{get;set;}
    Public List<VG_Policy_Schedule_Endorsement__c> subpseList{get;set;}
    Public List<VG_Policy_Schedule_Asset__c> psaList{get;set;}
    public List<Endorsement_Library__c> ElList{get;set;} 
    Public Map<String, Decimal> EndorsementSublimit{get;set;}
    Public Map<id,VG_Policy_Schedule_Endorsement__c> PSEsublimitMap{get;set;}
    public EndorsementWrapper EW{get;set;}
    public List<EndorsementWrapper> Property_sl_EndorsementWrapperList{get; set;}  
    public List<EndorsementWrapper> Wrap_Ded_EndorsementWrapperList{get; set;}
    public List<EndorsementWrapper> Wrap_sl_EndorsementWrapperList{get; set;}    
    public List<EndorsementWrapper> GLPL_Ded_EndorsementWrapperList{get; set;}
    public List<EndorsementWrapper> GLPL_sl_EndorsementWrapperList{get; set;}
	public List<EndorsementWrapper> EndorsementWrapperListProp{get; set;}    
    
    public Boolean quote {get;set;}
    public Boolean schedule {get;set;}
    
    public Boolean PropertBII {get;set;}
    public Decimal GrossWrittenPremium {get;set;}
    public Decimal PSLimit {get;set;}
    
    public String aInfo{get;set;}
    public String wrapUp{get;set;}
    public String TypeOfLimit{get;set;}
    public String TypeOfDeductible{get;set;}
    public String adjustableBasis{get;set;}
    public Decimal MDPremium{get;set;}
    public Decimal sublimit1{get;set;}
    public Decimal sublimit2{get;set;}
    public Decimal sublimit3{get;set;}
    public Decimal sublimit4{get;set;}
    public Decimal sublimit5{get;set;}
    public Decimal sublimit6{get;set;}
    public Decimal sublimit7{get;set;}
    public Decimal sublimit8{get;set;}
    public Decimal sublimit9{get;set;}
    public Decimal sublimit10{get;set;}
    public Decimal sublimit11{get;set;}
    
    public Decimal Deductible1{get;set;}
    public Decimal Deductible2{get;set;}
    public Decimal Deductible3{get;set;}
    public Decimal Deductible4{get;set;}
    public Decimal Deductible5{get;set;}
    public Decimal Deductible6{get;set;}
    public Decimal Deductible7{get;set;}
    public Decimal Deductible8{get;set;}
    public Decimal Deductible9{get;set;}
    public Decimal Deductible10{get;set;}
    public Decimal Deductible11{get;set;}    
    
    public String UEPolicies{get;set;}
    public String PrintView{get;set;}
    public String Logo{get;set;}
    public String LloydsLogo{get;set;}
    public String br{get;set;}
    
    
    Public VG_VCLDocumentController(){
        polId = apexpages.currentpage().getparameters().get('PolId');
        PSId = apexpages.currentpage().getparameters().get('Id');
        PropertBII= false;
        PrintView = '<!--[if gte mso 9]>' +
            '<xml>' +
            '<w:WordDocument>' +
            '<w:View>Print</w:View>' +
            '<w:Zoom>100</w:Zoom>' +
            '<w:DoNotOptimizeForBrowser/>' +
            '</w:WordDocument>' +
            '</xml>' +
            '<![endif]>';  
        string strOrgId  =  UserInfo.getOrganizationId();
        br='<br/><div style="page-break-after: always" />';
        EndorsementSublimit = new Map<String, Decimal>();
        Wrap_Ded_EndorsementWrapperList = new List<EndorsementWrapper>();
        Wrap_sl_EndorsementWrapperList = new List<EndorsementWrapper>();
        GLPL_Ded_EndorsementWrapperList = new List<EndorsementWrapper>();
        GLPL_sl_EndorsementWrapperList = new List<EndorsementWrapper>();     
        PSEsublimitMap = new Map<id,VG_Policy_Schedule_Endorsement__c>();
        EndorsementWrapperListProp = new List<EndorsementWrapper>();
        List< document > documentList  =  [select Id,  name from document where Name='VCL_Lloyds'];
        Logo  =  'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/VCL/servlet/servlet.ImageServer?id='+documentList[0].Id+'&oid=' + strOrgId; 
        documentList.clear();
        List< document > documentList1  =  [select Id,  name from document where Name='VG_VCL_Lloyds'];
        LloydsLogo  =  'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/VCL/servlet/servlet.ImageServer?id='+documentList1[0].Id+'&oid=' + strOrgId; 
        documentList1.clear();
        documentList  =  [select Id,  name from document where Name='ROB Sign'];    
        Sign_Url  =  'https://'+ApexPages.currentPage().getHeaders().get('Host')+ '/Bridge/servlet/servlet.ImageServer?id='+documentList[0].Id+'&oid=' + strOrgId;  
        documentList1.clear();
        documentList  =  [select Id,  name from document where Name='Liability_Sign_Url'];    
        Liability_Sign_Url  =  'https://'+ApexPages.currentPage().getHeaders().get('Host')+ '/Bridge/servlet/servlet.ImageServer?id='+documentList[0].Id+'&oid=' + strOrgId;  
        documentList1.clear();        
                
        If(polId!=null){
            GrossWrittenPremium =PSLimit= 0;
            psList = [Select Id, Name,VG_Type_Of_Operation__c,Policy__r.CurrencyIsoCode,VG_MTA_Type__c,Policy__r.Policy_Status__c, Policy__r.Broker_Name__c,VG_Booked_Time__c,VG_Capacity_Paper__c, Policy__r.Broker_Name__r.E_mail_address__c, VG_VAT__c, Policy__r.Policy_Basis__c, VG_VAT_Amount__c, VG_Witholding_Tax_Amount__c, VG_Machinery_Breakdown_Cover__c, VG_Machinery_Breakdown_BI_Cover__c, Product__c, Limit__c, Attachment__c, Sum_Insured__c, Policy__r.VG_Additional_Insureds__c, Policy__r.VG_Wording__c, Policy__r.VG_Governance_Compliance__r.VG_Conditions_Subjectivites__c, Policy__r.Gross_Written_Premium__c, Gross_Written_Premium__c, Policy__r.Line_Of_Business__c, VG_Deductible__c, VG_Extended_Reporting_Period__c,Policy__r.VG_Territorial_Limits__c,Policy__r.Jurisdiction__c, Policy__r.VG_Aggregate_Limit__c, Policy__r.Insured__r.BillingStreet, Policy__r.Insured__r.BillingCity, Policy__r.Insured__r.BillingCountry, Policy__r.Insured__r.BillingPostalCode, Policy__r.VG_Expiry_Date__c, Policy__r.Insured__r.Company_Registration_Number__c, Policy__r.Broker_Name__r.Name, Policy__r.Broker_Name__r.Phone, Policy__r.Broker_Name__r.ShippingStreet, Policy__r.Broker_Name__r.ShippingCity, Policy__r.Broker_Name__r.ShippingCountry, Policy__r.Broker_Name__r.ShippingPostalCode, Policy__r.Underwriter__r.Name, Policy__r.Broker_Name__r.Billing_Phone__c, Policy__r.VG_Continuous_Cover_Date__c, Policy__r.Extended_Reporting__c, Policy__r.Retroactive_Date__c, Policy__r.VG_Brokerage_Percent__c, VG_Brokerage_Percent__c, VG_Brokerage_Amount__c, Policy__r.Broker_Name__r.VG_Intermediary_Number__c, Base_Creation_Start_Date__c, Policy__r.Insured__r.Name, Policy__r.Insured__r.Country__c, Policy__r.Insured__r.ShippingStreet, Policy__r.Insured__r.ShippingCity, Policy__r.Insured__r.ShippingPostalCode, Policy__r.Insured__r.ShippingState, Policy__r.Insured__r.ShippingCountry, Policy__r.Insured__r.SicDesc, Policy__r.Name, Policy__r.Inception_Expiry_Time__c, VG_Is_MTA__c, Actual_GWP__c, IPT_Percent__c, IPT__c, VG_MGA_Commission_Amount__c, Transaction_GWP__c,  Policy__r.Insured__r.AccountNumber, Policy__r.Insured__r.Bank_Sort_Code__c, VG_MTA_Start_Date__c, Policy__r.VG_Inception_Date__c, Levies__c, VG_Fee_Income__c, Policy__r.Deductible_or_Excess_Amount__c, Policy__r.Deductible_or_Excess_Basis__c,Endorsement_Premium_Pro__c from Policy_Schedule__c Where Policy__c = :polId];
            ps=psList[0];
            pseList = new List<VG_Policy_Schedule_Endorsement__c>([Select id, Name, VG_Endorsement_Number__c, VG_Sub_limit__c,VG_Deductible__c, VG_Endorsement_Details__c,VG_Endorsement_Library_Id__c, VG_Title__c, VG_Product__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c IN:psList AND (VG_Type__c=:'Endorsements' OR VG_Type__c=:'' OR VG_Type__c=:null) ORDER By VG_Province__c ASC]);
            subpseList = new List<VG_Policy_Schedule_Endorsement__c>([Select id, Name,CurrencyIsoCode,VG_Policy_Schedule__r.Product__c, VG_Endorsement_Number__c,VG_Premium__c,VG_Sub_limit__c,VG_Deductible__c, VG_Endorsement_Details__c,VG_Endorsement_Library_Id__c,Endorsement_Library_Id__r.VG_Coverage__c,Endorsement_Library_Id__r.VG_Reason_of_Sublimit__c, VG_Title__c, VG_Product__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c IN:psList AND (VG_Type__c=:'Sub-limits') ORDER By VG_Province__c ASC]);
            psaList = new List<VG_Policy_Schedule_Asset__c>([select id,Name,Type_of_Limit__c,Type_of_use_or_description_of_automobile__c,VG_Model_Year__c,VG_Trade_Name_Make__c,VG_Comment__c,VG_BASIC_BENEFITS_Premium__c,VG_ALL_PERILS_DEDUCTIBLE__c,IsDeleted,CurrencyIsoCode,RecordTypeId,CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,SystemModstamp,LastViewedDate,LastReferencedDate,VG_Premium__c,VG_Coverage__c,VG_Deductible_Type__c,VG_Rate_Per_Vehicle__c,VG_Number_of_Vehicles__c,VG_Vehicle_Type__c,VG_Policy_Schedule__c,VG_Deductible__c,VG_Use__c,VG_IsTemp__c,VG_IsTempDelete__c,VG_Technical_UW_Rate_Annual__c,Technical_UW_Premium__c,VG_Limit__c,VG_Sub_Aggregation__c,Asset__c,VG_Territorial_Limits__c,VG_AAD__c,VG_Aggregate_Precent__c,VG_Aggregate__c,VG_Deductible_Precent__c,VG_Deposit_Premium_Formula__c,VG_Deposit_Premium__c,VG_GNPI__c,VG_Limit_Precent__c,VG_Max_Rate__c,VG_Min_Rate__c,VG_Minimum_Premium_Formula__c,VG_Minimum_Premium__c,VG_No_Claims_Bonus_Value__c,VG_No_Claims_Bonus__c,VG_Provisional_Rate__c,VG_Rate_on_Income__c,VG_Return_Period_Entry__c,VG_Return_Period_Exit__c,VG_Risk_Premium__c,VG_Swing_Load__c,VG_Sub_limit__c,VG_PD_Deductible__c,VG_MB_PD_Deductible__c,VG_Adjusted_PD_Premium__c,VG_Adjusted_BI_Premium__c,VG_Building_Discount_Loading__c,VG_Net_PD_Premium__c,VG_Net_BI_Premium__c,VG_Net_MB_Premium__c,VG_Net_Risk_Premium__c,VG_Waiting_Period__c,VG_BI_Indemnity_Period__c,VG_MB_Waiting_Period__c,VG_MB_BI_Indemnity_Period__c,VG_Share__c,VG_Max_SI__c,VG_Avg_SI__c,VG_Coverage_Type__c,VG_Fee_Amounts__c,VG_Base_Premium_Rate__c,VG_Scheme_Name__c,VG_Binder_Ref__c,VG_Policy_No__c,VG_Insured_Name__c,VG_Address__c,VG_Country__c,VG_Vehicle_Make__c,VG_Vehicle_Model__c,VG_Payment_Ref__c,VG_Sum_Insured__c,VG_Gross_Written_Premium__c,VG_Brokerage__c,VG_Tax_on_Premium__c,VG_CH_Commission__c,VG_Bordereax_Date__c,VG_Policy_Cover_Start_Date__c,VG_Policy_Cover_End_Date__c,VG_Transaction_Type__c,VG_Payment_Terms__c,VG_Base_Premium__c,VG_Profession__c,VG_Declared_Value__c,VG_Perils__c,VG_Retention_Line__c,VG_Event_Limit__c,VG_Treaty_Limit__c,VG_Expected_Premium_Income__c,VG_Expected_Ceding_Commission__c,VG_Expected_Profit_Commission__c,VG_Ceding_Commission__c,VG_Expected_Loss_Ratio__c,VG_Min_Ceding_Commission__c,VG_Loss_Ratio_for_Min__c,VG_Max_Ceding_Commission__c,VG_Loss_Ratio_for_Max__c,VG_No_of_Surplus_Lines__c,VG_Retention__c,VG_Cession__c,VG_Perils_Text__c,VG_Information__c,VG_Retroactive_Date__c,VG_Policy_Basis__c,VG_Transaction_Effective_date__c,VG_Date_of_Birth__c,VG_Address2__c,VG_Address3__c,VG_Postcode__c,VG_Registration_Plate__c,VG_Sub_broker__c,VG_Risk_start__c,VG_Risk_End__c,VG_Attachment__c,VG_Written_Share__c,VG_Signed_Share__c,VG_CC_Information__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c IN: psList]);
            system.debug('subpseList::'+subpseList);
            system.debug('pseList::'+pseList);
            for(VG_Policy_Schedule_Endorsement__c pse: pseList){
                /*if(pse.VG_Title__c== 'Earthquake')
                    Earthquakedeductible = pse.VG_Deductible__c;  
                if(pse.VG_Title__c== 'Flood')
                    Flooddeductible = pse.VG_Deductible__c;
                */
            }
            for(VG_Policy_Schedule_Endorsement__c subpse: subpseList){
                system.debug('subpse.VG_Policy_Schedule__r.Product__c::'+subpse.VG_Policy_Schedule__r.Product__c);
                if((subpse.VG_Policy_Schedule__r.Product__c == 'Property' || subpse.VG_Policy_Schedule__r.Product__c == 'Property BI&I') && (subpse.VG_Title__c == 'Time Element & Time Element Coverage Extensions' || subpse.VG_Title__c == 'Equipment Breakdown- Time Element & Time Element Coverage Extensions' || subpse.VG_Title__c == 'Equipment Breakdown - Property Damage' || subpse.VG_Title__c == 'Earthquake' || subpse.VG_Title__c == 'Flood' || subpse.VG_Title__c == 'Service Interruption: Utilities' || subpse.VG_Title__c == 'Service Interruption: Cloud Computing' || subpse.VG_Title__c == 'Service Interruption: Equipment Breakdown')){
                    //system.debug('subpse.VG_Policy_Schedule__r.Product__c::'+subpse.VG_Policy_Schedule__r.Product__c + '::'+ subpse.CurrencyIsoCode);
                    EndorsementWrapper ew = new EndorsementWrapper();
                    ew.Name = subpse.VG_Title__c;
                    ew.Deductible = subpse.VG_Deductible__c;
                    CurrISO = subpse.CurrencyIsoCode;
                    if(subpse.VG_Title__c =='Earthquake')
                        ew.Reason = '% of the 100% value of insured property, and Time Element values. The combined deductible for insured property and Time Element shall be subject to a minimum of $[] in any one Occurrence. ';
                    if(subpse.VG_Title__c =='Time Element & Time Element Coverage Extensions' || subpse.VG_Title__c =='Service Interruption: Equipment Breakdow' || subpse.VG_Title__c =='Service Interruption: Cloud Computing' || subpse.VG_Title__c =='Service Interruption: Utilitie')
                        ew.Reason = 'Hours';
                    EndorsementWrapperListProp.add(ew);
                }
            }
            system.debug('EndorsementWrapperListProp::'+EndorsementWrapperListProp.size()+'::'+EndorsementWrapperListProp);
            for(Policy_Schedule__c ps: psList){
                If(ps.VG_MTA_Type__c==null && (ps.Product__c =='Property' || ps.Product__c == 'Property BI&I')){
                    GrossWrittenPremium += ps.Gross_Written_Premium__c;
                    
                }
                If(ps.VG_MTA_Type__c==null && ps.Product__c =='Property'){
                    PSLimit += ps.Limit__c;
                }
                If(ps.VG_MTA_Type__c==null && ps.Product__c =='Property BI&I')
                    PropertBII=True;
                
            }            
        }
        if(PSId!=null){
            ps = [Select Id, Name,VG_Type_Of_Operation__c,Policy__r.CurrencyIsoCode,Policy__r.Policy_Status__c, Policy__r.Broker_Name__c,VG_Booked_Time__c,VG_Capacity_Paper__c, Policy__r.Broker_Name__r.E_mail_address__c, VG_VAT__c, Policy__r.Policy_Basis__c, VG_VAT_Amount__c, VG_Witholding_Tax_Amount__c, VG_Machinery_Breakdown_Cover__c, VG_Machinery_Breakdown_BI_Cover__c, Product__c, Limit__c, Attachment__c, Sum_Insured__c, Policy__r.VG_Additional_Insureds__c, Policy__r.VG_Wording__c, Policy__r.VG_Governance_Compliance__r.VG_Conditions_Subjectivites__c, Policy__r.Gross_Written_Premium__c, Gross_Written_Premium__c, Policy__r.Line_Of_Business__c, VG_Deductible__c, VG_Extended_Reporting_Period__c,Policy__r.VG_Territorial_Limits__c,Policy__r.Jurisdiction__c, Policy__r.VG_Aggregate_Limit__c, Policy__r.Insured__r.BillingStreet, Policy__r.Insured__r.BillingCity, Policy__r.Insured__r.BillingCountry, Policy__r.Insured__r.BillingPostalCode, Policy__r.VG_Expiry_Date__c, Policy__r.Insured__r.Company_Registration_Number__c, Policy__r.Broker_Name__r.Name, Policy__r.Broker_Name__r.Phone, Policy__r.Broker_Name__r.ShippingStreet, Policy__r.Broker_Name__r.ShippingCity, Policy__r.Broker_Name__r.ShippingCountry, Policy__r.Broker_Name__r.ShippingPostalCode, Policy__r.Underwriter__r.Name, Policy__r.Broker_Name__r.Billing_Phone__c, Policy__r.VG_Continuous_Cover_Date__c, Policy__r.Extended_Reporting__c, Policy__r.Retroactive_Date__c, Policy__r.VG_Brokerage_Percent__c, VG_Brokerage_Percent__c, VG_Brokerage_Amount__c, Policy__r.Broker_Name__r.VG_Intermediary_Number__c, Base_Creation_Start_Date__c, Policy__r.Insured__r.Name, Policy__r.Insured__r.Country__c, Policy__r.Insured__r.ShippingStreet, Policy__r.Insured__r.ShippingCity, Policy__r.Insured__r.ShippingPostalCode, Policy__r.Insured__r.ShippingState, Policy__r.Insured__r.ShippingCountry, Policy__r.Insured__r.SicDesc, Policy__r.Name, Policy__r.Inception_Expiry_Time__c, VG_Is_MTA__c, Actual_GWP__c, IPT_Percent__c, IPT__c, VG_MGA_Commission_Amount__c, Transaction_GWP__c,  Policy__r.Insured__r.AccountNumber, Policy__r.Insured__r.Bank_Sort_Code__c, VG_MTA_Start_Date__c, Policy__r.VG_Inception_Date__c, Levies__c, VG_Fee_Income__c, Policy__r.Deductible_or_Excess_Amount__c, Policy__r.Deductible_or_Excess_Basis__c,Endorsement_Premium_Pro__c from Policy_Schedule__c Where Id = :PSId];
            rc = [select id, Name, CurrencyIsoCode,VG_Completion_Date__c,VG_Issue_Date__c,VG_Minimum_Premium_Currency__c,VG_Minimum_Premium__c,VG_Project_Insured__c,VG_Adjustment_Basis__c,VG_Minimum_and_Deposit_Premium__c,VG_Minimum_and_Refund_Premium_Type__c,VG_Reason_for_Issue__c,VG_Completed_Operations_Number_of_Months__c, Policy_Schedule__c, Drivers_Name__c, Drivers_License_Ban_Details__c, Drivers_Claims__c, Drivers_Medical_Conditions__c, Drivers_DOB__c, Drivers_Conviction_Points__c, Drivers_Convictions__c, VG_IsTemp__c, VG_IsTempDelete__c, VG_Layer__c, VG_No_of_Reinstatements__c, VG_Plan_Loss_Ratio__c, VG_Rate_Type__c, VG_Territorial_Scope__c, VG_Territorial_Limits__c, VG_Share__c, VG_Risk_End__c, VG_Risk_start__c, VG_Company_Type__c, VG_Company_Domicile__c, VG_Revenue__c, VG_Total_Assets__c, VG_Net_Profit__c, VG_Market_Cap__c, VG_Net_Equity__c, VG_Headcount__c, VG_Class_1_Employees__c, VG_Industry__c, VG_Profession__c, VG_Fees_Current_Year__c, VG_Fees_Year_1__c, VG_Fees_Year_2__c, VG_Fees_Year_3__c, VG_Income_Basis__c, VG_Claims_Notification_Threshold__c, VG_Cash_Loss_Limit__c, VG_First_Premium_Payment_Date__c, VG_Ceding_Commission_Type__c, VG_Additional_Information__c, VG_Policy_Details__c, VG_Dispute_Clause__c from Risk_Capture__c where Policy_Schedule__c = :psid limit 1];
            pseList = new List<VG_Policy_Schedule_Endorsement__c>([Select id, Name, VG_Endorsement_Number__c, VG_Sub_limit__c,VG_Deductible__c, VG_Endorsement_Details__c,VG_Endorsement_Library_Id__c, VG_Title__c, VG_Product__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c =:ps.id AND (VG_Type__c=:'Endorsements' OR VG_Type__c=:'' OR VG_Type__c=:null) ORDER By VG_Province__c ASC]);
            subpseList = new List<VG_Policy_Schedule_Endorsement__c>([Select id, Name, VG_Endorsement_Number__c,VG_Premium__c,VG_Sub_limit__c,VG_Deductible__c, VG_Endorsement_Details__c,VG_Endorsement_Library_Id__c,Endorsement_Library_Id__r.VG_Coverage__c,Endorsement_Library_Id__r.VG_Reason_of_Sublimit__c, VG_Title__c, VG_Product__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c =:ps.id AND (VG_Type__c=:'Sub-limits') ORDER By VG_Province__c ASC]);
            system.debug('subpseList::'+subpseList);
            system.debug('pseList::'+pseList);
            if(ps.Policy__r.Policy_Status__c == 'Quoted' ||  ps.Policy__r.Policy_Status__c == 'NTU/Decline'){
                quote = True;
            }
            if(ps.Policy__r.Policy_Status__c == 'Bound' || ps.Policy__r.Policy_Status__c == 'Booked'){
                schedule = True;
            }
            assList = new List<Asset__c>([select id, Name,CurrencyIsoCode,VG_Comment__c,VG_Account__c,VG_Province_State__c from Asset__c where VG_Account__c=:ps.Policy__r.Insured__c]);
            psaList = new List<VG_Policy_Schedule_Asset__c>([select id,Name,Type_of_Limit__c,Type_of_use_or_description_of_automobile__c,VG_Model_Year__c,VG_Trade_Name_Make__c,VG_Comment__c,VG_BASIC_BENEFITS_Premium__c,VG_ALL_PERILS_DEDUCTIBLE__c,IsDeleted,CurrencyIsoCode,RecordTypeId,CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,SystemModstamp,LastViewedDate,LastReferencedDate,VG_Premium__c,VG_Coverage__c,VG_Deductible_Type__c,VG_Rate_Per_Vehicle__c,VG_Number_of_Vehicles__c,VG_Vehicle_Type__c,VG_Policy_Schedule__c,VG_Deductible__c,VG_Use__c,VG_IsTemp__c,VG_IsTempDelete__c,VG_Technical_UW_Rate_Annual__c,Technical_UW_Premium__c,VG_Limit__c,VG_Sub_Aggregation__c,Asset__c,VG_Territorial_Limits__c,VG_AAD__c,VG_Aggregate_Precent__c,VG_Aggregate__c,VG_Deductible_Precent__c,VG_Deposit_Premium_Formula__c,VG_Deposit_Premium__c,VG_GNPI__c,VG_Limit_Precent__c,VG_Max_Rate__c,VG_Min_Rate__c,VG_Minimum_Premium_Formula__c,VG_Minimum_Premium__c,VG_No_Claims_Bonus_Value__c,VG_No_Claims_Bonus__c,VG_Provisional_Rate__c,VG_Rate_on_Income__c,VG_Return_Period_Entry__c,VG_Return_Period_Exit__c,VG_Risk_Premium__c,VG_Swing_Load__c,VG_Sub_limit__c,VG_PD_Deductible__c,VG_MB_PD_Deductible__c,VG_Adjusted_PD_Premium__c,VG_Adjusted_BI_Premium__c,VG_Building_Discount_Loading__c,VG_Net_PD_Premium__c,VG_Net_BI_Premium__c,VG_Net_MB_Premium__c,VG_Net_Risk_Premium__c,VG_Waiting_Period__c,VG_BI_Indemnity_Period__c,VG_MB_Waiting_Period__c,VG_MB_BI_Indemnity_Period__c,VG_Share__c,VG_Max_SI__c,VG_Avg_SI__c,VG_Coverage_Type__c,VG_Fee_Amounts__c,VG_Base_Premium_Rate__c,VG_Scheme_Name__c,VG_Binder_Ref__c,VG_Policy_No__c,VG_Insured_Name__c,VG_Address__c,VG_Country__c,VG_Vehicle_Make__c,VG_Vehicle_Model__c,VG_Payment_Ref__c,VG_Sum_Insured__c,VG_Gross_Written_Premium__c,VG_Brokerage__c,VG_Tax_on_Premium__c,VG_CH_Commission__c,VG_Bordereax_Date__c,VG_Policy_Cover_Start_Date__c,VG_Policy_Cover_End_Date__c,VG_Transaction_Type__c,VG_Payment_Terms__c,VG_Base_Premium__c,VG_Profession__c,VG_Declared_Value__c,VG_Perils__c,VG_Retention_Line__c,VG_Event_Limit__c,VG_Treaty_Limit__c,VG_Expected_Premium_Income__c,VG_Expected_Ceding_Commission__c,VG_Expected_Profit_Commission__c,VG_Ceding_Commission__c,VG_Expected_Loss_Ratio__c,VG_Min_Ceding_Commission__c,VG_Loss_Ratio_for_Min__c,VG_Max_Ceding_Commission__c,VG_Loss_Ratio_for_Max__c,VG_No_of_Surplus_Lines__c,VG_Retention__c,VG_Cession__c,VG_Perils_Text__c,VG_Information__c,VG_Retroactive_Date__c,VG_Policy_Basis__c,VG_Transaction_Effective_date__c,VG_Date_of_Birth__c,VG_Address2__c,VG_Address3__c,VG_Postcode__c,VG_Registration_Plate__c,VG_Sub_broker__c,VG_Risk_start__c,VG_Risk_End__c,VG_Attachment__c,VG_Written_Share__c,VG_Signed_Share__c,VG_CC_Information__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c=: psid]);
            If(ps.Product__c == 'Wrap Up Primary (Canada only)' || ps.Product__c == 'Wrap Up Excess (Canada Only)'){
                for(VG_Policy_Schedule_Asset__c psa : psaList ){
                    TypeOfLimit = psa.Type_of_Limit__c;
                    TypeOfDeductible = psa.VG_Deductible_Type__c;
                }
            }

            /*for(VG_Policy_Schedule_Endorsement__c pse: subpseList){
                PSEsublimitMap.put(pse.VG_Endorsement_Library_Id__c, pse);
            }
            ElList =[select id,Name,Endorsement_Title__c,Text__c,Type__c,VG_Product__c,VG_Document_Section__c,VG_Reason_of_Sublimit__c,VG_Province__c from Endorsement_Library__c where (VG_Product__c =:'Except Motor and Property' OR VG_Product__c =:'Property') AND Type__c=:'Sub-limits' AND RecordType.Name =: 'VCL' ORDER By Name ASC];        
            VG_Policy_Schedule_Endorsement__c tempEndsmt;      
            for(Endorsement_Library__c EL : ElList){ 
                System.debug('EL.VG_Document_Section__c::'+EL.VG_Document_Section__c);
                if(EL.VG_Document_Section__c!=null && EL.VG_Document_Section__c.contains('Wrap_Deductible')){
                    System.debug('EL.VG_Document_Section__c2::'+EL.VG_Document_Section__c+'::'+EL.VG_Document_Section__c.contains('Deductible'));                    
                    EW = new EndorsementWrapper();
                    EW.pse = EL;  
                    EW.Name= EL.Endorsement_Title__c;                                                                          
                    EW.Deductible =  (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Deductible__c:0);                   
                    Wrap_Ded_EndorsementWrapperList.add(EW);            
               }
               If(EL.VG_Document_Section__c!=null && EL.VG_Document_Section__c.contains('Wrap_Limit of Liability')){     
                    EW = new EndorsementWrapper();
                    EW.pse = EL;
                    EW.Name= EL.Endorsement_Title__c;
                    EW.Reason = EL.VG_Reason_of_Sublimit__c;                                                          
                    System.debug('check2::'+PSEsublimitMap.containsKey(EL.id));
                    EW.Premium= (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Premium__c:0);                
                    EW.Sublimit =  (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Sub_limit__c:0);    
                    Wrap_sl_EndorsementWrapperList.add(EW);                             
               } 
               if(EL.VG_Document_Section__c!=null && EL.VG_Document_Section__c.contains('GLPL_Deductible')){
                    System.debug('EL.VG_Document_Section__c2::'+EL.VG_Document_Section__c+'::'+EL.VG_Document_Section__c.contains('Deductible'));                    
                    EW = new EndorsementWrapper();
                    EW.pse = EL;  
                    EW.Name= EL.Endorsement_Title__c;                                                                          
                    EW.Deductible =  (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Deductible__c:0);                   
                    GLPL_Ded_EndorsementWrapperList.add(EW);            
               }
               If(EL.VG_Document_Section__c!=null && EL.VG_Document_Section__c.contains('GLPL_Limit of Liability')){     
                    EW = new EndorsementWrapper();
                    EW.pse = EL;
                    EW.Name= EL.Endorsement_Title__c; 
                    EW.Reason = EL.VG_Reason_of_Sublimit__c;                                                                                                                                  
                    System.debug('check2::'+PSEsublimitMap.containsKey(EL.id));
                    EW.Premium= (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Premium__c:0);                
                    EW.Sublimit =  (PSEsublimitMap.containsKey(EL.id)?PSEsublimitMap.get(EL.Id).VG_Sub_limit__c:0);    
                    GLPL_sl_EndorsementWrapperList.add(EW);                             
               }             
               System.debug('EndorsementWrapperList::'+Wrap_Ded_EndorsementWrapperList.size());
            }
            
            //sublimit =0;
            for(VG_Policy_Schedule_Endorsement__c pse: subpseList){
                System.debug('check::'+ pse.Endorsement_Library_Id__r.VG_Coverage__c);
                if(pse.VG_Title__c == 'Claims made employee benefits'){
                    sublimit1 = pse.VG_Sub_limit__c;
                    Deductible1 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c == 'United States of America jurisdiction'){
                    sublimit2 = pse.VG_Sub_limit__c;
                    Deductible2 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c == 'Contingent employers liability'){
                    sublimit3 = pse.VG_Sub_limit__c;
                    Deductible3 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Duty to defend - loss of earnings'){
                    sublimit4 = pse.VG_Sub_limit__c;
                    Deductible4 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Forest fire fighting expenses'){
                    sublimit5 = pse.VG_Sub_limit__c;
                    Deductible5 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Medical expenses'){
                    sublimit6 = pse.VG_Sub_limit__c;
                    Deductible6 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Standard non-owned automobile (S.P.F.6)'){
                    sublimit7 = pse.VG_Sub_limit__c;
                    Deductible7 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Standard hired automobiles (S.E.F. 94)'){
                    sublimit8 = pse.VG_Sub_limit__c;
                    Deductible8 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Tenants legal liability'){
                    sublimit9 = pse.VG_Sub_limit__c;
                    Deductible9 = pse.VG_Deductible__c;
                }
                if(pse.VG_Title__c== 'Pollution - Time element (120) hours'){
                    sublimit10 = pse.VG_Sub_limit__c;
                    Deductible10 = pse.VG_Deductible__c;
                }            
                if(pse.VG_Title__c== 'Products-completed operations'){           
                   sublimit11 = pse.VG_Sub_limit__c;
                   Deductible11 = pse.VG_Deductible__c;
                }        
            }*/
            riskDetailList = new List<RCWrapper>();
            if(rc.VG_Additional_Information__c !=  null){
                aInfo = rc.VG_Additional_Information__c;
                String[] tempDetail = aInfo.split('<br>');
                wrapUp = tempDetail[0].split(':')[1];
                adjustableBasis = tempDetail[1].split(':')[1];
                if(adjustableBasis == 'Yes'){
                    System.debug('if::'+adjustableBasis);
                    MDPremium = Decimal.ValueOf(tempDetail[2].split(':')[1]);
                    UEPolicies = tempDetail[3].split(':')[1];
                }else{
                    UEPolicies = tempDetail[2].split(':')[1];
                }
                    If(ps.Product__c =='Umbrella - Occurrence, Excluding USA' || ps.Product__c =='Umbrella - Occurrence, Including USA' || ps.Product__c =='Umbrella - Claims Made, Excluding USA' || ps.Product__c =='Umbrella - Claims Made, Including USA' || ps.Product__c =='Excess - Occurrence, Excluding USA' || ps.Product__c =='Excess - Occurrence, Including USA' || ps.Product__c =='Excess - Claims Made, Excluding USA' || ps.Product__c == 'Excess - Claims Made, Including USA'){                
                    integer i = 0;
                    while(i<tempDetail.size()){
                        System.debug('Iteration'+i);
                        RCWrapper rcw = new RCWrapper();
                        String[] tmp = tempDetail[i].split(':');
                        String[] tmp1 = tempDetail[i+1].split(':');
                        String[] tmp2 = tempDetail[i+2].split(':');
                        String[] tmp3 = tempDetail[i+3].split(':');
                        String[] tmp4 = tempDetail[i+4].split(':');
                        String[] tmp5 = tempDetail[i+5].split(':');
                        String[] tmp6 = tempDetail[i+6].split(':');
                        //system.debug('tmp5::'+tmp5);
                        if(tmp.size() > 1)
                            rcw.CA1  =  tempDetail[i].split(':')[1];
                        else
                            rcw.CA1  =  '';
                        if(tmp1.size() > 1)
                            rcw.PA1  = tempDetail[i+1].split(':')[1];
                        else
                            rcw.PA1 = '';
                        if(tmp2.size() > 1)
                            rcw.PSD1  = tempDetail[i+2].split(':')[1];
                        else
                            rcw.PSD1  = '';
                        if(tmp3.size() > 1)
                            rcw.PED1  = tempDetail[i+3].split(':')[1];
                        else
                            rcw.PED1  = '';
                        if(tmp4.size() > 1)                        
                            rcw.CO1  = tempDetail[i+4].split(':')[1];
                        else
                            rcw.CO1  = '';
                        if(tmp5.size() > 1)       
                            rcw.UI1  = Decimal.valueOf(tempDetail[i+5].split(':')[1]);
                        else
                            rcw.UI1  = 0;
                        /*if(tmp6.size() > 1)       
                            rcw.PR1 =tempDetail[i+6].split(':')[1];
                        else
                            rcw.PR1 ='';*/
                        riskDetailList.add(rcw);
                        i = i+7;                   
                    }           
                }
            }
        }
    }
    public class RCWrapper{
        public String CA1{get;set;}
        public String PA1{get;set;}
        public String PSD1{get;set;}
        public String PED1{get;set;}
        public String CO1{get;set;}
        public Decimal UI1{get;set;}
        //public Decimal PR1{get;set;}        
    }
    
    Public Class EndorsementWrapper{
        Public Endorsement_Library__c pse {get; set;}
        Public String Name {get; set;} 
        Public Decimal Sublimit {get; set;}  
        Public Decimal Deductible{get; set;}  
        Public Decimal Premium{get; set;}  
        Public String Reason{get; set;} 
        
        Public EndorsementWrapper(){
            pse = new Endorsement_Library__c ();
            Name = '';
            Sublimit = 0;
            Deductible = 0;
            Premium = 0;
            Reason = '';
        }
    }
}