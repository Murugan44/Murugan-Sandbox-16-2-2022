Public without sharing Class VG_ReviseGentiumSteps_Controller{
    
    public VG_Policy_Schedule_Asset__c psa{get;set;}
    public Policy_Schedule__c ps{get;set;}
    public Policy_Schedule__c originalPS {get; set;}
    Public Risk_Capture__c rc{get;set;}
    public Policy__c pol {get; set;}
    
    public String Index{get;set;}
    public String polid{get;set;}
    public String MTAType {get; set;}
    public String MTAStartDate{get;set;}
    public String MTAEndDate{get;set;}
    public String PSName {get; set;}
    public String seletedProrateoption {get; set;}  
    public Decimal ExpectedLossRatio{get;set;}
    
    public Integer counter{get;set;}
    public Integer counterRisk{get;set;}
    public Integer counterEnd {get; set;}
    
    public Id PSId {get; set;}
    public Id OriginalId {get; set;}
    public Id policyid {get; set;}
    
    public Boolean IsCancellation {get; set;}
    public Boolean showError {get; set;}
    public Boolean IsExtension {get; set;}
    public Boolean IsRevision {get; set;}
    public Boolean IsDeclaration {get; set;}
    public Boolean hasEndorsements {get; set;}
    public Boolean hasAssets {get; set;}    
    public Boolean hasRCs {get; set;}
    
    public List<VG_Policy_Schedule_Asset__c> psaList{get;set;}
    public List<VG_Policy_Schedule_Endorsement__c> pseList{get;set;}
    public Map<Id, VG_Policy_Schedule_Endorsement__c> pseMap{get;set;}
    public List<VG_ReInsurance__c> RIList {get; set;}
    public List<Risk_Capture__c> rcList{get;set;}
    public List<WrapperAsset> waList{get;set;}
    public List<SelectOption> DecTypes {get; set;}
    public List<VG_Policy_Schedule_Asset__c> psaListDup {get;set;}
    public List<VG_Policy_Schedule_Endorsement__c> pseListDup {get;set;}
    public List<Risk_Capture__c> rcListDup {get;set;}
    public List<VG_ReInsurance__c> RIListDup {get; set;}
    public list<SelectOption> coverageOptions {get; set;}
    Public List<WrapperRisk> wrcList{get;set;}
    public List<Endorsement_Library__c> ElList {get; set;}
    public List<LibraryWrapper> LibraryWrapperList {get; set;}
    
    public list<SelectOption> VolanteEntity_Select {get; set;}
    public list<SelectOption> NonEEAVolanteEntity_Select {get; set;}
    public list<SelectOption> EEAVolanteEntity_Select {get; set;}
    Public List<SelectOption> splitTypes{get; set;} 
    
    public Set<Id> existingEndSet {get; set;}
    
    public decimal TechUWPre{get;set;}
    //public decimal riskPremiumPro{get;set;}
    public decimal TUWPremium {get;set;}
    public decimal endPremiumPro {get;set;}
    public decimal riskPremiumPro {get;set;}
    public decimal grossWrittenPremium{get;set;}
    public decimal IPTCal{get;set;}
    //public decimal endPremiumPro {get;set;}
    public decimal actPremium{get;set;}
    public decimal RateChange {get;set;}
    public decimal brokerageAmount{get;set;}
    public decimal technicalPremium {get;set;}
    public decimal technicalPremiumPro {get;set;}
    
    
    public VG_ReviseGentiumSteps_Controller(ApexPages.StandardController controller) {
        
        showError  =  false;
        TechUWPre  =  technicalPremiumPro   =  0;
        psaList  =  new List<VG_Policy_Schedule_Asset__c>();
        wrcList  =  new List<WrapperRisk>();
        rc  =  new Risk_Capture__c();
        LibraryWrapperList   =   new List<LibraryWrapper>();
        LibraryWrapper LW;
        existingEndSet   =   new Set<Id>();
        
        PSId   =   apexpages.currentpage().getparameters().get('PSID');
        MTAEndDate  =  apexpages.currentpage().getparameters().get('MTAStartEnd');  
        MTAStartDate  =  apexpages.currentpage().getparameters().get('MTAStartDate');
        seletedProrateoption   =  apexpages.currentpage().getparameters().get('seletedProrateoption');  
        OriginalId   =   apexpages.currentpage().getparameters().get('OriginalId');
        MTAType   =   apexpages.currentpage().getparameters().get('MTAType');
        
        DecTypes   =   new List<SelectOption>();
        DecTypes.add(new SelectOption('--Select--', '--Select--'));
        DecTypes.add(new SelectOption('1st Quarter', '1st Quarter'));
        DecTypes.add(new SelectOption('2nd Quarter', '2nd Quarter'));
        DecTypes.add(new SelectOption('3rd Quarter', '3rd Quarter'));
        DecTypes.add(new SelectOption('4th Quarter', '4th Quarter'));
        DecTypes.add(new SelectOption('Annual', 'Annual'));
        Schema.DescribeFieldResult coverageDescription   =   VG_Policy_Schedule_Asset__c.VG_Coverage__c.getDescribe();

        coverageOptions   =   new list<SelectOption>();
        Id GentiumLibraryId   =    Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VIM').getRecordTypeId();
        
        for(Schema.Picklistentry picklistEntry : coverageDescription.getPicklistValues()){
            coverageOptions.add(new SelectOption(pickListEntry.getValue(), pickListEntry.getLabel()));
        }
        system.debug('PSId:::>>'+PSId);
        ps  =  [select id, Name,CurrencyIsoCode,Seleted_Prorate_Option__c,VG_Technical_Loss_Ratio__c,Limit__c,Attachment__c,VG_MTA_Start_Date__c,Split_Type__c,Sum_Insured__c,VG_Volante_Entities__c, VG_MTA_Type__c, Policy__r.Name,Policy__r.VG_Inception_Date__c FROM Policy_Schedule__c Where Id =:PSId];               
        splitTypes = new List<SelectOption>();
        if(ps.Policy__r.VG_Inception_Date__c.year() <= 2020){
            splitTypes.add(new SelectOption('','--None--'));           
        }
        splitTypes.add(new SelectOption('Non EEA','Non EEA'));
        splitTypes.add(new SelectOption('EEA','EEA'));

        if(PSId  !=    null){
            psaList  =  [select id, Name, VG_Number_of_Vehicles__c, VG_Vehicle_Type__c,  VG_IsTemp__c,  VG_IsTempDelete__c,  VG_Use__c,  VG_Coverage__c,  VG_Rate_Per_Vehicle__c, VG_Premium__c,  VG_Deductible__c, VG_Technical_UW_Rate_Annual__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c  =  :PSId];
            PSName   =   [Select Id,  Name from Policy_Schedule__c where Id   = : PSId].Name;
            If(MTAType !=   null && MTAType !=   '' && MTAType   ==   'Revision of Cover')
                psaList.clear();
        }else{
            rcList  =  new List<Risk_Capture__c>();
            pseList  =  new List<VG_Policy_Schedule_Endorsement__c>();
        }
        
        if(MTAType   ==   null){
            System.debug('Constructor if'+PSId);
            polid  =  apexpages.currentpage().getparameters().get('id');
            ps  =  [select id, Name,CurrencyIsoCode, Seleted_Prorate_Option__c,VG_Technical_Loss_Ratio__c,VG_Lloyds_Product__c,VG_MTA_Type__c,Split_Type__c,Limit__c,VG_MTA_Start_Date__c,Attachment__c,Sum_Insured__c,VG_Volante_Entities__c, Policy__r.Name, IPT_Percent__c, VG_Declaration_Type_percent__c, VG_Rate_Change__c, Gross_Written_Premium__c, Levies__c,  Policy__c,  Premium_Adjustment__c,  VG_IsTempDelete__c,  VG_Is_MTA__c,  VG_IsTemp__c,  VG_Declaration_Type__c,  VG_Brokerage_Percent__c,ILF_Layer__c,  VG_Technical_Model_Premium__c,  Base_Creation_End_Date__c,  Base_Creation_Start_Date__c,  VG_Fee_Income__c ,  Product__c,  Policy__r.VG_Expiry_Date__c,  Policy__r.VG_Inception_Date__c, VG_VAT__c, VG_VAT_Amount__c,  VG_Adjustment_Reason__c ,  MTA_Reason_for_Cancellation__c from Policy_Schedule__c Where Id   =  :PSId];
            psaList  =  [select id, Name, VG_Number_of_Vehicles__c,Technical_UW_Premium__c, VG_Vehicle_Type__c, VG_Coverage__c, VG_IsTempDelete__c, VG_IsTemp__c, VG_Use__c,  VG_Rate_Per_Vehicle__c, VG_Premium__c,  VG_Deductible__c, VG_Technical_UW_Rate_Annual__c   from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c  =  :PSId];
            pseMap  =  new Map<Id, VG_Policy_Schedule_Endorsement__c>([select id, Name, VG_Title__c, VG_IsTempDelete__c, VG_IsTemp__c, VG_Premium__c, VG_Endorsement_Details__c, VG_Endorsement_Library_Id__c, VG_Endorsement_Number__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c  =  :PSId]);
            pseList  =  new List<VG_Policy_Schedule_Endorsement__c>();
            pseList  =  pseMap.values();
            rcList  =  new List<Risk_Capture__c>([select Id, Name, Drivers_Name__c, Drivers_DOB__c, VG_IsTempDelete__c, VG_IsTemp__c, Drivers_Convictions__c, Drivers_Conviction_Points__c, Drivers_License_Ban_Details__c, Drivers_Claims__c, Drivers_Medical_Conditions__c, Policy_Schedule__c from Risk_Capture__c where Policy_Schedule__c  =  :PSId]);
            ExpectedLossRatio = ps.VG_Technical_Loss_Ratio__c;          
            RateChange = ps.VG_Rate_Change__c;
            if(ps.VG_Fee_Income__c>0){
                VAT_Setting__mdt [] vs   =   [SELECT VG_VAT__c FROM VAT_Setting__mdt];
                ps.VG_VAT__c  =  vs[0].VG_VAT__c;
                ps.VG_VAT_Amount__c  =  (ps.VG_VAT__c/100)*ps.VG_Fee_Income__c;    
            }else{
                ps.VG_VAT__c  =  0;
                ps.VG_VAT_Amount__c  =  0;
            }
            if(!rcList.IsEmpty()){
                counterRisk  =  0;
                for(Risk_Capture__c rc:rcList){
                    WrapperRisk wrc  =  new WrapperRisk();
                    wrc.rc  =  rc;
                    wrc.Counter  =  String.valueOf(counterRisk);
                    wrcList.add(wrc);
                    counterRisk++;
                }
            }else{
                counterRisk  =  0;
            }
            if(pseList.IsEmpty()){
                hasEndorsements   =   False;
                counterEnd   =   0;
                pseList  =  new List<VG_Policy_Schedule_Endorsement__c>();
            }else{
                hasEndorsements   =   True;
                counterEnd   =   pseList.size();
            }
            for(VG_Policy_Schedule_Endorsement__c Endsmt: pseList){
                Id endId   =   Endsmt.VG_Endorsement_Library_Id__c;
                existingEndSet.add(endId);            
            }
            System.debug('Library Id:'+existingEndSet);
            ElList   =   [Select Id, Text__c,  Name,  Endorsement_Title__c from Endorsement_Library__c where RecordTypeId   =  : GentiumLibraryId ORDER By Name ASC];
            for(Endorsement_Library__c EL : ElList){
                LW   =   new LibraryWrapper();
                LW.EL   =   EL;
                if(existingEndSet.contains(EL.Id)){
                    LW.isSelected   =   True;
                }else{
                    LW.isSelected   =   False;
                }
                LW.premium   =   0;
                LibraryWrapperList.add(LW);
            }
            ps.Base_Creation_Start_Date__c   =   ps.Policy__r.VG_Inception_Date__c;
            ps.Base_Creation_End_Date__c   =   ps.Policy__r.VG_Expiry_Date__c;
            updateCalc();
        }else{
            System.debug('Constructor else');
            psaListDup   =   new List<VG_Policy_Schedule_Asset__c>();
            pseListDup   =   new List<VG_Policy_Schedule_Endorsement__c>();
            RIListDup   =   new List<VG_ReInsurance__c>();
            rcListDup   =   new List<Risk_Capture__c>();
            rcList  =  new List<Risk_Capture__c>();
            pseList  =  new List<VG_Policy_Schedule_Endorsement__c>();
            if(PSId   ==   null){
                originalPS   =   [select id, Name,CurrencyIsoCode,Seleted_Prorate_Option__c,VG_Lloyds_Product__c, VG_MTA_Type__c,Policy__r.Name, Gross_Written_Premium__c,VG_MTA_Start_Date__c, VG_Fee_Income__c, IPT_Percent__c, VG_VAT__c, VG_VAT_Amount__c,  Levies__c,  Policy__c,  Premium_Adjustment__c,ILF_Layer__c,  VG_Technical_Model_Premium__c,  VG_Declaration_Type__c,  VG_Brokerage_Percent__c,  Product__c, VG_Declaration_Type_percent__c,  Policy__r.VG_Expiry_Date__c,  Policy__r.VG_Inception_Date__c,  MTA_Reason_for_Cancellation__c, Base_Creation_End_Date__c, Base_Creation_Start_Date__c from Policy_Schedule__c Where Id   =  :OriginalId];
                polid   =   originalPS.Policy__c;                
                ps  =  originalPS.clone(false,  true,  false,  false);
                ps.id   =   null;               
                ps.VG_MTA_Type__c   =   MTAType;
                ps.VG_Is_MTA__c   =   True;
                RIList   =  new List<VG_ReInsurance__c>([Select Id,  VG_Policy_Schedule__c, VG_RI_Currency__c,  VG_UMR__c from VG_ReInsurance__c where VG_Policy_Schedule__c   =  : OriginalId]);
                
                for(VG_ReInsurance__c ri : RIList){
                    VG_ReInsurance__c temp   =   ri.clone(false,  true,  false,  false);
                    temp.Id   =   null;
                    RIListDup.add(temp);
                }
                if(MTAType   ==   'Revision of Cover'){
                    ps.Base_Creation_End_Date__c   =   OriginalPS.Policy__r.VG_Expiry_Date__c;
                    ps.VG_MTA_End_Date__c   =   OriginalPS.Policy__r.VG_Expiry_Date__c;
                    System.debug('25.4::'+ps.Base_Creation_End_Date__c+'::'+ps.Base_Creation_Start_Date__c);
                    updateCalc();
                }
                if(MTAType   ==   'Declaration'){
                    ps.VG_Declaration_Type__c   =   null;
                    ps.Base_Creation_Start_Date__c   =   OriginalPS.Policy__r.VG_Inception_Date__c;
                    ps.Base_Creation_End_Date__c   =   OriginalPS.Policy__r.VG_Expiry_Date__c;
                    ps.VG_MTA_Start_Date__c   =   OriginalPS.Policy__r.VG_Inception_Date__c;
                    ps.VG_MTA_End_Date__c   =   OriginalPS.Policy__r.VG_Expiry_Date__c;
                    updateCalc();
                }
            }else{
                ps   =   [select id, Name,VG_MTA_Type__c,CurrencyIsoCode,Seleted_Prorate_Option__c,VG_Lloyds_Product__c, Policy__r.Name, IPT_Percent__c,VG_MTA_Start_Date__c,Limit__c,Attachment__c,Split_Type__c,Sum_Insured__c,VG_Volante_Entities__c, Gross_Written_Premium__c, Levies__c, VG_Declaration_Type_percent__c,  Policy__c,  Premium_Adjustment__c,  VG_IsTempDelete__c,  VG_Is_MTA__c,  VG_IsTemp__c,  VG_Declaration_Type__c,  VG_Brokerage_Percent__c,ILF_Layer__c,  VG_Technical_Model_Premium__c,  Base_Creation_End_Date__c,  Base_Creation_Start_Date__c,  VG_Fee_Income__c ,  Product__c,  Policy__r.VG_Expiry_Date__c,  Policy__r.VG_Inception_Date__c, VG_VAT__c, VG_VAT_Amount__c,  VG_Adjustment_Reason__c ,  MTA_Reason_for_Cancellation__c from Policy_Schedule__c Where Id   =  :PSId ];
                polid   =   ps.Policy__c;
                if(MTAType  ==  'Revision of Cover' || MTAType =='Bad Debt Provision'){    
                    ps.VG_Technical_Model_Premium__c = null;
                    actPremium = null;
                    techUWPre = null;
                    ps.VG_Fee_Income__c = null;
                    riskPremiumPro =null;
                    ps.Sum_Insured__c =null ;
                    endPremiumPro =null;
                    ExpectedLossRatio = null;
                    ps.VG_VAT__c = null;
                    ps.Premium_Adjustment__c=null;
                    ps.VG_VAT_Amount__c=null;
                    grossWrittenPremium =null;
                    ps.Limit__c =null;
                    ps.VG_Brokerage_Percent__c=null;  
                    ps.Attachment__c = null;
                    brokerageAmount = null;
                    ps.VG_Capacity_Paper__c = null;
                    RateChange = null;
                    
                }
                /*if(ps.VG_Fee_Income__c>0){
                    VAT_Setting__mdt [] vs   =   [SELECT VG_VAT__c FROM VAT_Setting__mdt];
                    ps.VG_VAT__c  =  vs[0].VG_VAT__c;
                    ps.VG_VAT_Amount__c  =  (ps.VG_VAT__c/100)*ps.VG_Fee_Income__c;    
                }else{
                    ps.VG_VAT__c  =  0;
                    ps.VG_VAT_Amount__c  =  0;
                }*/
            }
            if(MTAType   ==   'Extension'){
                IsExtension   =   True;
                IsCancellation   =   IsRevision   =   IsDeclaration   =   False;
            }else if(MTAType   ==   'Cancellation'){
                IsCancellation   =   True;
                IsExtension   =   IsRevision   =   IsDeclaration   =   False;
            }else if(MTAType   ==   'Revision of Cover'){
                IsRevision   =   True;
                IsCancellation   =   IsExtension   =   IsDeclaration   =   False;
            }else if(MTAType   ==   'Declaration'){
                IsDeclaration   =   True;
                IsCancellation   =   IsRevision   =   IsExtension   =   False;
            }
            System.debug('MTAType:'+MTAType);
        }
        if(MTAType !='Bad Debt Provision'){    
            waList  =  new List<WrapperAsset>();
            if(psaList.IsEmpty()){
                psa  =  new VG_Policy_Schedule_Asset__c();
                psaList.add(psa);
            }
            counter  =  0;
            for(VG_Policy_Schedule_Asset__c tempPS : psaList){
                WrapperAsset wa  =  new WrapperAsset();
                wa.psa  =  tempPS;
                wa.Counter  =  String.valueOf(counter);
                waList.add(wa);
                counter++;
            }
            System.debug('waList::'+waList.size()+'::'+waList);
            for(WrapperAsset wa:waList){
                if(wa.psa.VG_Technical_UW_Rate_Annual__c  !=   null &&  wa.psa.VG_Rate_Per_Vehicle__c  !=   null){
                    wa.techPremium  =  (wa.psa.VG_Number_of_Vehicles__c*wa.psa.VG_Technical_UW_Rate_Annual__c).setScale(2);
                    TechUWPre  =  TechUWPre+wa.techPremium;
                }
            }
        }
        If(MTAType  ==  'Bad Debt Provision' || ps.VG_MTA_Type__c == 'Bad Debt Provision'){
            riskPremiumPro=endPremiumPro = 0;  
            UpdateCalc();           
        }
        
    }
    
    public void RemoveAsset(){
        counter  =  0;
        System.debug('waList::'+waList.size()+'::'+waList);
        for(WrapperAsset wa:waList){
            wa.Counter  =  String.valueOf(counter);
            if(counter   ==   integer.valueOf(Index)){
                wa.psa.VG_IsTempDelete__c   =   True;
            }
            counter++;
            if(wa.psa.VG_Technical_UW_Rate_Annual__c  !=   null &&  wa.psa.VG_Rate_Per_Vehicle__c  !=   null  && wa.psa.VG_Coverage__c  !=   null ){
                System.debug('if::');
                wa.psa.VG_Premium__c  =  wa.psa.VG_Number_of_Vehicles__c*wa.psa.VG_Rate_Per_Vehicle__c;
                wa.techPremium  =  (wa.psa.VG_Number_of_Vehicles__c*wa.psa.VG_Technical_UW_Rate_Annual__c).setScale(2);
            }
        }
        System.debug('waList::'+waList.size()+'::'+waList);
    }
    
    public void addAsset(){
        Boolean allOkToTaddNewAsset   =   True;
        WrapperAsset waNew  =  new WrapperAsset();
        waNew.Counter  =  string.valueOf(counter);
        for(WrapperAsset temp : waList){
            System.debug('Rate::'+temp.psa.VG_Rate_Per_Vehicle__c +':No.of:'+temp.psa.VG_Number_of_Vehicles__c+':coverage:'+temp.psa.VG_Coverage__c+':type:'+temp.psa.VG_Vehicle_Type__c);
            if(temp.psa.VG_Technical_UW_Rate_Annual__c  !=   null && temp.psa.VG_Rate_Per_Vehicle__c  !=   null && temp.psa.VG_Number_of_Vehicles__c  !=   null && temp.psa.VG_Coverage__c  !=   null && temp.psa.VG_Vehicle_Type__c  !=    null && temp.psa.VG_Use__c  !=   null){
                System.debug('if::');
                temp.psa.VG_Premium__c  =  (temp.psa.VG_Number_of_Vehicles__c*temp.psa.VG_Rate_Per_Vehicle__c).setScale(2);
                temp.techPremium  =  (temp.psa.VG_Number_of_Vehicles__c*temp.psa.VG_Technical_UW_Rate_Annual__c).setScale(2);
            }else if(!temp.psa.VG_IsTempDelete__c){
                System.debug('else::');
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please enter the Number, Use,  Rate,  Technical Rate and Coverage for all vehicles before adding a new asset..'));    
                allOkToTaddNewAsset   =   False;     
                
            }
        }
        if(allOkToTaddNewAsset){
            VG_Policy_Schedule_Asset__c psaNew  =  new VG_Policy_Schedule_Asset__c();
            psaNew.VG_IsTemp__c   =   True;
            waNew.psa  =  psaNew;
            waList.add(waNew);
            counter++;
        }
        System.debug('waList::'+waList.size()+'::'+waList);
    }
    
    public void updateDeclarationRate(){
        Declaration_Rates__c decRates   =   Declaration_Rates__c.getInstance('Edison_Motor');
        if(ps.VG_Declaration_Type__c  !=    '--Select--'){
            if(ps.VG_Declaration_Type__c   ==   '1st Quarter'){
                ps.VG_Declaration_Type_percent__c   =   decRates.Q1_Declaration_Rate__c;
            }else if(ps.VG_Declaration_Type__c   ==   '2nd Quarter'){
                ps.VG_Declaration_Type_percent__c   =   decRates.Q2_Declaration_Rate__c;
            }else if(ps.VG_Declaration_Type__c   ==   '3rd Quarter'){
                ps.VG_Declaration_Type_percent__c   =   decRates.Q3_Declaration_Rate__c;
            }else if(ps.VG_Declaration_Type__c   ==   '4th Quarter'){
                ps.VG_Declaration_Type_percent__c   =   decRates.Q4_Declaration_Rate__c;
            }else if(ps.VG_Declaration_Type__c   ==   'Annual'){
                ps.VG_Declaration_Type_percent__c   =   decRates.Annual_Declaration_Rate__c;
            } 
        }
        //System.Debug(ps.VG_Declaration_Type_percent__c);
    }
    
    public void AddRisk(){
        counterRisk  =  0;
        WrapperRisk wrc  =  new WrapperRisk();
        rc.VG_IsTemp__c   =   True;
        wrc.rc  =  rc;
        wrc.Counter  =  String.valueOf(counterRisk);
        wrcList.add(wrc);
        counterRisk++;
        System.debug('wrc::'+wrc.rc.Policy_Schedule__c);
        rc  =  new Risk_Capture__c();
        
    }
    
    public void RemoveRisk(){
        counterRisk  =  0;
        for(WrapperRisk wrc:wrcList){
            wrc.Counter  =  String.valueOf(counterRisk);
            if(counterRisk   ==   integer.valueOf(Index)){
                wrc.rc.VG_IsTempDelete__c   =   True;
            }
            counterRisk++;
        }
    }
    
    public void EditRisk(){
        rc  =  wrcList[integer.valueOf(Index)].rc;
        System.debug('rc::'+rc.Policy_Schedule__c);
        wrcList.remove(integer.valueOf(Index));
        counterRisk--;
    }
    
    public PageReference updateCalc(){
        Map<String, List<String>> MapEntityList = new Map<String, List<String>>();            
        Date StartDate;
        if(MTAType  ==  null && ps.VG_MTA_Type__c  ==  null)
           StartDate = ps.Policy__r.VG_Inception_Date__c; 
        else if(MTAType  !=  null && MTAStartDate !=  null)      
           StartDate = Date.valueOf(MTAStartDate);
        else
           StartDate = ps.VG_MTA_Start_Date__c;
        If(ps.Split_Type__c == 'None' || ps.Split_Type__c == null){
           MapEntityList = Utilities.Entities('EEA' ,StartDate  ,'VIM',null);
           MapEntityList = Utilities.Entities('Non EEA',StartDate ,'VIM',null);
        }else{
           MapEntityList = Utilities.Entities(ps.Split_Type__c ,StartDate ,'VIM',null);
        }
        VolanteEntity_Select = new List<SelectOption>();
        If(Utilities.VolanteEntitySet!=null){
            for(String s: Utilities.VolanteEntitySet){
                VolanteEntity_Select.add(new SelectOption(s,s));
            }
        }
        NonEEAVolanteEntity_Select = new List<SelectOption>();
        If(MapEntityList.get('Non EEA')!=null){
            for(String s : MapEntityList.get('Non EEA')){
                NonEEAVolanteEntity_Select.add(new SelectOption(s,s));
            }
        }
        EEAVolanteEntity_Select = new List<SelectOption>();
        If(MapEntityList.get('EEA')!=null){
            for(String s : MapEntityList.get('EEA')){
                EEAVolanteEntity_Select.add(new SelectOption(s,s));
            }
        }
        if(ps.VG_Fee_Income__c>0){
            VAT_Setting__mdt [] vs   =   [SELECT VG_VAT__c FROM VAT_Setting__mdt];
            ps.VG_VAT__c  =  vs[0].VG_VAT__c;
            ps.VG_VAT_Amount__c  =  (ps.VG_VAT__c/100)*ps.VG_Fee_Income__c;    
        }else{
            ps.VG_VAT__c  =  0;
            ps.VG_VAT_Amount__c  =  0;
        }
        if(ps.Premium_Adjustment__c  !=    null){
            grossWrittenPremium   =   (technicalPremium!=null?technicalPremium:0)+ (ps.Premium_Adjustment__c!=null?ps.Premium_Adjustment__c:0);
        }else{
            grossWrittenPremium   =   technicalPremiumPro + 0;
        }
        
        if(ps.VG_Brokerage_Percent__c  !=    null){
            brokerageAmount   =   grossWrittenPremium * (ps.VG_Brokerage_Percent__c/100);
            brokerageAmount  =  brokerageAmount.setScale(2);
        }else{
            brokerageAmount   =   0;
        }
        actPremium  =  grossWrittenPremium-brokerageAmount;
        
        return null;
    }
    
    public PageReference Cancel(){
        return new PageReference('/'+PSId);
    }
    
    public PageReference previous(){
        if(MTAType   ==   null){
            return new PageReference('/apex/VG_Revise_Gentium_Edit1?psid  =  '+psid);
        }else{
            return new PageReference('/apex/VG_Revise_Gentium_Edit1?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&psid  =  '+ps.id);
        }   
    }
    
    public PageReference previous4(){
        if(MTAType   ==   null){
            return new PageReference('/apex/VG_Revise_Gentium_Edit3b?psid  =  '+psid);
        }else{
            return new PageReference('/apex/VG_Revise_Gentium_Edit3b?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&psid  =  '+ps.id);
        }   
    }
    public void RemoveCustom(){
        List<VG_Policy_Schedule_Endorsement__c> newPSEList  =  new List<VG_Policy_Schedule_Endorsement__c>();
        newPSEList.addAll(pseList);
        pseList.clear();
        for(VG_Policy_Schedule_Endorsement__c pse: newPSEList){
            if(!pse.VG_IsTempDelete__c){
                pseList.add(pse);
            }
        }
    }
    public void AddCustom(){
        hasEndorsements   =   True;    
        VG_Policy_Schedule_Endorsement__c tempEndsmt   =   new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.VG_Policy_Schedule__c   =   PSId;
        tempEndsmt.VG_Premium__c   =   0;
        tempEndsmt.VG_Type__c  =  'Endorsements';
        pseList.add(tempEndsmt);
    }
    
    public PageReference Nexta(){
        System.debug('pseList::'+pseList.size());
        List<VG_Policy_Schedule_Endorsement__c> endorsementsToBeInserted   =   new List<VG_Policy_Schedule_Endorsement__c>();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        counterEnd   =   1;
        hasEndorsements   =   False;
        for(LibraryWrapper LW : LibraryWrapperList){
            if(LW.isSelected){
                hasEndorsements   =   True;
                if(!existingEndSet.contains(LW.EL.Id)){
                    System.debug('LW.EL.Id::'+LW.EL.Id);
                    tempEndsmt   =   new VG_Policy_Schedule_Endorsement__c();
                    tempEndsmt.VG_Endorsement_Details__c   =   LW.EL.Text__c;
                    tempEndsmt.VG_Endorsement_Library_Id__c   =   LW.EL.Id;
                    tempEndsmt.VG_Policy_Schedule__c   =   PSId;
                    tempEndsmt.VG_Title__c   =   LW.EL.Endorsement_Title__c;
                    tempEndsmt.VG_Premium__c   =   0;
                    tempEndsmt.Name   =   PSName + '/PE/' + counterEnd;
                    tempEndsmt.VG_Endorsement_Number__c   =   LW.EL.Name;
                    tempEndsmt.VG_IsTempDelete__c   =   False;
                    tempEndsmt.VG_IsTemp__c   =   True;
                    counterEnd++;
                    pseList.add(tempEndsmt);
                    existingEndSet.add(LW.EL.Id);
                }
            }else{
                if(existingEndSet.contains(LW.EL.Id)){
                    for(VG_Policy_Schedule_Endorsement__c endsmt : pseList){
                        if(endsmt.VG_Endorsement_Library_Id__c   ==   LW.EL.Id){
                            endsmt.VG_IsTempDelete__c   =   True;
                            endsmt.VG_IsTemp__c   =   False;
                        }
                    }
                }
            }
        }
        System.debug('pseList::'+pseList.size());
        /*for(VG_Policy_Schedule_Endorsement__c pse:pseMap.values()){
          if(pse.VG_Endorsement_Library_Id__c   ==   null){
            pse.VG_IsTempDelete__c   =  false;
            pseList.add(pse);
          }
        }*/
        if(MTAType   ==   null){
            return new PageReference('/apex/VG_Revise_Gentium_Edit3b?psid  =  '+psid);
        }else{
            return new PageReference('/apex/VG_Revise_Gentium_Edit3b?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&psid  =  '+ps.id);
        } 
    }
    
    public PageReference Nextb(){
        
        /*if(ps.VG_Fee_Income__c>0){
            VAT_Setting__mdt [] vs   =   [SELECT VG_VAT__c FROM VAT_Setting__mdt];
            ps.VG_VAT__c  =  vs[0].VG_VAT__c;
            ps.VG_VAT_Amount__c  =  (ps.VG_VAT__c/100)*ps.VG_Fee_Income__c;    
        }else{
            ps.VG_VAT__c  =  0;
            ps.VG_VAT_Amount__c  =  0;
        }
        if(psaList.IsEmpty()){
            hasAssets   =   False;
        }else{
            hasAssets   =   True;
        }
        if(rcList.IsEmpty()){
            hasRCs   =   False;
        }else{
            hasRCs   =   True;
        }
        if(pseList.IsEmpty()){
            hasEndorsements   =   False;
        }else{
            hasEndorsements   =   True;
        }*/
        Decimal proratingfator   =   1;
        riskPremiumPro  =  0;
        techUWPre   =   0;
        system.debug('psaList::'+psaList);
        for(VG_Policy_Schedule_Asset__c psa:psaList){
            if(!psa.VG_IsTempDelete__c){
                riskPremiumPro  =  riskPremiumPro+psa.VG_Premium__c;
                if(psa.Technical_UW_Premium__c  !=    null)
                    techUWPre   =   techUWPre   + psa.Technical_UW_Premium__c;
            }
        }
        
        endPremiumPro   =   0;
        for(VG_Policy_Schedule_Endorsement__c pse:pseList){
            if(!pse.VG_IsTempDelete__c)
                endPremiumPro   =  endPremiumPro +pse.VG_Premium__c;
        } 
        if(MTAType   ==   null){
            proratingfator   =   Decimal.valueOf(ps.Base_Creation_Start_Date__c.daysBetween(ps.Base_Creation_End_Date__c)+1)/365;
        }else{
            if(MTAType   ==   'Revision of Cover'){
                proratingfator   =   Decimal.valueOf(ps.Base_Creation_Start_Date__c.daysBetween(ps.Base_Creation_End_Date__c)+1)/365;
            }else if(MTAType   ==   'Declaration'){
                proratingfator   =   (ps.VG_Declaration_Type_percent__c/100);
            }
        }
        if(ps.Seleted_Prorate_Option__c == 'Flat' || seletedProrateoption == 'Flat')
                proratingfator = 1;
        if(MTAType   ==   'Revision of Cover'){
            System.debug('seletedProrateoption::'+seletedProrateoption+'::'+ps.Seleted_Prorate_Option__c+riskPremiumPro);
            If(seletedProrateoption  ==  'Flat'){
                System.debug('riskPremiumPro::'+riskPremiumPro);
                riskPremiumPro   =   riskPremiumPro;
                techUWPre   =   techUWPre ;
                endPremiumPro   =   endPremiumPro ;
                technicalPremium   =   riskPremiumPro + endPremiumPro;
            }else If(seletedProrateoption  ==  'Prorated'){
                riskPremiumPro   =   riskPremiumPro * proratingfator;
                techUWPre   =   techUWPre * proratingfator;
                endPremiumPro   =   endPremiumPro * proratingfator;
                technicalPremium   =   (riskPremiumPro + endPremiumPro );
            }           
        }else{
            riskPremiumPro   =   riskPremiumPro * proratingfator;
            techUWPre   =   techUWPre  * proratingfator;
            endPremiumPro   =   endPremiumPro * proratingfator;
            technicalPremium   =   (riskPremiumPro + endPremiumPro);
        }
        updateCalc();
        if(MTAType   ==   null){
            return new PageReference('/apex/VG_Revise_Gentium_Edit4?psid  =  '+psid);
        }else{
            return new PageReference('/apex/VG_Revise_Gentium_Edit4?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&psid  =  '+ps.id);
        } 
    }
    
    public PageReference NextPSA(){
        
        Boolean noAsset   =   True;
        for(WrapperAsset temp : waList){
            if(!temp.psa.VG_IsTempDelete__c){
                noAsset   =   False;
                Break;
            }
        }
        
        if(waList.size()  ==  0){
            
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please add atleast one asset to the policy schedule..'));    
            return null;  
            
        }else{
            
            Boolean allOkToTaddNewAsset   =   True;
            psaList   =   new List<VG_Policy_Schedule_Asset__c >();
            Decimal TUWStep1Premium   =   0;
            
            for(WrapperAsset temp : waList){
                
                if(temp.psa.VG_Technical_UW_Rate_Annual__c !=   null && temp.psa.VG_Rate_Per_Vehicle__c  !=   null && temp.psa.VG_Number_of_Vehicles__c  !=   null && temp.psa.VG_Coverage__c  !=   null && temp.psa.VG_Vehicle_Type__c  !=    null && temp.psa.VG_Use__c  !=   null){
                    
                    temp.psa.VG_Premium__c  =  (temp.psa.VG_Number_of_Vehicles__c*temp.psa.VG_Rate_Per_Vehicle__c).setScale(2);
                    temp.techPremium  =  (temp.psa.VG_Number_of_Vehicles__c*temp.psa.VG_Technical_UW_Rate_Annual__c).setScale(2);
                    temp.psa.Technical_UW_Premium__c  =  (temp.psa.VG_Number_of_Vehicles__c*temp.psa.VG_Technical_UW_Rate_Annual__c).setScale(2);
                    TUWStep1Premium   =   TUWStep1Premium + temp.psa.Technical_UW_Premium__c;
                    
                }else if(!temp.psa.VG_IsTempDelete__c){
                    
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please enter the Number, Use,  Rate, Technical Rate and Coverage for all vehicles before adding a new asset..'));    
                    allOkToTaddNewAsset   =   False;   
                    return null;
                    
                }
                
                psaList.add(temp.psa);
            }
            
            ps.Technical_UW_Premium__c   =   TUWStep1Premium ;
            
            if(MTAType   ==   null && ps.Product__c   ==   null ){
                
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product..'));    
                showError  =  true;   
                return null;
                
            }
            
            Integer count  =  0;
            
            for(VG_Policy_Schedule_Asset__c psa:psaList){
                
                count  =  count+1;
                psa.VG_Policy_Schedule__c  =  PSId;
                
                if(psa.VG_Number_of_Vehicles__c !=   null && psa.VG_Rate_Per_Vehicle__c  !=   null){
                    psa.VG_Premium__c  =  psa.VG_Number_of_Vehicles__c*psa.VG_Rate_Per_Vehicle__c;
                    psa.Technical_UW_Premium__c  =  psa.VG_Number_of_Vehicles__c*psa.VG_Technical_UW_Rate_Annual__c;
                }
                psa.Name  =  ps.Name+'/RR/'+count;
                
            }
            if(MTAType   ==   null){
                return new PageReference('/apex/VG_Revise_Gentium_Edit2?PSId  =  '+PSId);
            }else{
                
                for(VG_ReInsurance__c ri : RIListDup){
                    ri.VG_Policy_Schedule__c   =   PSId;
                }
                
                Upsert RIListDup;
                return new PageReference('/apex/VG_Revise_Gentium_Edit2?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&id  =  '+ps.id+'&policyid  =  '+polid);
            }
            //return new PageReference('/apex/VG_Revise_Gentium_Edit2?PSId  =  '+PSId);
        }
    } 
    
    public PageReference NextRC(){
        List<Risk_Capture__c> rcInsList  =  new List<Risk_Capture__c>();
        for(WrapperRisk wrc:wrcList){
            wrc.rc.Name  =  ps.Name+'/RD/'+wrc.Counter;
            wrc.rc.Policy_schedule__c  =  PSId;
        }
        System.debug('pseList::'+pseList.size());
        if(MTAType   ==   null){
            return new PageReference('/apex/VG_Revise_Gentium_Edit3?id  =  '+psid);
        }else{
            return new PageReference('/apex/VG_Revise_Gentium_Edit3?MTAType  =  '+MTAType+'&OriginalId  =  '+OriginalId+'&id  =  '+ps.id);
        }   
    } 
    
    public PageReference Previousa(){
        return new PageReference('/apex/VG_Revise_Gentium_Edit2?id  =  '+psid);
    }
    
    public PageReference Previousb(){
        return new PageReference('/apex/VG_Revise_Gentium_Edit3?id  =  '+psid);
    }
    
    public PageReference Finish(){
        Savepoint sp = Database.setSavepoint();       
        try{
            //updateCalc();
            List<VG_Policy_Schedule_Asset__c> PSAtoBeUpserted   =   new List<VG_Policy_Schedule_Asset__c>();
            List<VG_Policy_Schedule_Asset__c> PSAtoBeDeleted   =   new List<VG_Policy_Schedule_Asset__c>();
            List<Risk_Capture__c> RCtoBeUpserted   =   new List<Risk_Capture__c>();
            List<Risk_Capture__c> RCtoBeDeleted   =   new List<Risk_Capture__c>();
            List<VG_Policy_Schedule_Endorsement__c> endorsementsToBeUpserted   =   new List<VG_Policy_Schedule_Endorsement__c>();
            List<VG_Policy_Schedule_Endorsement__c> endorsementsToBeDeleted   =   new List<VG_Policy_Schedule_Endorsement__c>();       
            Integer count  =  0;    
            PSName = PSName.remove('/EEA').remove('/NonEEA');
            if(ps.Split_Type__c == 'Non EEA'){
                PSName = PSName+'/NonEEA';
            }else if(ps.Split_Type__c == 'EEA'){
                PSName = PSName+'/EEA';
            }  
            System.debug('riskPremiumPro::'+riskPremiumPro+'::'+endPremiumPro+'::'+techUWPre);
            ps.Risk_Premium_Pro__c   =   riskPremiumPro ;        
            ps.Technical_UW_Premium__c   =   techUWPre;         
            ps.Endorsement_Premium_Pro__c   =   endPremiumPro;    
            ps.RecordTypeId  =  Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('VIM').getRecordTypeId();
            ps.Gross_Written_Premium__c  =  grosswrittenpremium;
            ps.VG_Gross_Written_Premium_100__c  =  grosswrittenpremium;
            ps.Actual_GWP__c  =  actPremium;
            ps.VG_Brokerage_Amount__c  =  brokerageAmount;
            ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;          
            ps.VG_Rate_Change__c  =  RateChange;
            ps.Base_Creation_Start_Date__c   =   ps.Policy__r.VG_Inception_Date__c;
            ps.Base_Creation_End_Date__c   =   ps.Policy__r.VG_Expiry_Date__c;  
            ps.Name = PSName;   
            if(seletedProrateoption !=null && MTAType != 'Bad Debt Provision')
                ps.Seleted_Prorate_Option__c = seletedProrateoption;
          
            if(MTAType  !=    'Revision of Cover' &&  MTAType != 'Bad Debt Provision')
                Update ps; 
            //Utilities.clearMethods();
            system.debug('psName: '+ps.Name + '::'+PSName);
            If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){            
                for(WrapperAsset wa : waList){
                    wa.psa.CurrencyIsoCode  =  ps.CurrencyIsoCode;           
                    if(wa.psa.VG_IsTempDelete__c && wa.psa.Id  !=    null){
                        PSAtoBeDeleted.add(wa.psa);
                    }
                    if(!wa.psa.VG_IsTempDelete__c){
                        System.debug('count::'+count);
                        wa.psa.Name  =  PSName+'/RR/'+count;
                        PSAtoBeUpserted.add(wa.psa);
                        count++;
                        System.debug('count::'+count+'::'+PSAtoBeUpserted);
                    }            
                }   
                Integer rccount  =  0;      
                for(WrapperRisk wr : wrcList){
                    wr.rc.CurrencyIsoCode  =  ps.CurrencyIsoCode;
                    if(wr.rc.VG_IsTempDelete__c && wr.rc.Id  !=    null){
                        RCtoBeDeleted.add(wr.rc);
                    }
                    if(!wr.rc.VG_IsTempDelete__c){
                        System.debug('rccount::'+rccount);
                        wr.rc.Name  =  PSName+'/RR/'+rccount;
                        RCtoBeUpserted.add(wr.rc);
                        rccount++;
                        System.debug('rccount::'+rccount);
                    }           
                }
                Set<ID> pseIds  =  new Set<ID>();
                Integer pseCount  =  1;
                for(VG_Policy_Schedule_Endorsement__c pse: pseList){
                    if(!pse.VG_IsTempDelete__c && pse.Id  !=    null){
                        system.System.debug('PSName::'+PSName);
                        pse.Name  =  PSName+'/PE/'+pseCount;
                        pseCount++;
                    }
                    System.debug('::>>'+pse.Name+'::'+pse.id);
                    pseIds.add(pse.id);
                }
                for(VG_Policy_Schedule_Endorsement__c pse: pseList){
                    if(!pse.VG_IsTempDelete__c && pse.Id   ==   null){
                        System.debug('PSName::'+PSName);
                        pse.Name  =  PSName+'/PE/'+pseCount;
                        pseCount++;               
                        endorsementsToBeUpserted.add(pse);
                        System.debug('PSName::'+PSName);
                        System.debug('endorsementsToBeUpserted::'+endorsementsToBeUpserted);
                    }
                }
                if(pseMap != null){
                    for(VG_Policy_Schedule_Endorsement__c pse: pseMap.values()){
                        System.debug(':::::>>'+pse.Name+'::'+pse.id+'::'+pseIds.contains(pse.id));
                        if(!pseIds.contains(pse.id)){
                            endorsementsToBeDeleted.add(pse);
                        }
                    }
                }
            }
            if(MTAType  !=  'Revision of Cover' &&  MTAType != 'Bad Debt Provision'){
                if(!PSAtoBeDeleted.IsEmpty()){
                    System.debug('PSAtoBeDeleted::'+'::'+PSAtoBeDeleted);
                    Delete PSAtoBeDeleted;
                }
                if(!PSAtoBeUpserted.IsEmpty()){
                    System.debug('PSAtoBeUpserted::'+'::'+PSAtoBeUpserted);
                    Upsert PSAtoBeUpserted;
                }
                if(!RCtoBeDeleted.IsEmpty()){
                    Delete RCtoBeDeleted;
                }
                if(!RCtoBeUpserted.IsEmpty()){
                    Upsert RCtoBeUpserted;
                }       
                if(!endorsementsToBeDeleted.IsEmpty()){
                    Delete endorsementsToBeDeleted;
                }
                if(!endorsementsToBeUpserted.IsEmpty()){
                    Upsert endorsementsToBeUpserted;
                    System.debug('endorsementsToBeUpserted::'+endorsementsToBeUpserted);
                }                
                /*List<VG_ReInsurance__c> RIListToBeDel   =   [Select Id from VG_ReInsurance__c where VG_Policy_Schedule__c   =  : ps.Id];
                Delete RIListToBeDel;*/
                
                return new PageReference('/'+PSId);
            }else{
                List<Policy_Schedule__c> psList  =  new List<Policy_Schedule__c>([select id, Name,CurrencyIsoCode, Policy__r.Name from Policy_Schedule__c where Policy__c  =  :ps.Policy__c]);
                Policy_Schedule__c rocps  =  new Policy_Schedule__c();
                rocps  =  ps;
                rocps.VG_Is_MTA__c  =  true;
                If(MTAType == 'Bad Debt Provision'){
                    rocps.VG_MTA_Type__c = 'Bad Debt Provision';
                    System.debug('MTAType::'+rocps.VG_MTA_Type__c); 
                    If(MTAEndDate!=null)
                        rocps.VG_MTA_End_Date__c=Date.valueOf(MTAEndDate);
                    If(MTAStartDate!=null)
                        rocps.VG_MTA_Start_Date__c=Date.valueOf(MTAStartDate);              
                }else{
                    rocps.VG_MTA_Type__c = 'Revision of Cover';
                    rocps.VG_MTA_Start_Date__c = Date.valueOf(MTAStartDate);
                    rocps.VG_MTA_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;               
                }
                rocps.VG_Base_Policy__c  =  true;
                rocps.id  =  null;
                rocps.Gross_Written_Premium__c  =  grosswrittenpremium;
                rocps.VG_Gross_Written_Premium_100__c  =  grosswrittenpremium;
                rocps.Actual_GWP__c  =  actPremium;
                rocps.VG_Brokerage_Amount__c  =  brokerageAmount;
                rocps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;                      
                rocps.VG_MTA_Start_Date__c  =  Date.valueOf(MTAStartDate);
                rocps.VG_MTA_End_Date__c  =  ps.Policy__r.VG_Expiry_Date__c;
                rocps.Base_Creation_Start_Date__c  =  rocps.VG_MTA_Start_Date__c;
                rocps.Base_Creation_End_Date__c  =  rocps.VG_MTA_End_Date__c;
                rocps.IPT__c = null;
                rocps.IPT_Percent__c = null;
                rocps.MTA_Parent_Policy_Schedule__c  =  PSId; 
                if(seletedProrateoption !=null && MTAType != 'Bad Debt Provision' && MTAType != 'Run-off')
                    rocps.Seleted_Prorate_Option__c = seletedProrateoption;
                       
                integer tmp;
                String[] tempDetail;
                if(psList.size()>0){
                    List<Integer> nums  =  new List<Integer>();
                    for(Policy_Schedule__c ps : psList){
                        ps.Name = ps.Name.remove('/EEA').remove('/NonEEA');
                        If(ps.Name.contains('/PS/')) 
                            tempDetail  =  ps.Name.split('/PS/');
                        else If(ps.Name.contains('/MTA/'))
                            tempDetail  =  ps.Name.split('/MTA/');
                        tmp  =  Integer.valueOf(tempDetail[1]);
                        nums.add(tmp);
                    }
                    nums.sort();
                    System.debug('max::'+nums[0]+'::'+nums[nums.size()-1]);
                    rocps.Name  =  ps.Policy__r.Name+'/MTA/'+(nums[nums.size()-1]+1);
                    if(rocps.Split_Type__c == 'Non EEA'){
                        rocps.Name = rocps.Name+'/NonEEA';
                    }else if(rocps.Split_Type__c == 'EEA'){
                        rocps.Name = rocps.Name+'/EEA';
                    }  
                }
                PolicyScheduleTriggerFunction.isBasePsProduct = True;                 
                PolicyScheduleTriggerFunction.allowInsertRI   =   True;
                Insert rocps;
                // List<Policy_Schedule__c> TriggerNew   =   new List<Policy_Schedule__c>();
                // TriggerNew.add(rocps);
                // PolicyScheduleTriggerFunction.allowInsertRI   =   True;
                // PolicyScheduleTriggerFunction.createRIRecords(TriggerNew);
                If(MTAType != 'Bad Debt Provision' && ps.VG_MTA_Type__c!= 'Bad Debt Provision'){
                    List<Risk_Capture__c> rocrc  =  new List<Risk_Capture__c>();
                    rocrc.addAll(RCtoBeUpserted);
                    //rocpsa.addAll(assetToBeInserted);
                    Integer rccounter  =  1;
                    if(!rocrc.IsEmpty()){
                        for(Risk_Capture__c  rc: rocrc){
                            rc.id  =  null;
                            rc.Policy_Schedule__c  =  rocps.id;
                            rc.Name  =  rocps.Name+'/RR/'+rccounter;
                            rccounter++;                   
                        }
                        Insert rocrc;
                    }    
                    List<VG_Policy_Schedule_Asset__c> rocpsa  =  new List<VG_Policy_Schedule_Asset__c>();
                    rocpsa.addAll(PSAtoBeUpserted);
                    //rocpsa.addAll(assetToBeInserted);
                    Integer psacounter  =  1;
                    if(!rocpsa.IsEmpty()){
                        for(VG_Policy_Schedule_Asset__c  psa : rocpsa){
                            psa.id  =  null;
                            psa.VG_Policy_Schedule__c  =  rocps.id;
                            psa.Name  =  rocps.Name+'/RR/'+psacounter;
                            psacounter++;                   
                        }
                        Insert rocpsa;
                    }                   
                    List<VG_Policy_Schedule_Endorsement__c> rocend  =  new List<VG_Policy_Schedule_Endorsement__c>();
                    rocend.addAll(endorsementsToBeUpserted);
                    //rocend.addAll(endToBeInserted);
                    Integer psecounter  =  1;
                    Integer psesbcounter  =  1;
                    if(!rocend.IsEmpty()){
                        for(VG_Policy_Schedule_Endorsement__c pse : rocend){
                            pse.id  =  null;
                            pse.VG_Policy_Schedule__c  =  rocps.id;
                            pse.Name  =  rocps.Name+'/PE/'+psecounter;
                            psecounter++;
                        }
                        Insert rocend;
                    }    
                }       
                return new PageReference('/'+rocps.Id);
            }
        }Catch(Exception e){
            Database.rollback(sp);
            showError(e);
            return null;
        }  
    }
    
    Public void showError(Exception e){
        String refId = ErrorTrace.insertLog(e , PSID);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin with this reference id '+refId));     
    }
    
    public class WrapperAsset{
        public VG_Policy_Schedule_Asset__c psa{get;set;}
        public String Counter{get;set;}
        public Decimal techPremium{get;set;}
    }
    
    public class WrapperRisk{
        public Risk_Capture__c rc{get;set;}
        public String Counter{get;set;}
    }
    
    Public Class LibraryWrapper{
        Public Endorsement_Library__c EL {get; set;}
        Public Boolean isSelected {get; set;} 
        Public Decimal premium {get; set;}
        Public LibraryWrapper(){
            EL   =   new Endorsement_Library__c();
            isSelected   =   False;
            premium   =   0;
        }
    }
}