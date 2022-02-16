Public Class VG_Revise_VCLController{
    
    public Policy_Schedule__c ps{get;set;}
    public Risk_Capture__c rc{get;set;}
    public VG_Policy_Schedule_Asset__c rr{get;set;}
    public Policy__c policy{get;set;}
    public LibraryWrapper LW1{get;set;}
    public LibraryWrapper LW{get;set;}
    
    public Id psid {get; set;}
    
    public String seletedProrateoption {get; set;}
    public String addressofInsuredProject {get;set;}
    public String wrapUp{get;set;}    
    public String UEPolicies{get;set;}
    public String LP_Select {get;set;}
    public String Coverage_Select {get;set;}
    public String Teri_Select {get;set;}
    public String Product_Select {get;set;}
    public String layer {get; set;}
    public String GrossOrNet {get; set;}
    public String Index{get;set;}
    public String fileName {get;set;}
    public string nameFile{get;set;}
    public String[] filelines = new String[]{};
    public String aInfo{get;set;}
    public String br{get;set;}
    public string CapacityPaper{get;set;}
    public string products {get;set;}
    Public String selectedIds{get;set;}
    public ID policyId{get;set;}
    
    public Boolean pmsg {get; set;}
    public boolean enableMList{get;set;}
    public Boolean errmsg {get; set;}
    Public Boolean EnableReinstatement{get;set;}
    public Boolean addRRMode {get; set;}
    public Boolean DMLAlert{get;set;}
    public Boolean PropertyDMLALert{get;set;}
    public Boolean showfield {get; set;}   
    public Boolean IsAssertInsertion {get;set;}
       
    public Integer counterEnd {get; set;}
    public Integer RRcounter {get; set;}
    public Integer RRSize{get; set;}
    public Integer counter {get; set;}
    public Integer RCcounter {get; set;}
    
    public Decimal sumAnnualPremium{get;set;}
    public Decimal MDPremium{get;set;}
    public Decimal netModelPremium {get; set;}
    public Decimal RiskPremium {get;set;}
    public Decimal lmt {get;set;}
    public Decimal attachment {get;set;}
    public Decimal adjustment {get;set;}
    public Decimal writtenShare {get; set;}
    public Decimal actualPremium {get; set;}
    public Decimal sumInsured {get; set;}
    public Decimal brokerage {get; set;}
    public Decimal uwPremium {get; set;}
    public Decimal levies {get; set;}
    public Decimal brokerageAmount {get; set;}
    public Decimal grossWrittenPremium {get; set;}
    public Decimal grossWrittenPremium2 {get; set;}
    public Decimal feeIncome {get; set;}
    Public Decimal totalFeeAmount{get;set;}
    Public Decimal totalbasepremium{get;set;}
    Public Decimal totalbasepremiumrate{get;set;}
    public Decimal sharePercent {get; set;}
    public Decimal techModelPremium {get; set;}
    public Decimal adjustmentTechPremium {get; set;}
    public Decimal taxamount {get; set;}
    public Decimal endorsementPremium {get; set;}
    public Decimal TotalSumInsured{get; set;}
    public Decimal TotalPremium{get; set;}
    public Decimal proRata{get; set;}
    public Decimal RateChange {get;set;}   
    public Decimal ExpectedLossRatio{get;set;}
  
    public Blob fileBody {get;set;}
    public String MTAType{get;set;}
    public String MTAStartDate{get;set;}
    public String str{get;set;}
    public String str_2 {get;set;}
    public String str_3{get;set;}
    public String str_4{get;set;}
    Public String IndexVal{get;set;}
    Public string pseIndex {get;set;}
    Public string deductibletoall{get;set;}
    
    public String[] Province { get; set; }
    Public String CompanyType {get; set;}
    Public String IndustrySelected {get; set;}
    Public List<SelectOption> DO_Industry_Select {get; set;}
    Public List<SelectOption> SectionNo_Select {get; set;}    
    Public List<SelectOption> CompanyType_Select {get; set;}
    Public List<SelectOption> splitTypes{get; set;}
    public List<SelectOption> pickListValuesList {get; set;}
    public List<SelectOption> TypeOfOperationList{get; set;}      
    public list<SelectOption> lpList {get; set;}
    public list<SelectOption> productList {get; set;}
    public list<SelectOption> RRCoverage_Select{get; set;}
    public list<SelectOption> NonEEAVolanteEntity_Select {get; set;}
    public list<SelectOption> Territorial_List{get; set;}
    public list<SelectOption> RRLimit_Select {get; set;}
    public list<SelectOption> RRDeductible_Select {get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    public List<Endorsement_Library__c> ElList1{get;set;}
    public List<Endorsement_Library__c> ElList{get;set;} 
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}
    public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    public List<LibraryWrapper> LibraryWrapperList {get; set;}
    public List<RRWrapper> riskRatingList {get; set;}
    public List<RRWrapper> rrwList{get; set;}
    public List<RRWrapper> addedRRList {get; set;}
    Public list<Integer> createLoop {get; set;}
    Public List<Integer> NOIList{get;set;}
    Public list<VG_Policy_Schedule_Asset__c> assetValues{get; set;}
    public List<RCWrapper> riskDetailList {get; set;}  
    Public list<AssetWrapper> AssetWrapperList {get;set;}
    Public list<Asset__c> AssetList {get;set;} 
    Public Map<String , List<LibraryWrapper>> ELWList{get;set;}
    Public Map<String , Boolean> selectAllMap{get;set;}  
    Public Map<String, Asset__c> assMap {get; set;}   
    public Map<id,Asset__c> assetMap{get; set;}  
    
    //public Map<id,Asset__c> assetMap{get; set;}
    public Map<id,VG_Policy_Schedule_Endorsement__c> pseTempMap{get;set;}
    public Map<id,VG_Policy_Schedule_Endorsement__c> pseMap{get;set;}
    public Map<id,VG_Policy_Schedule_Asset__c> psaMap{get;set;}
    
    Public Set<String> assetLookups{get;set;}
    Public Set<String> addedassetLookups{get;set;}
    Public set<String> proviceSet{get;set;}
    
    public String jsonData{get;set;}
    public Boolean endorsCheck{get;set;}
    Public List<csvFileWrapper> csvFileWrapperList{get;set;}
    public List<String> UnderwriterProducts {get; set;}
    public List<SelectOption> selectedCoveragesList {get; set;}
    Public Set<String> RRprovince {get;set;}

    public VG_Revise_VCLController(){
        psid= apexpages.currentpage().getparameters().get('Id');
        System.debug('ps::'+psid);
        MTAType=apexpages.currentpage().getparameters().get('MTAType');
        MTAStartDate=apexpages.currentpage().getparameters().get('MTAStartDate'); 
        seletedProrateoption  = apexpages.currentpage().getparameters().get('seletedProrateoption'); 
        ps=[select id,Name,VG_Bridge_Selected_Asset__c,VG_Rate_Change__c,VG_Volante_Entities__c,Policy__r.VG_Inception_Date__c,Policy__r.Name,Split_Type__c,Seleted_Prorate_Option__c,Policy__r.Insured__r.Name,VG_Province_List__c,Policy__r.VG_Expiry_Date__c,IsDeleted,CurrencyIsoCode,RecordTypeId,CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,SystemModstamp,LastViewedDate,LastReferencedDate,VG_IsTemp__c,VG_IsTempDelete__c,VG_Financials_Created__c,VG_Risk_Premium__c,Insured_Id__c,Declaration_Date__c,Product__c,Policy__c,VG_Plan_Rate__c,IPT_Percent__c,Premium_Adjustment__c,Endorsement_GWP__c,Levies__c,VG_Is_MTA__c,VG_MTA_Type__c,VG_MTA_Status__c,VG_MTA_Start_Date__c,VG_MTA_End_Date__c,VG_Current_Plan_Rate__c,VG_MTA_Cancellation_Date__c,MTA_Reason_for_Cancellation__c,VG_Declaration_Type__c,VG_Status__c,Net_Premium__c,VG_Declaration_Type_percent__c,VG_Fee_Income__c,VG_Adjustment_Reason__c,VG_Brokerage_Percent__c,VG_Pre_MTA_Expiry_Date__c,VG_Base_Policy__c,Base_Creation_Start_Date__c,Base_Creation_End_Date__c,Commission__c,Gross_Base_Premium__c,VG_MGA_Commission_Amount__c,VG_Technical_Model_Premium__c,Technical_UW_Premium__c,Risk_Premium_Pro__c,Endorsement_Premium_Pro__c,Limit__c,Attachment__c,Sum_Insured__c,ILF_Factor__c,ILF_Premium__c,Rate_On_Line__c,Rate_Per_Mil__c,Share__c,Underwriting_Premium__c,Premium_Adjustment_2__c,ORC__c,ORC_Amount__c,Account_Id__c,VG_VAT__c,VG_VAT_Amount__c,VG_Lloyds_Product__c,VG_Auto_acquisition_Threshold__c,VG_Extended_Reporting_Period_AP__c,ILF_Layer__c,VG_Retired_Directors_Additional_Premium__c,VG_Retired_Directors_Year__c,VG_Extended_Reporting_Period__c,Technical_Layer_Premium__c,Written_share__c,Gross_Written_Premium__c,Gross_or_Net_Premium__c,VG_Overider_Amount__c,VG_Overider_Percent__c,VG_Total_Layer_Premium__c,Transaction_GWP__c,Actual_GWP__c,IPT__c,VG_Brokerage_Amount__c,VG_Deductible__c,VG_Booked_Time__c,VG_Coverages__c,VG_Number_Of_vehicle__c,VG_Turn_Over__c,VG_Type_Of_Operation__c,VG_CREDIT_Augur_SCORE__c,VG_Exposure_Premium__c,VG_Experience_Premium__c,VG_Selected_Weight__c,VG_Net_Base_Premium__c,VG_Occupancy__c,VG_PD_Base_Rate__c,VG_BI_Base_Rate__c,VG_Machinery_Breakdown_Cover__c,VG_Machinery_Breakdown_BI_Cover__c,VG_Adjustment_Factor__c,VG_Adjusted_PD_Base_Rate__c,VG_Adjusted_BI_Base_Rate__c,VG_Witholding_Tax_Amount__c,VG_Reinsurance_Type__c,VG_Structure__c,VG_Sub_Structure__c,VG_Technical_Loss_Ratio__c,MID_Check_Box__c,VG_Capacity_Paper__c,VG_Payment_Due_Date__c from Policy_Schedule__c where id=:psid limit 1];
        policy=[select id, Name, CurrencyIsoCode,VG_Quoted_Time__c,Underwriter__c,RecordTypeId, RecordType.Name, Underwriter__r.Underwriter_Product__c,VG_Current_Insurer__r.BillingStreet,VG_Current_Insurer__r.BillingCity,VG_Current_Insurer__r.BillingState,VG_Current_Insurer__r.BillingPostalCode,Underwriter__r.Name,Underwriter__r.Title,Underwriter__r.Email,Underwriter__r.Phone,Broker_Contact__r.Phone,Insured__r.Phone,VG_Current_Insurer__c, Line_Of_Business__c,VG_Current_Insurer__r.Name,Insured__r.Name,Broker_Name__r.Name,Broker_Name__c,VG_Inception_Date__c, VG_Expiry_Date__c, VG_Aggregate_Limit__c, Deductible_or_Excess_Amount__c, VG_Prospect_Premium__c, Sum_Insured_Share__c from Policy__c where id=:ps.Policy__c limit 1];
        if(policy.Underwriter__c != null){
            //system.debug('check underwriter Product::'+pol.Underwriter__r.Underwriter_Product__c+'::'+pol);
            String underwriterProduct = policy.Underwriter__r.Underwriter_Product__c;
            UnderwriterProducts = new List<String>();
            UnderwriterProducts = Utilities.underwriterProduct(underwriterProduct);
            //system.debug('return:::'+UnderwriterProducts);
        }
        If(policy.RecordType.Name == 'VDL'){
            if(MTAType == null && ps.VG_MTA_Type__c == null)
                proRata=Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c))/365;
            else
                proRata=MTAStartDate != null ? Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(policy.VG_Expiry_Date__c))/365 : Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(policy.VG_Expiry_Date__c))/365;
        }
        If(policy.RecordType.Name == 'VCL')
            proRata = 1;
        
        If(MTAType != 'Revision of Cover' ){
            If(ps.Product__c != 'Motor')
                rc=[select id,Name,IsDeleted,VG_Reinstatement_Premiums__c,VG_Contract_Size__c,VG_Appetite_Risk__c,VG_Proposal_form_date__c,VG_Completion_Date__c,VG_Issue_Date__c,VG_Reason_for_Issue__c,CurrencyIsoCode,VG_Premium_Subject_to_Adjustment__c,VG_Minimum_and_Refund_Premium_Type__c,VG_Minimum_Premium_Currency__c,VG_Project_Insured__c,VG_Completed_Operations_Number_of_Months__c,VG_Estimated_Project_Costs__c,VG_Deposit_Premium__c,VG_Minimum_Premium__c,VG_Adjustment_Rate_Per_1000_of_Proj_Cost__c,VG_Adjustment_Basis__c,VG_Adjustment_Rate__c,VG_Minimum_and_Deposit_Premium__c,VG_Rating_Basis__c,Policy_Schedule__c,Drivers_Name__c,Drivers_License_Ban_Details__c,Drivers_Claims__c,Drivers_Medical_Conditions__c,Drivers_DOB__c,Drivers_Conviction_Points__c,Drivers_Convictions__c,VG_IsTemp__c,VG_IsTempDelete__c,VG_Layer__c,VG_No_of_Reinstatements__c,VG_Plan_Loss_Ratio__c,VG_Rate_Type__c,VG_Territorial_Scope__c,VG_Territorial_Limits__c,VG_Share__c,VG_Risk_End__c,VG_Risk_start__c,VG_Company_Type__c,VG_Company_Domicile__c,VG_Revenue__c,VG_Total_Assets__c,VG_Net_Profit__c,VG_Market_Cap__c,VG_Net_Equity__c,VG_Headcount__c,VG_Class_1_Employees__c,VG_Industry__c,VG_Profession__c,VG_Fees_Current_Year__c,VG_Fees_Year_1__c,VG_Fees_Year_2__c,VG_Fees_Year_3__c,VG_Income_Basis__c,VG_Claims_Notification_Threshold__c,VG_Cash_Loss_Limit__c,VG_First_Premium_Payment_Date__c,VG_Ceding_Commission_Type__c,VG_Additional_Information__c,VG_Policy_Details__c,VG_Dispute_Clause__c from Risk_Capture__c where Policy_Schedule__c=:psid limit 1];
            else
                rc = new Risk_Capture__c();
            psaMap=new Map<id,VG_Policy_Schedule_Asset__c>([select id,Name,VG_Province__c,Type_of_Limit__c,VG_Territory__c,VG_Class__c,VG_Driving_Record__c,VG_Sub_Type__c,VG_Rating_Group__c,VG_Unit_Count__c,VG_MA__c,VG_CL__c,VG_CM__c,VG_SP__c,VG_AP__c,VG_DC__c,VG_CL_Deductible__c,VG_CM_Deductible__c,VG_SP_Deductible__c,VG_TPL__c,VG_Sect_A__c,VG_BI__c,VG_PDT__c,VG_PDDC__c,VG_CL_Premium__c,VG_CM_Premium__c,VG_AP_Premium__c,VG_SP_Premium__c,VG_AB__c,VG_UA__c,VG_SEF_OPCE_44__c,VG_Opt_AB__c,IsDeleted,Type_of_use_or_description_of_automobile__c,VG_Model_Year__c,VG_Trade_Name_Make__c,VG_Comment__c,VG_BASIC_BENEFITS_Premium__c,VG_ALL_PERILS_DEDUCTIBLE__c,CurrencyIsoCode,RecordTypeId,CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,SystemModstamp,LastViewedDate,LastReferencedDate,VG_Premium__c,VG_Coverage__c,VG_Deductible_Type__c,VG_Rate_Per_Vehicle__c,VG_Number_of_Vehicles__c,VG_Vehicle_Type__c,VG_Policy_Schedule__c,VG_Deductible__c,VG_Use__c,VG_IsTemp__c,VG_IsTempDelete__c,VG_Technical_UW_Rate_Annual__c,Technical_UW_Premium__c,VG_Limit__c,VG_Sub_Aggregation__c,Asset__c,VG_Territorial_Limits__c,VG_AAD__c,VG_Aggregate_Precent__c,VG_Aggregate__c,VG_Deductible_Precent__c,VG_Deposit_Premium_Formula__c,VG_Deposit_Premium__c,VG_GNPI__c,VG_Limit_Precent__c,VG_Max_Rate__c,VG_Min_Rate__c,VG_Minimum_Premium_Formula__c,VG_Minimum_Premium__c,VG_No_Claims_Bonus_Value__c,VG_No_Claims_Bonus__c,VG_Provisional_Rate__c,VG_Rate_on_Income__c,VG_Return_Period_Entry__c,VG_Return_Period_Exit__c,VG_Risk_Premium__c,VG_Swing_Load__c,VG_Sub_limit__c,VG_PD_Deductible__c,VG_MB_PD_Deductible__c,VG_Adjusted_PD_Premium__c,VG_Adjusted_BI_Premium__c,VG_Building_Discount_Loading__c,VG_Net_PD_Premium__c,VG_Net_BI_Premium__c,VG_Net_MB_Premium__c,VG_Net_Risk_Premium__c,VG_Waiting_Period__c,VG_BI_Indemnity_Period__c,VG_MB_Waiting_Period__c,VG_MB_BI_Indemnity_Period__c,VG_Share__c,VG_Max_SI__c,VG_Avg_SI__c,VG_Coverage_Type__c,VG_Fee_Amounts__c,VG_Base_Premium_Rate__c,VG_Scheme_Name__c,VG_Binder_Ref__c,VG_Policy_No__c,VG_Insured_Name__c,VG_Address__c,VG_Country__c,VG_Vehicle_Make__c,VG_Vehicle_Model__c,VG_Payment_Ref__c,VG_Sum_Insured__c,VG_Gross_Written_Premium__c,VG_Brokerage__c,VG_Tax_on_Premium__c,VG_CH_Commission__c,VG_Bordereax_Date__c,VG_Policy_Cover_Start_Date__c,VG_Policy_Cover_End_Date__c,VG_Transaction_Type__c,VG_Payment_Terms__c,VG_Base_Premium__c,VG_Profession__c,VG_Declared_Value__c,VG_Perils__c,VG_Retention_Line__c,VG_Event_Limit__c,VG_Treaty_Limit__c,VG_Expected_Premium_Income__c,VG_Expected_Ceding_Commission__c,VG_Expected_Profit_Commission__c,VG_Ceding_Commission__c,VG_Min_Ceding_Commission__c,VG_Loss_Ratio_for_Min__c,VG_Max_Ceding_Commission__c,VG_Loss_Ratio_for_Max__c,VG_No_of_Surplus_Lines__c,VG_Retention__c,VG_Cession__c,VG_Perils_Text__c,VG_Information__c,VG_Retroactive_Date__c,VG_Policy_Basis__c,VG_Transaction_Effective_date__c,VG_Date_of_Birth__c,VG_Address2__c,VG_Address3__c,VG_Postcode__c,VG_Registration_Plate__c,VG_Sub_broker__c,VG_Risk_start__c,VG_Risk_End__c,VG_Attachment__c,VG_Written_Share__c,VG_Signed_Share__c,VG_CC_Information__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c=: psid]);
        }else{
            psaMap=new Map<id,VG_Policy_Schedule_Asset__c>();
            rc = new Risk_Capture__c();
        }
        If(MTAType!=null && MTAType!='')
            psaMap.clear();
        pseTempMap= new Map<id,VG_Policy_Schedule_Endorsement__c>();
        Product_Select=ps.Product__c;  
        LP_Select = ps.VG_Lloyds_Product__c;
        splitTypes = new List<SelectOption>();            
        if(policy.VG_Inception_Date__c.year() <= 2020){
            splitTypes.add(new SelectOption('','--None--'));           
        }
        splitTypes.add(new SelectOption('Non EEA','Non EEA'));
        If(MTAType != 'Revision of Cover'){     
            If(Product_Select == 'Motor')
                pseMap= new Map<id,VG_Policy_Schedule_Endorsement__c>([select id,Name,VG_Deductible__c,VG_Product__c,VG_Endorsement_Number__c,VG_Endorsement_Library_Id__c,VG_Sub_limit__c,VG_Premium__c,VG_Title__c,VG_Type__c, VG_Endorsement_Details__c  from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c=: PSID AND VG_Policy_Schedule__r.Product__c = 'Motor']);
            else
                pseMap= new Map<id,VG_Policy_Schedule_Endorsement__c>([select id,Name,VG_Deductible__c,VG_Product__c,VG_Endorsement_Number__c,VG_Endorsement_Details__c,VG_Endorsement_Library_Id__c,VG_Sub_limit__c,VG_Premium__c,VG_Title__c,VG_Type__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c=: PSID]);
        }else{
            pseMap= new Map<id,VG_Policy_Schedule_Endorsement__c>();
        }
        
        manualList=new List<VG_Policy_Schedule_Endorsement__c>();
        str='';
        addressofInsuredProject = '';
        
        DMLAlert = false;
        PropertyDMLALert = false;
        for(VG_Policy_Schedule_Endorsement__c pse: pseMap.values()){
            if(pse.VG_Endorsement_Library_Id__c == null){
                manualList.add(pse);
            }else{ 
                pseTempMap.put(pse.VG_Endorsement_Library_Id__c, pse);                                                  
            } 
        }   
        SYstem.debug('pseTempMap::'+pseTempMap.size()+'::'+pseTempMap.values());
        enableMList=true;
        endorsCheck = true;
        LibraryWrapper LW;
        LibraryWrapper LW1;
        existingEndorsements1 = new List<VG_Policy_Schedule_Endorsement__c>();
        existingEndorsements = new List<VG_Policy_Schedule_Endorsement__c>();
        LibraryWrapperList1 = new List<LibraryWrapper >();
        LibraryWrapperList = new List<LibraryWrapper >();
        assetValues=new List<VG_Policy_Schedule_Asset__c>();
        csvFileWrapperList = new List<csvFileWrapper>();
        ELWList = new Map<String, List<LibraryWrapper>>(); 
        selectAllMap = new Map<String , Boolean>(); 
        AssetWrapperList = new list<AssetWrapper>();
        CompanyType_Select = new List<SelectOption>();
        DO_Industry_Select = new List<SelectOption>(); 
        SectionNo_Select = new List<SelectOption>();
        NOIList=new List<Integer>();
        counterEnd=counter=0;
        Index='0';
        pmsg=false;
        errmsg=false;
        EnableReinstatement=False;
        addRRMode=False;          
        rrwList=new List<RRWrapper>();
        addedRRList = new List<RRWrapper>();
        createLoop=new List<Integer>();
        assetLookups=new Set<String>();
        addedassetLookups=new Set<String>();
        fileBody=blob.valueOf('');
        IsAssertInsertion = false;
        //assetMap = new Map<Id,Asset__c>([select id,Name,VG_Asset_Type__c,VG_Account__c from Asset__c]);
        String[] Assetids;
        If(ps.VG_Bridge_Selected_Asset__c!=null && ps.VG_Bridge_Selected_Asset__c!='')
            Assetids = ps.VG_Bridge_Selected_Asset__c.split(';');
        AssetWrapper asw ;
        If(Assetids!=null)
            AssetList = new List<Asset__c>([Select Id, Name, VG_Coverage__c,VG_Location__c,VG_Site_Name__c,VG_Combined_Address__c,VG_Street_Number__c,VG_Street_Name__c,VG_City__c,VG_Province_State__c,VG_Country__c,VG_Postal_Code__c,VG_Latitude__c,VG_Longitude__c,CurrencyIsoCode,VG_Construction__c,VG_Automatic_sprinklers__c,VG_Year_Built__c,VG_Fire_Protection__c,VG_Has_Sprinkler_System__c,VG_Last_Year_Structurally_Updated_YYYY__c,VG_Population__c,VG_Participation_Schedule__c,VG_Quoted_Fire_Premium__c,VG_Quoted_Fire_BI_Premium__c,VG_Quoted_Earthquake_Premium__c,VG_Quoted_Flood_Premium__c,VG_Quoted_Property_Other_Premium__c,VG_Quoted_BI_I_Premium__c,VG_Total_Quoted_Premium__c,VG_Fire_Premium_Adjustment__c,VG_Fire_BI_Premium_Adjustment__c,VG_Earthquake_Premium_Adjustment__c,VG_Flood_Premium_Adjustment__c,VG_Property_Other_Premium_Adjustment__c,VG_BI_I_Premium_Adjustment__c,VG_Total_Premium_Adjustment__c from Asset__c where id IN: Assetids]);
        else
            AssetList = new List<Asset__c>();
        for(Asset__c ass : AssetList){
            asw = new AssetWrapper();
            asw.ass = ass;
            asw.typeOfOperation = ps.VG_Type_Of_Operation__c;
            AssetWrapperList.add(asw);
        }
        If(MTAType!=null && MTAType!=''){
            psaMap.clear();           
            AssetWrapperList.clear();
            AssetList.clear();
            ps.VG_Bridge_Selected_Asset__c = '';
            if(Product_Select =='Property' || Product_Select =='Property BI&I')
                Assetids.clear();
        }
        netModelPremium=RiskPremium=sumAnnualPremium=uwPremium=techModelPremium=sumInsured=sharePercent=writtenShare=lmt=taxAmount=0;
        levies=brokerage=ExpectedLossRatio=brokerageAmount=grossWrittenPremium=grossWrittenPremium2 =feeIncome=actualPremium=adjustmentTechPremium=adjustment=0;
        pickListValuesList = new SelectOption[0];
        Province= new String[0];
        Schema.DescribeFieldResult statusFieldDescription  =  Schema.Endorsement_Library__c.VG_Province__c.getDescribe();
          for(Schema.Picklistentry picklistEntry: statusFieldDescription.getPicklistValues()){
                pickListValuesList.add(new SelectOption(pickListEntry.getValue(), pickListEntry.getLabel()));            
          } 
        TypeOfOperationList  = new SelectOption[0];
        Schema.DescribeFieldResult TypeOfOperation=  Schema.Account.Industry.getDescribe();
          for(Schema.Picklistentry picklistEntry: TypeOfOperation.getPicklistValues()){
                TypeOfOperationList.add(new SelectOption(pickListEntry.getValue(), pickListEntry.getLabel()));            
          }
        lpList = new List<SelectOption>();
        setLPList();
        Territorial_List= new List<SelectOption>();
        Territorial_List.add(new SelectOption('TBA1','TBA1'));
        Territorial_List.add(new SelectOption('TBA2','TBA2'));
        Territorial_List.add(new SelectOption('TBA3','TBA3'));
        
        RRCoverage_Select = new List<SelectOption>();
        RRCoverage_Select .add(new SelectOption('NA-GL/ PL excl Claims Made excl USA','NA-GL/ PL excl Claims Made excl USA'));
        RRCoverage_Select .add(new SelectOption('NC-GL/ PL Claims Made excl USA','NC-GL/ PL Claims Made excl USA'));
        RRCoverage_Select .add(new SelectOption('PB-Product Recall','PB-Product Recall'));
        RRCoverage_Select .add(new SelectOption('UA-GL/ PL excl Claims Made incl USA','UA-GL/ PL excl Claims Made incl USA'));
        RRCoverage_Select .add(new SelectOption('UC-GL/ PL Claims Made incl USA','UC-GL/ PL Claims Made incl USA'));
        RRCoverage_Select .add(new SelectOption('7T-Terrorism TPL','7T-Terrorism TPL'));
        
        RRLimit_Select =  new List<SelectOption>();
        RRLimit_Select.add(new SelectOption('Each Occurrence', 'Each Occurrence'));
        RRLimit_Select.add(new SelectOption('Each Person', 'Each Person'));
        RRLimit_Select.add(new SelectOption('Each Accident', 'Each Accident'));
        RRLimit_Select.add(new SelectOption('Each Claim', 'Each Claim'));
        RRLimit_Select.add(new SelectOption('Per Claim', 'Per Claim'));
        RRLimit_Select.add(new SelectOption('Products and Completed Operations Aggrgeate', 'Products and Completed Operations Aggrgeate'));
        RRLimit_Select.add(new SelectOption('Aggregate, Each claim and in the aggregate', 'Aggregate, Each claim and in the aggregate'));
        RRLimit_Select.add(new SelectOption('All perils', 'All perils'));
        
        RRDeductible_Select =  new List<SelectOption>();
        RRDeductible_Select.add(new SelectOption('Each Occurrence', 'Each Occurrence'));
        RRDeductible_Select.add(new SelectOption('Each Claim', 'Each Claim'));
        RRDeductible_Select.add(new SelectOption('Per Claimant', 'Per Claimant'));
        RRDeductible_Select.add(new SelectOption('Per Claim', 'Per Claim'));
        RRDeductible_Select.add(new SelectOption('Per Abduction', 'Per Abduction'));
        RRDeductible_Select.add(new SelectOption('As per Policy Coverages', 'As per Policy Coverages'));     
        
        CompanyType_Select.add(new SelectOption('--None--','--None--'));
        CompanyType_Select.add(new SelectOption('Public','Public'));
        CompanyType_Select.add(new SelectOption('Private','Private'));
        CompanyType_Select.add(new SelectOption('Not for Profit','Not for Profit'));
         
        totalFeeAmount=0;
        totalbasepremium=0;
        totalbasepremiumrate=0;
        
        productList  =  new List<SelectOption>();
        productList.add(new SelectOption('--None--', '--None--'));
        If(underwriterProducts == Null){
            If(policy.RecordType.Name == 'VDL'){
                productList.add(new SelectOption('Property', 'Property'));
                productList.add(new SelectOption('Marine', 'Marine'));
                productList.add(new SelectOption('Liability', 'Liability'));
            }else If(policy.RecordType.Name == 'VCL'){
                //productList.add(new SelectOption('Motor', 'Motor'));
                productList.add(new SelectOption('Property', 'Property'));
                productList.add(new SelectOption('Property BI&I', 'Property BI&I'));
                productList.add(new SelectOption('GL - Occurrence , Excluding USA', 'GL - Occurrence , Excluding USA'));
                productList.add(new SelectOption('GL - Occurrence, Including USA', 'GL - Occurrence, Including USA'));
                productList.add(new SelectOption('GL - Claims Made, Excluding USA', 'GL - Claims Made, Excluding USA'));
                productList.add(new SelectOption('GL - Claims Made, Including USA', 'GL - Claims Made, Including USA'));
                productList.add(new SelectOption('Umbrella - Occurrence, Excluding USA', 'Umbrella - Occurrence, Excluding USA'));
                productList.add(new SelectOption('Umbrella - Occurrence, Including USA', 'Umbrella - Occurrence, Including USA'));
                productList.add(new SelectOption('Umbrella - Claims Made, Excluding USA', 'Umbrella - Claims Made, Excluding USA'));
                productList.add(new SelectOption('Umbrella - Claims Made, Including USA', 'Umbrella - Claims Made, Including USA'));
                productList.add(new SelectOption('Excess - Occurrence, Excluding USA', 'Excess - Occurrence, Excluding USA'));
                productList.add(new SelectOption('Excess - Occurrence, Including USA', 'Excess - Occurrence, Including USA'));
                productList.add(new SelectOption('Excess - Claims Made, Excluding USA', 'Excess - Claims Made, Excluding USA'));
                productList.add(new SelectOption('Excess - Claims Made, Including USA', 'Excess - Claims Made, Including USA'));
                productList.add(new SelectOption('Wrap Up Primary (Canada only)', 'Wrap Up Primary (Canada only)'));
                productList.add(new SelectOption('Wrap Up Excess (Canada Only)', 'Wrap Up Excess (Canada Only)'));
            }
        }
        If(underwriterProducts != Null){   
            for(String s : UnderwriterProducts){
                If(policy.RecordType.Name == 'VCL'){
                    for(String p: Label.VCL_Products.split(';')){ 
                        if(p.equals(s))
                            productList.add(new SelectOption(s,s));
                    }
                }
                If(policy.RecordType.Name == 'VDL'){
                
                    for(String p: Label.VDL_Products.split(';')){ 
                        if(p.equals(s))
                            productList.add(new SelectOption(s,s));
                    }
                }
            }
        }
        
        riskDetailList = new List<RCWrapper>();
        RCcounter=0;
        //RCWrapper rcw = new RCWrapper();
        //riskDetailList.add(rcw);
        if(rc.VG_Additional_Information__c != null){
            aInfo=rc.VG_Additional_Information__c;
            String[] tempDetail=aInfo.split('<br>');
            System.debug('tempDetail::'+tempDetail.size());
            If(Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
               integer i=0;
               System.debug('tempDetail::'+tempDetail.size());
               while(i<tempDetail.size()){              
                    RCWrapper rcw=new RCWrapper();
                    rcw.Counter = string.valueOf(RCcounter);         
                    System.debug('tmp::'+tempDetail[i]);
                    String[] tmp=tempDetail[i].split(':');
                    String[] tmp1=tempDetail[i+1].split(':');
                    String[] tmp2=tempDetail[i+2].split(':');
                    String[] tmp3=tempDetail[i+3].split(':');
                    String[] tmp4=tempDetail[i+4].split(':');
                    String[] tmp5=tempDetail[i+5].split(':');
                    String[] tmp6=tempDetail[i+5].split(':');
                    if(tmp.size() > 1)
                        rcw.CA1 = tempDetail[i].split(':')[1];
                    else
                        rcw.CA1 = '';
                    System.debug('rcw.CA1::'+rcw.CA1+'::'+tmp.size()+tmp);
                    if(tmp1.size() > 1)
                        rcw.PA1 =tempDetail[i+1].split(':')[1];
                    else
                        rcw.PA1='';
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
                        rcw.UI1  = Decimal.valueOf('0'); 
                    System.debug('tmp6.size()::'+tmp6.size()+tempDetail[i+6]); 
                    try{                  
                        if(tmp6.size() > 1)       
                            rcw.PR1 =tempDetail[i+6].split(':')[1]!=null?tempDetail[i+6].split(':')[1]:'';
                        else
                            rcw.PR1 ='';
                    }catch(Exception e){
                        rcw.PR1 ='';
                    }
                    i=i+7;                     
                    RCcounter++;
                    riskDetailList.add(rcw);
                    
                }           
            }
        }
        if(rc.VG_Reinstatement_Premiums__c!= null){
            String[] NOI=rc.VG_Reinstatement_Premiums__c.split('<br>');
            EnableReinstatement=False;
            if(rc.VG_No_of_Reinstatements__c.isNumeric()){
                for(integer i = 0 ; i < Integer.valueOf(rc.VG_No_of_Reinstatements__c) ; i++){
                    createLoop.add(i);
                    system.debug('NOI ::'+NOI[i].split(':')[1]);
                    NOIList.add(Integer.valueOf(NOI[i].split(':')[1]));
                }
            }
        }
        System.debug('riskDetailList::'+riskDetailList);
        netModelPremium = ps.Net_Premium__c;
        RiskPremium = ps.Risk_Premium_Pro__c;
        lmt = ps.Limit__c;
        attachment=ps.Attachment__c;
        CapacityPaper=ps.VG_Capacity_Paper__c;
        layer = ps.ILF_Layer__c ;
        writtenShare=ps.Written_share__c ;
        sharePercent=ps.Share__c;
        actualPremium=ps.Actual_GWP__c;
        brokerage=ps.VG_Brokerage_Percent__c ;
        brokerageAmount=ps.VG_Brokerage_Amount__c;
        ExpectedLossRatio = ps.VG_Technical_Loss_Ratio__c;
        grossWrittenPremium2 = ps.Gross_Written_Premium__c;
        if(sharePercent !=0)
            grossWrittenPremium=grossWrittenPremium2 /(sharePercent/100);
        else
            grossWrittenPremium=0;
        adjustmentTechPremium=ps.Premium_Adjustment__c;
        adjustment=ps.Premium_Adjustment_2__c;
        feeIncome=ps.VG_Fee_Income__c;
        levies = ps.Levies__c;
        sumInsured=ps.Sum_Insured__c ;
        taxamount=ps.VG_Witholding_Tax_Amount__c;
        uwPremium=ps.Technical_UW_Premium__c ;
        techModelPremium=ps.VG_Technical_Model_Premium__c;
        GrossOrNet=ps.Gross_or_Net_Premium__c ;
        if(ps.Seleted_Prorate_Option__c == 'Flat'){
            RiskPremium = ps.Risk_Premium_Pro__c.setScale(2);
            //EndorsementPremium = ps.Endorsement_Premium_Pro__c;
        }
        RateChange = ps.VG_Rate_Change__c;
        selectedIds = ps.VG_Bridge_Selected_Asset__c;
        CompanyType = rc.VG_Company_Type__c;     
        IndustrySelected  = ps.VG_Type_Of_Operation__c;
        counter=counterEnd=0;
        Index='0';
        riskRatingList = new List<RRWrapper>();
        proviceSet = new set<String>();
        RRcounter=0;      
        RRCalc();
        String[] Provinces;
        Provinces = ((ps.VG_Province_List__c!=null?ps.VG_Province_List__c:'').split(';'));       
        Boolean Start = true;
        for(String Str : Provinces ) {
            System.debug('str::'+str);
            Province.add(str);       
            if(ps.Product__c == 'Motor'){
                proviceSet.add(str);
            }    
        }        
        System.debug('Province::'+Province+ps.VG_Province_List__c);    
        If(MTAType != 'Revision of Cover'){
            if( ps.Product__c!='Property' && ps.Product__c!='Property BI&I' && ps.Product__c!='Motor'){
                for(VG_Policy_Schedule_Asset__c psa : psaMap.values()){
                    RRWrapper RRW = new RRWrapper();
                    RRW.psa = psa;
                    RRW.counter = '0';
                    //RRW.assName=assetMap.get(psa.Asset__c).Name;
                    RRW.CoverageSelected=psa.VG_Coverage__c;
                    //RRW.TerritorialSelected=psa.VG_Territorial_Limits__c;
                    addressofInsuredProject  = psa.VG_Address__c;
                    riskRatingList.add(RRW);
                    RRcounter++;
                }
            }else if(ps.Product__c=='Property' || ps.Product__c =='Property BI&I' ){
                for(VG_Policy_Schedule_Asset__c psa : psaMap.values()){
                    RRWrapper RRW = new RRWrapper();
                    RRW.psa = psa;
                    //RRW.assName=assetMap.get(psa.Asset__c).Name;
                    RRW.psa.VG_Risk_start__c=policy.VG_Inception_Date__c;
                    RRW.psa.VG_Risk_End__c=policy.VG_Expiry_Date__c;           
                    RRW.counter = '0';
                    RRW.Premium=rrw.psa.VG_Premium__c;
                    RRW.sumInsured=rrw.psa.VG_Sum_Insured__c;
                    addedRRList.add(RRW);
                    RRcounter++;
                }           
            }else if(ps.Product__c=='Motor' ){
                for(VG_Policy_Schedule_Asset__c psa : psaMap.values()){
                    RRWrapper RRW = new RRWrapper();
                    RRW.psa = psa;
                    RRW.psa.VG_Premium__c = RRW.psa.VG_Premium__c;  
                    rrwList.add(RRW);
                    RRcounter++;
                } 
                System.debug('rrwList::'+rrwList+psaMap.values());          
            }
        }    

        If(MTAType == 'Revision of Cover'){
            adjustmentTechPremium = null; 
            adjustment = null;
            lmt = null;           
            attachment = null;
            writtenShare = null;
            brokerage = null;
            ps.IPT_Percent__c = null;
            ps.IPT__c = null;
            ExpectedLossRatio = null;
            RateChange = null;
            pickListValuesList.clear();
            proviceSet.clear();
        }
    }  
    
    Public Void generateReinstatement(){
        try{
            EnableReinstatement=True;
            createLoop.clear();
            NOIList.clear();
            if( rc.VG_No_of_Reinstatements__c.isNumeric()){
                for(integer i = 0 ; i < Integer.valueOf(rc.VG_No_of_Reinstatements__c) ; i++){
                    NOIList.add(0);
                    createLoop.add(i);
                }
            }
        }Catch(Exception e){
            showError(e);
        }
    } 
    
    public void setLPList(){      
        lpList.clear();
        lpList.add(new SelectOption('--None--', '--None--'));
        List<String> doLPList = new List<String>();
        If(policy.RecordType.Name == 'VDL')
            doLPList = Utilities.setLloydsProduct('VDL',Product_Select,null,null);
        else
            doLPList = Utilities.setLloydsProduct('VCL',Product_Select,null,null); 
        for(String s : doLPList){
            lpList.add(new SelectOption(s,s));            
        }
        System.debug('lpList::'+lpList); 
        
    }

    public void updateDeductible(){
        for(Integer i = 1; i < existingEndorsements1.size(); i++){
            existingEndorsements1[i].VG_Deductible__c = existingEndorsements1[0].VG_Deductible__c;
            system.debug('>>::'+ existingEndorsements1[i].VG_Deductible__c);
        }
    }
    public void updateSublimit(){
        for(Integer i = 1; i < existingEndorsements1.size(); i++){
            existingEndorsements1[i].VG_Sub_limit__c = existingEndorsements1[0].VG_Sub_limit__c;
        }
    }
    public void updateSublimitEndors(){
        for(Integer i = 1; i < existingEndorsements.size(); i++){
            existingEndorsements[i].VG_Sub_limit__c = existingEndorsements[0].VG_Sub_limit__c;
        }
    }
    public void updateDeductibleEndors(){
        for(Integer i = 1; i < existingEndorsements.size(); i++){
            existingEndorsements[i].VG_Deductible__c = existingEndorsements[0].VG_Deductible__c;
        }
    }
    
    public PageReference processuploadAsset(){
        try{
            csvFileWrapperList.clear();
            jsonData = '';
            if(fileBody  ==  null || fileBody  ==  blob.valueOf('')){
                System.debug('fileBody::'+fileBody); 
                pmsg = true;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Must select file.'));
                return null;
            }
            
            pmsg = false;
            PropertyDMLALert = false;
            System.debug('fileBody::'+DMLAlert+'::'+fileBody+'::'+blob.valueOf(''));
            if(fileBody !=  blob.valueOf('')){
                addedRRList.clear();
                AssetWrapperList.clear();
                csvFileWrapperList.clear();
                jsonData = '';
                PropertyDMLALert = True;               
            }
            if(PropertyDMLALert){
                if(!fileName.contains('.csv')){
                    System.debug('fileName::'+fileName);
                    pmsg = true;
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Please use CSV file format...'));
                    return null;
                }
                jsonData = Utilities.parseCSV(fileBody);
                system.debug('jsonData::'+jsonData);
                JSONParser parser = JSON.createParser(jsonData);
                
                while (parser.nextToken() != null) {
                    if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                        while (parser.nextToken() != null) {
                            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                                csvFileWrapper fileData = (csvFileWrapper)parser.readValueAs(csvFileWrapper.class);
                                csvFileWrapperList.add(fileData);
                                parser.skipChildren();
                            }
                        }
                    }
                }            
                assMap = new Map<String, Asset__c>();
                AssetWrapper asw;
                for(csvFileWrapper csv: csvFileWrapperList){
                    asw = new AssetWrapper();
                    asw.ass.VG_Location__c = csv.Location;
                    asw.ass.VG_Site_Name__c = csv.SiteName;
                    asw.ass.VG_Combined_Address__c = csv.CombinedAddress;
                    asw.ass.VG_Street_Number__c = csv.StreetNumber;
                    asw.ass.VG_Street_Name__c = csv.StreetName;
                    asw.ass.VG_City__c = csv.City;
                    asw.ass.VG_Province_State__c = csv.ProvinceState;
                    asw.ass.VG_Country__c = csv.Country;
                    asw.typeOfOperation = csv.TypeofOperation;
                    asw.ass.VG_Postal_Code__c = csv.PostalCodeZipCode;
                    asw.ass.VG_Latitude__c = csv.Latitude;
                    asw.ass.VG_Longitude__c = csv.Longitude;
                    asw.FloodZone = csv.FloodZone;
                    asw.EQHazard = csv.EQHazard;
                    asw.CrestaZone = csv.CrestaZone;
                    asw.AssetCurrency = csv.AssetCurrency;
                    asw.BuildingSI = csv.BuildingSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? (csv.BuildingSI.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.ContentsSI = csv.ContentsSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? (csv.ContentsSI.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.AnnualBusinessInterruptionSI = csv.AnnualBusinessInterruptionSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ?(csv.AnnualBusinessInterruptionSI.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.BIIndemnityPeriodmonths = csv.BIIndemnityPeriodmonths;
                    asw.TotalTIV = csv.TotalTIV;
                    asw.Occupancy = csv.Occupancy;
                    asw.ass.VG_Construction__c = csv.Constructiontype;
                    asw.Storeysabovegrade = csv.Storeysabovegrade;
                    asw.Storeysbelowgrade = csv.Storeysbelowgrade.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? (csv.Storeysbelowgrade.trim().replaceAll('[^a-zA-Z0-9]', '')):'0';
                    asw.ass.VG_Automatic_sprinklers__c = csv.Automaticsprinklers;
                    asw.FUSZone = csv.FUSZone;
                    asw.PDMFL = csv.PDMFL.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? (csv.PDMFL.trim().replaceAll('[^a-zA-Z0-9]', '')):'0';
                    asw.PDMFLPercent = (csv.PDMFLPercent!=null && csv.PDMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? (csv.PDMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.BIMFL = csv.BIMFL.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? (csv.BIMFL.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.BIMFLPercent = (csv.BIMFLPercent!=null && csv.BIMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? (csv.BIMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '')):'0'; 
                    asw.LloydsConstuctionCode = csv.LloydsConstuctionCode;
                    asw.LloydsOccupancyCode = csv.LloydsOccupancyCode;
                    asw.ass.VG_Year_Built__c = csv.YearBuilt;
                    asw.OccupancyByInsured = csv.OccupancyByInsured;
                    asw.OccupancyByOthers = csv.OccupancyByOthers;
                    asw.ass.VG_Fire_Protection__c = csv.FireProtection;
                    asw.ass.VG_Has_Sprinkler_System__c = csv.HasSprinklerSystem;
                    asw.CurrentYearRate = csv.CurrentYearRate;
                    asw.ExpiringRate = csv.ExpiringRate;
                    asw.IsEarthquakeShakeCovered = csv.IsEarthquakeShakeCovered;
                    asw.IsFloodCovered = csv.IsFloodCovered;  
                    asw.ass.VG_Last_Year_Structurally_Updated_YYYY__c = csv.LastYearStructurallyUpdatedyyyy ;
                    asw.ass.VG_Population__c =  csv.Population  ;
                    asw.ass.VG_Participation_Schedule__c =  csv.ParticipationSchedule;
                    
                    asw.TechnicalFirePremium = csv.TechnicalFirePremium; //(csv.TechnicalFirePremium!=null && csv.TechnicalFirePremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalFirePremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TechnicalFireBIPremium = csv.TechnicalFireBIPremium; //(csv.TechnicalFireBIPremium!=null && csv.TechnicalFireBIPremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalFireBIPremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TechnicalEarthquakePremium = csv.TechnicalEarthquakePremium; //(csv.TechnicalEarthquakePremium!=null && csv.TechnicalEarthquakePremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalEarthquakePremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TechnicalFloodPremium = csv.TechnicalFloodPremium; //(csv.TechnicalFloodPremium!=null && csv.TechnicalFloodPremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalFloodPremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TechnicalPropertyOtherPremium = csv.TechnicalPropertyOtherPremium; //(csv.TechnicalPropertyOtherPremium!=null && csv.TechnicalPropertyOtherPremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalPropertyOtherPremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TechnicalBIIPremium = csv.TechnicalBIIPremium; //(csv.TechnicalBIIPremium!=null && csv.TechnicalBIIPremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TechnicalBIIPremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    asw.TotalTechnicalPremium = csv.TotalTechnicalPremium; //(csv.TotalTechnicalPremium!=null && csv.TotalTechnicalPremium.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.TotalTechnicalPremium.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                    
                    asw.ass.Name = asw.ass.VG_Site_Name__c+', '+asw.ass.VG_Street_Number__c+', '+asw.ass.VG_City__c;
                    System.debug('Product_Select::'+Product_Select);  
                    If(Product_Select == 'Property BI&I'){  
                        System.debug('Product_Select::'+Product_Select+'::'+csv.TechnicalBIIPremium);           
                        asw.ass.VG_Coverage__c = (csv.TechnicalBIIPremium!=null && csv.TechnicalBIIPremium!=0 ? 'BI&I;':'');
                        System.debug('Coverage::'+asw.ass.VG_Coverage__c);
                    }else{
                        System.debug('Product_Select::'+Product_Select); 
                        asw.ass.VG_Coverage__c = (csv.TechnicalFirePremium!=null && csv.TechnicalFirePremium!=0 ? 'Fire;':'')+
                                                (csv.TechnicalFireBIPremium!=null && csv.TechnicalFireBIPremium!=0 ? 'Fire BI;':'')+
                                                (csv.TechnicalEarthquakePremium!=null && csv.TechnicalEarthquakePremium!=0 ? 'Earthquake;':'')+
                                                (csv.TechnicalFloodPremium!=null && csv.TechnicalFloodPremium!=0 ? 'Flood;':'')+
                                                (csv.TechnicalPropertyOtherPremium!=null && csv.TechnicalPropertyOtherPremium!=0 ? 'Property Other;':'');                                         
                    }
                                                   
                    assMap.put(asw.ass.Name, asw.ass); 
                    System.debug('assMap::'+asw.ass.VG_Coverage__c+'::'+assMap.values());
                    If(asw.ass.VG_Coverage__c!=null && asw.ass.VG_Coverage__c!=''){
                        System.debug('coverage::'+assMap.values());
                        RRWrapper rrw;
                        for(String s : asw.ass.VG_Coverage__c.split(';')){
                            rrw = new RRWrapper();
                            rrw.assName = asw.ass.Name;
                            rrw.psa.VG_Flood_Zone__c = csv.FloodZone;
                            rrw.psa.VG_EQ_Hazard__c = csv.EQHazard;
                            rrw.psa.VG_Cresta_Zone__c = csv.CrestaZone;
                            rrw.psa.CurrencyIsoCode = csv.AssetCurrency;
                            rrw.psa.VG_Occupancy__c = csv.Occupancy;   
                            rrw.psa.VG_FUS_Zone__c = csv.FUSZone;
                            rrw.psa.VG_Occupancy_By_Insured__c = csv.OccupancyByInsured;
                            rrw.psa.VG_Occupancy_By_Others__c = csv.OccupancyByOthers; 
                            rrw.psa.VG_Current_Year_Rate__c = csv.CurrentYearRate;
                            rrw.psa.VG_Expiring_Rate__c = csv.ExpiringRate;                                       
                            rrw.psa.VG_Building_SI__c = csv.BuildingSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.BuildingSI.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_Contents_SI__c = csv.ContentsSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.ContentsSI.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_Total_Business_Interruption_SI__c = csv.AnnualBusinessInterruptionSI.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.AnnualBusinessInterruptionSI.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_BI_Indemnity_Period__c = csv.BIIndemnityPeriodmonths.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.BIIndemnityPeriodmonths.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_Total_TIV__c = csv.TotalTIV.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.TotalTIV.trim().replaceAll('[^a-zA-Z0-9]', '')):0;                
                            rrw.psa.VG_Storeys_above_grade__c = csv.Storeysabovegrade.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.Storeysabovegrade.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_Storeys_below_grade__c = csv.Storeysbelowgrade.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.Storeysbelowgrade.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_PD_MFL__c = csv.PDMFL.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.PDMFL.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_PD_MFL_Percent__c = (csv.PDMFLPercent!=null && csv.PDMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.PDMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_BI_MFL__c = csv.BIMFL.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.BIMFL.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_BI_MFL_Percent__c = (csv.BIMFLPercent!=null && csv.BIMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '') !='') ? Decimal.valueOf(csv.BIMFLPercent.trim().replaceAll('[^a-zA-Z0-9]', '')):0; 
                            rrw.psa.VG_Lloyds_Constuction_Code__c = csv.LloydsConstuctionCode.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.LloydsConstuctionCode.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_Lloyd_s_Occupancy_Code__c = csv.LloydsOccupancyCode.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.LloydsOccupancyCode.trim().replaceAll('[^a-zA-Z0-9]', '')):0;
                            rrw.psa.VG_Coverage__c = s; 
                            If(Product_Select == 'Property BI&I'){
                                if(s == 'BI&I')
                                    rrw.psa.VG_Premium__c = csv.TechnicalBIIPremium;
                            }else{
                                if(s == 'Fire')
                                    rrw.psa.VG_Premium__c = csv.TechnicalFirePremium;
                                else if(s == 'Fire BI')
                                    rrw.psa.VG_Premium__c = csv.TechnicalFireBIPremium;
                                else if(s == 'Earthquake')
                                    rrw.psa.VG_Premium__c = csv.TechnicalEarthquakePremium;
                                else if(s == 'Flood')
                                    rrw.psa.VG_Premium__c = csv.TechnicalFloodPremium;
                                else if(s == 'Property Other')
                                    rrw.psa.VG_Premium__c = csv.TechnicalPropertyOtherPremium;
                            }
                            System.debug('rrw.psa.VG_Premium__c::'+rrw.psa.VG_Premium__c);
                            rrw.psa.CurrencyIsoCode = policy.CurrencyIsoCode; 
                            If(policy.RecordType.Name == 'VDL')
                                rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VDL').getRecordTypeId();                              
                            else
                                rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();      
                        addedRRList.add(rrw);
                        }
                    }
                    asw.ass.VG_Quoted_Fire_Premium__c = csv.QuotedFirePremium ;
                    asw.ass.VG_Quoted_Fire_BI_Premium__c  = csv.QuotedFireBIPremium ;
                    asw.ass.VG_Quoted_Earthquake_Premium__c = csv.QuotedEarthquakePremium ;
                    asw.ass.VG_Quoted_Flood_Premium__c = csv.QuotedFloodPremium ;
                    asw.ass.VG_Quoted_Property_Other_Premium__c = csv.QuotedPropertyOtherPremium ;
                    asw.ass.VG_Quoted_BI_I_Premium__c = csv.QuotedBIIPremium ;
                    asw.ass.VG_Total_Quoted_Premium__c = csv.TotalQuotedPremium ;
                    asw.ass.VG_Fire_Premium_Adjustment__c = csv.FirePremiumAdjustment ;
                    asw.ass.VG_Fire_BI_Premium_Adjustment__c = csv.FireBIPremiumAdjustment ;
                    asw.ass.VG_Earthquake_Premium_Adjustment__c = csv.EarthquakePremiumAdjustment ;
                    asw.ass.VG_Flood_Premium_Adjustment__c = csv.FloodPremiumAdjustment ;
                    asw.ass.VG_Property_Other_Premium_Adjustment__c = csv.PropertyOtherPremiumAdjustment ;
                    asw.ass.VG_BI_I_Premium_Adjustment__c = csv.BIIPremiumAdjustment ;
                    asw.ass.VG_Total_Premium_Adjustment__c = csv.TotalPremiumAdjustment;
                    //asw.ass.Name = asw.ass.VG_Site_Name__c+', '+asw.ass.VG_Street_Number__c+', '+asw.ass.VG_City__c;                
                    AssetWrapperList.add(asw);
                    System.debug('asw::'+asw.ass.VG_Coverage__c+'::'+asw.ass.Name);
                     
                }             
            }
            IndustrySelected = AssetWrapperList.get(0).typeOfOperation;
        }catch(Exception e){       
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Error ::'+e));
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            return null;
        }
        return null;
    }
    
    public PageReference cancel(){
        return new PageReference('/'+psid);
    }
    public PageReference gotostep1(){
        
        return new PageReference('/apex/VG_Revise_VCL_Step_1');
    }
    public PageReference gotostep2(){
        RRCoverage_Select  =  new List<SelectOption>();        
        if(Product_Select != 'Wrap Up Primary (Canada only)' && Product_Select != 'Wrap Up Excess (Canada Only)'){
            RRCoverage_Select.add(new SelectOption('General Liability', 'General Liability'));
            RRCoverage_Select.add(new SelectOption('Products Completed Operations', 'Products Completed Operations'));
        }else if(Product_Select == 'Wrap Up Primary (Canada only)' || Product_Select == 'Wrap Up Excess (Canada Only)'){
            RRCoverage_Select.add(new SelectOption('Wrap Up Liability', 'Wrap Up Liability'));
            RRCoverage_Select.add(new SelectOption('Products Completed Operations', 'Products Completed Operations'));
        }
        if(Product_Select  == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product...')); 
            return null;
        }
        if(LP_Select == '--None--' || LP_Select == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
            return null;  
        }else{
            return new PageReference('/apex/VG_Revise_VCL_Step_2');
        }
    }
    public PageReference gotostep2a(){
    if(Product_Select  == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product...')); 
            return null;
        }
        if(LP_Select == '--None--' || LP_Select == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
            return null;  
        }
        if(Product_Select == 'Motor'){
            RRCoverage_Select .add(new SelectOption('NA-GL/ PL excl Claims Made excl USA', 'NA-GL/ PL excl Claims Made excl USA'));
            RRCoverage_Select .add(new SelectOption('NC-GL/ PL Claims Made excl USA', 'NC-GL/ PL Claims Made excl USA'));
            RRCoverage_Select .add(new SelectOption('PB-Product Recall', 'PB-Product Recall'));
            RRCoverage_Select .add(new SelectOption('UA-GL/ PL excl Claims Made incl USA', 'UA-GL/ PL excl Claims Made incl USA'));
            RRCoverage_Select .add(new SelectOption('UC-GL/ PL Claims Made incl USA', 'UC-GL/ PL Claims Made incl USA'));
            RRCoverage_Select .add(new SelectOption('7T-Terrorism TPL', '7T-Terrorism TPL'));
        
        }
        return new PageReference('/apex/VG_Revise_VCL_Step_2a');
    }
    public PageReference gotostep2c(){
    if(Product_Select  == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product...')); 
            return null;
        }
        System.debug('Product_Select::'+Product_Select);
        if(LP_Select == '--None--' || LP_Select == null ){
            if(Product_Select == 'Property BI&I'){
                LP_Select = 'BI&I';
            }else{
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
                return null;
            }  
        }  
        PropertyDMLALert = false;
        System.debug('addedRRList::'+addedRRList.size());
        return new PageReference('/apex/VG_Revise_VCL_Step_2c');
    }
    public PageReference gotostep2b(){
        
        try{  
            // proviceSet = new set<String>();
            DMLAlert = false;
            if(fileBody !=  blob.valueOf('')){
                rrwList.clear();
                csvFileWrapperList.clear();
                jsonData = '';
                DMLAlert = True;               
            }
            if(DMLAlert){
                jsonData = Utilities.parseCSV(fileBody);
                system.debug('jsonData::'+jsonData);
                JSONParser parser = JSON.createParser(jsonData);
                
                while (parser.nextToken() != null) {
                    if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                        while (parser.nextToken() != null) {
                            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                                csvFileWrapper fileData = (csvFileWrapper)parser.readValueAs(csvFileWrapper.class);
                                //system.debug('Size of list items::' + fileData);
                                csvFileWrapperList.add(fileData);
                                parser.skipChildren();
                            }
                        }
                    }
                }
                //system.debug('csvFileWrapperList::'+csvFileWrapperList.size());
                //system.debug('list 4::'+csvFileWrapperList.get(4));
                RRWrapper rrw;
                Integer i = 0;
                csvFileWrapper[] cvwrapperEndrose = new csvFileWrapper[]{};
                
                Map<String, Decimal> covMap= new Map<String, Decimal>();
                    cvwrapperEndrose.add(csvFileWrapperList.get(3)); // for endrosment
                //system.debug('cvwrapper::'+cvwrapperEndrose);
                for(csvFileWrapper csv: csvFileWrapperList){
                    System.debug('csv.Prov::'+csv.Prov.trim()+'::'+ps.VG_Province_List__c);                    
                    If(csv.Prov.trim()!= ps.VG_Province_List__c){
                        pmsg = true;
                        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please upload '+ps.VG_Province_List__c +' Only'));   
                        return null; 
                    }
                    proviceSet.add(csv.Prov.trim());
                }
                
                for(csvFileWrapper cv: cvwrapperEndrose){
                    system.debug('cv::'+cv.Endorse);
                    EndorsementPremium = Decimal.valueOf(cv.Endorse.trim().replaceAll('[^a-zA-Z0-9]', ''));
                    RiskPremium = Decimal.valueOf(cv.Total.trim().replaceAll('[^a-zA-Z0-9]', '')) - EndorsementPremium;
                }
                
                for(csvFileWrapper csv: csvFileWrapperList){

                    covMap= new Map<String, Decimal>();
                    covMap.put('TPLManual',  csv.TPLManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.TPLManual.trim().replaceAll('[^a-zA-Z0-9]', '')) : null);
                    covMap.put('SectAManual',  csv.SectAManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.SectAManual.trim().replaceAll('[^a-zA-Z0-9]', '')):null);
                    covMap.put('BIManual', csv.BIManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.BIManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('PDTManual', csv.PDTManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.PDTManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('PDDCManual', csv.PDDCManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.PDDCManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('CLManual', csv.CLManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.CLManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('CMManual', csv.CMManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.CMManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('APManual', csv.APManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.APManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('SPManual', csv.SPManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.SPManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('ABManual', csv.ABManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.ABManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('UAManual', csv.UAManual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.UAManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    covMap.put('SEF44Manual', csv.SEF44Manual.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.SEF44Manual.trim().replaceAll('[^a-zA-Z0-9]', '')) :null);
                    System.debug('map::'+covMap);

                    for(String cov: covMap.Keyset()){
                        if(covMap.get(cov) != null){
                            rrw = new RRWrapper();
                            rrw.psa.VG_Province__c = csv.Prov.trim();
                            rrw.psa.VG_Territory__c = csv.STATTerritory;
                            rrw.psa.VG_Vehicle_Type__c = csv.VehType;
                            rrw.psa.VG_Driving_Record__c = csv.DrivingRecord;
                            rrw.psa.VG_CL_Deductible__c = csv.DedCL.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.DedCL.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_CM_Deductible__c = csv.DedCM.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.DedCM.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_SP_Deductible__c = csv.DedSP.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.DedSP.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Unit_Count__c = csv.Unit.trim().replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.Unit.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_PDDC_Deductible__c = csv.DedPDDC.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.DedPDDC.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Endorsement_Premium__c = csv.ENDORSEManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.ENDORSEManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Surcharge_Premium__c = csv.SURCHARGEManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.SURCHARGEManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_OPT_AB_Premium__c = csv.OPTABManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.OPTABManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Manual_Premium__c = csv.TotalManual.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.TotalManual.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Rate_Group_Accident_Benefits__c = csv.RGAB.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.RGAB.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.VG_Rate_Group_Comprehenisve__c = csv.RGCM.replaceAll('[^a-zA-Z0-9]', '') !='' ? Decimal.valueOf(csv.RGCM.trim().replaceAll('[^a-zA-Z0-9]', '')) :0;
                            rrw.psa.Rate_Group_Collission_Direct_Compensatio__c = csv.RGCLDC.replaceAll('[^a-zA-Z0-9//s]', '') !='' ? String.valueOf(csv.RGCLDC.trim().replaceAll('[^a-zA-Z0-9//s]', '')) :'0';
                            rrw.psa.Rate_Group_Manufacturer_Suggested_Retail__c = csv.RGMSRP.replaceAll('[^a-zA-Z0-9//s]', '') !='' ? String.valueOf(csv.RGMSRP.trim().replaceAll('[^a-zA-Z0-9//s]', '')) :'0';
                            // rrw.psa.VG_Coverage__c = String.valueOf(csv.NA);
                            rrw.counter = String.valueOf(i++);
                            System.debug('rrw::'+ cov+ '::'+ covMap.get(cov));
                            rrw.psa.VG_Premium__c = covMap.get(cov);
                            rrw.psa.VG_Coverage__c = cov;
                            // RRprovince.add(rrw.psa.VG_Province__c);
                            // System.debug('rrwList::'+ RRprovince+ '::'+ rrw.psa.VG_Premium__c);
                            rrwList.add(rrw);
                        }
                    }
                }
            }
            pickListValuesList.clear();
            for(string prov: proviceSet){
                system.debug('prov::'+prov);
                if(prov == 'ON')
                    pickListValuesList.add(new SelectOption('ON', 'Ontario'));
                else if(prov == 'NB')
                    pickListValuesList.add(new SelectOption('NB', 'New Brunswick'));
                else if(prov == 'PQ')
                    pickListValuesList.add(new SelectOption('PQ', 'Quebec'));
                else if(prov == 'AB')
                    pickListValuesList.add(new SelectOption('AB', 'Alberta'));
                else if(prov == 'NS')
                    pickListValuesList.add(new SelectOption('NS', 'Nova Scotia'));
                else if(prov == 'PE')
                    pickListValuesList.add(new SelectOption('PE', 'Prince Edward Island'));
                else if(prov == 'NF')
                    pickListValuesList.add(new SelectOption('NF', 'New foundland'));
                else if(prov == 'YK')
                    pickListValuesList.add(new SelectOption('YK', 'Yukon'));
                else if(prov == 'NW')
                    pickListValuesList.add(new SelectOption('NW', 'NW'));
                else if(prov == 'NU')
                    pickListValuesList.add(new SelectOption('NU', 'Nunavut'));
                // else if(prov == '')
                //     pickListValuesList.add(new SelectOption());
                // else if(prov == '')
                //     pickListValuesList.add(new SelectOption());
                // else if(prov == '')
                //     pickListValuesList.add(new SelectOption());
                // else if(prov == '')
                //     pickListValuesList.add(new SelectOption());
            }
            system.debug('EndorsementPremium::'+EndorsementPremium);
            system.debug('pickListValuesList::'+pickListValuesList);
            if(EndorsementPremium !=null){
                VG_Policy_Schedule_Endorsement__c tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Premium__c  = EndorsementPremium;
                tempEndsmt.VG_Endorsement_Number__c = 'Endorsement Premium';
                tempEndsmt.VG_Sub_limit__c = 0;
                tempEndsmt.VG_Type__c = 'Endorsements';
                tempEndsmt.CurrencyISOCode  =  policy.CurrencyIsoCode;
                endorsCheck = false;
                // existingEndorsements.add(tempEndsmt);
            }else{
                endorsCheck = true;
            }
            system.debug('existingEndorsements::'+existingEndorsements);
            DMLAlert = True;
            System.debug('RRWLIst::'+rrwList);
        }catch(Exception e){       
           ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error ::'+e));
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
           return null;
        }
        System.debug('RRWLIst::'+rrwList);
        return new PageReference('/apex/VG_Revise_VCL_Step_2b');
        //return null;
    }
    public PageReference gotostep3(){
        sumAnnualPremium=0;
        for(RRWrapper rrw: riskRatingList){ 
            sumAnnualPremium=(sumAnnualPremium+(rrw.psa.VG_Premium__c !=null ? rrw.psa.VG_Premium__c:0)).setScale(2);
        }
        return new PageReference('/apex/VG_Revise_VCL_Step_3');
    }
    public PageReference gotostep4(){  
        ELWList = new Map<String, List<LibraryWrapper>>();   
        Map<String, String> propertyCoverageMap = new Map<String, String>();
        If(PropertyDMLALert){
            Asset__c ass ;
            AssetList = new list<Asset__c>();
            for(AssetWrapper asw: AssetWrapperList){
                    ass = new Asset__c();
                    ass.id = null;
                    ass = asw.ass;
                    ass.VG_Account__c = policy.Insured__c;                
                    AssetList.add(ass);                                                                                   
            }
        }
        System.debug('AssetWrapperList::'+AssetList.size());
        if(!AssetWrapperList.isEmpty()){
            for(AssetWrapper asw: AssetWrapperList){
                if(asw.ass.VG_Coverage__c != null){
                    for(String s : asw.ass.VG_Coverage__c.split(';')){
                        if(s != null && s != ''){
                            propertyCoverageMap.put(s, s);
                        }
                    }
                }
            }
        } 
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pse: existingEndorsements1){
            if(!tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                tmpPSEMap.put(pse.VG_Endorsement_Library_Id__c, pse);
            }
        }    
        if(Product_Select == 'General and Product Liability'){
            if(riskRatingList.IsEmpty()){
               ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please add atleast one Risk Rating to the policy schedule..'));   
               return null;
            }
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c=rr.CoverageSelected;   
                //rr.psa.VG_Territorial_Limits__c= rr.TerritorialSelected;
            }            
        }
        
        if(!existingEndorsements1.IsEmpty()){
            existingEndorsements1.clear();
        }
        
        List<String> productlist = new List<String>();       
        If(Product_Select =='GL - Occurrence, Excluding USA' || Product_Select =='GL - Occurrence, Including USA' || Product_Select =='GL - Claims Made, Excluding USA' || Product_Select =='GL - Claims Made, Including USA'  || Product_Select =='Wrap Up Primary (Canada only)'  || Product_Select =='Wrap Up Excess (Canada Only)' || Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
             productlist.add('Except Motor and Property');
        }else If(Product_Select =='Motor'){
            productlist.add('Motor');
        }else if(Product_Select == 'Property' || Product_Select == 'Property BI&I'){
            selectedCoveragesList  =  new List<SelectOption>();
            If(propertyCoverageMap.keySet()!=null){
                for(String s: propertyCoverageMap.keySet()){
                    selectedCoveragesList.add(new SelectOption(s, s));
                }
            } 
            productlist.add(Product_Select);                                       
        }    
        ElList1=[select id,Name,Endorsement_Title__c,VG_Coverage__c,Text__c,Type__c,VG_Product__c,VG_Province__c from Endorsement_Library__c where VG_Product__c IN:productlist AND Type__c=:'Sub-limits' AND RecordType.Name =: policy.RecordType.Name ORDER By Name ASC];         
        LibraryWrapperList1.clear();       
        for(Endorsement_Library__c EL1 : ElList1){            
            LW1  =  new LibraryWrapper();
            LW1.EL  =  EL1;  
            LW1.coverage = EL1.VG_Coverage__c;          
            //LW1.isSelected  =  False;
            if(pseTempMap.containsKey(EL1.id)) { 
                LW1.isSelected  =  True;
            }
            if(tmpPSEMap.containsKey(EL1.id)) { 
                LW1.isSelected  =  True;
            }                        
            LibraryWrapperList1.add(LW1); 
            selectAllMap.put(EL1.VG_Coverage__c, false);
        }
        
        for(LibraryWrapper l: LibraryWrapperList1){
            List<LibraryWrapper> tempcoverages = (ELWList.get(l.coverage) != null ? ELWList.get(l.coverage) : new List<LibraryWrapper>());
            tempcoverages.add(l);
            ELWList.put(l.coverage, tempcoverages);
            System.debug('ELWList::'+ELWList.keySet());
        }       
        return new PageReference('/apex/VG_Revise_VCL_Step_4');
    }
    public void CheckAll(){
        Boolean updatedValue = selectAllMap.get(IndexVal)? true: false;
        for(LibraryWrapper LW : LibraryWrapperList1){ 
            System.debug('isCheck::'+'::'+IndexVal);            
            LW.isSelected = updatedValue;
            System.debug('isCheck::'+IndexVal+'::'+LW.isSelected);
        }
        system.debug('LibraryWrapperList1::'+LibraryWrapperList1);
    }  
    
    
    public PageReference gotostep4b(){
        system.debug('inside::');
        Map<Id,VG_Policy_Schedule_Endorsement__c> tmpPSEMap=new Map<Id,VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements1){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c,pe);
        }
        existingEndorsements1.clear();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        for(LibraryWrapper LW:LibraryWrapperList1){
            if(LW.isSelected){
                tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Library_Id__c = LW.EL.Id;
                tempEndsmt.Endorsement_Library_Id__c = LW.EL.Id;                               
                tempEndsmt.VG_Title__c = LW.EL.Endorsement_Title__c;                 
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.id=pseTempMap.get(LW.EL.Id).id;
                if(pseTempMap.containsKey(LW.EL.Id) )
                    tempEndsmt.VG_Premium__c = pseTempMap.get(LW.EL.Id).VG_Premium__c;
                else if(tmpPSEMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Premium__c = tmpPSEMap.get(LW.EL.Id).VG_Premium__c; 
                else
                    tempEndsmt.VG_Premium__c =0;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Sub_limit__c = pseTempMap.get(LW.EL.Id).VG_Sub_limit__c;
                else if(tmpPSEMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Sub_limit__c = tmpPSEMap.get(LW.EL.Id).VG_Sub_limit__c;
                else
                    tempEndsmt.VG_Sub_limit__c =0;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Deductible__c = pseTempMap.get(LW.EL.Id).VG_Deductible__c;
                else if(tmpPSEMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Deductible__c = tmpPSEMap.get(LW.EL.Id).VG_Deductible__c;
                else
                    tempEndsmt.VG_Deductible__c =  0;                
                //tempEndsmt.Name = PSName + '/PE/' + counterEnd;
                tempEndsmt.VG_Endorsement_Number__c = LW.EL.Name;
                tempEndsmt.VG_Type__c=LW.EL.Type__c;
                tempEndsmt.VG_IsTempDelete__c = False;
                tempEndsmt.VG_IsTemp__c = True;
                if(MTAType == 'Revision of Cover'){
                    tempEndsmt.VG_Premium__c =0;
                    tempEndsmt.VG_Sub_limit__c =0;
                }
                counterEnd++;
                existingEndorsements1.add(tempEndsmt);
            }
        }
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements1){
            if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c != 0){
                    pse.VG_Premium__c=tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                }
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c != 0){
                    pse.VG_Sub_limit__c=tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                }
            }
        }
        if(existingEndorsements1.IsEmpty()){
            counterEnd = 0;
        }else{
            counterEnd = existingEndorsements1.size();    
        }
       return new PageReference('/apex/VG_Revise_VCL_Step_4b');
    }
    public PageReference gotostep4c(){       
        return new PageReference('/apex/VG_Revise_VCL_Step_4c');
    }
    public PageReference gotostep5(){
        system.debug('existingEndorsements::'+existingEndorsements);
        if(endorsCheck){
            if(!existingEndorsements.IsEmpty()){
                existingEndorsements.clear();
                system.debug('existingEndorsements::'+existingEndorsements);
            }
        }
        
        System.debug('Province::'+Province);
        if(Product_Select == 'General and Product Liability'){
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c=rr.CoverageSelected;   
                //rr.psa.VG_Territorial_Limits__c= rr.TerritorialSelected; 
            }
        }
         Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
            if(pe.VG_Endorsement_Library_Id__c  !=  null && !pseTempMap.containsKey(pe.VG_Endorsement_Library_Id__c))
                tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
                System.debug('tmpPSEMap::'+tmpPSEMap.size()+'::'+pe.VG_Title__C+'::'+pe.VG_Endorsement_Library_Id__c);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Endorsement_Library_Id__c  ==  null)
                manualList.add(pse);
                System.debug('manualList::'+manualList.size()+'::'+pse.Name);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:pseTempMap.values()){
            if(manualList.IsEmpty()){
                if(pse.VG_Endorsement_Library_Id__c  ==  null){
                    pse.VG_IsTempDelete__c  = false;
                    manualList.add(pse);
                }
                    
            }else{
                for(VG_Policy_Schedule_Endorsement__c pse1:existingEndorsements){
                    if(pse.Name  !=  pse1.Name && pse1.Name  !=  null && !(new Set<VG_Policy_Schedule_Endorsement__c>(manualList)).contains(pse1)){
                        manualList.add(pse);
                        System.debug('manualList::'+manualList.size()+'::'+pse.Name);
                    }
                }
            }
        }       
        System.debug('tmpPSEMap::'+tmpPSEMap);
        System.debug('manualList::'+manualList);
        //String products;
        If(Product_Select =='GL - Occurrence , Excluding USA' || Product_Select =='GL - Occurrence, Including USA' || Product_Select =='GL - Claims Made, Excluding USA' || Product_Select =='GL - Claims Made, Including USA'  || Product_Select =='Wrap Up Primary (Canada only)'  || Product_Select =='Wrap Up Excess (Canada Only)' || Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
            products = 'Liability';
        }else{
            products = Product_Select;
        }
        If(Product_Select == 'Motor'){
            ElList = [select id, Name, Endorsement_Title__c, Type__c,VG_Province__c from Endorsement_Library__c where  RecordType.Name  = : policy.RecordType.Name AND Type__c = :'Endorsements' AND VG_Product__c=:products AND VG_Province__c IN:Province  ORDER By VG_Province__c ASC];
        }else{
            ElList = [select id, Name, Endorsement_Title__c, Text__c, Type__c,VG_Province__c from Endorsement_Library__c where  RecordType.Name  = : policy.RecordType.Name AND Type__c = :'Endorsements' AND VG_Product__c=:products ORDER By Name ASC];
        }
        LibraryWrapperList.clear();
        for(Endorsement_Library__c EL : ElList){            
            LW = new LibraryWrapper();
            LW.EL = EL;            
            LW.isSelected = False;
            if(pseTempMap.containsKey(EL.id)) { 
                LW.isSelected = True;
            }
            if(tmpPSEMap.containsKey(EL.id)) { 
                LW.isSelected = True;
            }                      
            LibraryWrapperList.add(LW); 
        }
        //endorsCheck = false;
        return new PageReference('/apex/VG_Revise_VCL_Step_5');
    }
     
    public PageReference gotostep5b(){
        system.debug('existingEndorsements::'+existingEndorsements);
        system.debug('manualList::'+manualList);
        if(!enableMList)
            manualList.clear();
        enableMList=false;
        Set<ID> elid = new Set<ID>();
        List<VG_Policy_Schedule_Endorsement__c> tmpPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
            if(pe.VG_Endorsement_Library_Id__c==null)tmpPSEList.add(pe);
        }
        existingEndorsements.clear();
        system.debug('existingEndorsements::'+existingEndorsements);
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        for(LibraryWrapper LW:LibraryWrapperList){
            elid.add(LW.EL.Id);
            if(LW.isSelected){
                tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Library_Id__c = LW.EL.Id; 
                tempEndsmt.VG_Endorsement_Number__c = LW.EL.Name;
                tempEndsmt.Endorsement_Library_Id__c = LW.EL.Id;    
                tempEndsmt.VG_Province__c = LW.EL.VG_Province__c; 
                tempEndsmt.VG_Product__c= products ;                              
                If(Product_Select != 'Motor'){
                    if(tmpPSEMap.containsKey(LW.EL.Id)){
                        tempEndsmt.VG_Endorsement_Details__c  =  tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                    }else if(pseTempMap.containsKey(LW.EL.Id)){
                        tempEndsmt.VG_Endorsement_Details__c  =  pseTempMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                    }else{
                        tempEndsmt.VG_Endorsement_Details__c  =  LW.EL.Text__c;                
                    }
                }
                tempEndsmt.Endorsement_Library_Id__c  =  LW.EL.Id;              
                if(pseTempMap.containsKey(LW.EL.Id)){
                     tempEndsmt.VG_Title__c = pseTempMap.get(LW.EL.Id).VG_Title__c ;
                }else if(tmpPSEMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Title__c = tmpPSEMap.get(LW.EL.Id).VG_Title__c ;
                }else{
                    tempEndsmt.VG_Title__c = LW.EL.Endorsement_Title__c;   
                }   
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.id=pseTempMap.get(LW.EL.Id).id;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Premium__c = pseTempMap.get(LW.EL.Id).VG_Premium__c;
                else
                    tempEndsmt.VG_Premium__c =0;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Sub_limit__c = pseTempMap.get(LW.EL.Id).VG_Sub_limit__c;
                else
                    tempEndsmt.VG_Sub_limit__c =0;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Deductible__c = pseTempMap.get(LW.EL.Id).VG_Deductible__c;
                else if(tmpPSEMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Deductible__c = tmpPSEMap.get(LW.EL.Id).VG_Deductible__c;
                else
                    tempEndsmt.VG_Deductible__c =  0; 
                tempEndsmt.VG_Type__c=LW.EL.Type__c;
                System.debug('Type::'+tempEndsmt.VG_Type__c+'::'+LW.EL.Type__c);
                tempEndsmt.VG_IsTempDelete__c = False;
                tempEndsmt.VG_IsTemp__c = True;
                if(MTAType == 'Revision of Cover'){
                    tempEndsmt.VG_Premium__c =0;
                    tempEndsmt.VG_Sub_limit__c =0;
                }
                counterEnd++;
                existingEndorsements.add(tempEndsmt);  
            }
        }
        //system.debug('tmpPSEMap::'+tmpPSEMap.values());
        for(VG_Policy_Schedule_Endorsement__c pse:tmpPSEMap.values()){
            if(pse.VG_Endorsement_Library_Id__c != null){
                existingEndorsements.add(pse);
            }
        }
        for(VG_Policy_Schedule_Endorsement__c pse:tmpPSEList){
            existingEndorsements.add(pse);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:manualList){
            existingEndorsements.add(pse);
        }
        //manualList.clear();
          
        system.debug('existingEndorsements::'+existingEndorsements);
        if(endorsCheck){ // no need to come inside this - for csv
            for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
                if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c != 0){
                        pse.VG_Premium__c=tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                    }
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c != 0){
                        pse.VG_Sub_limit__c=tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                    }
                }
            }
            system.debug('existingEndorsements::'+existingEndorsements);
        }
        if(existingEndorsements.IsEmpty()){
            counterEnd = 0;
        }else{
            counterEnd = existingEndorsements.size();    
        }
        endorsCheck = false;
       return new PageReference('/apex/VG_Revise_VCL_Step_5b');
    }
     public PageReference gotostep6(){
         system.debug('EndorsementPremium::'+endorsementPremium);
         If(policy.RecordType.Name == 'VCL'){
            If(Product_Select != 'Property' && Product_Select != 'Property BI&I')
                SectionNo_Select.add(new SelectOption('VCL','VCL'));
            else If(Product_Select == 'Property' || Product_Select == 'Property BI&I')
                SectionNo_Select.add(new SelectOption('VCL','VCL'));
                SectionNo_Select.add(new SelectOption('VCL BI&I','VCL BI&I'));
         }else If(policy.RecordType.Name == 'VDL'){ 
             SectionNo_Select.add(new SelectOption('VDL','VDL'));     
         }
         //EndorsementPremium  =  0;
        // if(endorsementPremium == 0 || endorsementPremium == null || Product_Select !='Motor')
             endorsementPremium  =  0;
         for(VG_Policy_Schedule_Endorsement__c en : existingEndorsements){
             EndorsementPremium = EndorsementPremium + en.VG_Premium__c;             
         }
        
        // if(RiskPremium == 0 || RiskPremium == null || Product_Select !='Motor')
            RiskPremium = 0;
        for(RRWrapper rrw: riskRatingList){ 
            RiskPremium = RiskPremium+rrw.psa.VG_Premium__c;
        }
        RiskPremium = 0;
        for(RRWrapper rrw: riskRatingList){ 
            RiskPremium = RiskPremium+rrw.psa.VG_Premium__c;
        }
        for(RRWrapper rrw: addedRRList){ 
            System.debug('RiskPremium::'+rrw.psa.VG_Premium__c);     
            RiskPremium = RiskPremium + (rrw.psa.VG_Premium__c!=null?rrw.psa.VG_Premium__c:0);
        }
        System.debug('RiskPremium::'+RiskPremium);  
        for(RRWrapper rrw: rrwList){ 
            System.debug('RiskPremium::'+rrw.psa.VG_Premium__c);     
            RiskPremium = RiskPremium + (rrw.psa.VG_Premium__c!=null?rrw.psa.VG_Premium__c:0);
        }
        System.debug('RiskPremium::'+RiskPremium);
        if(Product_Select != 'Motor'){
             if(seletedProrateoption != 'Flat' && ps.Seleted_Prorate_Option__c != 'Flat'){
                 RiskPremium = RiskPremium * proRata;
                 endorsementPremium = endorsementPremium * proRata;
             }
        }
        rc.VG_Company_Type__c = CompanyType; 
        //ps.VG_Type_Of_Operation__c = IndustrySelected;
        System.debug('RiskPremium::'+RiskPremium);
        netModelPremium = RiskPremium + EndorsementPremium;
        UpdateFinalCalculations();
        return new PageReference('/apex/VG_Revise_VCL_Step_6');
    }
    public PageReference finish(){
        Savepoint sp = Database.setSavepoint();
        try{
            If(Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){        
                if(layer=='Primary'){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Should not select Primary option in layer'));   
                    return null;
                }
            }
            ps.Policy__c = ps.Policy__c;
            ps.VG_Lloyds_Product__c=LP_Select;
            ps.Product__c=Product_Select;
            ps.VG_Bridge_Selected_Asset__c = selectedIds;
            ps.Net_Premium__c = netModelPremium;
            ps.Risk_Premium_Pro__c = RiskPremium;
            ps.Endorsement_Premium_Pro__c=endorsementPremium;
            If(ps.Product__c == 'Property' || ps.Product__c == 'Property BI&I')
                ps.VG_Type_Of_Operation__c = IndustrySelected;
            else
                ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;
            ps.Limit__c=lmt;
            ps.Attachment__c=attachment;
            ps.VG_Capacity_Paper__c  =  CapacityPaper;
            ps.ILF_Layer__c = layer ;
            ps.Written_share__c = writtenShare ;
            ps.Share__c=sharePercent;
            ps.Actual_GWP__c=actualPremium;
            ps.VG_Brokerage_Percent__c = brokerage;
            ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;
            ps.VG_Brokerage_Amount__c=brokerageAmount;
            ps.Gross_Written_Premium__c = grossWrittenPremium2;
            ps.VG_Gross_Written_Premium_100__c = grossWrittenPremium ;
            ps.Premium_Adjustment__c = adjustmentTechPremium;
            ps.Premium_Adjustment_2__c = adjustment;
            ps.VG_Fee_Income__c = feeIncome;
            ps.Levies__c = levies;
            ps.Sum_Insured__c = sumInsured;
            ps.VG_Witholding_Tax_Amount__c=taxamount;
            ps.Technical_UW_Premium__c = uwPremium;
            ps.VG_Technical_Model_Premium__c = techModelPremium;
            ps.Gross_or_Net_Premium__c = GrossOrNet ;
            ps.VG_Rate_Change__c   =  RateChange;
            ps.Name = ps.Name.remove('/EEA').remove('/NonEEA');
            If(policy.VG_Inception_Date__c.year() > 2020){
                if(ps.Split_Type__c == 'Non EEA'){
                    ps.Name += '/NonEEA';
                } 
            }
            if(seletedProrateoption != null)
                ps.Seleted_Prorate_Option__c = seletedProrateoption;
            String Provinces= '';
            Boolean Start = true;
            if(!Province.isEmpty()) {          
                for(String Str : Province) {
                    if(Start) {
                        Provinces = Str;
                        Start = false;
                    } else {              
                        Provinces = Provinces + ';' + Str;
                    }
                }
            }
            ps.VG_Province_List__c = Provinces ;
            PolicyScheduleTriggerFunction.isBasePsProduct = True;               
            if(MTAType != 'Revision of Cover'){
                Update ps;
            
                selectedIds = ps.VG_Bridge_Selected_Asset__c;    
                System.debug('PropertyDMLALert::'+PropertyDMLALert+IsAssertInsertion);  
                //If(IsAssertInsertion){      
                    If(PropertyDMLALert){
                        If(!AssetList.IsEmpty()){ 
                            IsAssertInsertion = true; 
                            Insert AssetList;                                           
                        }
                        selectedIds = '';                                                          
                        for(Asset__c ass: AssetList){
                            selectedIds += ass.id+';';
                        }
                        ps.VG_Bridge_Selected_Asset__c = selectedIds;
                        update ps;
                    }
                //}
            }
            System.debug('addedRRList::'+addedRRList.size());
            if(NOIList.size() > 0){
                Integer i = 1;
                for(Integer noi : NOIList){
                    if(i == 1)
                        rc.VG_Reinstatement_Premiums__c = '1st Reinstatement :'+noi+'<br/>';
                    if(i == 2)
                        rc.VG_Reinstatement_Premiums__c +=  '2nd Reinstatement :'+noi+'<br/>';
                    if(i == 3)
                        rc.VG_Reinstatement_Premiums__c +=  '3rd Reinstatement :'+noi+'<br/>';
                    if(i>3)
                        rc.VG_Reinstatement_Premiums__c +=  i+'th Reinstatement :'+noi+'<br/>';
                    
                    i++;
                }
                rc.VG_Reinstatement_Premiums__c = rc.VG_Reinstatement_Premiums__c.removeEnd('<br/>');
            }else{
                rc.VG_Reinstatement_Premiums__c = '';
            }    
            String ADInfo='';
            //ADInfo+='Umbrella/ Excess policies :'+UEPolicies+'<br/>';
            If(Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
                for(RCWrapper rcw : riskDetailList){
                    ADInfo+= 'Carrier :'+rcw.CA1+'<br/>'+'Policy Number:'+rcw.PA1+'<br/>'+'Policy Start Date:'+rcw.PSD1+'<br/>'+'Policy End Date:'+rcw.PED1+'<br/>'+'Coverage :'+rcw.CO1+'<br/>'+'ULL :'+rcw.UI1+'<br/>'+'Premium:'+rcw.PR1+'<br/>';
                }
            }
            rc.VG_Additional_Information__c=ADInfo;
            if(MTAType != 'Revision of Cover' && ps.Product__c !='Motor')
                Update rc;
                
            List<VG_Policy_Schedule_Endorsement__c> endToBeUpdated = new List<VG_Policy_Schedule_Endorsement__c>();
            List<VG_Policy_Schedule_Endorsement__c> endToBeInserted = new List<VG_Policy_Schedule_Endorsement__c>();
            Set<ID> pseIds=new Set<ID>();
            for(VG_Policy_Schedule_Endorsement__c pse : pseMap.values()){
                pseIds.add(pse.id);
            }
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                if(pse.id==null){
                    endToBeInserted.add(pse);
                }else{
                    VG_Policy_Schedule_Endorsement__c tmp= new VG_Policy_Schedule_Endorsement__c ();
                    tmp.id=pse.id;
                    tmp=pse;
                    endToBeUpdated.add(tmp);
                    pseIds.remove(pse.id);
                }
            }
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                if(pse.id==null){
                    endToBeInserted.add(pse);
                }else{
                    VG_Policy_Schedule_Endorsement__c tmp= new VG_Policy_Schedule_Endorsement__c ();
                    tmp.id=pse.id;
                    tmp=pse;
                    endToBeUpdated.add(tmp);
                    pseIds.remove(pse.id);
                }
            }
            if(pseIds.size() > 0){
                List<VG_Policy_Schedule_Endorsement__c> endToBeDeleted = new List<VG_Policy_Schedule_Endorsement__c>([select id from VG_Policy_Schedule_Endorsement__c where id IN: pseIds]);
                Delete endToBeDeleted;
            }
            Integer psecount=1;
            Integer psesbcount=1;
            if(!endToBeUpdated.IsEmpty()){
                for(VG_Policy_Schedule_Endorsement__c pse : endToBeUpdated){
                    if(pse.VG_Type__c == 'Endorsements'){
                        pse.Name=ps.Name+'/PE/'+psecount;
                        psecount++;
                    }else{
                        pse.Name=ps.Name+'/PESB/'+psesbcount;
                        psesbcount++;
                    }
                }
            }
            if(!endToBeInserted.IsEmpty()){
                for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                    if(pse.VG_Type__c == 'Endorsements'){
                        pse.Name=ps.Name+'/PE/'+psecount;
                        psecount++;
                    }else{
                        pse.Name=ps.Name+'/PESB/'+psesbcount;
                        psesbcount++;
                    }
                    pse.VG_Policy_Schedule__c=ps.id;
                    pse.CurrencyISOCode=ps.CurrencyISOCode;
                }
            }
            if(MTAType != 'Revision of Cover'){
                if(!endToBeUpdated.IsEmpty()){
                    update endToBeUpdated;
                }
                if(!endToBeInserted.IsEmpty()){
                    insert endToBeInserted;
                }
            }
            List<VG_Policy_Schedule_Asset__c> assetToBeInserted = new List<VG_Policy_Schedule_Asset__c>();
            List<VG_Policy_Schedule_Asset__c> assetToBeUpdated = new List<VG_Policy_Schedule_Asset__c>();        
            Set<ID> psaIds=new Set<ID>();
            for(VG_Policy_Schedule_Asset__c psa: psaMap.values()){
                psaIds.add(psa.id);
            }
            for(RRWrapper rrw : riskRatingList){
                if(rrw.psa.id==null){
                    assetToBeInserted.add(rrw.psa);
                    System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                }else{
                    assetToBeUpdated.add(rrw.psa);
                    psaIds.remove(rrw.psa.id);
                    System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size()+'::'+rrw.psa.id);
                }
                DMLAlert = True;
            }
            if(Product_Select  == 'Property' || Product_Select  == 'Property BI&I'){
                
                If(PropertyDMLALert){                                               
                    for(RRWrapper rr : addedRRList){ 
                        if(rr.psa.id==null){                  
                            System.debug('assmap::'+rr.assName);           
                            //rr.psa.Name  =  ps.Name + '/RR/' + psacount;
                            rr.psa.Asset__c = assMap.get(rr.assName).id;   
                            rr.psa.VG_Policy_Schedule__c = ps.id;
                            assetToBeInserted.add(rr.psa); 
                        }                                                     
                    } 
                    System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                    DMLAlert = True;          
                }else{
                    for(RRWrapper rr : addedRRList){ 
                        if(rr.psa.id!=null){
                            assetToBeUpdated.add(rr.psa);
                            psaIds.remove(rr.psa.id);  
                            DMLAlert = True;  
                        }
                    } 
                }
            }
            for(RRWrapper rrw : rrwList){
                if(rrw.psa.id==null){
                    assetToBeInserted.add(rrw.psa);
                    System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                }else{
                    assetToBeUpdated.add(rrw.psa);
                    psaIds.remove(rrw.psa.id);
                    System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                }
            }
            if(psaIds.size() > 0){
                List<VG_Policy_Schedule_Asset__c > assetToBeDeleted = new List<VG_Policy_Schedule_Asset__c >([select id from VG_Policy_Schedule_Asset__c where id IN: psaIds]);
                Delete assetToBeDeleted;
            }
            Integer psacount=1;
             if(!assetToBeUpdated.IsEmpty()){
                for(VG_Policy_Schedule_Asset__c psa : assetToBeUpdated){
                    psa.Name=ps.Name+'/RR/'+psacount;
                    psa.VG_Address__c =addressofInsuredProject ;               
                    psacount++;
                }
            }
            if(!assetToBeInserted.IsEmpty() && DMLAlert){
                for(VG_Policy_Schedule_Asset__c psa : assetToBeInserted){
                    psa.Name=ps.Name+'/RR/'+psacount;
                    psa.VG_Policy_Schedule__c=ps.id;
                    psa.CurrencyISOCode=ps.CurrencyISOCode;                
                    psa.VG_Address__c =addressofInsuredProject ;               
                    psacount++;
                }            
            }
            System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
            If(MTAType != 'Revision of Cover'){
                if(DMLAlert){
                                    
                    if(!assetToBeInserted.IsEmpty()){
                        insert assetToBeInserted;
                         System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                    }
                    if(!assetToBeUpdated.IsEmpty()){
                        Update assetToBeUpdated;
                        System.debug('Lists::'+assetToBeInserted.size()+'::'+assetToBeUpdated.size());
                    }               
                } 
                if(!endToBeInserted.IsEmpty() && Product_Select  == 'Motor')  
                    return new PageReference('/apex/VG_Revise_VCL_Step_7?id='+PSId );
                else if(!endToBeUpdated.IsEmpty() && Product_Select  == 'Motor')          
                    return new PageReference('/apex/VG_Revise_VCL_Step_7?id='+PSId );
                else
                    return new PageReference('/'+PSId );
            }else{
                List<Policy_Schedule__c> psList=new List<Policy_Schedule__c>([select id,Name,Policy__r.Name from Policy_Schedule__c where Policy__c=:ps.Policy__c]);
                Policy_Schedule__c rocps=new Policy_Schedule__c();
                rocps=ps;
                rocps.VG_Is_MTA__c=true;
                rocps.VG_MTA_Type__c='Revision of Cover';
                rocps.id=null;
                rocps.VG_Base_Policy__c=true;
                rocps.VG_Status__c = 'Draft';
                rocps.VG_MTA_Start_Date__c=Date.valueOf(MTAStartDate);
                rocps.VG_MTA_End_Date__c=ps.Policy__r.VG_Expiry_Date__c;
                rocps.Base_Creation_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                rocps.Base_Creation_End_Date__c=rocps.VG_MTA_End_Date__c;
                rocps.MTA_Parent_Policy_Schedule__c=psid;            
                integer tmp;
                    String[] tempDetail;
                    if(psList.size() > 0){
                        List<Integer> psNumList=new List<Integer>();
                        for(Policy_Schedule__c psh: psList){
                            psh.Name = psh.Name.remove('/EEA').remove('/NonEEA');
                            if(psh.Name.contains('/PS/'))
                                psNumList.add(Integer.valueOf(psh.Name.split('/PS/')[1]));
                            else if(psh.Name.contains('/MTA/'))
                                psNumList.add(Integer.valueOf(psh.Name.split('/MTA/')[1]));
                        }
                        psNumList.sort();
                        rocps.Name  =  ps.Policy__r.Name+'/MTA/'+((psNumList[psNumList.size()-1])+1);        
                    }else{
                        rocps.Name  =  ps.Policy__r.Name+'/MTA/0';    
                    }   
                    If(policy.VG_Inception_Date__c.year() > 2020){
                        if(rocps.Split_Type__c == 'EEA'){
                            rocps.Name += '/EEA';
                        }else if(rocps.Split_Type__c == 'Non EEA'){
                            rocps.Name += '/NonEEA';
                        }  
                    }
                PolicyScheduleTriggerFunction.allowInsertRI = True;
                Utilities.SkipMethods('Trigger Context');
                Utilities.SkipMethods('Trigger Context2');
                Insert rocps;
                System.debug('PropertyDMLALert::'+PropertyDMLALert+IsAssertInsertion);  
                    If(PropertyDMLALert){
                        If(!AssetList.IsEmpty()){ 
                            Insert AssetList;                                           
                        }
                        selectedIds = '';                                                          
                        for(Asset__c ass: AssetList){
                            selectedIds += ass.id+';';
                        }
                        rocps.VG_Bridge_Selected_Asset__c = selectedIds;
                        update rocps;
                    }
                Risk_Capture__c rocrc = new Risk_Capture__c();
                rocrc = rc.clone(false, true, false, false);
                rocrc.id = null;
                rocrc.Policy_Schedule__c = rocps.id;
                rocrc.Name = rocps.Name+'RD/1';
                if(ps.Product__c !='Motor')
                    Insert rocrc;
                List<VG_Policy_Schedule_Endorsement__c> rocend= new List<VG_Policy_Schedule_Endorsement__c>();
                rocend.addAll(endToBeUpdated);
                rocend.addAll(endToBeInserted);
                Integer psecounter=1;
                Integer psesbcounter=1;
                if(!rocend.IsEmpty()){
                    for(VG_Policy_Schedule_Endorsement__c pse : rocend){
                        pse.id=null;
                        pse.VG_Policy_Schedule__c=rocps.id;
                        if(pse.VG_Type__c == 'Endorsements'){
                            pse.Name=rocps.Name+'/PE/'+psecounter;
                            psecounter++;
                        }else{
                            pse.Name=rocps.Name+'/PESB/'+psesbcounter;
                            psesbcounter++;
                        }
                    }
                    Insert rocend;
                }
                List<VG_Policy_Schedule_Asset__c> rocpsa= new List<VG_Policy_Schedule_Asset__c>();
                rocpsa.addAll(assetToBeUpdated);
                rocpsa.addAll(assetToBeInserted);
                Integer psacounter=1;
                if(!rocpsa.IsEmpty()){
                    for(VG_Policy_Schedule_Asset__c  psa : rocpsa){
                        psa.id=null;
                        psa.VG_Policy_Schedule__c=rocps.id;
                        psa.Name=rocps.Name+'/RR/'+psacounter;
                        psacounter++;                   
                    }
                    Insert rocpsa;
                }
                if(!rocend.IsEmpty() && Product_Select  == 'Motor')
                    return new PageReference('/apex/VG_Revise_VCL_Step_7?id='+rocps.Id);
                else
                    return new PageReference('/'+rocps.Id);
            } 
        }Catch(Exception e){
            System.debug('e::'+e.getMessage()+e.getLineNumber());
            showError(e);
            Database.rollback(sp);
            return null;
        }       
    }
    
    Public void showError(Exception e){
        String refId = ErrorTrace.insertLog(e , policyId);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin with this reference id '+refId));     
    }
     
    public void RemoveRR(){
        riskRatingList.remove(integer.valueOf(Index));
        RRcounter=0;
        sumAnnualPremium=0;
        System.debug('riskRatingList::'+riskRatingList.size()+'::'+riskRatingList);
        for(RRWrapper temp : riskRatingList){
            temp.Counter=String.valueOf(RRcounter);
            RRcounter++;
            sumAnnualPremium=(sumAnnualPremium+(temp.psa.VG_Premium__c !=null ? temp .psa.VG_Premium__c:0)).setScale(2);
            
        }
        if(riskRatingList.IsEmpty()){
           ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please add atleast one asset to the policy schedule..'));   
        }
    }
    public void addUI(){
        RCWrapper rcw=new RCWrapper();
        rcw.Counter=string.valueOf(RCcounter); 
        rcw.CA1='';
        rcw.PA1='';
        rcw.PSD1 = '';
        rcw.PED1 = '';
        rcw.CO1='';
        rcw.UI1=0;
        rcw.PR1='';
        riskDetailList.add(rcw);
        RCcounter++;          
        
    }   
    public void RemoveUI(){
        riskDetailList.remove(integer.valueOf(Index));
        RCcounter = 0;        
        
        if(riskDetailList.IsEmpty()){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please add atleast one UI Schedule to the policy schedule..'));   
        }
    }    
    public void addRR(){
        RRWrapper waNew=new RRWrapper();
        waNew.Counter=string.valueOf(RRcounter);            
        VG_Policy_Schedule_Asset__c psaNew=new VG_Policy_Schedule_Asset__c();
        psaNew.CurrencyISOCode = policy.CurrencyIsoCode;
        psaNew.VG_Deductible__c=0;
        psaNew.VG_Coverage__c=LP_Select;
        psaNew.VG_Base_Premium_Rate__c=0;
        psaNew.VG_Premium__c=0;
        psaNew.VG_Sum_Insured__c=0;
        waNew.Premium=0;
        waNew.psa=psaNew;
        riskRatingList.add(waNew);
        RRcounter++;
        sumAnnualPremium=0;
        for(RRWrapper rrw: riskRatingList){ 
            sumAnnualPremium=(sumAnnualPremium+(rrw.psa.VG_Premium__c !=null ? rrw.psa.VG_Premium__c:0)).setScale(2);
            System.debug('sumAnnualPremium::'+sumAnnualPremium);
        }
        System.debug('riskRatingList::'+riskRatingList.size()+'::'+riskRatingList);
    }
    
    public void RRCalc(){
        totalFeeAmount=0;
        totalbasepremium=0;
        totalbasepremiumrate=0;
        sumAnnualPremium = 0;
        for(RRWrapper rrw:riskRatingList){
            System.debug('premium::'+rrw.psa.VG_Sum_Insured__c+'+'+rrw.psa.VG_Base_Premium_Rate__c);
            sumAnnualPremium = (sumAnnualPremium+(rrw.psa.VG_Premium__c  !=  null ? rrw.psa.VG_Premium__c:0)).setScale(2);
        }
        
        TotalSumInsured = 0;
        TotalPremium = 0;
        for(RRWrapper rrw:addedRRList){
            rrw.Premium = rrw.sumInsured*(rrw.psa.VG_Base_Premium_Rate__c/100);
            TotalSumInsured = TotalSumInsured+rrw.sumInsured;
            TotalPremium = TotalPremium+rrw.Premium;
            
        }
    }
    
    
    Public PageReference AddRiskRating(){
        addRRMode=True;
        return null;
    }
    public void AddCustom(){   
        VG_Policy_Schedule_Endorsement__c tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.VG_Premium__c = 0;
        tempEndsmt.VG_Sub_limit__c=0;
        tempEndsmt.VG_Type__c='Endorsements';
        tempEndsmt.CurrencyISOCode = policy.CurrencyIsoCode;
        existingEndorsements.add(tempEndsmt);
    }
    public void UpdateFinalCalculations(){
        Decimal uwPremiumVal;
        Map<String, List<String>> MapEntityList = new Map<String, List<String>>();
        MapEntityList = Utilities.Entities('Non EEA',policy.VG_Inception_Date__c ,policy.RecordType.Name,null);
        NonEEAVolanteEntity_Select = new List<SelectOption>();
        If(MapEntityList.get('Non EEA')!=null){
            for(String s : MapEntityList.get('Non EEA')){
                NonEEAVolanteEntity_Select.add(new SelectOption(s,s));
            }
        }
        system.debug('csvFileWrapperList::'+csvFileWrapperList.size());
        if(Product_Select == 'Motor' && csvFileWrapperList.size() > 0){
            //adjustmentTechPremium
            csvFileWrapper[] cvwrapperUW = new csvFileWrapper[]{};
            cvwrapperUW.add(csvFileWrapperList.get(4)); // for adjustmentTechPremium
            system.debug('cvwrapperUW::'+cvwrapperUW);
            for(csvFileWrapper cv: cvwrapperUW){
                system.debug('cv.Total::'+cv.Total);
                uwPremiumVal = Decimal.valueOf(cv.Total.trim().replaceAll('[^a-zA-Z0-9]', ''));
                // lmt = Decimal.valueOf(cv.Limit1.trim().replaceAll('[^a-zA-Z0-9]', ''));
            }
        }
        system.debug('RiskPremium::'+RiskPremium);
        RiskPremium = RiskPremium.setScale(2); 
        endorsementPremium = endorsementPremium.setScale(2);
        if(seletedProrateoption == 'Flat' || ps.Seleted_Prorate_Option__c == 'Flat')
            netModelPremium = endorsementPremium+RiskPremium;
        
        techModelPremium=(sharePercent/100)*netModelPremium;
        if(Product_Select == 'Motor' && csvFileWrapperList.size() > 0){
            adjustment = 0;
            adjustmentTechPremium = 0;
            uwPremium = (netModelPremium!=null?netModelPremium:0)+(adjustmentTechPremium!=null?adjustmentTechPremium:0);
        }else{
            uwPremium = (netModelPremium!=null?netModelPremium:0)+(adjustmentTechPremium!=null?adjustmentTechPremium:0);
        }
        grossWrittenPremium = (uwPremium!=null?uwPremium:0) + (adjustment!=null?adjustment:0);
        If(sharePercent!=0){
            grossWrittenPremium2 = (grossWrittenPremium!=null?grossWrittenPremium:0)*(sharePercent/100);  
        }
        brokerageAmount = grossWrittenPremium2*((brokerage!=null?brokerage:0)/100);
        actualPremium=grossWrittenPremium2-brokerageAmount ;        
        If(sharePercent!=null){
            sumInsured= (lmt!=null?lmt:0)*(sharePercent/100);            
        }
    }
    /*Public PageReference SaveRR(){
            
        addRRMode=False;
        Integer counter;
        if(addedRRList.IsEmpty()){
            counter=0;
        }else{
            counter=addedRRList.size();
        }
        integer asscount=assetValues.size();
        Set<ID> inassids=new Set<ID>();
        for(VG_Policy_Schedule_Asset__c psa: assetValues){
            if(psa.Asset__c == null){
                errmsg=true;
                addRRMode=True;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Asset lookup don\'t empty..'));    
                return null; 
            }
            if(assetMap.containsKey(psa.Asset__c)){
                assetLookups.add(assetMap.get(psa.Asset__c).Name);
            }else{
                inassids.add(psa.Asset__c);
                 
            }
            asscount--;
        }
        List<Asset__c> inAssList=new List<Asset__c>([select id,Name from Asset__c where id IN: inassids]);
        for(Asset__c ass: inAssList){
            errmsg=true;
            addRRMode=True;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Selected Asset '+ass.Name+' is invalid.Please select valid asset...'));    
            return null;
        }
        for(VG_Policy_Schedule_Asset__c psa: assetValues){
            RRWrapper tmp=new RRWrapper();
            System.debug('Log::'+assetMap.containsKey(psa.Asset__c));
            tmp.assName=assetMap.get(psa.Asset__c).Name;
            tmp.psa.VG_Risk_start__c=policy.VG_Inception_Date__c;
            tmp.psa.VG_Risk_End__c=policy.VG_Expiry_Date__c;
            tmp.psa.VG_AVG_SI__c =0;
            tmp.Premium=0;
            tmp.sumInsured=0;
            tmp.psa.VG_Coverage__c=Coverage_Select;
            tmp.psa.VG_Territorial_Limits__c=Teri_Select;
            tmp.psa.VG_Premium__c=0;
            tmp.psa.VG_Max_SI__c =0;
            tmp.psa.Asset__c=psa.Asset__c;
            tmp.psa.CurrencyISOCode = policy.CurrencyIsoCode;
            tmp.psa.VG_Base_Premium_Rate__c=0;
            tmp.psa.VG_Signed_Share__c=0;
            tmp.psa.VG_Sum_Insured__c=0;
            tmp.psa.VG_Limit__c=0;
            tmp.psa.VG_Attachment__c=0;
            tmp.Counter=String.valueOf(counter);
            addedRRList.add(tmp);
            addedassetLookups.add(assetMap.get(psa.Asset__c).Name);
            counter++;
        }
        RRSize=null;
        assetValues.clear();
        createLoop.clear();
        return null;
    }
    Public void CancelRR(){
        addRRMode=False;
        RRSize=null;
        assetValues.clear();
        createLoop.clear();
    }
    public void RemoveRiskRating(){
        addedassetLookups.remove(addedRRList[integer.valueOf(Index)].psa.Name);
        addedRRList.remove(integer.valueOf(Index));
        counter=0;
        for(RRWrapper rrw:addedRRList){
            rrw.Counter=String.valueOf(counter);
            counter++;
        }
        RRCalc();
    }*/
    public class RCWrapper{
        public String Counter{get;set;}
        public String CA1{get;set;}
        public String PA1{get;set;}
        public String PSD1{get;set;}
        public String PED1{get;set;}
        public String CO1{get;set;}
        public Decimal UI1{get;set;}
        public String PR1{get;set;}
    }
    
    public class AssetWrapper{
        public Asset__c ass{get;set;}
        public String Counter{get;set;}
        public String assName{get;set;}
        Public String typeOfOperation{get;set;}
        Public String FloodZone {get;set;} 
        Public String EQHazard {get;set;} 
        Public String CrestaZone {get;set;} 
        Public String AssetCurrency {get;set;} 
        Public String BuildingSI {get;set;} 
        Public String ContentsSI {get;set;} 
        Public String AnnualBusinessInterruptionSI {get;set;} 
        Public String BIIndemnityPeriodmonths {get;set;} 
        Public String TotalTIV {get;set;} 
        Public String Occupancy {get;set;} 
        Public String Storeysabovegrade {get;set;} 
        Public String Storeysbelowgrade {get;set;}
        Public String FUSZone {get;set;} 
        Public String PDMFL {get;set;} 
        Public String PDMFLPercent {get;set;} 
        Public String BIMFL {get;set;} 
        Public String BIMFLPercent {get;set;} 
        Public String LloydsConstuctionCode {get;set;} 
        Public String LloydsOccupancyCode {get;set;} 
        Public String YearBuilt {get;set;} 
        Public String OccupancyByInsured {get;set;} 
        Public String OccupancyByOthers {get;set;} 
        Public String FireProtection {get;set;} 
        Public String HasSprinklerSystem {get;set;} 
        Public String CurrentYearRate {get;set;} 
        Public String ExpiringRate {get;set;} 
        Public String IsEarthquakeShakeCovered {get;set;} 
        Public String IsFloodCovered {get;set;} 
        Public String LastYearStructurallyUpdatedyyyy {get;set;} 
        Public String Population {get;set;} 
        Public String ParticipationSchedule {get;set;} 
        Public Decimal TechnicalFirePremium {get;set;}
        Public Decimal TechnicalFireBIPremium {get;set;}
        Public Decimal TechnicalEarthquakePremium {get;set;}
        Public Decimal TechnicalFloodPremium {get;set;}
        Public Decimal TechnicalPropertyOtherPremium {get;set;}
        Public Decimal TechnicalBIIPremium {get;set;}
        Public Decimal TotalTechnicalPremium {get;set;}
        Public Decimal QuotedFirePremium {get;set;}
        Public Decimal QuotedFireBIPremium {get;set;}
        Public Decimal QuotedEarthquakePremium {get;set;}
        Public Decimal QuotedFloodPremium {get;set;}
        Public Decimal QuotedPropertyOtherPremium {get;set;}
        Public Decimal QuotedBIIPremium {get;set;}
        Public Decimal TotalQuotedPremium {get;set;}
        Public Decimal FirePremiumAdjustment {get;set;}
        Public Decimal FireBIPremiumAdjustment {get;set;}
        Public Decimal EarthquakePremiumAdjustment {get;set;}
        Public Decimal FloodPremiumAdjustment {get;set;}
        Public Decimal PropertyOtherPremiumAdjustment {get;set;}
        Public Decimal BIIPremiumAdjustment {get;set;}
        Public Decimal TotalPremiumAdjustment {get;set;}
        public AssetWrapper(){
            ass = new Asset__c(); 
            
        }
    }
    
    public class RRWrapper{
        public VG_Policy_Schedule_Asset__c psa{get;set;}
        public String Counter{get;set;}
        public String assName{get;set;}
        public String CoverageSelected{get;set;}
        public String TerritorialSelected{get;set;}
        public Decimal Premium{get;set;}
        public Decimal sumInsured {get;set;}
        public RRWrapper(){
            psa=new VG_Policy_Schedule_Asset__c (); 
            CoverageSelected='';
            TerritorialSelected='';
            Premium=0;
            sumInsured =0;
        }
    }
    Public Class LibraryWrapper{
        Public Endorsement_Library__c EL {get; set;}
        Public Boolean isSelected {get; set;} 
        Public String coverage{get;set;}
        
        Public LibraryWrapper(){
            EL = new Endorsement_Library__c();
            isSelected = False;
        }
    }
    Public Class csvFileWrapper{
        Public String Prov{get;set;}
        Public String STATTerritory{get;set;}
        Public String VehType {get;set;}
        Public String ClassVal {get;set;}
        Public String DrivingRecord {get;set;}
        Public String DedPDDC {get;set;}
        Public String DedCL {get;set;}
        Public String DedCM {get;set;}
        Public String DedSP {get;set;}
        Public String RGAB {get;set;}
        Public String RGCLDC {get;set;}
        Public String RGCM {get;set;}
        Public String RGMSRP {get;set;}
        Public String NA {get;set;}
        Public String Unit {get;set;}
        Public String Limit1 {get;set;}
        Public String Age {get;set;}
        Public String EngineCC {get;set;}
        Public String ATVType {get;set;}
        Public String Campers {get;set;}
        Public String Limit2 {get;set;}
        Public String Owner {get;set;}
        Public String AmbulanceType {get;set;}
        Public String Seating {get;set;}
        Public String Distance {get;set;}
        Public String Trailer {get;set;}
        Public String CamperPrice {get;set;}
        Public String BusPrice {get;set;}
        Public String YearLicense {get;set;}
        Public String MSRPCost {get;set;}
        Public String ModelYear {get;set;}
        Public String TPLManual {get;set;}
        Public String SectAManual {get;set;}
        Public String BIManual {get;set;}
        Public String PDTManual {get;set;}
        Public String PDDCManual {get;set;}
        Public String CLManual {get;set;}
        Public String CMManual {get;set;}
        Public String APManual {get;set;}
        Public String SPManual {get;set;}
        Public String ABManual {get;set;}
        Public String UAManual {get;set;}
        Public String SEF44Manual {get;set;}
        Public String ENDORSEManual {get;set;}
        Public String SURCHARGEManual {get;set;}
        Public String OPTABManual {get;set;}
        Public String TotalManual {get;set;}
        Public String EndorseDetail {get;set;}
        Public String SurchargeDetail {get;set;}
        Public String OptABDetail {get;set;}
        
        Public String FleetSummary {get;set;}
        Public String TPL {get;set;}
        Public String SectA {get;set;}
        Public String BI {get;set;}
        Public String PDT {get;set;}
        Public String PDDC {get;set;}
        Public String CL {get;set;}
        Public String CM {get;set;}
        Public String AP {get;set;}
        Public String SP {get;set;}
        Public String AB {get;set;}
        Public String UA {get;set;}
        Public String SEF44 {get;set;}
        Public String Endorse {get;set;}
        Public String Surcharge {get;set;}
        Public String OptAB {get;set;}
        Public String Total {get;set;}
        Public String PerUnit {get;set;}
        Public String Client {get;set;}
        Public String Underwriter {get;set;}
        Public String PolicyNumber {get;set;}
        Public String EffectiveDate {get;set;}
        Public String RecordDate {get;set;}
        Public String Comments {get;set;}
        Public String YearsofExp {get;set;}
        Public String HistoricalPeriod {get;set;}
        Public String HistoricalMandatory {get;set;}
        Public String HistoricalCL {get;set;}
        Public String HistoricalCM {get;set;}
        Public String HistoricalAP {get;set;}
        Public String HistoricalSP {get;set;}
        Public String AccidentPeriod {get;set;}
        Public String Province {get;set;}
        Public String Coverage {get;set;}
        Public String TypeofVehicle {get;set;}
        Public String Count {get;set;}
        Public String IncurredLossed {get;set;}
        Public String MSL {get;set;}
        Public String TPLFleet {get;set;}
        Public String SectAFleet {get;set;}
        Public String BIFleet {get;set;}
        Public String PDTFleet {get;set;}
        Public String PDDCFleet {get;set;}
        Public String CLFleet {get;set;}
        Public String CMFleet {get;set;}
        Public String APFleet {get;set;}
        Public String SPFleet {get;set;}
        Public String ABFleet {get;set;}
        Public String UAFleet {get;set;}
        Public String SEF44Fleet {get;set;}
        Public String EndorseFleet {get;set;}
        Public String SurchargeFleet {get;set;}
        Public String OptABFleet {get;set;}
        Public String TotalFleet {get;set;}
        Public String PerUnitFleet {get;set;}
        Public String AgeGen {get;set;}
        Public String MACoverage {get;set;}
        Public String CLCoverage {get;set;}
        Public String CMCoverage {get;set;}
        Public String APCoverage {get;set;}
        Public String SPCoverage {get;set;}
        
        //Property Upload file
        
        Public String Location {get;set;} 
        Public String SiteName {get;set;} 
        Public String CombinedAddress {get;set;} 
        Public String StreetNumber {get;set;} 
        Public String StreetName {get;set;} 
        Public String City {get;set;} 
        Public String ProvinceState {get;set;} 
        Public String Country {get;set;}
        Public String TypeofOperation {get;set;} 
        Public String PostalCodeZipCode {get;set;} 
        Public String Latitude {get;set;} 
        Public String Longitude {get;set;} 
        Public String FloodZone {get;set;} 
        Public String EQHazard {get;set;} 
        Public String CrestaZone {get;set;} 
        Public String AssetCurrency {get;set;} 
        Public String BuildingSI {get;set;} 
        Public String ContentsSI {get;set;} 
        Public String AnnualBusinessInterruptionSI {get;set;} 
        Public String BIIndemnityPeriodmonths {get;set;} 
        Public String TotalTIV {get;set;} 
        Public String Occupancy {get;set;} 
        Public String Constructiontype {get;set;} 
        Public String Storeysabovegrade {get;set;} 
        Public String Storeysbelowgrade {get;set;} 
        Public String Automaticsprinklers {get;set;} 
        Public String FUSZone {get;set;} 
        Public String PDMFL {get;set;} 
        Public String PDMFLPercent {get;set;} 
        Public String BIMFL {get;set;} 
        Public String BIMFLPercent {get;set;} 
        Public String LloydsConstuctionCode {get;set;} 
        Public String LloydsOccupancyCode {get;set;} 
        Public String YearBuilt {get;set;} 
        Public String OccupancyByInsured {get;set;} 
        Public String OccupancyByOthers {get;set;} 
        Public String FireProtection {get;set;} 
        Public String HasSprinklerSystem {get;set;} 
        Public String CurrentYearRate {get;set;} 
        Public String ExpiringRate {get;set;} 
        Public String IsEarthquakeShakeCovered {get;set;} 
        Public String IsFloodCovered {get;set;} 
        Public String LastYearStructurallyUpdatedyyyy {get;set;} 
        Public String Population {get;set;} 
        Public String ParticipationSchedule {get;set;}
        Public Decimal TechnicalFirePremium {get;set;}
        Public Decimal TechnicalFireBIPremium {get;set;}
        Public Decimal TechnicalEarthquakePremium {get;set;}
        Public Decimal TechnicalFloodPremium {get;set;}
        Public Decimal TechnicalPropertyOtherPremium {get;set;}
        Public Decimal TechnicalBIIPremium {get;set;}
        Public Decimal TotalTechnicalPremium {get;set;}
        Public Decimal QuotedFirePremium {get;set;}
        Public Decimal QuotedFireBIPremium {get;set;}
        Public Decimal QuotedEarthquakePremium {get;set;}
        Public Decimal QuotedFloodPremium {get;set;}
        Public Decimal QuotedPropertyOtherPremium {get;set;}
        Public Decimal QuotedBIIPremium {get;set;}
        Public Decimal TotalQuotedPremium {get;set;}
        Public Decimal FirePremiumAdjustment {get;set;}
        Public Decimal FireBIPremiumAdjustment {get;set;}
        Public Decimal EarthquakePremiumAdjustment {get;set;}
        Public Decimal FloodPremiumAdjustment {get;set;}
        Public Decimal PropertyOtherPremiumAdjustment {get;set;}
        Public Decimal BIIPremiumAdjustment {get;set;}
        Public Decimal TotalPremiumAdjustment {get;set;} 
    }
}