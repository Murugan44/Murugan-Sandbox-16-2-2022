Public Class VG_HorizonStepsController{
    
    Public Risk_Capture__c rc{get;set;}
    Public Policy__c policy{get;set;}
    public Policy_Schedule__c ps{get;set;}
    Public VG_Policy_Schedule_Asset__c rr{get;set;}
    
    public LibraryWrapper LW{get;set;}
    public LibraryWrapper LW1{get;set;}
    
    Public String Product{get;set;}
    public String PolicyId{get;set;}
    public String PolicyName{get;set;}    
    public String policyCurrency {get; set;}
    public string CapacityPaper{get;set;}
    
    public Boolean hasEndorsements {get; set;}
    Public Boolean EnableReinstatement{get;set;}
    public Boolean skipSplit {get; set;}
    
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
    public Decimal RateChange {get;set;}
    public Decimal PSRiskPremium{get;set;}
    public Decimal EndorsementPremium{get;set;}
    public Decimal techmodelpremium{get;set;}
    public Decimal netmodelpremium{get;set;}
    public Decimal TechnicalLossRatio{get;set;}
    public Decimal sumInsured{get;set;}
    public Decimal psLimit{get;set;}
    public Decimal proRata{get;set;}
    public Decimal ExpectedLossRatio{get;set;}
    
    public Integer counterEnd {get; set;}
    
    Public List<Volante_Entities__c> Entities {get;set;}      
    Public list<SelectOption> Product_Select {get; set;}
    public list<SelectOption> EEAVolanteEntity_Select {get; set;}
    Public List<SelectOption> splitTypes{get; set;}
    public list<SelectOption> sectionNoList {get; set;}
    Public list<String> ReinstatementValues {get; set;}
    Public list<Integer> createLoop {get; set;}
    public List<Endorsement_Library__c> ElList{get;set;}  
    public List<Endorsement_Library__c> ElList1{get;set;}    
    public List<LibraryWrapper> LibraryWrapperList {get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}
    public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    public List<Integer> NOIList{get;set;}
    Public List<SelectOption> LP_Select {get; set;}
    Public String LProduct{get;set;}
    
    //Constructor Begins...    
    Public VG_HorizonStepsController(){ 
        PolicyId = apexpages.currentpage().getparameters().get('Id');
        policy = [Select id, Name, VG_Is_Renewal__c,VG_Inception_Date__c, VG_Expiry_Date__c from Policy__c where id = :PolicyId]; 
        PolicyName = policy.Name;
        policyCurrency  =  apexpages.currentpage().getparameters().get('Currency');
        ps = new Policy_Schedule__c();
        if(Math.mod(policy.VG_Inception_Date__c.year(), 4) !=  0){
            if(Math.mod(policy.VG_Expiry_Date__c.year(), 4)  ==  0){
                if(policy.VG_Expiry_Date__c <=  date.newInstance(policy.VG_Expiry_Date__c.year(), 02, 28)){
                    proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c)+1)/365;
                }else{
                    proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c))/365;
                }
            }else{
                proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c)+1)/365;
            }
        }else{
            if(policy.VG_Inception_Date__c < date.newInstance(policy.VG_Inception_Date__c.year(),03,01)){
                proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c))/365;
            }else{
                proRata = Decimal.valueOf(policy.VG_Inception_Date__c.daysBetween(policy.VG_Expiry_Date__c)+1)/365;
            }
        }     
        ps = new Policy_Schedule__c();         
        rc = new Risk_Capture__c();
        rc.CurrencyISOCode  =  policyCurrency;
        rr = new VG_Policy_Schedule_Asset__c();
        rr.CurrencyISOCode  =  policyCurrency;
        createLoop = new List<Integer>();
        existingEndorsements  =  new List<VG_Policy_Schedule_Endorsement__c>();
        ReinstatementValues = new List<String>();
        LP_Select = new List<SelectOption>();
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
        EnableReinstatement = False;
        LibraryWrapper LW; 
        LibraryWrapper LW1;       
        LibraryWrapperList  =  new List<LibraryWrapper>();
        LibraryWrapperList1  =  new List<LibraryWrapper>();
        existingEndorsements1  =  new List<VG_Policy_Schedule_Endorsement__c>();
        manualList = new List<VG_Policy_Schedule_Endorsement__c>();
        NOIList = new List<Integer>();    
        splitTypes = new List<SelectOption>();
        skipSplit = False;
        if(policy.VG_Inception_Date__c.year() <= 2020){
            splitTypes.add(new SelectOption('','--None--'));
            skipSplit = True;
        }
        splitTypes.add(new SelectOption('EEA','EEA'));
        counterEnd = 0;
        Overider = 0;
        FeeIncome = 0;
        RiskPremium = PSRiskPremium = 0;
        Levies = 0;
        sumInsured = 0;
        EndorsementPremium = 0;
        TransactionalPremium = 0;
        PremiumAdjustment = 0;
        TotalLayerPremium = 0;
        SignedShare = 0;
        WrittenShare = 0;
        GrossWrittenPremium = GrossWrittenPremium2 = 0;
        TechnicalPremium = 0;
        BrokerageAmount = 0;
        OveriderAmount = 0;
        RateOnLine = 0;
        MinimumPremium = 0;
        DepositPremium = 0;
        NCBValue = 0;
        TechnicalLossRatio = 0; 
        techmodelpremium = netmodelpremium = ExpectedLossRatio =0; 
        
        setLPList();
    }
    //Constructor Ends...    
    //Supporting Methods Begins
    
    Public void setLPList(){
        try{
            LP_Select.clear();
            LProduct = '';
            String LPString;
            List<String> doLPList = Utilities.setLloydsProduct('Horizon',Product,null,null);
            system.debug('doLPList::'+doLPList);
            LP_Select.add(new SelectOption('--None--','--None--'));
            for(String s : doLPList){
                LP_Select.add(new SelectOption(s,s));
            }
        }Catch(Exception e){
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            showError(e);
        }
    }
    
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
        Map<String, List<String>> MapEntityList = new Map<String, List<String>>();
        system.debug('policy.VG_Inception_Date__c::'+policy.VG_Inception_Date__c);
        MapEntityList = Utilities.Entities('EEA',policy.VG_Inception_Date__c ,'Horizon',null);
        system.debug('MapEntityList::'+MapEntityList);
        EEAVolanteEntity_Select = new List<SelectOption>();
        for(String s : MapEntityList.get('EEA')){
            EEAVolanteEntity_Select.add(new SelectOption(s,s));
        }
        
        If(RateChange==0.00 && policy.VG_Is_Renewal__c == false)
            RateChange=0.00;
        System.debug('Brokerage::'+Brokerage); 
        if(Brokerage  ==  0)
            Brokerage = null;
        TotalLayerPremium = PremiumAdjustment+PSRiskPremium+EndorsementPremium; 
        GrossWrittenPremium = TotalLayerPremium*(SignedShare/100);
        GrossWrittenPremium2 = TotalLayerPremium;            
        if(psLimit !=  null)
            sumInsured = psLimit*(SignedShare/100);
        if(TechnicalLossRatio !=  null && TechnicalLossRatio > 0)
            TechnicalPremium = GrossWrittenPremium * (TechnicalLossRatio/100);
        If(Brokerage!= null)
            BrokerageAmount = GrossWrittenPremium*(Brokerage/100);
        OveriderAmount = GrossWrittenPremium*(Overider/100);
        TransactionalPremium = GrossWrittenPremium+(FeeIncome!= null?FeeIncome:0)-BrokerageAmount-OveriderAmount;
        if(Product  == 'AGG Stop Loss'){
            if(TotalLayerPremium > 0  && rr.VG_Limit_Precent__c !=  null && rr.VG_GNPI__c != null && rr.VG_Limit_Precent__c > 0){
                RateOnLine = TotalLayerPremium/((rr.VG_Limit_Precent__c/100)*rr.VG_GNPI__c);
            }else {
                RateOnLine = 0;
            }
        }else{
            if(TotalLayerPremium > 0  && psLimit !=  null && psLimit > 0)
                RateOnLine =  TotalLayerPremium/(psLimit/100);
            else
                RateOnLine = 0;
        }
        ActualPremium  =  GrossWrittenPremium - BrokerageAmount - OveriderAmount;
        techmodelpremium = netmodelpremium*(SignedShare/100);    
    }
    public void RiskRatingCalc(){
        if((rr.VG_Rate_on_Income__c !=  null && rr.VG_Rate_on_Income__c  > 0 )&&(rr.VG_GNPI__c !=  null )){
            RiskPremium = rr.VG_GNPI__c*(rr.VG_Rate_on_Income__c/100);
        }else if((rr.VG_Provisional_Rate__c !=  null && rr.VG_Provisional_Rate__c  > 0 )&&(rr.VG_GNPI__c !=  null )){
            RiskPremium = rr.VG_Provisional_Rate__c*(rr.VG_GNPI__c/100);
        }
        if((MinimumPremium != 0) && (RiskPremium != 0)){
            rr.VG_Minimum_Premium__c  =  (MinimumPremium/RiskPremium)*100;
        }
        if(DepositPremium != 0 && RiskPremium != 0 ){
            rr.VG_Deposit_Premium__c = (DepositPremium/RiskPremium)*100;
        }
        if(rr.VG_No_Claims_Bonus__c !=  null && rr.VG_No_Claims_Bonus__c > 0){
            NCBValue = RiskPremium*(rr.VG_No_Claims_Bonus__c/100);
        }
    }
    public void AddCustom(){
        hasEndorsements  =  True;    
        VG_Policy_Schedule_Endorsement__c tempEndsmt  =  new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.CurrencyISOCode  =  policyCurrency;
        tempEndsmt.VG_Type__c     =  'Endorsements';
        tempEndsmt.VG_Premium__c  =  0;
        existingEndorsements.add(tempEndsmt);
    }
    public void updatePremiums(){
        RiskRatingCalc();
        Calc();
    }
    //Supporting Methods Ends...
    //Redirection Methods Begins
    Public PageReference Cancel(){
        return new PageReference('/'+PolicyId);
    }
    Public PageReference gotostep1(){
        return new PageReference('/apex/VG_Horizon_Step1');
    }
    Public PageReference gotostep2(){
        if(Product == '--None--' || Product == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product..'));   
            return null;  
        }
        if(LProduct  == '--None--' || LProduct  == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
            return null;  
        }
        rr.clear();
        RiskPremium = 0;
        MinimumPremium = 0;
        DepositPremium = 0;
        NCBValue = 0;
        return new PageReference('/apex/VG_Horizon_Step2');
    }
    Public PageReference gotostep3(){
        if(Product != 'AGG Stop Loss'){
            return new PageReference('/apex/VG_Horizon_Step3a');
        }else{
            return new PageReference('/apex/VG_Horizon_Step3b');
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
        return new PageReference('/apex/VG_Horizon_Step6a');
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
                tempEndsmt.CurrencyISOCode  =  policyCurrency;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True;
                counterEnd++;
                existingEndorsements1.add(tempEndsmt);
            }
        }     
        
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements1){
            if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c !=  0){
                    pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                }
                if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c !=  0){
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
        return new PageReference('/apex/VG_Horizon_Step6b');
    }
    
    Public PageReference gotostep4a(){ 
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Endorsement_Library_Id__c  ==  null)
                manualList.add(pse);
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
            LibraryWrapperList.add(LW); 
        }  
        return new PageReference('/apex/VG_Horizon_Step4a');
    }
    Public PageReference gotostep4b(){
        EndorsementPremium = 0;
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
                tempEndsmt.VG_Endorsement_Details__c  =  LW.EL.Text__c;
                tempEndsmt.VG_Endorsement_Library_Id__c  =  LW.EL.Id;
                tempEndsmt.VG_Title__c  =  LW.EL.Endorsement_Title__c;
                if(tmpPSEMap.containsKey(LW.EL.Id)){
                    tempEndsmt.VG_Title__c  =  tmpPSEMap.get(LW.EL.Id).VG_Title__c ;                
                    tempEndsmt.VG_Endorsement_Details__c  =  tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c ;
                }
                tempEndsmt.VG_Premium__c  =  0;
                tempEndsmt.VG_Sub_limit__c  =  0;
                tempEndsmt.CurrencyISOCode  =  policyCurrency ;
                tempEndsmt.VG_Endorsement_Number__c  =  LW.EL.Name;
                tempEndsmt.VG_Type__c = LW.EL.Type__c;
                tempEndsmt.VG_IsTempDelete__c  =  False;
                tempEndsmt.VG_IsTemp__c  =  True;
                counterEnd++;
                existingEndorsements.add(tempEndsmt);
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
        return new PageReference('/apex/VG_Horizon_Step4b');
    }
    Public PageReference gotostep5(){
        EndorsementPremium  = 0;
        for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements){
            if(pse.VG_Premium__c !=  null ){
                EndorsementPremium  =  EndorsementPremium + pse.VG_Premium__c;
            }
        }
        if(rr.VG_Limit_Precent__c !=  null && rr.VG_GNPI__c != null)
            sumInsured = rr.VG_GNPI__c*(rr.VG_Limit_Precent__c/100);
        PSRiskPremium = RiskPremium * proRata;
        EndorsementPremium  = EndorsementPremium * proRata;
        netmodelpremium = PSRiskPremium + EndorsementPremium;
        Calc();
        return new PageReference('/apex/VG_Horizon_Step5');
    }
    Public PageReference Finish(){
        Savepoint sp = Database.setSavepoint();
        try{
            if(CapacityPaper == '--None--'){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Capacity Paper'));    
                return null;
            }
            
            List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([SELECT Id, Name, Policy__c FROM Policy_Schedule__c WHERE Policy__c = :policyId ORDER BY CreatedDate DESC]);                         
            List<VG_Policy_Schedule_Endorsement__c> endToBeInserted  =  new List<VG_Policy_Schedule_Endorsement__c>();
            Policy__c pol = [select id, Name, VG_Inception_Date__c, VG_Expiry_Date__c from Policy__c where Id = :policyId limit 1];                
            
            ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('Horizon').getRecordTypeId();
            ps.Policy__c = PolicyId;
            ps.VG_Capacity_Paper__c = CapacityPaper;
            ps.CurrencyISOCode  =  policyCurrency;       
            ps.Written_share__c = WrittenShare;
            ps.VG_Lloyds_Product__c = LProduct;
            ps.Share__c = SignedShare;
            ps.VG_Base_Policy__c = true;
            ps.Sum_Insured__c = sumInsured;
            ps.Limit__c = psLimit;
            ps.Gross_Written_Premium__c = GrossWrittenPremium;
            ps.VG_Gross_Written_Premium_100__c = GrossWrittenPremium2;
            ps.Technical_UW_Premium__c = TechnicalPremium;
            ps.VG_Brokerage_Percent__c = Brokerage;
            ps.VG_Brokerage_Amount__c = BrokerageAmount;
            ps.VG_Overider_Percent__c = Overider;
            ps.Actual_GWP__c = ActualPremium;
            ps.VG_Fee_Income__c = FeeIncome;
            ps.Premium_Adjustment_2__c = PremiumAdjustment;
            ps.Risk_Premium_Pro__c = PSRiskPremium;
            ps.Endorsement_Premium_Pro__c = EndorsementPremium;
            ps.Net_Premium__c = netmodelpremium;
            ps.VG_Technical_Model_Premium__c = techmodelpremium;
            ps.Rate_On_Line__c = RateOnLine;
            ps.Product__c = Product;
            ps.Levies__c = Levies;
            ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;
            ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;
            If(RateChange == 0.00 && policy.VG_Is_Renewal__c   == false)       
                ps.VG_Rate_Change__c   =   0.00;
            else
                ps.VG_Rate_Change__c   =  RateChange;
            ps.VG_Technical_Loss_Ratio__c = TechnicalLossRatio;
            ps.VG_Deductible__c = rr.VG_Deductible__c;
            ps.Transaction_GWP__c = TransactionalPremium;
            ps.Base_Creation_Start_Date__c  =  pol.VG_Inception_Date__c;
            ps.Base_Creation_End_Date__c  =  pol.VG_Expiry_Date__c;
            ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('Horizon').getRecordTypeId();
            List<Integer> psNumList = new List<Integer>();
            if(psList.size()>0){
                for(Policy_Schedule__c psh: psList){
                    psh.Name = psh.Name.remove('/EEA').remove('/NonEEA');                 
                    psNumList.add(Integer.valueOf(psh.Name.split('/PS/')[1]));
                }
                psNumList.sort();
                ps.Name = pol.Name+'/PS/'+((psNumList[psNumList.size()-1])+1);        
            }else{
                ps.Name = pol.Name+'/PS/0';      
            }  
            if(policy.VG_Inception_Date__c.year() > 2020){
                if(ps.Split_Type__c == 'EEA')
                    ps.Name = ps.Name+'/EEA';
            }       
            PolicyScheduleTriggerFunction.isBasePsProduct = True;
            Insert ps;
            
            rc.Name = ps.Name+'/RD/01';
            rc.CurrencyISOCode  =  policyCurrency;  
            rc.Policy_Schedule__c = ps.id;
            if(NOIList.size() > 0){
                Integer i = 1;
                for(Integer noi : NOIList){
                    if(i == 1)
                        rc.VG_Reinstatement_Premiums__c   = '1st Reinstatement :'+noi+'<br/>';
                    if(i == 2)
                        rc.VG_Reinstatement_Premiums__c  += '2nd Reinstatement :'+noi+'<br/>';
                    if(i == 3)
                        rc.VG_Reinstatement_Premiums__c  += '3rd Reinstatement :'+noi+'<br/>';
                    if(i>3)
                        rc.VG_Reinstatement_Premiums__c  += i+'th Reinstatement :'+noi+'<br/>';
                    
                    i++;
                }
                rc.VG_Reinstatement_Premiums__c   = rc.VG_Reinstatement_Premiums__c .removeEnd('<br/>');
            }
            Insert rc;
            rr.Name = ps.Name+'/RR/01';
            rr.VG_Policy_Schedule__c = ps.id;
            rr.CurrencyISOCode  =  policyCurrency;  
            rr.RecordTypeId = Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('Horizon').getRecordTypeId();      
            rr.VG_Risk_Premium__c = RiskPremium;
            Insert rr;
            Integer psecount = 1;
            Integer sbpsecount = 1;
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                pse.VG_Policy_Schedule__c  =  ps.Id;
                pse.Name =  ps.Name + '/PE/' + psecount;
                endToBeInserted.add(pse);
                psecount++;
            }
            for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                pse.VG_Policy_Schedule__c  =  ps.Id;
                pse.Name =  ps.Name + '/PESb/' + sbpsecount;
                endToBeInserted.add(pse);
                sbpsecount++;
            }
            if(!endToBeInserted.IsEmpty()){
                Insert endToBeInserted;
            }
            
            return new PageReference('/'+ps.id);
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