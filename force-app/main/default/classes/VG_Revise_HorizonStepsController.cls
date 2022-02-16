Public Class VG_Revise_HorizonStepsController{
    public Id PSID {get; set;}
    Public Risk_Capture__c rc{get;set;}
    Public VG_Policy_Schedule_Asset__c rr{get;set;}
    public Policy_Schedule__c ps {get; set;}
    public Policy_Schedule__c rocps{get;set;}
    
    Public String Product{get;set;}
    public String PolicyId{get;set;}
    public String PolicyName{get;set;}    
    public String policyCurrency {get; set;}
    public String MTAType{get;set;}
    public String MTAStartDate{get;set;}
    Public String MTAEndDate{get;set;}   
    public String seletedProrateoption {get; set;}  
    public string CapacityPaper{get;set;}
    public String SplitType {get;set;}
    Public String LProduct{get;set;}
    
    public Boolean skipSplit {get; set;}
    public Boolean hasEndorsements {get; set;}
    Public Boolean EnableReinstatement{get;set;}
    public Decimal Overider{get;set;}
    public Decimal Brokerage{get;set;}
    public Decimal FeeIncome{get;set;}
    public Decimal TransactionalPremium{get;set;}
    public Decimal ActualPremium{get;set;}
    public Decimal Levies{get;set;}
    public Decimal PremiumAdjustment{get;set;}
    public Decimal TotalLayerPremium{get;set;}
    public Decimal SignedShare{get;set;}
    public Decimal WrittenShare{get;set;}
    public Decimal GrossWrittenPremium{get;set;}
    public Decimal GrossWrittenPremium2{get;set;}
    public Decimal TechnicalPremium{get;set;}
    public Decimal BrokerageAmount{get;set;}
    public Decimal OveriderAmount{get;set;}
    public Decimal RateOnLine{get;set;}
    public Decimal MinimumPremium{get;set;}
    public Decimal DepositPremium{get;set;}
    public Decimal NCBValue{get;set;}
    public Decimal RiskPremium{get;set;}
    public Decimal PSRiskPremium{get;set;}
    public Decimal RateChange {get;set;}
    public Decimal EndorsementPremium{get;set;}
    public Decimal techmodelpremium{get;set;}
    public Decimal netmodelpremium{get;set;}
    public Decimal TechnicalLossRatio{get;set;}
    public Decimal sumInsured{get;set;}
    public Decimal proRata{get;set;}
    public Decimal psLimit{get;set;}
    public Decimal ExpectedLossRatio{get;set;}
    
    public Integer counterEnd {get; set;}
    
    public LibraryWrapper LW{get;set;}
    public LibraryWrapper LW1{get;set;}
    
    Public List<SelectOption> LP_Select {get; set;}
    Public list<SelectOption> Product_Select {get; set;}
    public list<SelectOption> EEAVolanteEntity_Select {get; set;}
    Public List<SelectOption> splitTypes{get; set;}
    public list<SelectOption> sectionNoList {get; set;}   
    Public list<String> ReinstatementValues {get; set;}
    Public list<Integer> createLoop {get; set;}
    public List<Endorsement_Library__c> ElList{get;set;}    
    public List<LibraryWrapper> LibraryWrapperList {get; set;}
    public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    public List<Endorsement_Library__c> ElList1{get;set;} 
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}     
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    public Map<id, VG_Policy_Schedule_Endorsement__c> pseTempMap{get;set;}
    public Map<id, VG_Policy_Schedule_Endorsement__c> pseMap{get;set;}
    public List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    public List<Integer> NOIList{get;set;}
    
    //Constructor Begins...    
    Public VG_Revise_HorizonStepsController(){ 
        PSID  =  apexpages.currentpage().getparameters().get('Id');
        MTAType = apexpages.currentpage().getparameters().get('MTAType');
        MTAStartDate = apexpages.currentpage().getparameters().get('MTAStartDate');
        MTAEndDate=apexpages.currentpage().getparameters().get('MTAEndDate');                    
        seletedProrateoption  = apexpages.currentpage().getparameters().get('seletedProrateoption');                
        ps = [Select id, Name, VG_Lloyds_Product__c,Limit__c,Seleted_Prorate_Option__c ,ILF_Layer__c,Attachment__c,Policy__r.Name,Base_Creation_Start_Date__c,Base_Creation_End_Date__c,VG_Volante_Entities__c,Split_Type__c,Policy__r.VG_Is_Renewal__c, Policy__c, VG_Rate_Change__c, Sum_Insured__c, Policy__r.VG_Inception_Date__c, Policy__r.VG_Expiry_Date__c, VG_MTA_Start_Date__c, VG_MTA_Type__c, VG_Is_MTA__c, VG_MTA_End_Date__c, VG_Brokerage_Amount__c, Net_Premium__c, VG_Technical_Model_Premium__c, VG_Technical_Loss_Ratio__c, Transaction_GWP__c, CurrencyIsoCode, Actual_GWP__c, Written_share__c, Share__c, Gross_Written_Premium__c, VG_Gross_Written_Premium_100__c, Technical_UW_Premium__c, VG_Brokerage_Percent__c, VG_Overider_Percent__c, VG_Fee_Income__c, Premium_Adjustment_2__c, Risk_Premium_Pro__c, Endorsement_Premium_Pro__c, Rate_On_Line__c, Product__c, VG_Capacity_Paper__c, Levies__c, RecordType.Name From Policy_Schedule__c where id = : PSID limit 1];   
        if(ps.VG_MTA_Type__c !='Bad Debt Provision'){
            if(MTAType ==null){
                rc = [Select id, Name, VG_Rate_Type__c, VG_Reinstatement_Premiums__c, VG_No_of_Reinstatements__c, VG_Industry__c,VG_Territorial_Scope__c, VG_Plan_Loss_Ratio__c, VG_Layer__c From Risk_Capture__c where Policy_Schedule__c = :PSID limit 1];
                rr = [Select id, Name, VG_No_Claims_Bonus__c, VG_Risk_Premium__c, VG_GNPI__c, VG_Aggregate_Precent__c, VG_Limit_Precent__c, VG_Deductible_Precent__c, VG_Rate_on_Income__c, VG_Provisional_Rate__c, VG_Min_Rate__c, VG_Max_Rate__c, VG_Swing_Load__c, VG_No_Claims_Bonus_Value__c, VG_Minimum_Premium__c, VG_Minimum_Premium_Formula__c, VG_Deposit_Premium__c, VG_Deposit_Premium_Formula__c, VG_Return_Period_Entry__c, VG_Return_Period_Exit__c, VG_Limit__c, VG_AAD__c, VG_Aggregate__c, VG_Deductible__c, VG_Coverage__c From VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c  = : PSID];
            }else{
                rr = new VG_Policy_Schedule_Asset__c(); 
                rc = new Risk_Capture__c();
                rc.CurrencyISOCode = ps.CurrencyISOCode;
            }
        }
        if(MTAType  ==  null && ps.VG_MTA_Type__c  ==  null){
            If(ps.Base_Creation_Start_Date__c!=null && ps.Base_Creation_End_Date__c!=null && ps.Base_Creation_End_Date__c!=ps.Policy__r.VG_Expiry_Date__c)
                proRata = Utilities.proRatingFactor(ps.Base_Creation_Start_Date__c, ps.Base_Creation_End_Date__c);
            else                   
                proRata = Utilities.proRatingFactor(ps.Policy__r.VG_Inception_Date__c, ps.Policy__r.VG_Expiry_Date__c);
        }else{
            if(Math.mod(ps.Policy__r.VG_Inception_Date__c.year(), 4) !=  0){
                if(Math.mod(ps.Policy__r.VG_Expiry_Date__c.year(), 4)  ==  0){
                    if(ps.Policy__r.VG_Expiry_Date__c <=  date.newInstance(ps.Policy__r.VG_Expiry_Date__c.year(), 02, 28)){
                        proRata = MTAStartDate  !=   null ? (Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365 : (Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365;
                    }else{
                        proRata = MTAStartDate  !=   null ? (Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(ps.Policy__r.VG_Expiry_Date__c)))/365 : (Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(ps.Policy__r.VG_Expiry_Date__c)))/365;
                    }
                }else{
                    proRata = MTAStartDate  !=   null ? (Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365 : (Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365;
                }
            }else{
                if(ps.Policy__r.VG_Inception_Date__c < date.newInstance(ps.Policy__r.VG_Inception_Date__c.year(),03,01)){
                    proRata = MTAStartDate  !=   null ? (Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(ps.Policy__r.VG_Expiry_Date__c)))/365 : (Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(ps.Policy__r.VG_Expiry_Date__c)))/365;
                }else{
                    proRata = MTAStartDate  !=   null ? (Decimal.valueOf(Date.valueOf(MTAStartDate).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365 : (Decimal.valueOf(Date.valueOf(ps.VG_MTA_Start_Date__c).daysBetween(ps.Policy__r.VG_Expiry_Date__c))+1)/365;
                }
            }
        }
        createLoop = new List<Integer>();
        pseTempMap =  new Map<id, VG_Policy_Schedule_Endorsement__c>();
        If(MTAType==null)
            pseMap =  new Map<id, VG_Policy_Schedule_Endorsement__c>([select id, Name, VG_IsTempDelete__c, VG_Endorsement_Number__c, VG_Endorsement_Library_Id__c, VG_Sub_limit__c, VG_Premium__c, VG_Endorsement_Details__c, VG_Title__c, VG_Type__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c = : PSID ORDER By CreatedDate DESC]);
        else
            pseMap = new Map<id, VG_Policy_Schedule_Endorsement__c>();
        
        manualList = new List<VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pse: pseMap.values()){
            if(pse.VG_Endorsement_Library_Id__c  ==  null)
                manualList.add(pse);
            else
                pseTempMap.put(pse.VG_Endorsement_Library_Id__c, pse);             
        }
        existingEndorsements  =  new List<VG_Policy_Schedule_Endorsement__c>();
        existingEndorsements1  =  new List<VG_Policy_Schedule_Endorsement__c>();
        LP_Select = new List<SelectOption>();
        NOIList = new List<Integer>();
        ReinstatementValues = new List<String>();
        String CPList = '';
        CPList = Label.Horizon_SectionNumber;
        sectionNoList = new List<SelectOption>();
        sectionNoList.add(new SelectOption('--None--','--None--'));
        
        for(String s : CPList.split(';')){
            sectionNoList.add(new SelectOption(s,s));
        }
        Product_Select  =  new List<SelectOption>();
        Product_Select.add(new SelectOption('--None--', '--None--'));
        Product_Select.add(new SelectOption('Property Per Event', 'Property Per Event'));
        Product_Select.add(new SelectOption('Property Per Risk', 'Property Per Risk'));
        Product_Select.add(new SelectOption('AGG XL', 'AGG XL'));
        Product_Select.add(new SelectOption('AGG Stop Loss', 'AGG Stop Loss'));
        splitTypes = new List<SelectOption>();
        skipSplit = False;
        if(ps.Policy__r.VG_Inception_Date__c.year() <= 2020){
            splitTypes.add(new SelectOption('','--None--'));
            skipSplit = True;
        }
        splitTypes.add(new SelectOption('EEA','EEA'));      
        EnableReinstatement = False;
        LibraryWrapper LW;        
        LibraryWrapperList  =  new List<LibraryWrapper>();
        LibraryWrapper LW1;        
        LibraryWrapperList1  =  new List<LibraryWrapper>();
        counterEnd = 0;
        Overider = 0;
        FeeIncome = 0;
        RiskPremium = PSRiskPremium = 0;
        Levies = 0;
        EndorsementPremium = 0;
        TransactionalPremium = 0;
        PremiumAdjustment = 0;
        TotalLayerPremium = 0;
        SignedShare = 0;
        WrittenShare = 0;
        sumInsured = 0;
        GrossWrittenPremium = GrossWrittenPremium2 = ExpectedLossRatio = 0;
        TechnicalPremium = 0;
        BrokerageAmount = 0;
        OveriderAmount = 0;
        RateOnLine = 0;
        psLimit = 0;
        if(MTAType !='Bad Debt Provision' && ps.VG_MTA_Type__c!='Bad Debt Provision'){
            if(rc.VG_Reinstatement_Premiums__c !=   null){
                String[] NOI = rc.VG_Reinstatement_Premiums__c.split('<br>');
                EnableReinstatement = False;
                createLoop = new List<Integer>(); 
                if(rc.VG_No_of_Reinstatements__c.isNumeric()){
                    for(integer i = 0 ; i < Integer.valueOf(rc.VG_No_of_Reinstatements__c) ; i++){
                        createLoop.add(i);
                        NOIList.add(Integer.valueOf(NOI[i].split(':')[1]));
                    }
                }
            }
            If(rr.VG_Risk_Premium__c !=  null)
                RiskPremium = (rr.VG_Risk_Premium__c).setScale(2);
            else
                RiskPremium = 0;
            if(rr.VG_Minimum_Premium__c != null && RiskPremium != null && RiskPremium != 0 && rr.VG_Minimum_Premium__c != 0 )
                MinimumPremium = ((RiskPremium*rr.VG_Minimum_Premium__c)/100).setScale(2);
            else
                MinimumPremium = 0;
            if(RiskPremium != null && rr.VG_Deposit_Premium__c != null)
                DepositPremium = ((RiskPremium*rr.VG_Deposit_Premium__c)/100).setScale(2);
            else
                DepositPremium = 0;
        }
        NCBValue = 0;
        SplitType = ps.Split_Type__c;
        TechnicalLossRatio = ps.VG_Technical_Loss_Ratio__c;
        if(ps.VG_MTA_Type__c !='Bad Debt Provision')
            PSRiskPremium = ps.Risk_Premium_Pro__c.setScale(2);
        WrittenShare = ps.Written_share__c;
        SignedShare = ps.Share__c;
        psLimit = ps.Limit__c;
        netmodelpremium = ps.Net_Premium__c;
        techmodelpremium = ps.VG_Technical_Model_Premium__c;
        CapacityPaper = ps.VG_Capacity_Paper__c;
        GrossWrittenPremium = ps.Gross_Written_Premium__c;
        GrossWrittenPremium2 = ps.VG_Gross_Written_Premium_100__c;
        TechnicalPremium = ps.Technical_UW_Premium__c;
        Brokerage = ps.VG_Brokerage_Percent__c;
        BrokerageAmount = ps.VG_Brokerage_Amount__c;
        Overider = ps.VG_Overider_Percent__c;
        FeeIncome = ps.VG_Fee_Income__c;
        TransactionalPremium = ps.Transaction_GWP__c;
        RateChange  =  ps.VG_Rate_Change__c;
        sumInsured = ps.Sum_Insured__c;
        LProduct = ps.VG_Lloyds_Product__c;
        ExpectedLossRatio = ps.VG_Technical_Loss_Ratio__c;
        
        if(ps.Premium_Adjustment_2__c>0)
            PremiumAdjustment = ps.Premium_Adjustment_2__c;
        
        if(ps.VG_MTA_Type__c !='Bad Debt Provision')
            If(ps.Endorsement_Premium_Pro__c>0)
            EndorsementPremium = ps.Endorsement_Premium_Pro__c;
        If(ps.Rate_On_Line__c>0)
            RateOnLine = ps.Rate_On_Line__c;
        Product = ps.Product__c;
        If(ps.Levies__c>0)
            Levies = ps.Levies__c;
        if(MTAType !='Bad Debt Provision' && ps.VG_MTA_Type__c!='Bad Debt Provision')
            RiskRatingCalc();
        If(MTAType  ==  'Bad Debt Provision' || ps.VG_MTA_Type__c == 'Bad Debt Provision'){
            PSRiskPremium=endorsementPremium =0;
        }
        if(MTAType  ==  'Revision of Cover' || MTAType =='Bad Debt Provision' || MTAType == 'Reinstatement Premium'){
            rocps = new Policy_Schedule__c(); 
            rocps= ps;
            WrittenShare = null;
            PremiumAdjustment=null;
            netmodelpremium = null;
            techmodelpremium = null;
            TechnicalPremium = null;
            Brokerage = null;
            BrokerageAmount = null;
            ExpectedLossRatio = null;
            Overider = null;
            FeeIncome = null;
            sumInsured = null;
            RateChange  =  null;
            TechnicalLossRatio=null;
            TechnicalPremium=null;
            psLimit = null;
            RateOnLine = null;
            ps.Attachment__c = null;
        }
        if(ps.Seleted_Prorate_Option__c == 'Flat'){
            PSRiskPremium = ps.Risk_Premium_Pro__c.setScale(2);
            EndorsementPremium = ps.Endorsement_Premium_Pro__c;
        }
        calc();     
        setLPList();
    }
    
    Public void setLPList(){
        try{
            LP_Select.clear();
            String LPString;
            List<String> doLPList = Utilities.setLloydsProduct('Horizon',Product,null,null);
            LP_Select.add(new SelectOption('--None--','--None--'));
            for(String s : doLPList){
                LP_Select.add(new SelectOption(s,s));
            }
        }Catch(Exception e){
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            showError(e);
        }
    }
    //Constructor Ends...    
    //Supporting Methods Begins
    Public Void generateReinstatement(){
        EnableReinstatement = True;
        createLoop.clear();
        NOIList.clear();
        if(rc.VG_No_of_Reinstatements__c.isNumeric()){
            for(integer i = 0 ; i < Integer.valueOf(rc.VG_No_of_Reinstatements__c) ; i++){
                createLoop.add(i);
                NOIList.add(0);
                ReinstatementValues.add('0');
            }
        }
    } 
    public void Calc(){
        if(ps.Seleted_Prorate_Option__c == 'Flat' || seletedProrateoption == 'Flat')
            netmodelpremium = PSRiskPremium + EndorsementPremium;

        Map<String, List<String>> MapEntityList = new Map<String, List<String>>();    
        if(MTAType  ==  null && ps.VG_MTA_Type__c  ==  null)
            MapEntityList = Utilities.Entities('EEA',ps.Policy__r.VG_Inception_Date__c,'Horizon',null);    
        else if(MTAType  !=  null && MTAStartDate !=  null)      
            MapEntityList = Utilities.Entities('EEA',Date.valueOf(MTAStartDate),'Horizon',null); 
        else
            MapEntityList = Utilities.Entities('EEA',ps.VG_MTA_Start_Date__c,'Horizon',null);
        
        EEAVolanteEntity_Select = new List<SelectOption>();
        If(MapEntityList.get('EEA')!=null){
            for(String s : MapEntityList.get('EEA')){
                EEAVolanteEntity_Select.add(new SelectOption(s,s));
            }           
        }
        
        If(RateChange==0.00 && ps.Policy__r.VG_Is_Renewal__c == false)
            RateChange=0.00;
        TotalLayerPremium = (PremiumAdjustment!=null?PremiumAdjustment:0)+(PSRiskPremium!=null?PSRiskPremium:0)+(EndorsementPremium!=null?EndorsementPremium:0);
        GrossWrittenPremium = TotalLayerPremium*(SignedShare/100);
        GrossWrittenPremium2 = TotalLayerPremium;
        if(TechnicalLossRatio  !=   null)
            TechnicalPremium = GrossWrittenPremium * (TechnicalLossRatio/100);
        If(Brokerage !=  null)
            BrokerageAmount = GrossWrittenPremium*(Brokerage/100);
        BrokerageAmount = (BrokerageAmount!=null?BrokerageAmount:0).setScale(2);
        OveriderAmount = GrossWrittenPremium*((Overider!=null?Overider:0)/100);
        TransactionalPremium = GrossWrittenPremium+(FeeIncome!=null?FeeIncome:0)-(BrokerageAmount!=null?BrokerageAmount:0)-(OveriderAmount!=null?OveriderAmount:0);
        
        If(MTAType !='Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
            if(rr.VG_Limit_Precent__c !=   null && rr.VG_GNPI__c !=  null)
                sumInsured = rr.VG_GNPI__c*(rr.VG_Limit_Precent__c/100);                     
            if(Product  == 'AGG Stop Loss'){
                if(TotalLayerPremium > 0  && rr.VG_Limit_Precent__c  !=   null && rr.VG_GNPI__c !=  null && rr.VG_Limit_Precent__c > 0){
                    RateOnLine = TotalLayerPremium/((rr.VG_Limit_Precent__c/100)*rr.VG_GNPI__c);
                }else{
                    RateOnLine = 0;
                }
            }
        }
        if(psLimit  !=   null)
            sumInsured = psLimit*(SignedShare/100);
           
        if(Product  != 'AGG Stop Loss'){
            if(TotalLayerPremium > 0  && psLimit  !=   null && psLimit > 0 )
                RateOnLine =  TotalLayerPremium/(psLimit/100);        
            else
                RateOnLine = 0;
        }
         
        ActualPremium  =  GrossWrittenPremium - (BrokerageAmount!=null?BrokerageAmount:0)- (OveriderAmount!=null?OveriderAmount:0);
        techmodelpremium = (netmodelpremium!=null?netmodelpremium:0)*((SignedShare!=null?SignedShare:0)/100);
        If(MTAType  ==  'Bad Debt Provision' || ps.VG_MTA_Type__c == 'Bad Debt Provision'){
            PSRiskPremium=endorsementPremium =netmodelpremium= techmodelpremium=0;
          
        }
    }
    public void RiskRatingCalc(){
        If(rc.VG_Rate_Type__c =='Rate On Income')
            rr.VG_Provisional_Rate__c=null;
        if(rc.VG_Rate_Type__c =='Swing Rate')
            rr.VG_Rate_on_Income__c=null;
        
        if(rc.VG_Rate_Type__c !='Flat Premium'){               
            if((rr.VG_Rate_on_Income__c != null) && (rr.VG_GNPI__c != null)){
                RiskPremium = rr.VG_GNPI__c*(rr.VG_Rate_on_Income__c/100);                   
            }
            if(rr.VG_Provisional_Rate__c != null && (rr.VG_GNPI__c != null)){
                RiskPremium = (rr.VG_Provisional_Rate__c)*(rr.VG_GNPI__c/100);                                  
            }              
        }
        if((MinimumPremium != null) && (RiskPremium != null)){
            rr.VG_Minimum_Premium__c  =  (RiskPremium!=0?(MinimumPremium/RiskPremium)*100:0);
        }
        if(DepositPremium != null && RiskPremium != null ){
            rr.VG_Deposit_Premium__c = (RiskPremium!=0?(DepositPremium/RiskPremium)*100:0);
        }
        if(rr.VG_No_Claims_Bonus__c !=  null){
            NCBValue = RiskPremium*(rr.VG_No_Claims_Bonus__c/100);
        }
    }
    public void RemoveCustom(){
        List<VG_Policy_Schedule_Endorsement__c> newPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
        newPSEList.addAll(existingEndorsements);
        existingEndorsements.clear();
        for(VG_Policy_Schedule_Endorsement__c pse: newPSEList){
            if(!pse.VG_IsTempDelete__c){
                existingEndorsements.add(pse);
            }
        }
    }
    public void AddCustom(){
        hasEndorsements  =  True;    
        VG_Policy_Schedule_Endorsement__c tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.VG_Type__c     =  'Endorsements';
        tempEndsmt.VG_Premium__c  =  0;
        existingEndorsements.add(tempEndsmt);
    }
    public void updatePremiums(){
        RiskRatingCalc();
        Calc();
    }
    //Supporting Methods Ends...
    //Redirection Methods 
    Public PageReference Cancel(){
        return new PageReference('/'+PSID);
    }
    Public PageReference gotostep1(){
        return new PageReference('/apex/VG_Revise_Horizon_Step1');
    }
    Public PageReference gotostep2(){
    if(Product== '--None--' || Product== null ){
          ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product..'));   
          return null;  
       }
       if(LProduct  == '--None--' || LProduct  == null ){
          ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
          return null;  
        }
        return new PageReference('/apex/VG_Revise_Horizon_Step2');
    }
    Public PageReference gotostep3(){
        if(Product  !=  'AGG Stop Loss'){
            return new PageReference('/apex/VG_Revise_Horizon_Step3a');
        }else{
            return new PageReference('/apex/VG_Revise_Horizon_Step3b');
        }
    }
    public PageReference gotostep6a(){
        if(!existingEndorsements1.IsEmpty()){
            existingEndorsements1.clear();
        }
        ElList1 = [select id, Name, Endorsement_Title__c, Type__c, Text__c from Endorsement_Library__c where Type__c = :'Sub-limits' AND RecordType.Name  = : 'Horizon' ORDER By Name ASC];        
        LibraryWrapperList1.clear();       
        for(Endorsement_Library__c EL1 : ElList1){            
            LW1  =  new LibraryWrapper();
            LW1.EL  =  EL1;            
            LW1.isSelected  =  False;                    
            LibraryWrapperList1.add(LW1); 
        }
        return new PageReference('/apex/VG_Revise_Horizon_Step6a');
    }
    
    public PageReference gotostep6b(){
        Set<ID> elid = new Set<ID>();
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements1){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
        }
        existingEndorsements1.clear();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        for(LibraryWrapper LW:LibraryWrapperList1){
            elid.add(LW.EL.Id);
            if(LW.isSelected){
                tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Details__c  =  LW.EL.Text__c;
                tempEndsmt.VG_Endorsement_Library_Id__c  =  LW.EL.Id;
                tempEndsmt.VG_Title__c  =  LW.EL.Endorsement_Title__c;
                tempEndsmt.VG_Premium__c  =  0;
                tempEndsmt.VG_Sub_limit__c  =  0;
                tempEndsmt.CurrencyISOCode  =   ps.CurrencyISOCode;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True;
                if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium'){
                    tempEndsmt.VG_Premium__c  = 0;
                    tempEndsmt.VG_Sub_limit__c  = 0;
                }
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
            }
        }
        if(existingEndorsements1.IsEmpty()){
            hasEndorsements  =  False;
            counterEnd  =  0;
        }else{
            hasEndorsements  =  True;
            counterEnd  =  existingEndorsements1.size();    
        }
        return new PageReference('/apex/VG_Revise_Horizon_Step6b');
    }
    
    public PageReference gotostep4a(){
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
            if(pe.VG_Endorsement_Library_Id__c  !=   null && !pseTempMap.containsKey(pe.VG_Endorsement_Library_Id__c))
                tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Endorsement_Library_Id__c  ==  null)
                manualList.add(pse);
        }
        for(VG_Policy_Schedule_Endorsement__c pse:pseTempMap.values()){
            if(manualList.IsEmpty()){
                if(pse.VG_Endorsement_Library_Id__c  ==  null){
                    pse.VG_IsTempDelete__c  = false;
                    manualList.add(pse);
                }
            }else{
                for(VG_Policy_Schedule_Endorsement__c pse1:existingEndorsements){
                    if(pse.Name  !=   pse1.Name && pse1.Name  !=   null && !(new Set<VG_Policy_Schedule_Endorsement__c>(manualList)).contains(pse1)){
                        manualList.add(pse);
                    }
                }
            }
        }
        if(!existingEndorsements.IsEmpty()){
            existingEndorsements.clear();
        }
        ElList = [select id, Name, Endorsement_Title__c, Type__c, Text__c from Endorsement_Library__c where RecordType.Name  = : 'Horizon' ORDER By Name ASC];       
        LibraryWrapperList.clear();
        for(Endorsement_Library__c EL : ElList){            
            LW  =  new LibraryWrapper();
            LW.EL  =  EL;            
            LW.isSelected  =  False;
            if(pseTempMap.containsKey(EL.id)) { 
                LW.isSelected  =  True;
            }
            if(tmpPSEMap.containsKey(EL.id)) { 
                LW.isSelected  =  True;
            }                      
            LibraryWrapperList.add(LW); 
        }
        return new PageReference('/apex/VG_Revise_Horizon_Step4a');
    }
    
    public PageReference gotostep4b(){
        Set<ID> elid = new Set<ID>();
        List<VG_Policy_Schedule_Endorsement__c> tmpPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
        Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
        for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
            tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
            if(pe.VG_Endorsement_Library_Id__c == null)tmpPSEList.add(pe);
        }
        existingEndorsements.clear();
        VG_Policy_Schedule_Endorsement__c tempEndsmt;
        for(LibraryWrapper LW:LibraryWrapperList){
            elid.add(LW.EL.Id);
            if(LW.isSelected){
                tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
                tempEndsmt.VG_Endorsement_Library_Id__c  = LW.EL.Id;
                if(tmpPSEMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Endorsement_Details__c  =  tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                }else if(pseTempMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Endorsement_Details__c  =  pseTempMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                }else{
                    tempEndsmt.VG_Endorsement_Details__c  =  LW.EL.Text__c;                
                }
                if(tmpPSEMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Title__c  =  tmpPSEMap.get(LW.EL.Id).VG_Title__c ; 
                    tempEndsmt.VG_Endorsement_Details__c  =  tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                }else if(pseTempMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Title__c  =  pseTempMap.get(LW.EL.Id).VG_Title__c ; 
                    tempEndsmt.VG_Endorsement_Details__c  =  pseTempMap.get(LW.EL.Id).VG_Endorsement_Details__c; 
                }else{
                    tempEndsmt.VG_Title__c  =  LW.EL.Endorsement_Title__c;     
                }
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Premium__c  =  pseTempMap.get(LW.EL.Id).VG_Premium__c;
                else
                    tempEndsmt.VG_Premium__c  = 0;
                if(pseTempMap.containsKey(LW.EL.Id))
                    tempEndsmt.VG_Sub_limit__c  =  pseTempMap.get(LW.EL.Id).VG_Sub_limit__c;
                else
                    tempEndsmt.VG_Sub_limit__c  = 0;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True;
                if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium'){
                    tempEndsmt.VG_Premium__c  = 0;
                    tempEndsmt.VG_Sub_limit__c  = 0;
                }
                counterEnd++;
                existingEndorsements.add(tempEndsmt);
            }
            
        }        
        for(VG_Policy_Schedule_Endorsement__c pse:tmpPSEList){
            existingEndorsements.add(pse);
        }
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
        
        return new PageReference('/apex/VG_Revise_Horizon_Step4b');
    }
    Public PageReference gotostep5(){
        EndorsementPremium  = 0;
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Premium__c  !=   null ){
                EndorsementPremium  =  EndorsementPremium + pse.VG_Premium__c;
            }
        }
        if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium'){
            If(seletedProrateoption == 'Flat'){
                PSRiskPremium = RiskPremium;
                EndorsementPremium  = EndorsementPremium;               
            }else If(seletedProrateoption == 'Prorated'){
                PSRiskPremium = RiskPremium * proRata;
                EndorsementPremium  = EndorsementPremium * proRata;
            }
        }else{
            if(ps.Seleted_Prorate_Option__c != 'Flat'){
                PSRiskPremium = RiskPremium * proRata;
                EndorsementPremium  = EndorsementPremium * proRata;
            }else{
                PSRiskPremium = RiskPremium;
                EndorsementPremium  = EndorsementPremium;
            }
        }
        
        netmodelpremium = PSRiskPremium + EndorsementPremium;    
        calc();          
        return new PageReference('/apex/VG_Revise_Horizon_Step5');
    }
    Public PageReference Finish(){
        Savepoint sp = Database.setSavepoint();
        try{
            if(CapacityPaper == '--None--'){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Capacity Paper'));    
                return null;
            }
            ps.id = PSID;
            ps.VG_Capacity_Paper__c = CapacityPaper;
            ps.Split_Type__c  =SplitType ;        
            ps.Written_share__c = WrittenShare;
            ps.Share__c = SignedShare;
            ps.Limit__c = psLimit;
            ps.VG_Lloyds_Product__c = LProduct;
            ps.Gross_Written_Premium__c = GrossWrittenPremium;
            ps.VG_Gross_Written_Premium_100__c = GrossWrittenPremium2;
            ps.Technical_UW_Premium__c = TechnicalPremium;
            ps.VG_Brokerage_Percent__c = Brokerage;
            ps.VG_Brokerage_Amount__c = BrokerageAmount;
            ps.VG_Overider_Percent__c = Overider;
            ps.Actual_GWP__c = ActualPremium;
            ps.VG_Fee_Income__c = FeeIncome;
            ps.Sum_Insured__c = sumInsured;
            ps.Premium_Adjustment_2__c = PremiumAdjustment;
            ps.Risk_Premium_Pro__c = PSRiskPremium;
            ps.Endorsement_Premium_Pro__c = EndorsementPremium;
            ps.Net_Premium__c = netmodelpremium;
            ps.VG_Technical_Model_Premium__c = techmodelpremium;
            ps.Rate_On_Line__c = RateOnLine;
            ps.Product__c = Product;
            ps.VG_Technical_Loss_Ratio__c = TechnicalLossRatio;
            ps.Levies__c = Levies;
            if(ps.VG_MTA_Type__c !='Bad Debt Provision')
                ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;
            if(seletedProrateoption !=null && MTAType != 'Bad Debt Provision')
                ps.Seleted_Prorate_Option__c = seletedProrateoption;
            If(RateChange == 0.00 && ps.Policy__r.VG_Is_Renewal__c   == false)       
                ps.VG_Rate_Change__c   =   0.00;
            else
                ps.VG_Rate_Change__c   =  RateChange;
            ps.Transaction_GWP__c = TransactionalPremium;
            if(ps.VG_MTA_Type__c != 'Revision of Cover' && MTAType != 'Reinstatement Premium' &&  MTAType != 'Bad Debt Provision'  && ps.Base_Creation_End_Date__c==null && ps.Base_Creation_Start_Date__c==null){
                ps.Base_Creation_Start_Date__c  =  ps.Policy__r.VG_Inception_Date__c;
                ps.Base_Creation_End_Date__c  =  ps.Policy__r.VG_Expiry_Date__c;   
            }
            if(ps.VG_MTA_Type__c == 'Revision of Cover' || MTAType == 'Reinstatement Premium'){
                ps.Base_Creation_Start_Date__c = ps.VG_MTA_Start_Date__c;
                ps.Base_Creation_End_Date__c = ps.VG_MTA_End_Date__c;    
            }
            ps.Name = ps.Name.remove('/EEA').remove('/NonEEA');
            if(ps.Policy__r.VG_Inception_Date__c.year() > 2020){
                if(ps.Split_Type__c == 'EEA')
                    ps.Name += '/EEA';
            }  
            If(MTAType !='Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                ps.VG_Deductible__c = rr.VG_Deductible__c;                    
                rr.VG_Risk_Premium__c = RiskPremium;
                rr.CurrencyISOCode  =  ps.CurrencyISOCode ;
                if(NOIList.size()>0){
                    Integer i = 1;
                    for(Integer noi : NOIList){
                        if(i == 1)
                            rc.VG_Reinstatement_Premiums__c = '1st Reinstatement :'+noi+'<br/>';
                        if(i == 2)
                            rc.VG_Reinstatement_Premiums__c+= '2nd Reinstatement :'+noi+'<br/>';
                        if(i == 3)
                            rc.VG_Reinstatement_Premiums__c+= '3rd Reinstatement :'+noi+'<br/>';
                        if(i>3)
                            rc.VG_Reinstatement_Premiums__c+= i+'th Reinstatement :'+noi+'<br/>';
                        
                        i++;
                    }
                    rc.VG_Reinstatement_Premiums__c = rc.VG_Reinstatement_Premiums__c.removeEnd('<br/>');
                }else{
                    rc.VG_Reinstatement_Premiums__c = '';
                }
                if(ps.Split_Type__c == 'EEA'){
                    rc.Name = ps.Name+'/RD/01';
                    rr.Name = ps.Name+'/RR/01';
                }else{
                    //ps.VG_Volante_Entities__c = '';
                    rc.Name = rc.Name.remove('/EEA').remove('/NonEEA');
                    rr.Name = rr.Name.remove('/EEA').remove('/NonEEA');        
                }
                
            }
            PolicyScheduleTriggerFunction.isBasePsProduct = True;
            If(MTAType  !=   'Revision of Cover' && MTAType != 'Reinstatement Premium' &&  MTAType != 'Bad Debt Provision')
                update ps;
            
            if(MTAType  !=   'Revision of Cover' && MTAType != 'Reinstatement Premium' &&  MTAType != 'Bad Debt Provision' &&  ps.VG_MTA_Type__c!='Bad Debt Provision'){           
                update rc;        
                update rr;
            }
            List<VG_Policy_Schedule_Endorsement__c> endToBeUpdated  =  new List<VG_Policy_Schedule_Endorsement__c>();
            List<VG_Policy_Schedule_Endorsement__c> endToBeInserted  =  new List<VG_Policy_Schedule_Endorsement__c>();
            Set<ID> pseIds = new Set<ID>();
            for(VG_Policy_Schedule_Endorsement__c pse : pseMap.values()){
                pseIds.add(pse.id);
            }
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                if(pse.id == null){
                    endToBeInserted.add(pse);
                }else{
                    VG_Policy_Schedule_Endorsement__c tmp =  new VG_Policy_Schedule_Endorsement__c ();
                    tmp.id = pse.id;
                    tmp = pse;
                    endToBeUpdated.add(tmp);
                    pseIds.remove(pse.id);
                }
            }
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                if(pse.id == null){
                    endToBeInserted.add(pse);
                }else{
                    VG_Policy_Schedule_Endorsement__c tmp =  new VG_Policy_Schedule_Endorsement__c ();
                    tmp.id = pse.id;
                    tmp = pse;
                    endToBeUpdated.add(tmp);
                    pseIds.remove(pse.id);
                }
            }
            Integer psecount = 1;
            Integer psesbcount = 1;
            if(!endToBeUpdated.IsEmpty()){
                for(VG_Policy_Schedule_Endorsement__c pse : endToBeUpdated){
                    if(pse.VG_Type__c  ==  'Endorsements'){
                        pse.Name = ps.Name+'/PE/'+psecount;
                        psecount++;
                    }
                    else{
                        pse.Name = ps.Name+'/PESB/'+psesbcount;
                        psesbcount++;
                    }
                }
            }
            if(!endToBeInserted.IsEmpty()){
                for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                    if(pse.VG_Type__c  ==  'Endorsements'){
                        pse.Name = ps.Name+'/PE/'+psecount;
                        psecount++;
                    }
                    else{
                        pse.Name = ps.Name+'/PESB/'+psesbcount;
                        psesbcount++;
                    }
                    pse.VG_Policy_Schedule__c = ps.id;
                    pse.CurrencyISOCode = ps.CurrencyISOCode;
                }
            }
            if(MTAType  !=   'Revision of Cover' && MTAType != 'Reinstatement Premium' &&  MTAType != 'Bad Debt Provision'){
                if(pseIds.size() > 0){
                    List<VG_Policy_Schedule_Endorsement__c> endToBeDeleted  =  new List<VG_Policy_Schedule_Endorsement__c>([select id from VG_Policy_Schedule_Endorsement__c where id IN: pseIds]);
                    Delete endToBeDeleted;
                }
                if(!endToBeUpdated.IsEmpty()){
                    update endToBeUpdated;
                }
                if(!endToBeInserted.IsEmpty()){
                    insert endToBeInserted;
                }
                return new PageReference('/'+ps.id);
            }else{
                List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([select id, Name, Policy__r.Name from Policy_Schedule__c where Policy__c = :ps.Policy__c]);
                
                rocps = ps;
                rocps.VG_Is_MTA__c = true;
                rocps.VG_Base_Policy__c = true;
                If(MTAType == 'Bad Debt Provision'){
                    rocps.VG_MTA_Type__c = 'Bad Debt Provision';
                    If(MTAEndDate!=null)
                        rocps.VG_MTA_End_Date__c=Date.valueOf(MTAEndDate);
                    If(MTAStartDate!=null)
                        rocps.VG_MTA_Start_Date__c=Date.valueOf(MTAStartDate);              
                }else if(MTAType == 'Revision of Cover'){
                    rocps.VG_MTA_Type__c = 'Revision of Cover';
                    rocps.VG_MTA_Start_Date__c = Date.valueOf(MTAStartDate);
                    rocps.VG_MTA_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;                
                }else{
                    rocps.VG_MTA_Type__c = 'Reinstatement Premium';
                    rocps.VG_MTA_Start_Date__c = Date.valueOf(MTAStartDate);
                    rocps.VG_MTA_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;
                }
                rocps.id = null;
                rocps.Base_Creation_Start_Date__c = rocps.VG_MTA_Start_Date__c;
                rocps.Base_Creation_End_Date__c = rocps.VG_MTA_End_Date__c;
                rocps.IPT__c = null;
                rocps.IPT_Percent__c = null;
                rocps.MTA_Parent_Policy_Schedule__c = PSID;           
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
                if(ps.Policy__r.VG_Inception_Date__c.year() > 2020){  
                    if(ps.Split_Type__c == 'EEA'){
                        rocps.Name += '/EEA';
                    }  
                }
                PolicyScheduleTriggerFunction.allowInsertRI  =  True;                 
                Insert rocps;

                If(MTAType != 'Bad Debt Provision'){
                    Risk_Capture__c rocrc = new Risk_Capture__c();
                    rocrc = rc;
                    rocrc.id = null;
                    rocrc.Name = rocps.Name+'/RD/01'; 
                    rocrc.Policy_Schedule__c = rocps.id;
                    rocrc.CurrencyISOCode  =  ps.CurrencyISOCode ;
                    insert rocrc;
                    VG_Policy_Schedule_Asset__c rocpsa = new VG_Policy_Schedule_Asset__c();
                    rocpsa = rr;
                    rocpsa.id = null;
                    rocpsa.Name = rocps.Name+'/RR/01';
                    rocpsa.CurrencyISOCode  =  ps.CurrencyISOCode ;
                    rocpsa.VG_Policy_Schedule__c = rocps.id;
                    insert rocpsa;
                    List<VG_Policy_Schedule_Endorsement__c> rocend =  new List<VG_Policy_Schedule_Endorsement__c>();
                    rocend.addAll(endToBeUpdated);
                    rocend.addAll(endToBeInserted);
                    Integer psecounter = 1;
                    Integer psesbcounter = 1;
                    if(!rocend.IsEmpty()){
                        for(VG_Policy_Schedule_Endorsement__c pse : rocend){
                            pse.id = null;
                            pse.VG_Policy_Schedule__c = rocps.id;
                            if(pse.VG_Type__c  ==  'Endorsements'){
                                pse.Name = rocps.Name+'/PE/'+psecounter;
                                psecounter++;
                            }else{
                                pse.Name = rocps.Name+'/PESB/'+psesbcounter;
                                psesbcounter++;
                            }
                        }
                        Insert rocend;
                    }
                }
                return new PageReference('/'+rocps.id);  
            }       
        }Catch(Exception e){
            showError(e);
            Database.rollback(sp);
            return null;
        }
    }
    
    
    Public void showError(Exception e){
        String refId = ErrorTrace.insertLog(e , policyId);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin with this reference id '+refId));     
    }
    
    //Redirection Methods Ends...
    //Sub Classes starts...
    Public Class LibraryWrapper{
        Public Endorsement_Library__c EL {get; set;}
        Public Boolean isSelected {get; set;} 
        
        Public LibraryWrapper(){
            EL  =  new Endorsement_Library__c();
            isSelected  =  False;
        }
    }
    //Sub Classes Ends...
    
}