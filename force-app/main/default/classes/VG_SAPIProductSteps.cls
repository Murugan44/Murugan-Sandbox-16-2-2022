Public Class VG_SAPIProductSteps{
    
    public Id policyId {get; set;}
    
    public Risk_Capture__c rc {get;set;}
    public Policy__c pol {get;set;}
    public Policy_Schedule__c ps {get; set;} 
    public Policy_Schedule__c NonEEAps {get; set;}
    public Policy_Schedule__c EEAps {get; set;}
    public Policy_Schedule__c tempPS {get; set;} 
    public LibraryWrapper LW1{get;set;}
    public LibraryWrapper LW{get;set;}
    
    public Boolean EnableReinstatement{get;set;}
    public Boolean hasEndorsements {get; set;}
    public Boolean stopProcess{get; set;}
    public Boolean skipSplit {get; set;}
    public Boolean DMLAlert{get;set;}
    public Boolean UploadAsset{get;set;}
   
    public Blob fileBody {get;set;} 
    
    public String[] filelines  =  new String[]{};     
    
    public Integer RRcounter {get; set;}
    Public Integer counter{get;set;}
    Public Integer counterEnd {get; set;}
    
    Public List<Volante_Entities__c> Entities {get;set;}
    Public List<RRWrapper> riskRatingList {get; set;}
    Public List<Endorsement_Library__c> ElList1{get;set;}
    Public List<Endorsement_Library__c> ElList{get;set;} 
    Public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}
    Public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    Public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    Public List<LibraryWrapper> LibraryWrapperList {get; set;}
    Public List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    
    Public List<SelectOption> splitTypes{get; set;}
    Public List<SelectOption> Product_Select {get; set;}
    Public List<SelectOption> LP_Select {get; set;}
    Public List<SelectOption> RRCoverage_Select {get; set;}
    Public List<SelectOption> MarketCap_Select {get; set;}
    public list<SelectOption> NonEEAVolanteEntity_Select {get; set;}
    public list<SelectOption> VolanteEntity_Select {get; set;}
    public list<SelectOption> EEAVolanteEntity_Select {get; set;}
    public list<SelectOption> VFPsectionNoList {get; set;}
    Public List<SelectOption> SAPI_Industry_Select {get; set;}
    public List<String> UnderwriterProducts {get; set;}    
    
    Public String Index{get;set;}
    Public String policyCurrency {get; set;}
    Public String CapacityPaper{get;set;}
    Public String LProduct{get;set;}
    Public String Product{get;set;}
    Public String IndustrySelected {get; set;}
    Public String CompanyType {get; set;}
    Public String layer {get; set;}
    Public String GrossOrNet {get; set;}
    
    Public Decimal endorsementPremium {get; set;}
    Public Decimal totalFeeAmount{get;set;}
    Public Decimal totalbasepremium{get;set;}
    Public Decimal totalbasepremiumrate{get;set;}
    Public Decimal netModelPremium {get; set;}
    Public Decimal RiskPremium {get;set;}
    Public Decimal lmt {get;set;}
    Public Decimal attachment {get;set;}
    Public Decimal adjustment {get;set;}
    Public Decimal writtenShare {get; set;}
    Public Decimal actualPremium {get; set;}
    Public Decimal sumInsured {get; set;}
    Public Decimal brokerage {get; set;}
    Public Decimal uwPremium {get; set;}
    Public Decimal levies {get; set;}
    Public Decimal brokerageAmount {get; set;}
    Public Decimal grossWrittenPremium {get; set;}
    Public Decimal grossWrittenPremium2 {get; set;}
    Public Decimal techModelPremium {get; set;}
    Public Decimal sharePercent {get; set;}
    Public Decimal RateChange {get;set;}
    Public Decimal adjustmentTechPremium {get; set;}
    Public Decimal prorata{get;set;}
    public Decimal ExpectedLossRatio{get;set;}
    
    Public VG_SAPIProductSteps(){
        stopProcess = false;
        try{
            policyId = apexpages.currentpage().getparameters().get('Id');
            policyCurrency = apexpages.currentpage().getparameters().get('Currency');
            pol=[select id,Name,VG_Expiry_Date__c,VG_Is_Renewal__c,Underwriter__c,VG_Inception_Date__c,Underwriter__r.Underwriter_Product__c from Policy__c where Id=:policyId limit 1];                    
            
            ps = new Policy_Schedule__c();   
            ps.VG_Volante_Entities__c = 'VIL';
            NonEEAps = new Policy_Schedule__c(); 
            EEAps = new Policy_Schedule__c(); 
            ps.CurrencyISOCode = policyCurrency;       
            rc=new Risk_Capture__c();
            rc.CurrencyISOCode = policyCurrency;
            EnableReinstatement=False;
            adjustmentTechPremium=adjustment=lmt=attachment=0;
            counter=counterEnd=0;
            netModelPremium=0;
            RiskPremium=0;
            uwPremium=sumInsured=sharePercent=writtenShare=ExpectedLossRatio=techModelPremium=brokerage=brokerageAmount=grossWrittenPremium=grossWrittenPremium2=actualPremium=0;
            Index='0';
            DMLAlert =UploadAsset= false;
            fileBody = blob.valueOf('');
            
            VG_Policy_Schedule_Asset__c psa = new VG_Policy_Schedule_Asset__c();
            psa.CurrencyISOCode = policyCurrency;
            psa.VG_Base_Premium__c=0;
            psa.VG_Premium__c=0;
            psa.VG_Base_Premium_Rate__c=0;
            psa.VG_Fee_Amounts__c=0;
            riskRatingList = new List<RRWrapper>();
            RRWrapper RRW = new RRWrapper();
            RRW.totalfeeAmt=0;
            RRW.techPremium=0;
            RRW.psa = psa;
            RRW.counter = '0';
            RRW.share=0;            
            riskRatingList.add(RRW);
            RRcounter = 1;
            LibraryWrapper LW;
            LibraryWrapper LW1;
            LibraryWrapperList = new List<LibraryWrapper>();
            LibraryWrapperList1 = new List<LibraryWrapper>();
            existingEndorsements = new List<VG_Policy_Schedule_Endorsement__c>();
            existingEndorsements1 = new List<VG_Policy_Schedule_Endorsement__c>();
            manualList=new List<VG_Policy_Schedule_Endorsement__c>();    
            Product_Select = new List<SelectOption>();
            LP_Select = new List<SelectOption>();
            RRCoverage_Select = new List<SelectOption>();
            MarketCap_Select = new List<SelectOption>();
            SAPI_Industry_Select = new List<SelectOption>();
            splitTypes = new List<SelectOption>();
            skipSplit = False;
            if(pol.VG_Inception_Date__c.year() <= 2020){
                splitTypes.add(new SelectOption('','None'));
                skipSplit = True;
            }
            splitTypes.add(new SelectOption('EEA','EEA'));
            splitTypes.add(new SelectOption('Non EEA','Non EEA'));
            splitTypes.add(new SelectOption('Both','Both'));
            VolanteEntity_Select = new List<SelectOption>();
            VolanteEntity_Select.add(new SelectOption('','--None--'));
            Product_Select.add(new SelectOption('--None--','--None--'));
            Product_Select.add(new SelectOption('SAPI','Shareholder Actvist Protection Insurance'));
            
            MarketCap_Select.add(new SelectOption('--None--','--None--'));
            for(String s : Label.FIDO_MarketCap_Select.split(';')){
                MarketCap_Select.add(new SelectOption(s,s));
            }
            
            SAPI_Industry_Select.add(new SelectOption('--None--','--None--'));
            for(String s : Label.FIDO_SAPI_Industry_Select.split(';')){
                SAPI_Industry_Select.add(new SelectOption(s,s));
            }                    
            
            totalFeeAmount=0;
            totalbasepremium=0;
            totalbasepremiumrate=0;
        }Catch(Exception e){
            stopProcess = true;
            system.debug('e::'+e.getLineNumber()+'::'+e.getMessage());
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin'));   
        }
    }
    
    Public PageReference processuploadAsset(){
        if(fileBody == null || fileBody == blob.valueOf('')){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Must select file.'));
            return null;
        }
        try{ 
            DMLAlert = false;
            if(fileBody !=  blob.valueOf('')){
                DMLAlert = True;               
            }
            System.debug('DMLAlert::'+DMLAlert);
            if(DMLAlert){
                System.debug('DMLAlert::'+DMLAlert);
                filelines  =  Utilities.decode(fileBody,'ISO-8859-1');//nameFile.split('\n'); 
                if(filelines.size()>2){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'you must have one row only.'));
                    return null;
                }
                UploadAsset = True;          
                fileBody = blob.valueOf('');
                for (Integer i = 1 ; i < filelines.size() ; i++){
                    String[] inputvalues  =  new String[]{};
                    String[] headervalues  =  new String[]{};
                    headervalues  =  filelines[0].split(',');                 
                    inputvalues  =  filelines[i].split(','); 
                    if(inputvalues[0].trim() != null && inputvalues[0].trim() !='' )
                        rc.VG_Company_Domicile__c = inputvalues[0].trim();                        
                    if(inputvalues[1].trim() != null && inputvalues[1].trim() !='' )
                        rc.VG_Market_Cap__c= Decimal.valueOf(inputvalues[1].trim()); 
                    if(inputvalues[2].trim() != null && inputvalues[2].trim() !='' )
                        rc.VG_Industry__c= inputvalues[2].trim(); 
                    if(inputvalues[3].trim() != null && inputvalues[3].trim() !='' )
                        rc.VG_RTR_Score__c= Decimal.valueOf(inputvalues[3].trim()); 
                    if(inputvalues[4].trim() != null && inputvalues[4].trim() !='' )
                        rc.VG_Attack_Probability__c= Decimal.valueOf(inputvalues[4].trim()); 
                    if(inputvalues[5].trim() != null && inputvalues[5].trim() !='' )
                        rc.VG_Loss_Cost__c= Decimal.valueOf(inputvalues[5].trim()); 
                    if(inputvalues[6].trim() != null && inputvalues[6].trim() !='' )
                        rc.VG_Country__c= Decimal.valueOf(inputvalues[6].trim()); 
                    if(inputvalues[7].trim() != null && inputvalues[7].trim() !='' )
                        rc.VG_Market_Cap_2__c= inputvalues[7].trim(); 
                    if(inputvalues[8].trim() != null && inputvalues[8].trim() !='' )
                        rc.VG_Market_Cap_Percent__c= Decimal.valueOf(inputvalues[8].trim()); 
                    if(inputvalues[9].trim() != null && inputvalues[9].trim() !='' )
                        rc.VG_Business_Segment__c= Decimal.valueOf(inputvalues[9].trim()); 
                    if(inputvalues[10].trim() != null && inputvalues[10].trim() !='' )
                        rc.VG_Revenue__c= Decimal.valueOf(inputvalues[10].trim()); 
                    if(inputvalues[11].trim() != null && inputvalues[11].trim() !='' )
                        rc.VG_Financial_Score__c= Decimal.valueOf(inputvalues[11].trim()); 
                    if(inputvalues[12].trim() != null && inputvalues[12].trim() !='' )
                        rc.VG_Governance_Score__c= Decimal.valueOf(inputvalues[12].trim()); 
                    if(inputvalues[13].trim() != null && inputvalues[13].trim() !='' )
                        rc.VG_Operational_Score__c= Decimal.valueOf(inputvalues[13].trim()); 
                    if(inputvalues[14].trim() != null && inputvalues[14].trim() !='' )
                        rc.VG_M_A_Score__c= Decimal.valueOf(inputvalues[14].trim()); 
                    if(inputvalues[15].trim() != null && inputvalues[15].trim() !='' )
                        rc.VG_Shareholders_Score__c= Decimal.valueOf(inputvalues[15].trim()); 
                    if(inputvalues[16].trim() != null && inputvalues[16].trim() !='' )
                        rc.VG_Company_Ticker__c= inputvalues[16].trim();  
                    if(inputvalues[17].trim() != null && inputvalues[17].trim() !='' )
                        rc.VG_Activist_Insight_Upload_Date__c = inputvalues[17].trim();                      
                } 
            } 
        }catch(Exception e){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Error ::'+e+e.getLineNumber()));
            system.debug(e);
            return null;
        }
        return null;  
    }
      
    Public void setLPList(){
        try{
            LP_Select.clear();
            List<String> doLPList = new List<String>();
            RRCoverage_Select.clear();
            rc.VG_Industry__c=null;
            IndustrySelected ='';  
            CompanyType ='';    
            String LPString, CoverageString;
            if(Product== 'SAPI'){
                 doLPList = Utilities.setLloydsProduct('SAPI',Product,null,null);
                //LPString = Label.FIDO_LoydsProduct_D_O;
                CapacityPaper='Liberty Mutual - D&O/Crime';
                CoverageString = Label.FIDO_Coverages_D_O;                       
            } 
            LP_Select.add(new SelectOption('--None--','--None--'));
            for(String s : doLPList){
                LP_Select.add(new SelectOption(s,s));           
            }
            /*for(String s : LPString.split(';')){
                LP_Select.add(new SelectOption(s,s));  
            }*/
            for(String s : CoverageString.split(';')){
                RRCoverage_Select.add(new SelectOption(s,s));   
            }     
        }Catch(Exception e){
            showError(e);
        }
    }
    
    Public void RRCalc(){
        try{
            totalFeeAmount=0;
            totalbasepremium=0;
            totalbasepremiumrate=0;
            for(RRWrapper rrw:riskRatingList){
                totalFeeAmount=totalFeeAmount+rrw.psa.VG_Fee_Amounts__c;
                rrw.psa.VG_Base_Premium__c=(rrw.psa.VG_Base_Premium_Rate__c/100)*rrw.psa.VG_Fee_Amounts__c;                
                totalbasepremium=totalbasepremium+rrw.psa.VG_Base_Premium__c;
                if(totalFeeAmount != 0)
                    totalbasepremiumrate=(totalbasepremium/totalFeeAmount).SetScale(2);                
            }
        }Catch(Exception e){
            showError(e);
        }
    }
    
    
    Public void AddCustom(){
        hasEndorsements = True;    
        VG_Policy_Schedule_Endorsement__c tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
        tempEndsmt.CurrencyISOCode = policyCurrency;
        tempEndsmt.VG_Type__c='Endorsements';
        tempEndsmt.VG_Premium__c = 0;
        tempEndsmt.VG_Sub_limit__c=0;
        existingEndorsements.add(tempEndsmt);
    }
    
    
    Public void addRR(){
        Boolean allOkToTaddNewAsset = True;
        RRWrapper waNew=new RRWrapper();
        waNew.Counter=string.valueOf(RRcounter);            
        if(allOkToTaddNewAsset){
            VG_Policy_Schedule_Asset__c psaNew=new VG_Policy_Schedule_Asset__c();
            psaNew.CurrencyISOCode = policyCurrency;
            psaNew.VG_Base_Premium__c=0;
            psaNew.VG_Base_Premium_Rate__c=0;
            psaNew.VG_Fee_Amounts__c=0;
            psaNew.VG_Premium__c=0;
            waNew.techPremium=0;
            waNew.psa=psaNew;
            waNew.totalfeeAmt=0;
            riskRatingList.add(waNew);
            RRcounter++;
        }
    }
    
    
    Public void RemoveRR(){
        try{
            riskRatingList.remove(integer.valueOf(Index));
            RRcounter=0;
            System.debug('riskRatingList::'+riskRatingList.size()+'::'+riskRatingList);
            for(RRWrapper temp : riskRatingList){
                temp.Counter=String.valueOf(counter);
                RRcounter++;
            }
            if(riskRatingList.IsEmpty()){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please add atleast one asset to the policy schedule..'));   
            }
        }Catch(Exception e){
            showError(e);
        }
    }
    
    
    Public PageReference gotostep1(){
        return new PageReference('/apex/VG_SAPI_Step1');
    } 
    
    
    Public PageReference gotostep2(){
        if(CapacityPaper == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Capacity Paper'));    
            return null;
        }
        if(Product  == '--None--' || Product  == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Product..'));   
            return null;  
        }
        if(LProduct  == '--None--' || LProduct  == null ){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select Lloyds Product..'));   
            return null;  
        }
        if(Product == null || Product == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please Choose Product'));   
            return null;
        }
        if(LProduct == null || LProduct == '--None--'){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please Choose Lloyds Product'));   
            return null;
        }       
        return new PageReference('/apex/VG_SAPI_Step2');
    }   
    
    
    Public PageReference gotostep3(){
        return new PageReference('/apex/VG_SAPI_Step3');
    }
    
    
    Public PageReference gotostep4(){
        try{
            if(!existingEndorsements1.IsEmpty()){
                existingEndorsements1.clear();
            }
            List<String> coverageList = new List<String>();
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c=rr.CoverageSelected;
                If(LProduct == rr.CoverageSelected)           
                    coverageList.add(rr.psa.VG_Coverage__c);
            }
            If(!riskRatingList.IsEmpty() && coverageList.IsEmpty()){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please add atleast one matching coverage with the Lloyds Product ..'));          
                return null;
            }
            ElList1=[select id,Name,Endorsement_Title__c,Type__c,Text__c from Endorsement_Library__c where Type__c=:'Sub-limits' AND RecordType.Name =: 'SAPI' ORDER By Name ASC];        
            LibraryWrapperList1.clear();       
            for(Endorsement_Library__c EL1 : ElList1){            
                LW1 = new LibraryWrapper();
                LW1.EL = EL1;            
                LW1.isSelected = False;                    
                LibraryWrapperList1.add(LW1); 
            }
            return new PageReference('/apex/VG_SAPI_Step4');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    
    Public PageReference gotostep4b(){
        try{
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
                    tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
                    tempEndsmt.VG_Endorsement_Details__c = LW.EL.Text__c;
                    tempEndsmt.VG_Endorsement_Library_Id__c = LW.EL.Id;
                    tempEndsmt.VG_Title__c = LW.EL.Endorsement_Title__c;
                    tempEndsmt.VG_Premium__c = 0;
                    tempEndsmt.VG_Sub_limit__c = 0;
                    tempEndsmt.CurrencyISOCode = policyCurrency;
                    tempEndsmt.VG_Endorsement_Number__c = LW.EL.Name;
                    tempEndsmt.VG_Type__c = LW.EL.Type__c;
                    tempEndsmt.VG_IsTempDelete__c = False;
                    tempEndsmt.VG_IsTemp__c = True;
                    counterEnd++;
                    existingEndorsements1.add(tempEndsmt);
                }
            }     
            
            for(VG_Policy_Schedule_Endorsement__c pse:existingEndorsements1){
                if(tmpPSEMap.containsKey(pse.VG_Endorsement_Library_Id__c)){
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c  != 0){
                        pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                    }
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c  != 0){
                        pse.VG_Sub_limit__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                    }
                }
            }
            if(existingEndorsements1.IsEmpty()){
                counterEnd = 0;
            }else{
                counterEnd = existingEndorsements1.size();    
            }
            return new PageReference('/apex/VG_SAPI_Step4b');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    
    Public PageReference gotostep5(){
        try{
            if(!existingEndorsements.IsEmpty()){
                existingEndorsements.clear();
            }
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c=rr.CoverageSelected;         
            }
            ElList=[select id,Name,Endorsement_Title__c,Type__c,Text__c from Endorsement_Library__c where Type__c = :'Endorsements' AND RecordType.Name =: 'SAPI' AND VG_Product__c =:Product ORDER By Name ASC];
            LibraryWrapperList.clear();
            for(Endorsement_Library__c EL : ElList){            
                LW = new LibraryWrapper();
                LW.EL = EL;            
                LW.isSelected = False;                    
                LibraryWrapperList.add(LW); 
            }
            return new PageReference('/apex/VG_SAPI_Step5');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    Public PageReference gotostep5b(){
        try{
            Set<ID> elid = new Set<ID>();
            List<VG_Policy_Schedule_Endorsement__c> tmpPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
            Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
            for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
                tmpPSEMap.put(pe.VG_Endorsement_Library_Id__c, pe);
                if(pe.VG_Endorsement_Library_Id__c==null)tmpPSEList.add(pe);
            }
            existingEndorsements.clear();
            VG_Policy_Schedule_Endorsement__c tempEndsmt;
            for(LibraryWrapper LW:LibraryWrapperList){
                elid.add(LW.EL.Id);
                if(LW.isSelected){
                    tempEndsmt = new VG_Policy_Schedule_Endorsement__c();
                    tempEndsmt.VG_Endorsement_Details__c = LW.EL.Text__c;
                    tempEndsmt.VG_Endorsement_Library_Id__c = LW.EL.Id;
                    tempEndsmt.VG_Title__c = LW.EL.Endorsement_Title__c;
                    if(tmpPSEMap.containsKey(LW.EL.Id)){
                        tempEndsmt.VG_Title__c = tmpPSEMap.get(LW.EL.Id).VG_Title__c ;                
                        tempEndsmt.VG_Endorsement_Details__c = tmpPSEMap.get(LW.EL.Id).VG_Endorsement_Details__c ;
                    }
                    tempEndsmt.VG_Premium__c = 0;
                    tempEndsmt.VG_Sub_limit__c = 0;
                    tempEndsmt.CurrencyISOCode = policyCurrency ;
                    tempEndsmt.VG_Endorsement_Number__c = LW.EL.Name;
                    tempEndsmt.VG_Type__c = LW.EL.Type__c;
                    tempEndsmt.VG_IsTempDelete__c = False;
                    tempEndsmt.VG_IsTemp__c = True;
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
                        if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c != 0){
                            pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                        }
                        if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c != 0){
                            pse.VG_Sub_limit__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                        }
                    }
                }
            }           
            if(existingEndorsements.IsEmpty()){
                counterEnd = 0;
            }else{
                
                counterEnd = existingEndorsements.size();    
            }
            return new PageReference('/apex/VG_SAPI_Step5b');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }   
    
    
    Public PageReference gotostep6(){
        try{
            RiskPremium=endorsementPremium=prorata=0;
            if(Math.mod(pol.VG_Inception_Date__c.year(), 4) != 0){
                if(Math.mod(pol.VG_Expiry_Date__c.year(), 4) == 0){
                    if(pol.VG_Expiry_Date__c <= date.newInstance(pol.VG_Expiry_Date__c.year(), 02, 28)){
                        proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                    }else{
                        proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c))/365;
                    }
                }else{
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                }
            }else{
                if(pol.VG_Inception_Date__c < date.newInstance(pol.VG_Inception_Date__c.year(),03,01)){
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c))/365;
                }else{
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                }
            }
        
            endorsementPremium = 0;
            for(VG_Policy_Schedule_Endorsement__c en : existingEndorsements){
                endorsementPremium = endorsementPremium + en.VG_Premium__c;
            }
            rc.VG_Company_Type__c = CompanyType ;
            RiskPremium=0;
            for(RRWrapper rrw: riskRatingList){ 
                RiskPremium = RiskPremium + rrw.psa.VG_Premium__c;               
            }
            RiskPremium=RiskPremium*prorata;
            endorsementPremium=endorsementPremium*prorata;       
            netModelPremium = RiskPremium+ endorsementPremium; 
                   
            UpdateFinalCalculations();
            return new PageReference('/apex/VG_SAPI_Step6');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    Public void UpdateFinalCalculations(){
        try{
            System.debug('splittype::'+ps.Split_Type__c);
            if(ps.Split_Type__c == 'Both'){
                ps.VG_Entity_Split_Required__c = True;
            }else{
                ps.VG_Entity_Split_Required__c = False;
            }
            // If(RateChange==0.00 && pol.VG_Is_Renewal__c == false)
            //     RateChange=null;
            uwPremium=netModelPremium +adjustmentTechPremium;
            grossWrittenPremium = uwPremium+adjustment;
            If(sharePercent!=0 && sharePercent!=null)
                grossWrittenPremium2 =grossWrittenPremium*(sharePercent/100);
            brokerageAmount = grossWrittenPremium2 *(brokerage/100);
            techModelPremium = netModelPremium*(sharePercent/100);
            actualPremium=grossWrittenPremium2 -brokerageAmount;                
            If(sharePercent!=null){
                sumInsured=lmt*(sharePercent/100);    
                
            }         
                
            updatePSDetails();
            ps.Name = ps.Name.remove('/EEA').remove('/NonEEA');
            //String CPList = 'SAPI';
            //CPList = Label.FIDO_Others_SectionNumber;
            
            VFPsectionNoList = new List<SelectOption>();
            //for(String s : CPList.split(';')){
                VFPsectionNoList.add(new SelectOption('SAPI','SAPI'));
            //}
            System.debug('split::'+ps.VG_Entity_Split_Required__c);
            if(ps.VG_Entity_Split_Required__c){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,  'You have chosen to split entities. Please refer to the individual entity sections for split.')); 
                system.debug('NonEEAps.VG_Entity_Share__c::'+NonEEAps.VG_Entity_Share__c);
                Decimal NonEEAShare = NonEEAps.VG_Entity_Share__c == null ? 0 : NonEEAps.VG_Entity_Share__c;
                Decimal EEAShare = EEAps.VG_Entity_Share__c == null ? 0 : EEAps.VG_Entity_Share__c;
                system.debug('NonEEAShare::'+NonEEAShare);
                String NonEEAEntity = NonEEAps.VG_Volante_Entities__c;
                String EEAEntity = EEAps.VG_Volante_Entities__c;
                String NonEEACapacityPaper = NonEEAps.VG_Capacity_Paper__c;
                String EEACapacityPaper = EEAps.VG_Capacity_Paper__c;
                NonEEAps = ps.clone(false,true,false,false);
                NonEEAps.VG_Entity_Share__c = NonEEAShare;
                NonEEAps.VG_Volante_Entities__c = NonEEAEntity;
                if(pol.VG_Inception_Date__c.year() > 2020)
                    NonEEAps.Name += '/NonEEA';
                NonEEAps.Split_Type__c = 'Non EEA';
                NonEEAps.VG_Capacity_Paper__c = NonEEACapacityPaper;
                system.debug('NonEEAShare::'+NonEEAShare+'::'+NonEEAps);
                NonEEAps = VG_ManageBrexitSolutionController.summarayCalc(NonEEAps);
                system.debug('NonEEAShare::'+NonEEAShare+'::'+NonEEAps);
                EEAps = ps.clone(false,true,false,false);
                EEAps.VG_Entity_Share__c = EEAShare;
                EEAps.VG_Volante_Entities__c = EEAEntity;
                if(pol.VG_Inception_Date__c.year() > 2020)
                    EEAps.Name += '/EEA';
                EEAps.Split_Type__c = 'EEA';
                EEAps.VG_Capacity_Paper__c = EEACapacityPaper;
                EEAps = VG_ManageBrexitSolutionController.summarayCalc(EEAps);
            }
            
            Map<String, List<String>> MapEntityList = new Map<String, List<String>>();
            MapEntityList = Utilities.Entities('EEA',pol.VG_Inception_Date__c ,'SAPI',null);
            MapEntityList = Utilities.Entities('Non EEA',pol.VG_Inception_Date__c ,'SAPI',null);
            System.debug('MapEntityList::'+MapEntityList.get('EEA'));
            
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
        }Catch(Exception e){
            showError(e);
            system.debug('e::'+e.getLineNumber()+':::'+e.getMessage());
        }
    }
    
    
    Public PageReference cancel(){
        return new PageReference('/'+policyId);
    }
    
    Public Void updatePSDetails(){    
        Policy__c pol=[select id,Name,VG_Inception_Date__c,VG_Expiry_Date__c,VG_Is_Renewal__c from Policy__c where Id=:policyId limit 1];         
        List<Policy_Schedule__c> psList=new List<Policy_Schedule__c>([SELECT Id,Name,Policy__c FROM Policy_Schedule__c WHERE Policy__c=:policyId ORDER BY CreatedDate DESC]);                                          
        ps.CurrencyISOCode = policyCurrency;
        ps.Policy__c = policyId;
        ps.VG_Lloyds_Product__c=LProduct;
        ps.Product__c=Product;
        ps.Net_Premium__c = netModelPremium;
        ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;
        ps.Risk_Premium_Pro__c = RiskPremium;
        ps.Endorsement_Premium_Pro__c = endorsementPremium;
        ps.Limit__c=lmt;
        ps.VG_Capacity_Paper__c = CapacityPaper;
        ps.Attachment__c=attachment;
        ps.ILF_Layer__c = layer ;
        ps.Written_share__c = writtenShare ;
        ps.Share__c=sharePercent;
        ps.Actual_GWP__c=actualPremium;
        ps.VG_Brokerage_Percent__c = brokerage;
        ps.VG_Brokerage_Amount__c=brokerageAmount;
        ps.Gross_Written_Premium__c = grossWrittenPremium2;
        ps.VG_Gross_Written_Premium_100__c = grossWrittenPremium;        
        ps.Premium_Adjustment__c = adjustmentTechPremium;
        ps.Premium_Adjustment_2__c = adjustment;
        ps.Sum_Insured__c = sumInsured;
        // If(RateChange == 0.00 && pol.VG_Is_Renewal__c == false)       
        //     // ps.VG_Rate_Change__c = null;
        // else
            ps.VG_Rate_Change__c = RateChange;
        ps.Technical_UW_Premium__c = uwPremium;
        ps.VG_Technical_Model_Premium__c = techModelPremium;
        ps.Gross_or_Net_Premium__c = GrossOrNet ;
        ps.Base_Creation_Start_Date__c =Pol.VG_Inception_Date__c;
        ps.Base_Creation_End_Date__c = Pol.VG_Expiry_Date__c;
        ps.VG_Base_Policy__c=true;
        List<Integer> psNumList=new List<Integer>();
        if(psList.size() > 0){
            String bsname;
            for(Policy_Schedule__c ps: psList){
                if(ps.Name.contains('/EEA'))
                    bsname = ps.Name.remove('/EEA');
                if(ps.Name.contains('/NonEEA'))
                    bsname = ps.Name.remove('/NonEEA');
                if(!ps.Name.contains('/NonEEA') && !ps.Name.contains('/EEA')){
                    bsname = ps.Name;
                    System.debug('bsname2::'+bsname );
                }
                if(bsname.contains('/PS/'))
                    psNumList.add(Integer.valueOf(bsname.split('/PS/')[1]));
                else if(bsname.contains('/MTA/'))
                    psNumList.add(Integer.valueOf(bsname.split('/MTA/')[1]));
            }
            psNumList.sort();
            ps.Name  =  pol.Name+'/PS/'+((psNumList[psNumList.size()-1])+1);        
        }else{
            ps.Name  =  pol.Name+'/PS/0';    
        }  
        if(pol.VG_Inception_Date__c.year() > 2020){                        
            if(ps.Split_Type__c == 'EEA'){
                ps.Name += '/EEA';
            }else if(ps.Split_Type__c == 'Non EEA'){
                ps.Name += '/NonEEA';
            }
        }
        ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;              
        ps.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId(); 
    }
    
    Public PageReference finish(){
        Savepoint sp = Database.setSavepoint();
        try{
            List<VG_Policy_Schedule_Asset__c> assetsToBeInserted = new List<VG_Policy_Schedule_Asset__c>();
            List<VG_Policy_Schedule_Endorsement__c> endToBeInserted = new List<VG_Policy_Schedule_Endorsement__c>();
            updatePSDetails();
            ps.Split_Type__c = ps.Split_Type__c == '' ? null : ps.Split_Type__c;
            
            if(!ps.VG_Entity_Split_Required__c){
                if(!skipSplit && (ps.Split_Type__c == null || ps.Split_Type__c == '--None--')){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select a split type.'));   
                    return null;
                }
                Set<String> eeaCountries = new Set<String>();
                eeaCountries.addAll(Label.EEA_Countries.split(';'));
                if(rc.VG_Company_Domicile__c != null && ps.Split_Type__c == 'EEA' && (!eeaCountries.contains(rc.VG_Company_Domicile__c))){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please check company domicile as policy schedule split is for EEA and company domicile is Non EEA'));
                    return null;
                }else if(rc.VG_Company_Domicile__c != null && ps.Split_Type__c == 'Non EEA' && (eeaCountries.contains(rc.VG_Company_Domicile__c))){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please check company domicile as policy schedule split is for Non EEA and company domicile is EEA'));
                    return null;
                }
                Utilities.SkipMethods('Bridge Context');
                Insert ps;
                RC.Policy_Schedule__c=ps.id;
                RC.Name=ps.Name+'/RD/1';
                insert RC;
                Integer psecount=1;
                Integer sbpsecount=1;
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                    pse.VG_Policy_Schedule__c = ps.Id;
                    pse.Name= ps.Name + '/PE/' + psecount;
                    endToBeInserted.add(pse);
                    psecount++;
                }
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                    pse.VG_Policy_Schedule__c = ps.Id;
                    pse.Name= ps.Name + '/PESb/' + sbpsecount;
                    endToBeInserted.add(pse);
                    sbpsecount++;
                }
                if(!endToBeInserted.IsEmpty()){
                    Insert endToBeInserted;
                }
                Integer psacount=1;
                for(RRWrapper rrw : riskRatingList){
                    rrw.psa.Name = ps.Name + '/RR/' + psacount;
                    rrw.psa.RecordTypeId=Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();      
                    rrw.psa.VG_Policy_Schedule__c=ps.id;
                    assetsToBeInserted.add(rrw.psa);
                    psacount++;
                }
                if(!assetsToBeInserted.IsEmpty()){
                    Insert assetsToBeInserted;
                }
                return new PageReference('/'+ps.Id);
            }else{
                if(NonEEAps.VG_Entity_Share__c + EEAps.VG_Entity_Share__c != 100){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'All entity shares must add up to 100%'));   
                    return null;
                }
                
                if(NonEEAps.VG_Entity_Share__c == 0  || EEAps.VG_Entity_Share__c == 0){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'All entity shares must be greater than 0%'));   
                    return null;
                }
                List<Policy_Schedule__c> tbi = new List<Policy_Schedule__c>();
                tbi.add(NonEEAps);
                tbi.add(EEAps);
                Insert tbi;
                
                List<Risk_Capture__c> rcList = new List<Risk_Capture__c>();
                for(Policy_Schedule__c entityPS : tbi){
                    Risk_Capture__c entityRC = RC.clone(false,true,false,false);
                    entityRC.Policy_Schedule__c  =  entityPS.id;
                    entityRC.Name  =  entityPS.Name+'/RD/1';
                    rcList.add(entityRC);
                }
                Insert rcList;
                
                
                Integer psecount  =  1;
                Integer sbpsecount  =  1;
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                    for(Policy_Schedule__c entityPS : tbi){
                        VG_Policy_Schedule_Endorsement__c entityPSE = pse.clone(false,true,false,false);
                        entityPSE.VG_Policy_Schedule__c  =  entityPS.Id;
                        entityPSE.Name  =   entityPS.Name + '/PE/' + psecount;
                        endToBeInserted.add(entityPSE);
                    }
                    psecount++;
                }
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                    for(Policy_Schedule__c entityPS : tbi){
                        VG_Policy_Schedule_Endorsement__c entityPSE = pse.clone(false,true,false,false);
                        entityPSE.VG_Policy_Schedule__c  =  entityPS.Id;
                        entityPSE.Name  =   entityPS.Name + '/PE/' + sbpsecount;
                        endToBeInserted.add(entityPSE);
                    }
                    sbpsecount++;
                }
                if(!endToBeInserted.IsEmpty()){
                    Insert endToBeInserted;
                }
                Integer psacount  =  1;
                for(RRWrapper rrw : riskRatingList){
                    for(Policy_Schedule__c entityPS : tbi){
                        VG_Policy_Schedule_Asset__c entityPSA = rrw.psa.clone(false,true,false,false);
                        entityPSA.Name  =  entityPS.Name + '/RR/' + psacount;
                        entityPSA.RecordTypeId  =  Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();      
                        entityPSA.VG_Policy_Schedule__c  =  entityPS.id;
                        assetsToBeInserted.add(entityPSA);
                    }
                    psacount++;
                }
                if(!assetsToBeInserted.IsEmpty()){
                    Insert assetsToBeInserted;
                }
            }
            Utilities.clearMethods();
            return new PageReference('/'+policyId);
            
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
    
    
    Public class RRWrapper{
        Public VG_Policy_Schedule_Asset__c psa{get;set;}
        Public String Counter{get;set;}
        Public Decimal share {get; set;}
        Public Decimal totalfeeAmt {get; set;}
        Public String CoverageSelected{get;set;}
        Public Decimal techPremium{get;set;}
        Public RRWrapper(){
            totalfeeAmt=0;
        }
    }
    
    
    Public Class LibraryWrapper{
        
        Public Endorsement_Library__c EL {get; set;}
        Public Boolean isSelected {get; set;} 
        
        Public LibraryWrapper(){
            EL = new Endorsement_Library__c();
            isSelected = False;
        }
    }
}