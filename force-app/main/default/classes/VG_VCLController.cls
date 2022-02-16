Public Class VG_VCLController{
    
    public Policy_Schedule__c ps{get;set;}
    public Risk_Capture__c rc{get;set;}
    public VG_Policy_Schedule_Asset__c rr{get;set;}
    public Policy__c policy{get;set;}
    public LibraryWrapper LW1{get;set;}
    public LibraryWrapper LW{get;set;}
    
    public string CapacityPaper{get;set;}
    public String addressofInsuredProject {get;set;}
    public String wrapUp{get;set;}
    public String adjustableBasis{get;set;}
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
    public String[] filelines  =  new String[]{};
    public string products {get;set;}
    public ID policyId{get;set;}
    public String SplitType {get;set;}
    public String Entity {get;set;}
    public String selectedIds{get;set;}
    Public String TypeOfOperation {get;set;}
    
    public Boolean pmsg {get; set;}
    public Boolean errmsg {get; set;}
    Public Boolean EnableReinstatement{get;set;}
    public Boolean addRRMode {get; set;}
    public Boolean IsAssertInsertion {get;set;}
    public Boolean showfield {get; set;}
    public Boolean isRRMotorCheck {get; set;}
    public Boolean isRRHasValue {get; set;}
    
    public Integer counterEnd {get; set;}
    public Integer RRcounter {get; set;}
    public Integer RCcounter {get; set;}
    public Integer RRSize{get; set;}
    public Integer counter {get; set;}
    
    public Decimal RateChange {get;set;}
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
    Public Decimal totalFeeAmount{get;set;}
    Public Decimal totalbasepremium{get;set;}
    Public Decimal totalbasepremiumrate{get;set;}
    public Decimal feeIncome {get; set;}
    public Decimal sharePercent {get; set;}
    public Decimal techModelPremium {get; set;}
    public Decimal adjustmentTechPremium {get; set;}
    public Decimal taxamount {get; set;}
    public Decimal endorsementPremium {get; set;}
    public Decimal TotalSumInsured{get; set;}
    public Decimal TotalPremium{get; set;}
    public Decimal proRata{get; set;}
    public Decimal ExpectedLossRatio{get;set;}
    Public String IndexVal{get;set;}
    public Blob fileBody {get;set;}
    
    Public string pseIndex {get;set;}
    Public string deductibleUpdate{get;set;}
    
    public String[] Province { get; set;}
    Public String CompanyType {get; set;}
    Public String IndustrySelected {get; set;}
    Public List<SelectOption> DO_Industry_Select {get; set;}
    Public List<SelectOption> SectionNo_Select {get; set;}
    Public List<SelectOption> CompanyType_Select {get; set;}
    public List<SelectOption> pickListValuesList {get; set;}
    public List<SelectOption> TypeOfOperationList{get; set;}    
    public list<SelectOption> lpList {get; set;}
    public list<SelectOption> productList {get; set;}
    public list<SelectOption> RRCoverage_Select {get; set;}
    public list<SelectOption> NonEEAVolanteEntity_Select {get; set;}    
    public list<SelectOption> RRLimit_Select {get; set;}
    public list<SelectOption> RRDeductible_Select {get; set;}
    public list<SelectOption> Territorial_List{get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    public List<Endorsement_Library__c> ElList1{get;set;}
    public List<Endorsement_Library__c> ElList{get;set;} 
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}
    public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    public List<LibraryWrapper> LibraryWrapperList {get; set;}
    public List<RCWrapper> riskDetailList {get; set;}
    public List<RRWrapper> riskRatingList {get; set;}
    public List<RRWrapper> rrwList{get; set;}
    public List<RRWrapper> addedRRList {get; set;}
    Public list<Integer> createLoop {get; set;}
    Public list<VG_Policy_Schedule_Asset__c> assetValues{get; set;}
    Public list<AssetWrapper> AssetWrapperList {get;set;}
    Public list<Asset__c> AssetList {get;set;}
    Public List<Integer> NOIList{get;set;}
    Public Set<String> RRprovince {get;set;}
    Public String  AllPSIds {get;set;}
    
    Public Map<String , List<LibraryWrapper>> ELWList{get;set;}
    Public Map<String , Boolean> selectAllMap{get;set;}       
    Public Map<String, List<RRWrapper>> MapOfProvince {get; set;}
    Public Map<String, Asset__c> assMap {get; set;}
    
    Public Set<String> assetLookups{get;set;}
    Public Set<String> addedassetLookups{get;set;}
    Public Map<String, Policy_Schedule__c> AllCoveargePSMap {get; set;}
    Public List<SelectOption> splitTypes{get; set;}
   
    
    Public Transient  String OPCF_19A_TableContent{get;set;}
    Public Transient  Decimal Specified_Perils_deductible{get;set;}
    Public Transient  Decimal Comprehensive_deductible{get;set;}
    Public Transient  Decimal Collision_deductible{get;set;}
    Public Transient  Decimal All_Perils_deductible{get;set;}
    Public Transient  Decimal Specified_Perils_premium{get;set;}
    Public Transient  Decimal Comprehensive_premium{get;set;}
    Public Transient  Decimal Collision_premium{get;set;}
    Public Transient  Decimal All_Perils_premium{get;set;}
    Public Transient  Decimal tplLimit{get;set;}
    Public Transient  Decimal BI_Limit{get;set;}
    Public Transient  Decimal PD{get;set;}
    Public Transient  Decimal PDDC{get;set;}
    Public Transient  Decimal deductible{get;set;}    
    Public Transient  String OAFSTableContent{get;set;}
    Public Transient  String OAFSTableContent_2{get;set;}
    Public Transient  String OAFSTableContent_3{get;set;}
    Public Transient  String OAFSTableContent_4{get;set;}
    Public Transient  String OPCF21B_TableContent{get;set;}
    Public Transient  String OPCF21B_TableContent_2{get;set;}
    Public Transient  String OPCF23A_TableContent{get;set;}
    Public Transient  String OPCF28A_TableContent{get;set;}
    Public Transient  String SEF_19A_TableContent{get;set;}
    Public Transient  String SEF_21d_TableContent{get;set;}
    Public Transient  String SEF_23A_TableContent{get;set;}
    Public Transient  String QEF_21BREV_TableContent{get;set;}
    Public Transient  String QEF_21BREV_TableContent_2{get;set;}
    Public Transient  String PEI_SEF_21B_TableContent{get;set;}
    Public Transient  String PEI_SEF_21B_TableContent_1{get;set;}
    Public Transient  String NBEF19a_TableContent{get;set;}
    Public Transient  String NSEF21b_TableContent{get;set;}
    Public Transient  String NSEF21b_TableContent_1{get;set;}
    Public Transient  String automobile_Number {get;set;}
    
    public static String jsonData{get;set;}
    Public static List<csvFileWrapper> csvFileWrapperList{get;set;}
    public List<SelectOption> selectedCoveragesList {get; set;}
    public List<String> UnderwriterProducts {get; set;}
    
    Public Map<String, Decimal> RiskpremiumMap {get;set;}
    Public Map<String, Decimal> endorsementpremiumMap {get;set;}
    Public Map<String, Decimal> netbasepremiumMap {get;set;}
    Public Map<String, List<VG_Policy_Schedule_Endorsement__c>> MapOfPSEcoverages {get; set;}
    Public Map<String, List<VG_Policy_Schedule_Endorsement__c>> MapOfSubPSEcoverages {get; set;}
    Public Set<String> psWrapKeys{get;set;}
    Public Map<String, PSWrapper> PSWrapperMap {get;set;}
    Public Map<String, List<RRWrapper>> RRWrapperMap {get;set;}
    Public Map<String, List<VG_Policy_Schedule_Endorsement__c>> MapOfPSEmotor {get; set;}
    Public Map<String, List<VG_Policy_Schedule_Endorsement__c>> MapOfSubPSEmotor {get; set;}
    


    public VG_VCLController(){
        policyId = apexpages.currentpage().getparameters().get('Id');
        policy = [select id, Name, RecordType.Name, Underwriter__c, Underwriter__r.Underwriter_Product__c, VG_Is_Renewal__c,CurrencyIsoCode,VG_Quoted_Time__c,VG_Current_Insurer__r.BillingStreet,VG_Current_Insurer__r.BillingCity,VG_Current_Insurer__r.BillingState,VG_Current_Insurer__r.BillingPostalCode,Broker_Contact__r.Phone,Insured__r.Phone,VG_Current_Insurer__c, Line_Of_Business__c,VG_Current_Insurer__r.Name,Insured__r.Name,Broker_Name__r.Name,Broker_Name__c,VG_Inception_Date__c, VG_Expiry_Date__c, VG_Aggregate_Limit__c, Deductible_or_Excess_Amount__c, VG_Prospect_Premium__c, Sum_Insured_Share__c from Policy__c where id = : policyId];
        // proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c))/365;
        If(policy.RecordType.Name == 'VCL')
            proRata = 1;
        else
            proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c))/365;

        ps =  new Policy_Schedule__c();
        rr =  new VG_Policy_Schedule_Asset__c();
        rc = new Risk_Capture__c();
        rc.VG_Minimum_Premium__c=75;
        addressofInsuredProject = '';
        LibraryWrapper LW;
        LibraryWrapper LW1;
        isRRMotorCheck = false;
        isRRHasValue = true;
        csvFileWrapperList = new List<csvFileWrapper>();
        existingEndorsements1  =  new List<VG_Policy_Schedule_Endorsement__c>();
        existingEndorsements  =  new List<VG_Policy_Schedule_Endorsement__c>();
        manualList = new List<VG_Policy_Schedule_Endorsement__c>();
        LibraryWrapperList1  =  new List<LibraryWrapper >();
        LibraryWrapperList  =  new List<LibraryWrapper >();
        assetValues = new List<VG_Policy_Schedule_Asset__c>();
        AssetWrapperList = new list<AssetWrapper>();
        selectAllMap = new Map<String , Boolean>();
        ELWList = new Map<String, List<LibraryWrapper>>(); 
        NOIList=new List<Integer>();
        CompanyType_Select = new List<SelectOption>();
        DO_Industry_Select = new List<SelectOption>();  
        MapOfProvince  = new Map<String, List<RRWrapper>>();
        RiskpremiumMap = new Map<String, Decimal>();
        endorsementpremiumMap = new Map<String, Decimal>();
        netbasepremiumMap = new Map<String, Decimal>();
        RRprovince = new Set<String>();
        counterEnd = counter = 0;
        Index = '0';
        pmsg = false;
        errmsg = false;
        EnableReinstatement = False;
        addRRMode = False;
        IsAssertInsertion = false;
        adjustableBasis = 'No';
        UEPolicies = 'No';
        riskDetailList = new List<RCWrapper>();
        rrwList = new List<RRWrapper>();
        addedRRList  =  new List<RRWrapper>();
        createLoop = new List<Integer>();
        assetLookups = new Set<String>();
        addedassetLookups = new Set<String>();
        fileBody = blob.valueOf('');
        splitTypes = new List<SelectOption>(); 
        selectedIds = '';     
        if(policy.VG_Inception_Date__c.year() <= 2020){
            splitTypes.add(new SelectOption('','--None--'));           
        }
        splitTypes.add(new SelectOption('Non EEA','Non EEA'));
        if(policy.Underwriter__c != null){
            //system.debug('check underwriter Product::'+pol.Underwriter__r.Underwriter_Product__c+'::'+pol);
            String underwriterProduct = policy.Underwriter__r.Underwriter_Product__c;
            UnderwriterProducts = new List<String>();
            UnderwriterProducts = Utilities.underwriterProduct(underwriterProduct);
            //system.debug('return:::'+UnderwriterProducts);
        }
        // deductibletoall = 0;
        netModelPremium = RiskPremium = uwPremium = sumAnnualPremium = MDPremium = techModelPremium = sumInsured = sharePercent = writtenShare = lmt = taxAmount = 0;
        levies = brokerage = ExpectedLossRatio = brokerageAmount = grossWrittenPremium = grossWrittenPremium2  = feeIncome = actualPremium = adjustmentTechPremium = adjustment = TotalSumInsured = TotalPremium = 0;
        pickListValuesList = new SelectOption[0];
        Province= new String[0];
        Schema.DescribeFieldResult statusFieldDescription  =  Schema.Endorsement_Library__c.VG_Province__c.getDescribe();
          for(Schema.Picklistentry picklistEntry: statusFieldDescription.getPicklistValues()){
                pickListValuesList.add(new SelectOption(pickListEntry.getValue(), pickListEntry.getLabel()));            
          } 
        lpList  =  new List<SelectOption>();
        TypeOfOperationList  = new SelectOption[0];
        Schema.DescribeFieldResult TypeOfOperation=  Schema.Account.Industry.getDescribe();
          for(Schema.Picklistentry picklistEntry: TypeOfOperation.getPicklistValues()){
                TypeOfOperationList.add(new SelectOption(pickListEntry.getValue(), pickListEntry.getLabel()));            
          }
        productList  =  new List<SelectOption>();
        productList.add(new SelectOption('--None--', '--None--'));
        System.debug('policy.RecordType.Name::'+policy.RecordType.Name+'::'+underwriterProducts+'::'+policy.Line_Of_Business__c);
        If(underwriterProducts == Null && policy.Line_Of_Business__c != 'Excess of Loss'){
            System.debug('policy.RecordType.Name::'+policy.RecordType.Name+'::'+underwriterProducts+'::'+policy.Line_Of_Business__c);
            If(policy.RecordType.Name == 'VCL'){
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
            }else If(policy.RecordType.Name == 'VDL'){
                productList.add(new SelectOption('Property', 'Property'));
                productList.add(new SelectOption('Marine', 'Marine'));
                productList.add(new SelectOption('Liability', 'Liability'));
            }
            System.debug('policy.RecordType.Name::'+policy.RecordType.Name);
        
        }  
        System.debug('policy.RecordType.Name::'+policy.RecordType.Name);
        If(underwriterProducts != Null && policy.Line_Of_Business__c != 'Excess of Loss'){   
            for(String s : UnderwriterProducts){
                System.debug('policy.RecordType.Name::'+policy.RecordType.Name);
                If(policy.RecordType.Name == 'VCL'){
                    System.debug('policy.RecordType.Name::'+policy.RecordType.Name);
                    for(String p: Label.VCL_Products.split(';')){ 
                        if(p.equals(s))
                            productList.add(new SelectOption(s,s));
                    }
                }
                If(policy.RecordType.Name == 'VDL'){
                    System.debug('policy.RecordType.Name::'+policy.RecordType.Name);
                    for(String p: Label.VDL_Products.split(';')){ 
                        System.debug('P::'+p);
                        if(p.equals(s))
                            productList.add(new SelectOption(s,s));
                    }
                }
            }
        }
        Territorial_List =  new List<SelectOption>();
        Territorial_List.add(new SelectOption('TBA1', 'TBA1'));
        Territorial_List.add(new SelectOption('TBA2', 'TBA2'));
        Territorial_List.add(new SelectOption('TBA3', 'TBA3'));
        
        RRCoverage_Select  =  new List<SelectOption>();
        
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
        VG_Policy_Schedule_Asset__c psa  =  new VG_Policy_Schedule_Asset__c();
        psa.CurrencyISOCode  =  policy.CurrencyIsoCode;
        psa.VG_Deductible__c = 0;
        psa.VG_Premium__c = 0;
        psa.VG_Base_Premium_Rate__c = 0;
        psa.VG_Sum_Insured__c = 0;
        
        riskDetailList  =  new List<RCWrapper>();
        RCcounter = 1;
        RCWrapper rcw = new RCWrapper();
        rcw.Counter = string.valueOf(RCcounter); 
        rcw.CA1 = '';
        rcw.PA1 = '';
        rcw.PSD1 = '';
        rcw.PED1 = '';
        rcw.CO1 = '';
        rcw.UI1 = '';
        rcw.PR1 = '';
        riskDetailList.add(rcw);
        riskRatingList  =  new List<RRWrapper>();
        RRWrapper RRW  =  new RRWrapper();
        RRW.Premium = 0;
        RRW.psa  =  psa;
        RRW.counter  =  '0';
        riskRatingList.add(RRW);
        RRcounter  =  1;
        
    }
    
    public void setLPList(){      
        lpList.clear();
        lpList.add(new SelectOption('--None--', '--None--'));
        List<String> doLPList = new List<String>();
        If(Product_Select != 'Property BI&I')
            doLPList = Utilities.setLloydsProduct(policy.RecordType.Name,Product_Select,null,null);
        CompanyType = '';
        
        System.debug('doLPList::'+doLPList); 
        for(String s : doLPList){
            lpList.add(new SelectOption(s,s));            
        }
        System.debug('lpList::'+lpList);        
    }
    
    public PageReference processuploadAsset(){
        csvFileWrapperList.clear();
        jsonData = '';
        if(fileBody !=  blob.valueOf('')){
            addedRRList.clear();
            AssetWrapperList.clear();
            csvFileWrapperList.clear();
            jsonData = '';
                         
        }
        System.debug('fileName::'+fileName); 
        
        if(fileBody  ==  null || fileBody  ==  blob.valueOf('')){
            System.debug('fileBody::'+fileBody+'::'+fileName); 
            pmsg = true;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Must select file.'));
            return null;
        }else{
            if(!fileName.contains('.csv')){
                System.debug('fileName::'+fileName);
                pmsg = true;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Please use CSV file format...'));
                return null;
            }
            System.debug('fileBody::'+fileBody+'::'+fileName); 
            pmsg = false;
            
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
            
        }
        try{
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
                System.debug('Product_Select::'+Product_Select+'::'+asw.ass.VG_Coverage__c+'::'+asw.ass.Name);                               
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
                        rrw.psa.CurrencyIsoCode = policy.CurrencyIsoCode; 
                        If(policy.RecordType.Name == 'VDL')
                            rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VDL').getRecordTypeId();                              
                        else
                            rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();      
                        addedRRList.add(rrw);
                        System.debug('addedRRList:'+addedRRList.size()+'::'+s);
                    }
                }
                System.debug('addedRRList1:'+addedRRList.size());
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
            System.debug('addedRRList2:'+addedRRList.size()+'::'+AssetWrapperList.size());
            IndustrySelected = AssetWrapperList.get(0).typeOfOperation;
            system.debug('IndustrySelected::'+IndustrySelected);
        }catch(Exception e){       
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Error ::'+e));
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            return null;
        }
        return null;
    } 
    
    public PageReference cancel(){
        return new PageReference('/'+policy.id);
    }
    public PageReference gotostep1(){
        return new PageReference('/apex/VG_VCL_Step_1?Id = '+policyId);
    }
    public PageReference gotostep2(){
        if(Product_Select  == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product...')); 
            return null;
        }
        System.debug('Product_Select::'+Product_Select);
        if(LP_Select == '--None--' || LP_Select == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
            return null;              
        }    
        RRCoverage_Select  =  new List<SelectOption>();        
        if(Product_Select != 'Wrap Up Primary (Canada only)' && Product_Select != 'Wrap Up Excess (Canada Only)'){
            RRCoverage_Select.add(new SelectOption('General Liability', 'General Liability'));
            RRCoverage_Select.add(new SelectOption('Products Completed Operations', 'Products Completed Operations'));
        }else if(Product_Select == 'Wrap Up Primary (Canada only)' || Product_Select == 'Wrap Up Excess (Canada Only)'){
            RRCoverage_Select.add(new SelectOption('Wrap Up Liability', 'Wrap Up Liability'));
            RRCoverage_Select.add(new SelectOption('Products Completed Operations', 'Products Completed Operations'));
        }
        for(RRWrapper rrw:riskRatingList){
            rrw.CoverageSelected = LP_Select;
        }
        return new PageReference('/apex/VG_VCL_Step_2');
        
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
        return new PageReference('/apex/VG_VCL_Step_2a');
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
        return new PageReference('/apex/VG_VCL_Step_2c');
    }

    @AuraEnabled
    public static void getJson(list<Object> jsonList){
        System.debug('json::'+jsonList.size()+'::'+jsonList);
        csvFileWrapperList = new List<csvFileWrapper>();
        for (Object file : jsonList) {
            system.debug('file2::'+file);
            csvFileWrapper fileData = (csvFileWrapper)JSON.deserialize(JSON.serialize(file), csvFileWrapper.class);
            system.debug('fileData::'+fileData);
            csvFileWrapperList.add(fileData);
        }
        System.debug('csvFileWrapperList::'+csvFileWrapperList.size()+'csvFileWrapperList::'+csvFileWrapperList);
        for(csvFileWrapper csv: csvFileWrapperList){
            System.debug('csv::'+csv);
        }
    }
    public PageReference gotostep2b(){
        rrwList.clear();
        csvFileWrapperList.clear();
        jsonData = '';
        if(fileBody  ==  null || fileBody  ==  blob.valueOf('')){
            System.debug('fileBody::'+fileBody); 
            pmsg = true;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Must select file.'));
            return null;
        }else{
            pmsg = false;
            
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
            system.debug('csvFileWrapperList::'+csvFileWrapperList.size()+'::'+csvFileWrapperList);
            //system.debug('list 4::'+csvFileWrapperList.get(4));
            
        }
        try{  
            RRWrapper rrw;
            Integer i = 0;
            csvFileWrapper[] cvwrapperEndrose = new csvFileWrapper[]{};
            cvwrapperEndrose.add(csvFileWrapperList.get(3)); // for endrosment
            //system.debug('cvwrapper::'+cvwrapperEndrose);
            Map<String, Decimal> covMap= new Map<String, Decimal>();
            for(csvFileWrapper cv: cvwrapperEndrose){
                system.debug('cv::'+cv.Total);
                endorsementPremium = Decimal.valueOf(cv.Endorse.trim().replaceAll('[^a-zA-Z0-9]', ''));
                RiskPremium = Decimal.valueOf(cv.Total.trim().replaceAll('[^a-zA-Z0-9]', '')) - endorsementPremium;
            }
            system.debug('RiskPremium::'+RiskPremium);
            RRWrapper temprrw = new RRWrapper();
            set<String> proviceSet = new set<String>();
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
                        RRprovince.add(rrw.psa.VG_Province__c);
                        System.debug('rrwList::'+ RRprovince+ '::'+ rrw.psa.VG_Premium__c);
                        rrwList.add(rrw);
                        proviceSet.add(csv.Prov.trim());
                    }
                }
            }
            System.debug('RRWLIst::'+rrwList.size()+'::'+rrwList);
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
            
           system.debug('pickListValuesList::'+pickListValuesList);
            System.debug('PSWrapperMap::'+ PSWrapperMap);
            if(existingEndorsements.size()==0){
                VG_Policy_Schedule_Endorsement__c tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Premium__c  = endorsementPremium;
                tempEndsmt.VG_Endorsement_Number__c = 'Endorsement Premium';
                tempEndsmt.VG_Sub_limit__c = 0;
                tempEndsmt.VG_Type__c = 'Endorsements';
                tempEndsmt.CurrencyISOCode  =  policy.CurrencyIsoCode;
                existingEndorsements.add(tempEndsmt);
            }
            isRRMotorCheck = true;
        }catch(Exception e){       
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Error ::'+e));
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            return null;
        }
        System.debug('RRWLIst::'+rrwList);
        return new PageReference('/apex/VG_VCL_Step_2b');       
    }


    public PageReference gotostep3(){
        nameFile =null;
        fileBody =null;
        filelines=null;
        addRRMode =null;
        pmsg = null;
        errmsg = null;
        EnableReinstatement = null;
        return new PageReference('/apex/VG_VCL_Step_3');
    }
    public PageReference gotostep4(){
        System.debug('PSWrapperMap::'+ PSWrapperMap);
        ELWList = new Map<String, List<LibraryWrapper>>();        
        Map<String, String> propertyCoverageMap = new Map<String, String>();
        Asset__c ass ;
        AssetList = new list<Asset__c>();
        for(AssetWrapper asw: AssetWrapperList){
            ass = new Asset__c();
            ass.id = null;
            ass = asw.ass;
            ass.VG_Account__c = policy.Insured__c;                
            AssetList.add(ass);  
            for(String s : asw.ass.VG_Coverage__c.split(';')){
                if(s != null && s != ''){
                    propertyCoverageMap.put(s, s);
                }
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
            LW1.isSelected  =  False;                    
            LibraryWrapperList1.add(LW1); 
            selectAllMap.put(EL1.VG_Coverage__c, false);
        }
        for(LibraryWrapper l: LibraryWrapperList1){
            List<LibraryWrapper> tempcoverages = (ELWList.get(l.coverage) != null ? ELWList.get(l.coverage) : new List<LibraryWrapper>());
            tempcoverages.add(l);
            ELWList.put(l.coverage, tempcoverages);
            System.debug('ELWList::'+ELWList.keySet());
        }
        return new PageReference('/apex/VG_VCL_Step_4');
    }
    
    
    public void CheckAll(){
        Boolean updatedValue = selectAllMap.get(IndexVal)? true: false;
        //selectAllMap.put(IndexVal, updatedValue);
        for(LibraryWrapper LW : LibraryWrapperList1){ 
            System.debug('isCheck::'+'::'+IndexVal);            
            LW.isSelected = updatedValue;
            System.debug('isCheck::'+IndexVal+'::'+LW.isSelected);
        }
        system.debug('LibraryWrapperList1::'+LibraryWrapperList1);
    }  
    
    public void updateDeductible(){
       
        // Integer count = math.mod(Integer.valueOf(pseIndex),existingEndorsements1.size());
        // system.debug('pseIndex::'+pseIndex);
        // system.debug('deductibleUpdate::'+deductibleUpdate);
        System.debug('deductibletoall::'+'::'+ApexPages.currentPage().getParameters().get('msg'));
        // deductibleUpdate = System.currentPagereference().getParameters().get('msg');
        //Apexpages.currentPage().getParameters().get('valFromDeductible');
        // system.debug('deductibleUpdate::'+deductibleUpdate);
        
        // pseIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('pseIndex'));
        // System.debug('pseIndex ::'+pseIndex );
        // If(Integer.valueOf(pseIndex) == 0 && existingEndorsements1[0].VG_Deductible__c != null){
        //     System.debug('pseIndex ::'+pseIndex );

        // if(deductibleUpdate == 'Update All Deductible'){
            system.debug('vv::');
            for(Integer i = 1; i < existingEndorsements1.size(); i++){
                existingEndorsements1[i].VG_Deductible__c = existingEndorsements1[0].VG_Deductible__c;
                system.debug('>>::'+ existingEndorsements1[i].VG_Deductible__c);
            }
        // }
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
    public PageReference gotostep4b(){
        /*String[] Provinces;
        
        for(RRWrapper rr : rrwList){
            rr.ProvinceList = rr.psa.VG_Province__c + ';';
            System.debug('rr.ProvinceList::'+rr.ProvinceList);                       
            Provinces = rr.ProvinceList.split(';');            
        }
        for(String s : Provinces){
            Province.add(s);
        }
        System.debug('Province2::'+Province);*/
        // pseIndex = 0;
        Set<ID> elid = new Set<ID>();
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements1){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
        }
        existingEndorsements1.clear();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        system.debug('LibraryWrapperList1::'+LibraryWrapperList1);
        for(LibraryWrapper LW: LibraryWrapperList1){
            elid.add(LW.EL.Id);
            System.debug('LW.isSelected::'+LW.isSelected);
            if(LW.isSelected){
                tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Details__c  =  LW.EL.Text__c;
                tempEndsmt.Endorsement_Library_Id__c = LW.EL.Id;            
                tempEndsmt.VG_Endorsement_Library_Id__c  =  LW.EL.Id;
                tempEndsmt.VG_Title__c  =  LW.EL.Endorsement_Title__c;
                tempEndsmt.VG_Premium__c  =  0;
                tempEndsmt.VG_Sub_limit__c  =  0;
                tempEndsmt.VG_Deductible__c =  0; 
                tempEndsmt.CurrencyISOCode  =  policy.CurrencyIsoCode;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                System.debug('Type::'+tempEndsmt.VG_Type__c+'::'+LW.EL.Type__c);
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True;
                counterEnd++;
                existingEndorsements1.add(tempEndsmt);
            }
        }
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements1){
            if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c  !=   0){
                    pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                }
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c  !=   0){
                    pse.VG_Sub_limit__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                }
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Deductible__c !=   0){
                    pse.VG_Deductible__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Deductible__c ;
                }
            }
        }
        if(existingEndorsements1.IsEmpty()){
            counterEnd  =  0;
        }else{
            counterEnd  =  existingEndorsements1.size();    
        }
        return new PageReference('/apex/VG_VCL_Step_4b');
    }
    public PageReference gotostep4c(){ 
        System.debug('Province:::'+Province);      
        return new PageReference('/apex/VG_VCL_Step_4c');       
    }   
    public PageReference gotostep5(){
        System.debug('Province:::'+Province);  
        RRWrapperMap = new Map<String, List<RRWrapper>>();
            
        for(RRWrapper rr : rrwList){
            List<RRWrapper> tempcoverages = (MapOfProvince.get(rr.psa.VG_Province__c) != null ? MapOfProvince.get(rr.psa.VG_Province__c) : new List<RRWrapper>());
            tempcoverages.add(rr);
            RRWrapperMap.put(rr.psa.VG_Province__c, tempcoverages);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Endorsement_Library_Id__c  ==  null)
                manualList.add(pse);
        }
        system.debug('manualList::'+manualList);
        if(!existingEndorsements.IsEmpty()){
            system.debug('existingEndorsements in 5::'+existingEndorsements.size());
            existingEndorsements.clear();
            system.debug('existingEndorsements in 51::'+existingEndorsements.size());
        }
        If(!manualList.IsEmpty())
            manualList.clear(); 
        //String products;
        If(Product_Select =='GL - Occurrence , Excluding USA' || Product_Select =='GL - Occurrence, Including USA' || Product_Select =='GL - Claims Made, Excluding USA' || Product_Select =='GL - Claims Made, Including USA'  || Product_Select =='Wrap Up Primary (Canada only)'  || Product_Select =='Wrap Up Excess (Canada Only)' || Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
            products = 'Liability';
        }else{
            products = Product_Select;
        }
        System.debug('Province::'+Province);
        If(Product_Select == 'Motor'){
            ElList = [select id, Name, Endorsement_Title__c, Type__c,VG_Province__c from Endorsement_Library__c where  RecordType.Name  = : policy.RecordType.Name AND Type__c = :'Endorsements' AND VG_Product__c=:products AND VG_Province__c IN:Province  ORDER By VG_Province__c ASC];
            System.debug('province::'+Province);
            System.debug('ElList::'+ElList);
        }else{
            ElList = [select id, Name, Endorsement_Title__c, Text__c, Type__c,VG_Province__c from Endorsement_Library__c where  RecordType.Name  = : policy.RecordType.Name AND Type__c = :'Endorsements' AND VG_Product__c=:products ORDER By Name ASC];
        }
        System.debug('ElList::'+ElList);
        LibraryWrapperList.clear();
        for(Endorsement_Library__c EL : ElList){            
            LW  =  new LibraryWrapper();
            LW.EL  =  EL;    
            LW.isSelected  =  False;  
            LibraryWrapperList.add(LW); 
        }       
        return new PageReference('/apex/VG_VCL_Step_5');
    }
    
    public PageReference gotostep5b(){
        MapOfPSEcoverages = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
        MapOfSubPSEcoverages = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
        endorsementpremiumMap = new Map<String, Decimal>();
        MapOfPSEmotor = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
        MapOfSubPSEmotor = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
        
        Set<ID> elid = new Set<ID>();
        List<VG_Policy_Schedule_Endorsement__c> tmpPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
            if(pe.VG_Endorsement_Library_Id__c==null)tmpPSEList.add(pe);
        }
        //if(!isRRMotorCheck)
            existingEndorsements.clear();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        System.debug('isselect::'+LibraryWrapperList.size()+'::'+LibraryWrapperList);       
        for(LibraryWrapper LW:LibraryWrapperList){
            elid.add(LW.EL.Id);
            System.debug('isselect::'+LibraryWrapperList.size()+'::'+LW.EL.Id+'::'+LW.isSelected);          
            if(LW.isSelected){
                tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Library_Id__c  =  LW.EL.Id;
                tempEndsmt.Endorsement_Library_Id__c  =  LW.EL.Id;
                tempEndsmt.Endorsement_Library_Id__c = LW.EL.Id;    
                tempEndsmt.VG_Title__c  =  LW.EL.Endorsement_Title__c;                
                tempEndsmt.VG_Province__c =  LW.EL.VG_Province__c;
                tempEndsmt.VG_Product__c= products ;   
                If(Product_Select != 'Motor'){
                    if(tmpPSEMap.containsKey(LW.EL.Id))
                        tempEndsmt.VG_Endorsement_Details__c  =  tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c ;
                    else
                        tempEndsmt.VG_Endorsement_Details__c  = LW.EL.Text__c;
                }
                tempEndsmt.VG_Premium__c  =  0;
                tempEndsmt.VG_Sub_limit__c  =  0;
                tempEndsmt.VG_Deductible__c =  0;                                              
                tempEndsmt.CurrencyISOCode =  policy.CurrencyIsoCode;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                System.debug('Type::'+tempEndsmt.VG_Type__c+'::'+LW.EL.Type__c);
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True; 
                counterEnd++;
                existingEndorsements.add(tempEndsmt);
                system.debug('existingEndorsements**::'+existingEndorsements);
            }
        }
        for(VG_Policy_Schedule_Endorsement__c pse:tmpPSEList){
            existingEndorsements.add(pse);
        }
        tmpPSEList.clear();
        for(VG_Policy_Schedule_Endorsement__c pse:manualList){
            existingEndorsements.add(pse);
        }
        manualList.clear();
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            If(pse.VG_Endorsement_Library_Id__c!=null){
                if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){           
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c !=  0){
                        pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                    }
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c !=  0){
                        pse.VG_Sub_limit__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                    }
                }
            }
        }    
        if(existingEndorsements.IsEmpty()){
            counterEnd  =  0;
        }else{
            counterEnd  =  existingEndorsements.size();            
        }
        system.debug('existingEndorsements::'+existingEndorsements);
        
        
        return new PageReference('/apex/VG_VCL_Step_5b');
    }
    public PageReference gotostep6(){
        SectionNo_Select = new List<SelectOption>();           
        SectionNo_Select.add(new SelectOption('--None--','--None--')); 
        Entity = 'VCL';
        If(Product_Select == 'Property' )
            CapacityPaper ='VCL';
        If(Product_Select == 'Property BI&I')
            CapacityPaper = 'VCL BI&I';
            
        MapOfPSEmotor = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
        MapOfSubPSEmotor = new Map<String, List<VG_Policy_Schedule_Endorsement__c >>();
                        
        If(policy.RecordType.Name == 'VCL'){
            If(Product_Select != 'Property' && Product_Select != 'Property BI&I')
                SectionNo_Select.add(new SelectOption('VCL','VCL'));
            else If(Product_Select == 'Property' || Product_Select == 'Property BI&I')
                SectionNo_Select.add(new SelectOption('VCL','VCL'));
                SectionNo_Select.add(new SelectOption('VCL BI&I','VCL BI&I'));
         }else If(policy.RecordType.Name == 'VDL'){ 
             SectionNo_Select.add(new SelectOption('VDL','VDL'));     
         } 
        
        system.debug('existingEndorsements::'+existingEndorsements.size());
            if(endorsementPremium == 0 || endorsementPremium == null || Product_Select !='Motor')
                endorsementPremium  =  0;
            for(VG_Policy_Schedule_Endorsement__c en : existingEndorsements){
                endorsementPremium  =  endorsementPremium + en.VG_Premium__c;                      
            }
        
        System.debug('addedRRList3:'+addedRRList.size()+'::'+AssetWrapperList.size());
        if(RiskPremium == 0 || RiskPremium == null || Product_Select !='Motor')
            RiskPremium = 0;
        for(RRWrapper rrw: riskRatingList){ 
            RiskPremium = RiskPremium+rrw.psa.VG_Premium__c;
        }
        for(RRWrapper rrw: addedRRList){ 
            System.debug('RiskPremium2::'+rrw.psa.VG_Premium__c);     
            RiskPremium = RiskPremium + (rrw.psa.VG_Premium__c!=null?rrw.psa.VG_Premium__c:0);
        }
        System.debug('RiskPremium2::'+RiskPremium);     
        
        if(Product_Select != 'Motor'){
            RiskPremium  =  RiskPremium * proRata;
            endorsementPremium  =  endorsementPremium * proRata;
        }
        System.debug('RiskPremium2::'+RiskPremium);                 
        rc.VG_Company_Type__c = CompanyType ;
        netModelPremium  =  RiskPremium + endorsementPremium;    

        if(Product_Select =='Motor'){
            PSWrapperMap = new Map<String, PSWrapper>();
            Decimal PSRiskPremium = 0;
            Decimal PSEndorsementPremium = 0; 
            PSWrapperMap = new Map<String, PSWrapper>();
                
            for(String s : RRWrapperMap.keySet()){
                PSRiskPremium =0;
                PSEndorsementPremium  = 0;
                RRWrapperMap = new Map<String, List<RRWrapper>>();    
                for(RRWrapper rr : rrwList){
                    PSWrapper psw = new PSWrapper();
                    psw.province = s;
                    If(s == rr.psa.VG_Province__c)  
                        PSRiskPremium =  PSRiskPremium + rr.psa.VG_Premium__c ;
                    RiskpremiumMap.put(s,PSRiskPremium);                    
                    //MapOfPSEmotor.put(s, MapOfPSEmotor.get(s)); 
                    //MapOfSubPSEmotor.put(rr.psa.VG_Province__c, existingEndorsements1); 
                    PSWrapperMap.put(rr.psa.VG_Province__c, psw);
                    if(RRWrapperMap.containsKey(rr.psa.VG_Province__c)){
                        List<RRWrapper> tempList = RRWrapperMap.get(rr.psa.VG_Province__c);
                        tempList.add(rr);
                        RRWrapperMap.put(rr.psa.VG_Province__c, tempList);
                    }else{
                        RRWrapperMap.put(rr.psa.VG_Province__c,new List<RRWrapper>{rr});
                    }
                }               
            }
            for(VG_Policy_Schedule_Endorsement__c pse: existingEndorsements){
                List<VG_Policy_Schedule_Endorsement__c> tempcoverages = (MapOfPSEmotor.get(pse.VG_Province__c) != null ? MapOfPSEmotor.get(pse.VG_Province__c) : new List<VG_Policy_Schedule_Endorsement__c>());
                tempcoverages.add(pse);
                MapOfPSEmotor.put(pse.VG_Province__c, tempcoverages); 
                System.debug('MapOfPSEmotor::'+MapOfPSEmotor.values());      
            }
           for(String s: RiskpremiumMap.keySet()){   
                PSWrapper psw = new PSWrapper();
                psw.RiskPremium = psw.endorsementPremium = 0;  
                psw.RiskPremium  = RiskpremiumMap.get(s); 
                if(MapOfPSEmotor.get(s)!=null){
                    for(VG_Policy_Schedule_Endorsement__c pse: MapOfPSEmotor.get(s)){
                        psw.endorsementPremium = psw.endorsementPremium + pse.VG_Premium__c; 
                        //endorsementpremiumMap.put(s, PSEndorsementPremium);       
                    }
                }
                //psw.endorsementPremium = endorsementpremiumMap.get(s);
                psw.netModelPremium = (psw.RiskPremium!=NULL?psw.RiskPremium:0) + (psw.endorsementPremium!=null?psw.endorsementPremium:0);
                
            
                MapOfSubPSEmotor.put(s, existingEndorsements1); 
                psw.Province = s;
                If(MapOfPSEmotor.get(s)==null){
                   MapOfPSEmotor.put(s, new List<VG_Policy_Schedule_Endorsement__c>()); 
                   System.debug('MapOfPSEmotor.get(s)::'+MapOfPSEmotor.get(s));
                } 
                PSWrapperMap.put(s, psw);
                         
            }
            //PSWrapper psw = new PSWrapper();  
            System.debug('RRWrapperMap::'+RRWrapperMap);
            System.debug('PSWrapperMap::'+PSWrapperMap);
            
            psWrapKeys = new Set<String>();
            psWrapKeys = PSWrapperMap.keySet();
        }    
        System.debug('RiskPremium2::'+RiskPremium); 
        UpdateFinalCalculations();    
        if(Product_Select !='Motor')     
            return new PageReference('/apex/VG_VCL_Step_6');
        else
            return new PageReference('/apex/VG_VCL_Step_6_Motor');
    }

    public boolean getRRIsEmpty() {
        return RRWrapperMap.IsEmpty();
    }
    
    public void valueupdate(){
        string w = Apexpages.currentPage().getParameters().get('valFromBrokerage');
        string x = Apexpages.currentPage().getParameters().get('valFromWritten');
        string y = Apexpages.currentPage().getParameters().get('valFromShare');
        string Gross = Apexpages.currentPage().getParameters().get('valFromGross');
        string Entity= Apexpages.currentPage().getParameters().get('valFromEntity');
        for(PSWrapper psw: PSWrapperMap.Values()){
            If(w!=null && w!='')
                psw.brokerage = decimal.valueof(w);
            If(x!=null  && x!='')
                psw.writtenShare = decimal.valueof(x);
            If(y!=null  && y!='')
                psw.sharePercent = decimal.valueof(y);
            If(Gross!=null  && Gross!='')
                psw.GrossOrNet = Gross ;
            If(Entity!=null  && Entity!='')
                psw.Entity = Entity;
            System.debug('writtenShare::'+psw.writtenShare);
            UpdateFinalCalculations();
        }        
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
            System.debug('IsAssertInsertion::'+IsAssertInsertion+'::'+AssetList.size());  
           
            
            List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([SELECT Id, Name, Policy__c FROM Policy_Schedule__c WHERE Policy__c = :policyId ORDER BY CreatedDate DESC]);                         
            List<VG_Policy_Schedule_Asset__c> assetsToBeInserted  =  new List<VG_Policy_Schedule_Asset__c>();
            List<VG_Policy_Schedule_Endorsement__c> endToBeInserted  =  new List<VG_Policy_Schedule_Endorsement__c>();
            List<VG_Policy_Schedule_Endorsement__c> subEndToBeInserted  =  new List<VG_Policy_Schedule_Endorsement__c>();
            AllCoveargePSMap =new Map<String, Policy_Schedule__c>();
            Map<String, List<VG_Policy_Schedule_Asset__c>> MapassetsToBeInserted  =  new Map<String, List<VG_Policy_Schedule_Asset__c>>();
            
            
            Policy__c pol = [select id, Name, VG_Inception_Date__c, VG_Expiry_Date__c from Policy__c where Id = :policyId limit 1];               
            List<Integer> psNumList = new List<Integer>();           
            if(psList.size() > 0){
                String bsname;
                for(Policy_Schedule__c psh: psList){
                    if(psh.Name.contains('/EEA'))
                        bsname = psh.Name.remove('/EEA');
                    if(psh.Name.contains('/NonEEA'))
                        bsname = psh.Name.remove('/NonEEA');
                    if(!psh.Name.contains('/NonEEA') && !psh.Name.contains('/EEA')){
                        bsname = psh.Name;
                        System.debug('bsname2::'+bsname );
                    }
                    if(bsname.contains('/PS/'))
                        psNumList.add(Integer.valueOf(bsname.split('/PS/')[1]));
                    else if(bsname.contains('/MTA/'))
                        psNumList.add(Integer.valueOf(bsname.split('/MTA/')[1]));
                }
                psNumList.sort();                        
            }
            If(Product_Select!='Motor'){ 
                if(psList.size() > 0){
                    ps.Name  =  pol.Name+'/PS/'+((psNumList[psNumList.size()-1])+1);
                }else{
                    ps.Name  =  pol.Name+'/PS/0';    
                }   
                ps.CurrencyISOCode  =  policy.CurrencyIsoCode;
                ps.Policy__c  =  policyId;
                ps.Endorsement_Premium_Pro__c = endorsementPremium;
                ps.VG_Lloyds_Product__c = LP_Select;
                ps.Product__c = Product_Select;
                ps.Net_Premium__c  =  netModelPremium;
                ps.Risk_Premium_Pro__c  =  RiskPremium;
                ps.Limit__c = lmt;
                ps.Attachment__c = attachment;
                ps.ILF_Layer__c  =  layer ;
                ps.Written_share__c  =  writtenShare ;
                ps.Share__c = sharePercent;
                ps.Actual_GWP__c = actualPremium;
                ps.VG_Brokerage_Percent__c  =  brokerage;
                ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;
                ps.VG_Brokerage_Amount__c = brokerageAmount;
                ps.VG_Gross_Written_Premium_100__c  =  grossWrittenPremium ;
                ps.Gross_Written_Premium__c  =  grossWrittenPremium2 ;
                ps.Premium_Adjustment__c  =  adjustmentTechPremium;
                ps.Premium_Adjustment_2__c  =  adjustment;
                ps.VG_Fee_Income__c  =  feeIncome;
                ps.Levies__c  =  levies;
                ps.Sum_Insured__c  =  sumInsured;
                ps.VG_Base_Policy__c = true;
                ps.VG_Witholding_Tax_Amount__c = taxamount;
                ps.Technical_UW_Premium__c  =  uwPremium;
                ps.VG_Technical_Model_Premium__c  =  techModelPremium;
                ps.Gross_or_Net_Premium__c  =  GrossOrNet ;
                ps.name = policy.Name+'/PS/'+psList.size();
                ps.Base_Creation_Start_Date__c  =  pol.VG_Inception_Date__c;
                ps.Base_Creation_End_Date__c  =  pol.VG_Expiry_Date__c;
                ps.VG_Capacity_Paper__c  =  CapacityPaper;
                ps.Split_Type__c = SplitType;
                ps.VG_Volante_Entities__c = Entity;
                System.debug('IndustrySelected::'+IndustrySelected);
                If(ps.Product__c == 'Property' || ps.Product__c == 'Property BI&I')
                    ps.VG_Type_Of_Operation__c = IndustrySelected;
                else
                    ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;
                If(pol.VG_Inception_Date__c.year() > 2020){
                    if(ps.Split_Type__c == 'Non EEA'){
                        ps.Name += '/NonEEA';
                    } 
                }
                System.debug('ps.VG_Volante_Entities__c::'+ps.VG_Volante_Entities__c+'::'+ps.Split_Type__c);
                ps.VG_Rate_Change__c   =  RateChange;
                ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get(policy.RecordType.Name).getRecordTypeId(); 
                String Provinces= '';
                Boolean Start = true;
                if(!Province.isEmpty()) {          
                    for(String Str : Province) {
                        if(Start) {
                            Provinces = Str;
                            Start = false;
                            System.debug('if::'+Provinces+':'+Start);
                        } else {              
                            Provinces = Provinces + ';' + Str;
                            System.debug('else::'+Provinces+':'+Start);
                        }
                    }
                }
                ps.VG_Province_List__c = Provinces ;
                PolicyScheduleTriggerFunction.isBasePsProduct = True;               
                Insert ps;
                If(!AssetList.IsEmpty()){
                IsAssertInsertion = true;
                Insert AssetList;                 
            }
            System.debug('AssetList::'+AssetList.size());  
           
            If(AssetList.Size()>0){
                selectedIds = '';
                for(Asset__c ass: AssetList){
                    selectedIds += ass.id+';';
                    System.debug('selectedIds::'+selectedIds);
                }
            }
            ps.VG_Bridge_Selected_Asset__c = selectedIds;
            update ps;
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
            //Risk_Capture__c rc = new Risk_Capture__c();
            rc.Name = ps.Name+'/RD/1';
            rc.CurrencyIsoCode = ps.CurrencyIsoCode;
            rc.Policy_Schedule__c = ps.id;
            
            String ADInfo = '';        
            //ADInfo+= 'Umbrella/ Excess policies :'+UEPolicies+'<br/>';
            If(Product_Select =='Umbrella - Occurrence, Excluding USA' || Product_Select =='Umbrella - Occurrence, Including USA' || Product_Select =='Umbrella - Claims Made, Excluding USA' || Product_Select =='Umbrella - Claims Made, Including USA' || Product_Select =='Excess - Occurrence, Excluding USA' || Product_Select =='Excess - Occurrence, Including USA' || Product_Select =='Excess - Claims Made, Excluding USA' || Product_Select == 'Excess - Claims Made, Including USA'){
                for(RCWrapper rcw : riskDetailList){
                    ADInfo+= 'Carrier :'+rcw.CA1+'<br/>'+'Policy Number:'+rcw.PA1+'<br/>'+'Policy Start Date:'+rcw.PSD1+'<br/>'+'Policy End Date:'+rcw.PED1+'<br/>'+'Coverage :'+rcw.CO1+'<br/>'+'ULL :'+rcw.UI1+'<br/>'+'Premium:'+rcw.PR1+'<br/>';
                }
            }
            rc.VG_Additional_Information__c = ADInfo;
            Insert rc;
            
                Integer psecount = 1;
                Integer sbpsecount = 1;
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                    pse.VG_Policy_Schedule__c  =  ps.Id;
                    pse.CurrencyIsoCode = policy.CurrencyIsoCode;
                    pse.VG_Endorsement_Details__c  =  '<div style="font-size: 9pt;font-family: Arial;text-align:left;" >'+pse.VG_Endorsement_Details__c+'</div>';
                    pse.Name =  ps.Name + '/PE/' + psecount;
                    endToBeInserted.add(pse);
                    psecount++;
                }
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                    pse.VG_Policy_Schedule__c  =  ps.Id;
                    pse.CurrencyIsoCode = policy.CurrencyIsoCode;
                    pse.Name =  ps.Name + '/PESB/' + sbpsecount;
                    endToBeInserted.add(pse);
                    sbpsecount++;
                }
                if(!endToBeInserted.IsEmpty()){
                    Insert endToBeInserted;
                }
                Integer psacount = 1;
                if(Product_Select  !=  'Property' && Product_Select  !=  'Property BI&I' && Product_Select  !=  'Motor'){
                    for(RRWrapper rrw : riskRatingList){
                        rrw.psa.Name  =  ps.Name + '/RR/' + psacount;
                        rrw.psa.VG_Coverage__c = rrw.CoverageSelected;   
                        rrw.psa.CurrencyIsoCode = policy.CurrencyIsoCode;
                        If(policy.RecordType.Name == 'VDL')             
                            rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VDL').getRecordTypeId();      
                        else
                            rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();      
                        rrw.psa.VG_Policy_Schedule__c = ps.id;
                        rrw.psa.VG_Address__c =addressofInsuredProject ;
                        assetsToBeInserted.add(rrw.psa);
                        psacount++;
                    }
                }else if(Product_Select  == 'Property' || Product_Select  == 'Property BI&I' ){            
                    for(RRWrapper rr : addedRRList){
                        System.debug('assmap::'+rr.assName);           
                        rr.psa.Name  =  ps.Name + '/RR/' + psacount;
                        rr.psa.Asset__c = assMap.get(rr.assName).id;   
                        rr.psa.VG_Policy_Schedule__c = ps.id;
                        assetsToBeInserted.add(rr.psa);
                        psacount++;
                    }           
                    System.debug('assetsToBeInserted::'+assetsToBeInserted.size()+'::'+AssetList.size());           
                }
                if(!assetsToBeInserted.IsEmpty()){
                    Insert assetsToBeInserted;
                }
                return new PageReference('/'+ps.id);
            }else{
                Integer countPS = psNumList.size();
                
                for(PSWrapper psw: PSWrapperMap.values()){
                    
                    // if(psw.RateChange == null ){
                    //     ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please give Rate Change...'));    
                    //     return null;
                    // }
                    
                    PSWrapper pswTemp = new PSWrapper();
                    pswTemp.ps.Policy__c = policy.id;
                    pswTemp.ps.id=null;
                    pswTemp.ps.CurrencyISOCode  =  policy.CurrencyIsoCode;
                    pswTemp.ps.Policy__c  =  policyId;
                    pswTemp.ps.Endorsement_Premium_Pro__c = endorsementPremium;
                    pswTemp.ps.VG_Lloyds_Product__c = LP_Select;
                    pswTemp.ps.Product__c = Product_Select;
                    pswTemp.ps.Net_Premium__c  =  psw.netModelPremium;
                    pswTemp.ps.Risk_Premium_Pro__c  =  psw.RiskPremium;
                    pswTemp.ps.Limit__c = psw.lmt;
                    pswTemp.ps.Attachment__c = psw.attachment;
                    pswTemp.ps.ILF_Layer__c  =  psw.layer ;
                    pswTemp.ps.Written_share__c  =  psw.writtenShare ;
                    pswTemp.ps.Share__c = psw.sharePercent;
                    pswTemp.ps.Actual_GWP__c = psw.actualPremium;
                    pswTemp.ps.VG_Brokerage_Percent__c  =  psw.brokerage;
                    pswTemp.ps.VG_Technical_Loss_Ratio__c = psw.ExpectedLossRatio;
                    pswTemp.ps.VG_Brokerage_Amount__c = psw.brokerageAmount;
                    pswTemp.ps.VG_Gross_Written_Premium_100__c  =  psw.grossWrittenPremium ;
                    pswTemp.ps.Gross_Written_Premium__c  =  psw.grossWrittenPremium2 ;
                    pswTemp.ps.Premium_Adjustment__c  =  psw.adjustmentTechPremium;
                    pswTemp.ps.Premium_Adjustment_2__c  =  psw.adjustment;
                    pswTemp.ps.Sum_Insured__c  =  psw.sumInsured;
                    pswTemp.ps.VG_Base_Policy__c = true;
                    pswTemp.ps.VG_Witholding_Tax_Amount__c = taxamount;
                    pswTemp.ps.Technical_UW_Premium__c  =  psw.uwPremium;
                    pswTemp.ps.Gross_or_Net_Premium__c  =  psw.GrossOrNet ;
                    pswTemp.ps.Name =  policy.Name + '/PS/'+countPS;
                    pswTemp.ps.Base_Creation_Start_Date__c  =  pol.VG_Inception_Date__c;
                    pswTemp.ps.Base_Creation_End_Date__c  =  pol.VG_Expiry_Date__c;
                    pswTemp.ps.VG_Capacity_Paper__c  =  psw.CapacityPaper;
                    pswTemp.ps.Split_Type__c = psw.SplitType;
                    pswTemp.ps.VG_Volante_Entities__c = psw.Entity;
                    System.debug('IndustrySelected::'+IndustrySelected);
                    pswTemp.ps.VG_Type_Of_Operation__c = IndustrySelected;
                    If(pol.VG_Inception_Date__c.year() > 2020){
                        if(pswTemp.ps.Split_Type__c == 'Non EEA'){
                            pswTemp.ps.Name += '/NonEEA';
                        } 
                    }
                    System.debug('pswTemp.ps.VG_Volante_Entities__c::'+pswTemp.ps.VG_Volante_Entities__c+'::'+pswTemp.ps.Split_Type__c);
                    pswTemp.ps.VG_Rate_Change__c   =  psw.RateChange;
                    pswTemp.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get(policy.RecordType.Name).getRecordTypeId(); 
                    String Provinces= '';
                    Boolean Start = true;
                    if(!Province.isEmpty()) {          
                        for(String Str : Province) {
                            if(Start) {
                                Provinces = Str;
                                Start = false;
                                System.debug('if::'+Provinces+':'+Start);
                            } else {              
                                Provinces = Provinces + ';' + Str;
                                System.debug('else::'+Provinces+':'+Start);
                            }
                        }
                    }
                    System.debug('psw.Province::'+psw.Province);
                    //pswTemp.ps.VG_Province_List__c = Provinces ;
                    pswTemp.ps.VG_Province_List__c = psw.Province ;
                    for(RRWrapper rrw : rrwList){    
                        If(rrw.psa.VG_Province__c == psw.province){
                            VG_Policy_Schedule_Asset__c psa  =  new VG_Policy_Schedule_Asset__c();
                            psa.Name =  pswTemp.ps.Name;
                            psa.VG_Province__c = rrw.psa.VG_Province__c;
                            psa.CurrencyIsoCode = policy.CurrencyIsoCode; 
                            psa.VG_Premium__c = rrw.psa.VG_Premium__c;  
                            rrw.psa.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get(policy.RecordType.Name).getRecordTypeId();      
                            rrw.psa.VG_Policy_Schedule__c = ps.id;
                            assetsToBeInserted.add(rrw.psa);  
                        }                                             
                    }
                    for(VG_Policy_Schedule_Endorsement__c endsmt : existingEndorsements){
                        If(endsmt.VG_Province__c == psw.province){
                            endsmt.VG_Policy_Schedule__c  =  null;
                            endsmt.Name =  pswTemp.ps.Name;
                            endToBeInserted.add(endsmt);   
                        }                
                    }
                    for(VG_Policy_Schedule_Endorsement__c endsmt : existingEndorsements1){
                        If(endsmt.VG_Province__c == psw.province){
                            endsmt.VG_Policy_Schedule__c  =  null;
                            endsmt.Name =  pswTemp.ps.Name;
                            subEndToBeInserted.add(endsmt); 
                        }                                   
                    }
                    PolicyScheduleTriggerFunction.isBasePsProduct = True;               
                    AllCoveargePSMap.put(pswTemp.ps.Name, pswTemp.ps); 
                    System.debug('AllCoveargePSMap::'+AllCoveargePSMap.values());   
                    countPS++;    
                    System.debug('AllCoveargePSMap::'+AllCoveargePSMap.size()+pswTemp.ps.Name);                                                                  
                }
                System.debug('AllCoveargePSMap::'+AllCoveargePSMap.size());                       
                If(!AllCoveargePSMap.IsEmpty())      
                    Insert AllCoveargePSMap.values();
                AllPSIds = '';
                for(Policy_Schedule__c ps: AllCoveargePSMap.values()){
                    AllPSIds += ps.id+'_' ;
                }
                System.debug('AllPSIds::'+AllPSIds);
                MapassetsToBeInserted = new Map<String, List<VG_Policy_Schedule_Asset__c>>();
                for(Policy_Schedule__c ps : AllCoveargePSMap.values()){
                    for(VG_Policy_Schedule_Asset__c psa: assetsToBeInserted){
                        If(psa.VG_Province__c == ps.VG_Province_List__c){
                            List<VG_Policy_Schedule_Asset__c> tempcoverages = (MapassetsToBeInserted.get(psa.VG_Province__c) != null ? MapassetsToBeInserted.get(psa.VG_Province__c) : new List<VG_Policy_Schedule_Asset__c>());
                            tempcoverages.add(psa);
                            MapassetsToBeInserted.put(psa.VG_Province__c, tempcoverages);
                            System.debug('MapassetsToBeInserted::'+psa.VG_Province__c+'::'+MapassetsToBeInserted.keySet());       
                        }
                    }
                    integer psacount = 1;
                    If(MapassetsToBeInserted.get(ps.VG_Province_List__c)!=null){
                        for(VG_Policy_Schedule_Asset__c psa: MapassetsToBeInserted.get(ps.VG_Province_List__c)){
                                System.debug(' AllCoveargePSMap.get(psa.Name).id::'+ ps.id);
                                psa.VG_Policy_Schedule__c =ps.id;
                                psa.Name = ps.Name+'/RR/'+psacount;
                                psacount++;                   
                        }
                    }
                    integer psecount = 1;
                    integer sbpsecount= 1;
                    If(MapOfPSEmotor.get(ps.VG_Province_List__c)!=null){
                        for(VG_Policy_Schedule_Endorsement__c pse: MapOfPSEmotor.get(ps.VG_Province_List__c)){
                            pse.VG_Policy_Schedule__c = ps.id;
                            //pse.VG_Policy_Schedule__c = AllCoveargePSMap.get(pse.Name).id;
                            pse.Name = pse.Name+'/PE/'+psecount;
                            psecount++;
                        }  
                    } 
                    If(MapOfSubPSEcoverages.get(ps.VG_Province_List__c)!=null){
                        for(VG_Policy_Schedule_Endorsement__c pse: MapOfSubPSEcoverages.get(ps.VG_Province_List__c)){
                            pse.VG_Policy_Schedule__c = AllCoveargePSMap.get(pse.Name).id;
                            pse.Name = pse.Name+'/PESb/' + sbpsecount;
                            sbpsecount++;
                        }
                    }
                }            
                if(!endToBeInserted.IsEmpty()){
                    Insert endToBeInserted;
                }
                if(!subEndToBeInserted.IsEmpty()){
                    Insert subEndToBeInserted;
                }
                if(!assetsToBeInserted.IsEmpty()){
                    Insert assetsToBeInserted;
                }            
                if(!endToBeInserted.IsEmpty() && Product_Select  == 'Motor')  
                    return new PageReference('/apex/VG_VCL_Step_7?AllPSIds='+AllPSIds);
                else
                    return new PageReference('/'+policy.id);
            }     
            
        }Catch(Exception e){
            Database.rollback(sp);
            showError(e);
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            return null;
        }
    }
    
    Public void showError(Exception e){
        String refId = ErrorTrace.insertLog(e , policyId);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin with this reference id '+refId));     
    }    
    
    public void RemoveRR(){
        riskRatingList.remove(integer.valueOf(Index));
        RRcounter = 0;
        sumAnnualPremium = 0;
        System.debug('riskRatingList::'+riskRatingList.size()+'::'+riskRatingList);
        for(RRWrapper temp : riskRatingList){
            temp.Counter = String.valueOf(RRcounter);
            RRcounter++;
            sumAnnualPremium = (sumAnnualPremium+(temp.psa.VG_Premium__c  !=  null ? temp .psa.VG_Premium__c:0)).setScale(2);
            
        }
        if(riskRatingList.IsEmpty()){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please add atleast one asset to the policy schedule..'));   
        }
    }
    public void addRR(){
        RRWrapper waNew = new RRWrapper();
        waNew.Counter = string.valueOf(RRcounter);            
        VG_Policy_Schedule_Asset__c psaNew = new VG_Policy_Schedule_Asset__c();
        psaNew.CurrencyISOCode  =  policy.CurrencyIsoCode;
        psaNew.VG_Deductible__c = 0;
        psaNew.VG_Coverage__c = LP_Select;
        psaNew.VG_Base_Premium_Rate__c = 0;
        psaNew.VG_Premium__c = 0;
        psaNew.VG_Sum_Insured__c = 0;
        waNew.Premium = 0;
        waNew.psa = psaNew;
        riskRatingList.add(waNew);
        RRcounter++;
        sumAnnualPremium = 0;
        for(RRWrapper rrw: riskRatingList){ 
            sumAnnualPremium = (sumAnnualPremium+(rrw.psa.VG_Premium__c  !=  null ? rrw.psa.VG_Premium__c:0)).setScale(2);
            
            System.debug('sumAnnualPremium::'+sumAnnualPremium);
        }
        System.debug('riskRatingList::'+riskRatingList.size()+'::'+riskRatingList);
    }
    public void addUI(){
        RCWrapper rcw = new RCWrapper();
        rcw.Counter = string.valueOf(RCcounter); 
        rcw.CA1 = '';
        rcw.PA1 = '';
        rcw.PSD1 = '';
        rcw.PED1 = '';
        rcw.CO1 = '';
        rcw.UI1 = '';
        rcw.PR1 = '';
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
    
    Public PageReference AddRiskRating(){
        addRRMode = True;
        return null;
    }
    public void AddCustom(){   
        VG_Policy_Schedule_Endorsement__c tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.VG_Premium__c  =  0;
        tempEndsmt.VG_Sub_limit__c = 0;
        tempEndsmt.VG_Type__c = 'Endorsements';
        tempEndsmt.CurrencyISOCode  =  policy.CurrencyIsoCode;
        existingEndorsements.add(tempEndsmt);
    }
    public void UpdateFinalCalculations(){
        System.debug('2.3.2019::'+actualPremium+uwPremium+adjustment);
        Decimal uwPremiumVal;
        Map<String, List<String>> MapEntityList = new Map<String, List<String>>();
        
        MapEntityList = Utilities.Entities('Non EEA',policy.VG_Inception_Date__c ,policy.RecordType.Name,null);
        NonEEAVolanteEntity_Select = new List<SelectOption>();
        If(MapEntityList.get('Non EEA')!=null){
            for(String s : MapEntityList.get('Non EEA')){
                NonEEAVolanteEntity_Select.add(new SelectOption(s,s));
            }
        }
        System.debug('Product_Select::'+Product_Select);
        if(Product_Select == 'Motor'){
            //adjustmentTechPremium
            
            csvFileWrapper[] cvwrapperUW = new csvFileWrapper[]{};
            cvwrapperUW.add(csvFileWrapperList.get(4)); // for adjustmentTechPremium
            system.debug('cvwrapperUW::'+cvwrapperUW);
            for(csvFileWrapper cv: cvwrapperUW){
                system.debug('cv.Total::'+cv.Total);
                uwPremiumVal = Decimal.valueOf(cv.Total.trim().replaceAll('[^a-zA-Z0-9]', ''));
                // lmt = Decimal.valueOf(cv.Limit1.trim().replaceAll('[^a-zA-Z0-9]', ''));
            }
            for(PSWrapper psw: PSWrapperMap.values()){
                //psw.techModelPremium = (psw.sharePercent/100)*psw.netModelPremium;                       
                psw.uwPremium = (psw.netModelPremium!=null?psw.netModelPremium:0) + (psw.adjustmentTechPremium!=null?psw.adjustmentTechPremium:0);
                // psw.adjustmentTechPremium = (psw.uwPremium!=null?psw.uwPremium:0) - (psw.netModelPremium!=null?psw.netModelPremium:0); 
                psw.adjustmentTechPremium = 0;      
                psw.adjustment = 0;         
                psw.grossWrittenPremium  =  (psw.uwPremium!=null?psw.uwPremium:0) +(psw.adjustment!=null?psw.adjustment:0);
                If(psw.sharePercent !=  0){
                    psw.grossWrittenPremium2  = (psw.grossWrittenPremium!=null?psw.grossWrittenPremium:0)*((psw.sharePercent!=null?psw.sharePercent:0)/100);  
                }
                psw.brokerageAmount  =  (psw.grossWrittenPremium2!=null?psw.grossWrittenPremium2:0)*((psw.brokerage!=null?psw.brokerage:0)/100);
                psw.actualPremium = (psw.grossWrittenPremium2!=null?psw.grossWrittenPremium2:0)-psw.brokerageAmount ;        
                If(psw.sharePercent !=  null){
                    psw.sumInsured = psw.lmt*((psw.sharePercent!=null?psw.sharePercent:0)/100);            
                } 
            
            }
        }else{
            techModelPremium = (sharePercent/100)*netModelPremium;
            
            if(Product_Select == 'Motor'){
                uwPremium = uwPremiumVal;
                adjustmentTechPremium = uwPremium - netModelPremium;
            }else{
                uwPremium = netModelPremium+adjustmentTechPremium;
            }
            grossWrittenPremium  =  uwPremium +adjustment;
            If(sharePercent !=  0){
                grossWrittenPremium2  = grossWrittenPremium*(sharePercent/100);  
            }
            brokerageAmount  =  grossWrittenPremium2*(brokerage/100);
            actualPremium = grossWrittenPremium2-brokerageAmount ;        
            If(sharePercent !=  null){
                sumInsured = lmt*(sharePercent/100);            
            } 
        }             
    }
    
    /*Public PageReference SaveRR(){
        
        addRRMode = False;
        Integer counter;
        if(addedRRList.IsEmpty()){
            counter = 0;
        }else{
            counter = addedRRList.size();
        }
        integer asscount = assetValues.size();
        Set<ID> inassids = new Set<ID>();
        for(VG_Policy_Schedule_Asset__c psa: assetValues){
            if(psa.Asset__c  ==  null){
                errmsg = true;
                addRRMode = True;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Asset lookup don\'t empty..'));    
                return null; 
            }
            if(assetMap.containsKey(psa.Asset__c)){
                assetLookups.add(assetMap.get(psa.Asset__c).Name);
            }else{
                inassids.add(psa.Asset__c);
                
            }
            asscount--;
        }
        List<Asset__c> inAssList = new List<Asset__c>([select id, Name from Asset__c where id IN: inassids]);
        for(Asset__c ass: inAssList){
            errmsg = true;
            addRRMode = True;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Selected Asset '+ass.Name+' is invalid.Please select valid asset...'));    
            return null;
        }
        for(VG_Policy_Schedule_Asset__c psa: assetValues){
            RRWrapper tmp = new RRWrapper();
            System.debug('Log::'+assetMap.containsKey(psa.Asset__c));
            tmp.assName = assetMap.get(psa.Asset__c).Name;
            tmp.psa.VG_Risk_start__c = policy.VG_Inception_Date__c;
            tmp.psa.VG_Risk_End__c = policy.VG_Expiry_Date__c;
            tmp.psa.VG_AVG_SI__c  = 0;
            tmp.Premium = 0;
            tmp.sumInsured = 0;
            tmp.psa.VG_Coverage__c = Coverage_Select;
            tmp.psa.VG_Territorial_Limits__c = Teri_Select;
            tmp.psa.VG_Premium__c = 0;
            tmp.psa.VG_Max_SI__c  = 0;
            tmp.psa.Asset__c = psa.Asset__c;
            tmp.psa.CurrencyISOCode  =  policy.CurrencyIsoCode;
            tmp.psa.VG_Base_Premium_Rate__c = 0;
            tmp.psa.VG_Signed_Share__c = 0;
            tmp.psa.VG_Sum_Insured__c = 0;
            tmp.psa.VG_Limit__c = 0;
            tmp.psa.VG_Attachment__c = 0;
            tmp.Counter = String.valueOf(counter);
            addedRRList.add(tmp);
            addedassetLookups.add(assetMap.get(psa.Asset__c).Name);
            counter++;
        }
        RRSize = null;
        assetValues.clear();
        createLoop.clear();
        return null;
    }
    Public void CancelRR(){
        addRRMode = False;
        RRSize = null;
        assetValues.clear();
        createLoop.clear();
    }
    public void RemoveRiskRating(){
        addedassetLookups.remove(addedRRList[integer.valueOf(Index)].psa.Name);
        addedRRList.remove(integer.valueOf(Index));
        counter = 0;
        for(RRWrapper rrw:addedRRList){
            rrw.Counter = String.valueOf(counter);
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
        public String UI1{get;set;}
        public String PR1{get;set;}
    }
    public class RRWrapper{
        public VG_Policy_Schedule_Asset__c psa{get;set;}
        public String Counter{get;set;}
        public String assName{get;set;}
        public String CoverageSelected{get;set;}
        public String ProvinceList {get;set;}
        public String TerritorialSelected{get;set;}
        public Decimal Premium{get;set;}
        public Decimal sumInsured {get;set;}
        public RRWrapper(){
            psa = new VG_Policy_Schedule_Asset__c (); 
            CoverageSelected = '';
            TerritorialSelected = '';
            Premium = 0;
            sumInsured  = 0;
        }
    }
    
    public class AssetWrapper{
        public Asset__c ass{get;set;}
        public String Counter{get;set;}
        public String assName{get;set;}
        public String typeOfOperation{get;set;}
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
    
    Public Class LibraryWrapper{
        Public Endorsement_Library__c EL {get; set;}
        Public Boolean isSelected {get; set;} 
        Public String coverage {get;set;}
        Public LibraryWrapper(){
            EL  =  new Endorsement_Library__c();
            isSelected  =  False;
        }
    }
    
    Public Class csvFileWrapper{
    
        // Motor upload file
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

    Public Class PSWrapper{
        Public Policy_Schedule__c ps {get; set;}
        public Decimal RateChange {get;set;}
        public Decimal netModelPremium {get; set;}
        public Decimal RiskPremium {get;set;}
        public Decimal endorsementPremium {get; set;}
        public Decimal writtenShare {get; set;}
        public Decimal sharePercent {get; set;}
        public Decimal adjustmentTechPremium {get; set;}
        public Decimal sumInsured {get; set;}
        public Decimal uwPremium {get; set;}
        public Decimal grossWrittenPremium2 {get; set;}
        public Decimal adjustment {get;set;}
        public Decimal brokerage {get; set;}
        public Decimal brokerageAmount {get; set;}
        public Decimal grossWrittenPremium {get; set;}
        public Decimal lmt {get;set;}
        public Decimal actualPremium {get; set;}
        public Decimal attachment {get;set;}
        public Decimal ExpectedLossRatio{get;set;}
        public String GrossOrNet {get; set;}
        public string CapacityPaper{get;set;}
        public String SplitType {get;set;}
        public String Entity {get;set;}
        public String layer {get; set;}
        public String province {get; set;}
        Public String VolanteEntity {get; set;}
        Public PSWrapper(){
            ps = new Policy_Schedule__c();
        }
    }
}