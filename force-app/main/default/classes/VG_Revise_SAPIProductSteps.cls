Public Class VG_Revise_SAPIProductSteps{
    
    Public Id PSID {get; set;}
    public Id EEAPSID {get; set;}
    public Id NonEEAPSID {get; set;}
    public Id policyId {get; set;}
    
    Public Risk_Capture__c rc{get;set;}
    Public Policy__c policy{get;set;}
    Public Policy_Schedule__c ps {get; set;} 
    Public Policy_Schedule__c rocps {get; set;}            
    public Policy_Schedule__c NonEEAps {get; set;}
    public Policy_Schedule__c EEAps {get; set;}  
    public Policy_Schedule__c DatePS{get; set;} 
    public Policy_Schedule__c tempPS{get; set;} 
    
    Public Boolean EnableReinstatement{get;set;}
    Public Boolean hasEndorsements {get; set;}
    Public Boolean stopProcess{get; set;}
    Public Boolean showSplitType {get; set;}
    Public Boolean skipSplit {get; set;}
    public Boolean DMLAlert{get;set;}
    public Boolean UploadAsset{get;set;}
    
    public Blob fileBody {get;set;} 
    
    public String[] filelines  =  new String[]{};    
    
    Public Integer RRcounter {get; set;}
    Public Integer counter{get;set;}
    Public Integer counterEnd {get; set;}
    Public Integer psacount {get;set;}
    
    public String bsname{get;set;}
    Public String layer {get; set;}
    Public String GrossOrNet {get; set;}
    Public String Index{get;set;}
    Public String LProduct{get;set;}
    Public String Product{get;set;}
    Public String policyCurrency {get; set;}
    Public string CapacityPaper{get;set;}
    Public String IndustrySelected {get; set;}
    Public String MTAType{get;set;}
    Public String MTAStartDate{get;set;}
    Public String MTAEndDate{get;set;}
    Public String seletedProrateoption {get; set;}  
    public String SplitType {get;set;}
    
    Public decimal proRata{get;set;}    
    Public decimal totalFeeAmount{get;set;}
    Public decimal totalbasepremium{get;set;}
    Public decimal totalbasepremiumrate{get;set;}
    Public Decimal netModelPremium {get; set;}
    Public Decimal RiskPremium {get;set;}
    Public Decimal lmt {get;set;}
    Public Decimal attachment {get;set;}
    Public Decimal adjustment {get;set;}
    Public Decimal writtenShare {get; set;}
    Public Decimal orderShare{get; set;}
    Public Decimal actualPremium {get; set;}
    Public Decimal sumInsured {get; set;}
    Public Decimal brokerage {get; set;}
    Public Decimal uwPremium {get; set;}
    Public Decimal RateChange {get;set;}
    Public Decimal brokerageAmount {get; set;}
    Public Decimal grossWrittenPremium {get; set;}
    Public Decimal grossWrittenPremium2 {get; set;}
    Public Decimal IPTAmount {get; set;}
    Public Decimal IPTPercent {get; set;}
    Public Decimal sharePercent {get; set;}
    Public Decimal techModelPremium {get; set;}
    Public Decimal adjustmentTechPremium {get; set;}
    Public Decimal taxamount {get; set;}     
    Public Decimal endorsementPremium {get; set;}         
    Public decimal ExpectedLossRatio{get;set;}
    
    Public List<Volante_Entities__c> Entities {get;set;}    
    
    Public List<RRWrapper> riskRatingList {get; set;}
    public list<SelectOption> VolanteEntity_Select {get; set;}
    public list<SelectOption> NonEEAVolanteEntity_Select {get; set;}
    public list<SelectOption> EEAVolanteEntity_Select {get; set;}
    public list<SelectOption> VFPsectionNoList {get; set;}
    Public list<SelectOption> Product_Select {get; set;}
    Public List<SelectOption> splitTypes{get; set;}
    Public list<SelectOption> LP_Select {get; set;}
    Public list<SelectOption> RRCoverage_Select {get; set;}
    Public list<SelectOption> Industry_Select {get; set;}
    Public list<SelectOption> CompanyType_Select {get; set;}
    Public List<SelectOption> SAPI_Industry_Select {get; set;}
    Public List<SelectOption> MarketCap_Select {get; set;}
    Public list<SelectOption> DOProduct_Select {get; set;}
    Public list<SelectOption> CapacityPaperList {get; set;}
    Public List<VG_Policy_Schedule_Asset__c> psaList{get;set;}
    Public List<Endorsement_Library__c> ElList1{get;set;}
    Public List<Endorsement_Library__c> ElList{get;set;} 
    Public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements1 {get; set;}
    Public List<LibraryWrapper> LibraryWrapperList1 {get; set;}
    Public List<VG_Policy_Schedule_Endorsement__c> existingEndorsements {get; set;}
    Public List<LibraryWrapper> LibraryWrapperList {get; set;}
    Public List<VG_Policy_Schedule_Endorsement__c> manualList{get;set;}
    Public List<VG_Policy_Schedule_Endorsement__c> endToBeUpdated{get;set;}
    Public List<VG_Policy_Schedule_Endorsement__c> endToBeInserted{get;set;}
    Public List<VG_Policy_Schedule_Asset__c> assetToBeInserted{get;set;}
    Public List<VG_Policy_Schedule_Asset__c> assetToBeUpdated {get;set;}
    public List<String> UnderwriterProducts {get; set;}
     
    Public LibraryWrapper LW1{get;set;}
    Public LibraryWrapper LW{get;set;}
    
    Public Map<id,VG_Policy_Schedule_Endorsement__c> pseTempMap{get;set;}
    Public Map<id,VG_Policy_Schedule_Endorsement__c> pseMap{get;set;}
    Public Map<id,VG_Policy_Schedule_Asset__c> psaMap{get;set;}
    Public Map<String, CurrencyType> currencyRateMap{get;set;}
    
    Public VG_Revise_SAPIProductSteps(){
    stopProcess = false;
      try{
            MTAType=apexpages.currentpage().getparameters().get('MTAType');
            MTAStartDate=apexpages.currentpage().getparameters().get('MTAStartDate');
            MTAEndDate=apexpages.currentpage().getparameters().get('MTAEndDate');       
            seletedProrateoption  = apexpages.currentpage().getparameters().get('seletedProrateoption'); 
            PSID = apexpages.currentpage().getparameters().get('Id');
            NonEEAps   =   new Policy_Schedule__c(); 
            EEAps  =   new Policy_Schedule__c(); 
            ps = [select id, Name, Policy__r.Name,VG_Technical_Loss_Ratio__c,Seleted_Prorate_Option__c, MTA_Parent_Policy_Schedule__c, VG_Is_MTA__c, VG_Entity_Split_Required__c,Base_Creation_Start_Date__c, VG_Gross_Written_Premium_100__c, VG_Entity_Share__c,VG_Risk_Start_Date__c,VG_Risk_End_Date__c,VG_MTA_End_Date__c,VG_Type_Of_Operation__c,Base_Creation_End_Date__c,VG_Rate_Change__c, VG_Side_C_Retention_Currency__c,VG_Side_B_Retention_Currency__c,VG_Side_B_Rentention__c, VG_Side_C_Rentention__c, VG_D_O_Product__c, VG_MTA_Type__c, VG_MTA_Start_Date__c, Endorsement_Premium_Pro__c, Policy__c, CurrencyISOCode, Policy__r.VG_Expiry_Date__c, Policy__r.VG_Inception_Date__c, VG_Capacity_Paper__c, Product__c, VG_Lloyds_Product__c, Net_Premium__c , Risk_Premium_Pro__c, Limit__c, Attachment__c, ILF_Layer__c, Written_share__c, Share__c, Actual_GWP__c, VG_Brokerage_Percent__c, Gross_or_Net_Premium__c, VG_Technical_Model_Premium__c, Technical_UW_Premium__c, VG_Witholding_Tax_Amount__c, VG_VAT_Amount__c, VG_VAT__c, Sum_Insured__c, Levies__c, VG_Fee_Income__c, VG_Brokerage_Amount__c, Gross_Written_Premium__c, Transaction_GWP__c, Premium_Adjustment__c, Premium_Adjustment_2__c, IPT__c, IPT_Percent__c, Split_Type__c, VG_Volante_Entities__c, Order_Share__c from Policy_Schedule__c where id = : PSID limit 1];
            policy = [select id, Name, Insured__c,VG_Is_Renewal__c,Underwriter__c,VG_Inception_Date__c, VG_Volante_Entities__c, CurrencyIsoCode, VG_Expiry_Date__c, Underwriter__r.Underwriter_Product__c from Policy__c where id = :ps.Policy__c limit 1];
            If(MTAType  ==null && ps.VG_MTA_Type__c !='Bad Debt Provision')
                rc = [SELECT Id,CurrencyIsoCode,Name,Policy_Schedule__c,VG_Company_Type__c,VG_Company_Domicile__c,VG_Market_Cap__c,VG_Industry__c,VG_RTR_Score__c,VG_Attack_Probability__c,VG_Loss_Cost__c,VG_Country__c,VG_Market_Cap_2__c,VG_Market_Cap_Percent__c,VG_Business_Segment__c,VG_Revenue__c,VG_Financial_Score__c,VG_Governance_Score__c,VG_Operational_Score__c,VG_M_A_Score__c,VG_Shareholders_Score__c,VG_Company_Ticker__c,VG_Activist_Insight_Upload_Date__c FROM Risk_Capture__c where Policy_Schedule__c=:PSID limit 1];
            else
                if(ps.VG_MTA_Type__c !='Bad Debt Provision')
                    rc = new Risk_Capture__c();
          
            If(MTAType == null && ps.VG_MTA_Type__c !='Bad Debt Provision')
                psaMap = new Map<id,VG_Policy_Schedule_Asset__c>([select id,Name,Asset__c,VG_Sum_Insured__c,VG_Territorial_Limits__c,VG_Share__c,VG_Deductible__c,VG_Sub_limit__c,VG_Premium__c,VG_Base_Premium_Rate__c ,VG_Profession__c,VG_Fee_Amounts__c,VG_Base_Premium__c,VG_Coverage__c ,VG_Coverage_Type__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c =: PSID]);
            else
                if(ps.VG_MTA_Type__c !='Bad Debt Provision')
                    psaMap = new Map<id,VG_Policy_Schedule_Asset__c>();
          
            policyId = ps.Policy__c;
            ps.Split_Type__c = ps.Split_Type__c == null ? '' : ps.Split_Type__c;
            if(ps.Split_Type__c == null || ps.Split_Type__c == '' || ps.VG_MTA_Type__c ==null || ps.VG_MTA_Type__c == 'Revision of Cover' || ps.VG_MTA_Type__c == 'Reinstatement Premium' || ps.VG_MTA_Type__c =='Run-Off'){ //ps.VG_MTA_Type__c != 'Cancellation' && ps.VG_MTA_Type__c != 'Extension' && ps.VG_MTA_Type__c != 'Reduction'
                showSplitType = True;
            }else{
                showSplitType = False;
            }
            if(ps.Name.contains('/NonEEA')){
                bsName = ps.Name.replace('/NonEEA', '/EEA');
            }else{
                bsName = ps.Name.replace('/EEA', '/NonEEA');
            }
            Set<String> bsNamesSet = new Set<String>();
            bsNamesSet.add(ps.Name);
            bsNamesSet.add(bsName);
            List<Policy_Schedule__c> entityPS = [select id, Name, VG_Type_Of_Operation__c,Seleted_Prorate_Option__c, VG_Gross_Written_Premium_100__c, VG_MTA_End_Date__c,VG_Risk_Start_Date__c,VG_Risk_End_Date__c,Policy__r.VG_Is_Renewal__c,Policy__r.Name, Base_Creation_End_Date__c,VG_Rate_Change__c, VG_Side_B_Rentention__c, VG_Side_C_Rentention__c, VG_D_O_Product__c, VG_MTA_Type__c, VG_MTA_Start_Date__c, Endorsement_Premium_Pro__c, Policy__c, CurrencyISOCode, Policy__r.VG_Expiry_Date__c, Policy__r.VG_Inception_Date__c, VG_Capacity_Paper__c, Product__c, VG_Lloyds_Product__c, Net_Premium__c , Risk_Premium_Pro__c, Limit__c, Attachment__c, ILF_Layer__c, Written_share__c, Share__c, Actual_GWP__c, VG_Brokerage_Percent__c, Gross_or_Net_Premium__c, VG_Technical_Model_Premium__c, Technical_UW_Premium__c, VG_Witholding_Tax_Amount__c, VG_VAT_Amount__c, VG_VAT__c, Sum_Insured__c, Levies__c, VG_Fee_Income__c, VG_Brokerage_Amount__c, Gross_Written_Premium__c, Transaction_GWP__c, Premium_Adjustment__c, Premium_Adjustment_2__c, IPT__c, IPT_Percent__c,VG_Entity_Share__c,VG_Entity_Split_Required__c, VG_Volante_Entities__c, Split_Type__c,Order_Share__c  from Policy_Schedule__c where Name IN : bsNamesSet];
            for(Policy_Schedule__c eps : entityPS){
                if(eps.Split_Type__c == 'Non EEA'){
                    NonEEAPS = eps;
                    NonEEAPSID = eps.Id;
                }
                if(eps.Split_Type__c == 'EEA'){
                    EEAPS = eps;
                    EEAPSID = eps.Id;
                }
            }
                 
            If(MTAType == 'Bad Debt Provision')
                ps.VG_Entity_Split_Required__c = False;
          
            if(ps.VG_Entity_Split_Required__c){
                system.debug('<>::'+ps.Split_Type__c+'::'+ps.Premium_Adjustment__c+'::'+ps.Premium_Adjustment_2__c+'::'+EEAps.Premium_Adjustment__c+'::'+EEAps.Premium_Adjustment_2__c+'::');
                system.debug('<>>::'+NonEEAps.Premium_Adjustment__c+'::'+NonEEAps.Premium_Adjustment_2__c);
                ps.Split_Type__c = 'Both';
                ps.Premium_Adjustment__c = ps.Premium_Adjustment__c / (ps.VG_Entity_Share__c/100);
                ps.Premium_Adjustment_2__c = ps.Premium_Adjustment_2__c / (ps.VG_Entity_Share__c/100);
                EEAps.Premium_Adjustment__c = EEAps.Premium_Adjustment__c / (EEAps.VG_Entity_Share__c/100); 
                EEAps.Premium_Adjustment_2__c = EEAps.Premium_Adjustment_2__c / (EEAps.VG_Entity_Share__c/100); 
                NonEEAps.Premium_Adjustment__c = NonEEAps.Premium_Adjustment__c / (NonEEAps.VG_Entity_Share__c/100); 
                NonEEAps.Premium_Adjustment_2__c = NonEEAps.Premium_Adjustment_2__c / (NonEEAps.VG_Entity_Share__c/100);
            }
          
            PolicyCurrency = policy.CurrencyIsoCode;
            riskRatingList=new List<RRWrapper>();
            Industry_Select = new List<SelectOption>();
            MarketCap_Select = new List<SelectOption>();
            SAPI_Industry_Select = new List<SelectOption>();
            LP_Select = new List<SelectOption>();
            RRCoverage_Select = new List<SelectOption>();
            CompanyType_Select = new List<SelectOption>();
            Product_Select = new List<SelectOption>();
            CapacityPaperList = new List<SelectOption>();
            splitTypes = new List<SelectOption>();
            LibraryWrapperList = new List<LibraryWrapper>();
            LibraryWrapperList1 = new List<LibraryWrapper>();
            existingEndorsements = new List<VG_Policy_Schedule_Endorsement__c>();
            existingEndorsements1 = new List<VG_Policy_Schedule_Endorsement__c>();
            manualList=new List<VG_Policy_Schedule_Endorsement__c>();
            counter = counterEnd = 0;
            totalFeeAmount=0;
            totalbasepremium=0;
            totalbasepremiumrate=0;
            DMLAlert = false;
            UploadAsset =True;
            RRCalc();
          if(ps.VG_MTA_Type__c !='Bad Debt Provision'){
              for(VG_Policy_Schedule_Asset__c psa : psaMap.values()){
                  RRWrapper tmp=new RRWrapper();
                  tmp.psa=psa;
                  tmp.Counter=String.valueOf(counter);
                  riskRatingList.add(tmp);
                  counter++;
              }
          }
                
            If(ps.VG_MTA_Type__c !=  'Run-off' && MTAType !=  'Run-off' && MTAType  !=  'Bad Debt Provision' && ps.Product__c!='Pre-paid D&O Run-off' && ps.Product__c!='D&O Run-off'){
                if(MTAType  ==  null && ps.VG_MTA_Type__c  ==  null){
                    If(ps.Base_Creation_Start_Date__c!=null && ps.Base_Creation_End_Date__c!=null && ps.Base_Creation_End_Date__c!=ps.Policy__r.VG_Expiry_Date__c)
                        proRata = Utilities.proRatingFactor(ps.Base_Creation_Start_Date__c, ps.Base_Creation_End_Date__c);
                    else                   
                        proRata = Utilities.proRatingFactor(ps.Policy__r.VG_Inception_Date__c, ps.Policy__r.VG_Expiry_Date__c);
                    System.debug('proRata::'+proRata);
                    
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
            }else{
                proRata =1;
            }
          System.debug('proRata::'+proRata);
            if(MTAType!= null && MTAType!=''){
                riskRatingList.clear();
            }
            pseTempMap= new Map<id,VG_Policy_Schedule_Endorsement__c>();
            If(MTAType==null)
                pseMap= new Map<id,VG_Policy_Schedule_Endorsement__c>([select id,Name,VG_Endorsement_Library_Id__c,VG_IsTempDelete__c,VG_Endorsement_Number__c,VG_Sub_limit__c,VG_Premium__c,VG_Endorsement_Details__c,VG_Title__c,VG_Type__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c=: PSID]);
            else
                pseMap= new Map<id,VG_Policy_Schedule_Endorsement__c>();
            for(VG_Policy_Schedule_Endorsement__c pse: pseMap.values()){
                pseTempMap.put(pse.VG_Endorsement_Library_Id__c,pse);
            }
            Set<ID> assetIds=new Set<ID>();
            if(ps.VG_MTA_Type__c !='Bad Debt Provision'){
              for(VG_Policy_Schedule_Asset__c psa : psaMap.values()){
                  if(psa.id != null && !assetIds.contains(psa.id))
                      assetIds.add(psa.id);
              }
            }
            EnableReinstatement=False;
            RRcounter = 1;
            LibraryWrapper LW;
            LibraryWrapper LW1;
            
            skipSplit = False;
            if(policy.VG_Inception_Date__c.year() <= 2020){
                splitTypes.add(new SelectOption('','None'));
                skipSplit = True;
            }
            splitTypes.add(new SelectOption('EEA','EEA'));
            splitTypes.add(new SelectOption('Non EEA','Non EEA'));
            splitTypes.add(new SelectOption('Both','Both'));
                
            If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){                
                for(VG_Policy_Schedule_Endorsement__c pse: pseMap.values()){
                    if(pse.VG_Endorsement_Library_Id__c == null)
                        manualList.add(pse);
                    else
                        pseTempMap.put(pse.VG_Endorsement_Library_Id__c,pse);             
                }
                List<CurrencyType> exchangeRates  =  [Select Id,  ConversionRate,  IsoCode from CurrencyType];
                currencyRateMap = new Map<String, CurrencyType>();
                for(CurrencyType cr : exchangeRates){
                    currencyRateMap.put(cr.IsoCode, cr);
                }
                Product_Select.add(new SelectOption('--None--','--None--'));
                Product_Select.add(new SelectOption('SAPI','Shareholder Actvist Protection Insurance'));                     
            }
            Product = ps.Product__c;               
            LProduct = ps.VG_Lloyds_Product__c;
            
            for(RRWrapper rr : riskRatingList){
                rr.CoverageSelected=rr.psa.VG_Coverage__c;               
            }            
            setLPList();
            MarketCap_Select.add(new SelectOption('--None--','--None--'));
            for(String s : Label.FIDO_MarketCap_Select.split(';')){
                MarketCap_Select.add(new SelectOption(s,s));
            }
            
            SAPI_Industry_Select.add(new SelectOption('--None--','--None--'));
            for(String s : Label.FIDO_SAPI_Industry_Select.split(';')){
                SAPI_Industry_Select.add(new SelectOption(s,s));
            }
            tempPS = new Policy_Schedule__c();
            DatePS = new Policy_Schedule__c();
            DatePS.VG_Risk_Start_Date__c = ps.VG_Risk_Start_Date__c;
            DatePS.VG_Risk_End_Date__c   = ps.VG_Risk_End_Date__c ; 
            system.debug('??0'+DatePS.VG_Risk_Start_Date__c +'::'+DatePS.VG_Risk_End_Date__c);
            if(MTAType  ==  'Run-Off' || ps.VG_MTA_Type__c == 'Run-Off'){
                system.debug('tempPS::'+Product);
                //tempPS.VG_Risk_Start_Date__c = ps.VG_Risk_Start_Date__c;
                //tempPS.VG_Risk_End_Date__c   = ps.VG_Risk_End_Date__c ;
                tempPS.VG_Risk_Start_Date__c = (MTAStartDate!=null?Date.valueOf(MTAStartDate):ps.VG_Risk_Start_Date__c);
                tempPS.VG_Risk_End_Date__c = (MTAEndDate!=null?Date.valueOf(MTAEndDate):ps.VG_Risk_End_Date__c);
                system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
                gotostep5();                            
            }         
            
            netModelPremium =  ps.Net_Premium__c ;
            RiskPremium = ps.Risk_Premium_Pro__c;
            EndorsementPremium=ps.Endorsement_Premium_Pro__c;
            lmt = ps.Limit__c;
            attachment =ps.Attachment__c;
            layer = ps.ILF_Layer__c ;
            writtenShare = ps.Written_share__c;
            sharePercent = ps.Share__c;
            orderShare = (ps.Order_Share__c!=null?ps.Order_Share__c:0);
            actualPremium=ps.Actual_GWP__c;
            brokerage=ps.VG_Brokerage_Percent__c;
            brokerageAmount=ps.VG_Brokerage_Amount__c;
            grossWrittenPremium2 = ps.Gross_Written_Premium__c;
            ExpectedLossRatio = ps.VG_Technical_Loss_Ratio__c;
            if(sharePercent !=0)
                grossWrittenPremium=grossWrittenPremium2 /(sharePercent/100);
            else
                grossWrittenPremium=0;
            adjustmentTechPremium=ps.Premium_Adjustment__c.setScale(2);
            adjustment =ps.Premium_Adjustment_2__c.setScale(2);
                   
            IPTAmount = ps.IPT__c;
            IPTPercent = ps.IPT_Percent__c;
            CapacityPaper=ps.VG_Capacity_Paper__c;
            RateChange = ps.VG_Rate_Change__c;
            sumInsured = ps.Sum_Insured__c;
            uwPremium = ps.Technical_UW_Premium__c;
            techModelPremium= ps.VG_Technical_Model_Premium__c ;
            GrossOrNet = ps.Gross_or_Net_Premium__c;
            IndustrySelected  = ps.VG_Type_Of_Operation__c;
            setCapacityPaper(); 
            if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium' || MTAType ==  'Run-off' || MTAType=='Bad Debt Provision'){
                rocps = new Policy_Schedule__c();
                rocps.id = null;
                
                adjustmentTechPremium = null;
                adjustment = null;
                lmt = null;
                attachment =null;
                layer =null ;
                writtenShare =null;
                orderShare = null;
                actualPremium=null;
                brokerage=null;
                IPTAmount =null;
                IPTPercent =null;
                brokerageAmount=null;  
                sumInsured = null;
                uwPremium = null; 
                ExpectedLossRatio = null;
            }
            If((MTAType  ==  'Bad Debt Provision' || ps.VG_MTA_Type__c == 'Bad Debt Provision') && ps.Product__c!='W&I'){
                RiskPremium =endorsementPremium=netModelPremium =0; 
                UpdateFinalCalculations();            
            }     
        }Catch(Exception e){
            stopProcess = true;
            System.debug('e::'+e.getMessage()+'::'+e.getLineNumber());
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
    
    Public void setCapacityPaper(){
        CapacityPaperList.clear();
        String CPList = '';
        CPList = Label.FIDO_Others_SectionNumber;
        
        for(String s : CPList.split(';')){
            CapacityPaperList.add(new SelectOption(s,s));
        }
        Set<String> availableCapacityPapers = new Set<String>();
        for(SelectOption so : CapacityPaperList){
            if(!availableCapacityPapers .contains(so.getLabel())){
                availableCapacityPapers.add(so.getLabel());
            }
        }
        if(CapacityPaper != null){
            if(!availableCapacityPapers.contains(CapacityPaper)){
                CapacityPaperList.add(new SelectOption(CapacityPaper, CapacityPaper));
            }
        }
    }  
    
    Public void setLPList(){
        try{    
            LP_Select.clear();
            List<String> doLPList = new List<String>();
            RRCoverage_Select.clear();
            String LPString, CoverageString;
            if(Product == 'SAPI'){
                //LPString = Label.FIDO_LoydsProduct_D_O;
                doLPList = Utilities.setLloydsProduct('SAPI',Product,null,null);
            System.debug('CapacityPaper::'+CapacityPaper);
                CapacityPaper='Liberty Mutual - D&O/Crime';
            System.debug('CapacityPaper::'+CapacityPaper);                
                CoverageString = Label.FIDO_Coverages_D_O;
            }
            LP_Select.add(new SelectOption('--None--','--None--'));
            if(Product != '--None--'){
                for(String s : doLPList){
                    LP_Select.add(new SelectOption(s,s));           
                }
                for(String s : CoverageString.split(';')){
                    RRCoverage_Select.add(new SelectOption(s,s));   
                }
            }
            setCapacityPaper();             
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
                totalbasepremiumrate=(totalbasepremium/totalFeeAmount).SetScale(2);
            }
        }Catch(Exception e){
            showError(e);
        }
    }
    
    
    Public void RemoveCustom(){
        List<VG_Policy_Schedule_Endorsement__c> newPSEList = new List<VG_Policy_Schedule_Endorsement__c>();
        newPSEList.addAll(existingEndorsements);
        existingEndorsements.clear();
        for(VG_Policy_Schedule_Endorsement__c pse: newPSEList){
            if(!pse.VG_IsTempDelete__c){
                existingEndorsements.add(pse);
            }
        }
    }
    
    
    Public void AddCustom(){
        hasEndorsements = True;    
        VG_Policy_Schedule_Endorsement__c tempEndsmt = new VG_Policy_Schedule_Endorsement__c();            
        tempEndsmt.VG_Premium__c = 0;
        tempEndsmt.VG_Sub_limit__c=0;
        tempEndsmt.VG_Type__c='Endorsements';
        existingEndorsements.add(tempEndsmt);
    }
    
    
    Public void addRR(){
        try{
            Boolean allOkToTaddNewAsset = True;
            RRWrapper waNew=new RRWrapper();
            waNew.Counter=string.valueOf(RRcounter);            
            if(allOkToTaddNewAsset){
                VG_Policy_Schedule_Asset__c psaNew=new VG_Policy_Schedule_Asset__c();
                psaNew.VG_Base_Premium__c=0;
                psaNew.VG_Base_Premium_Rate__c=0;
                psaNew.VG_Fee_Amounts__c=0;
                psaNew.VG_Premium__c=0;
                waNew.psa=psaNew;
                waNew.totalfeeAmt=0;
                riskRatingList.add(waNew);
                RRcounter++;
            }
        }Catch(Exception e){
            showError(e);
        }
    }
    
    Public void RemoveRR(){
        System.debug('Index::'+Index);
        if(riskRatingList.size()>1){
            riskRatingList.remove(integer.valueOf(Index));
        }else if(riskRatingList.size()==1){
            Index ='0';
            riskRatingList.remove(integer.valueOf(Index));
        }
        
        RRcounter=0;
        for(RRWrapper temp : riskRatingList){
            temp.Counter=String.valueOf(counter);
            RRcounter++;
        }
        if(riskRatingList.IsEmpty()){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please add atleast one asset to the policy schedule..'));   
        }
    }
    
    Public pagereference total(){
        return null;
    }
    
    Public PageReference gotostep1(){
        return new PageReference('/apex/VG_Revise_SAPI_Step1');
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
        return new PageReference('/apex/VG_Revise_SAPI_Step2');
    }   
    
    
    Public PageReference gotostep3(){
        return new PageReference('/apex/VG_Revise_SAPI_Step3');
    }
    
    
    Public PageReference gotostep4(){
        try{
            if(!existingEndorsements1.IsEmpty()){
                existingEndorsements1.clear();
            }
            List<String> coverageList  =  new List<String>();
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c = rr.CoverageSelected;
                If(LProduct  ==  rr.CoverageSelected)           
                    coverageList.add(rr.psa.VG_Coverage__c);
            }
            If(Product != 'Cyber' && Product != 'Combined Cyber/ Tech E&O'){
                If(!riskRatingList.IsEmpty() && coverageList.IsEmpty()){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please add atleast one matching coverage with the Lloyds Product ..'));          
                    return null;
                }
            }
            ElList1 = [select id, Name, Endorsement_Title__c, Type__c, Text__c from Endorsement_Library__c where Type__c = :'Sub-limits' AND RecordType.Name  = : 'SAPI' ORDER By Name ASC];        
            LibraryWrapperList1.clear();       
            for(Endorsement_Library__c EL1 : ElList1){            
                LW1  =  new LibraryWrapper();
                LW1.EL  =  EL1;            
                LW1.isSelected  =  False;
                if(pseTempMap.containsKey(EL1.id)) { 
                    LW1.isSelected  =  True;
                }                         
                LibraryWrapperList1.add(LW1); 
            }
            return new PageReference('/apex/VG_Revise_SAPI_Step4');
        }Catch(Exception e){
            showError(e);
            system.debug('e');
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
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c  !=  0){
                        pse.VG_Premium__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Premium__c;
                    }
                    if(tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c  !=  0){
                        pse.VG_Sub_limit__c = tmpPSEMap.get(pse.VG_Endorsement_Library_Id__c).VG_Sub_limit__c;
                    }
                }
            }
            if(existingEndorsements1.IsEmpty()){
                counterEnd  =  0;
            }else{
                counterEnd  =  existingEndorsements1.size();    
            }
            return new PageReference('/apex/VG_Revise_SAPI_Step4b');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    
    Public PageReference gotostep5(){
        try{
            system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
            Map<Id, VG_Policy_Schedule_Endorsement__c> tmpPSEMap = new Map<Id, VG_Policy_Schedule_Endorsement__c>();
            for(VG_Policy_Schedule_Endorsement__c pe:existingEndorsements){
                if(pe.VG_Endorsement_Library_Id__c !=  null && !pseTempMap.containsKey(pe.VG_Endorsement_Library_Id__c))
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
                        if(pse.Name !=  pse1.Name && pse1.Name !=  null && !(new Set<VG_Policy_Schedule_Endorsement__c>(manualList)).contains(pse1)){
                            manualList.add(pse);
                        }
                    }
                }
            }
            if(!existingEndorsements.IsEmpty()){
                existingEndorsements.clear();
            }
            for(RRWrapper rr : riskRatingList){
                rr.psa.VG_Coverage__c = rr.CoverageSelected;                 
            }
            
            ElList = [select id, Name, Endorsement_Title__c, Type__c, Text__c from Endorsement_Library__c where RecordType.Name  = : 'SAPI' AND VG_Product__c =:Product ORDER By Name ASC];       
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
            return new PageReference('/apex/VG_Revise_SAPI_Step5');
        }Catch(Exception e){
            showError(e);
            return null;
        }
    }
    
    
    Public PageReference gotostep5b(){
        try{
            system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
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
                        tempEndsmt.id=  tmpPSEMap.get(LW.EL.Id).id; 
                    }else if(pseTempMap.containsKey(LW.EL.Id)){
                        tempEndsmt.id=  pseTempMap.get(LW.EL.Id).id; 
                    }
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
            return new PageReference('/apex/VG_Revise_SAPI_Step5b');
        }Catch(Exception e){
            showError(e);
            return null;
        } 
    }
    
    
    Public PageReference gotostep6(){
    system.debug('wi::'+RiskPremium +EndorsementPremium );
        system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
        try{
            System.debug('proRata::'+proRata);
            if(ps.Seleted_Prorate_Option__c == 'Flat' || seletedProrateoption == 'Flat')
                proRata = 1;
            endorsementPremium  =  0;
            for(VG_Policy_Schedule_Endorsement__c en : existingEndorsements){
                endorsementPremium  =  endorsementPremium + en.VG_Premium__c;
            }
            RiskPremium = 0;
            for(RRWrapper rrw: riskRatingList){ 
                RiskPremium  =  RiskPremium + (rrw.psa.VG_Premium__c!=null?rrw.psa.VG_Premium__c:0);                           
            }
            
            if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium'){
                If(seletedProrateoption == 'Flat' || ps.Seleted_Prorate_Option__c == 'Flat'){
                    RiskPremium  =  RiskPremium;
                    EndorsementPremium  =  EndorsementPremium;                
                }else If(seletedProrateoption == 'Prorated'){
                    System.debug('proRata::'+proRata+'::RiskPremium::'+RiskPremium);
                    RiskPremium  =  RiskPremium * proRata;
                    EndorsementPremium  =  EndorsementPremium * proRata;                    
                }
            }else{
                System.debug('proRata::'+proRata);
                System.debug('proRata::'+proRata+'::RiskPremium::'+RiskPremium);
                RiskPremium  =  RiskPremium * proRata;
                EndorsementPremium  =  EndorsementPremium * proRata;
            }            
            System.debug('RiskPremium::'+RiskPremium);
            netModelPremium  =  RiskPremium + EndorsementPremium;
            UpdateFinalCalculations();
            return new PageReference('/apex/VG_Revise_SAPI_Step6');
        }Catch(Exception e){
          showError(e);
          return null;
        }
    }
        
    Public void UpdateFinalCalculations(){
        system.debug('Check::'+Product+','+MTAType);
        try{
            System.debug('MTAType::'+MTAType);
            if(ps.Seleted_Prorate_Option__c == 'Flat' || seletedProrateoption == 'Flat')
                proRata = 1;
            if(ps.Split_Type__c == 'Both'){
                ps.VG_Entity_Split_Required__c = True;
            }else{
                ps.VG_Entity_Split_Required__c = False;
            }  
            
            //Bad dept
            If(MTAType == 'Bad Debt Provision')
                ps.VG_Entity_Split_Required__c = False;
                             
            //endorsementPremium = 0;
            ps.VG_Entity_Share__c = ps.VG_Entity_Split_Required__c == False ? null : ps.VG_Entity_Share__c;
            //for(VG_Policy_Schedule_Endorsement__c en : existingEndorsements){
            //    endorsementPremium  =  endorsementPremium + en.VG_Premium__c;
           // }
            //System.debug('RiskPremium::'+RiskPremium);
            //RiskPremium = 0;
            //for(RRWrapper rrw: riskRatingList){ 
            //    RiskPremium  =  RiskPremium + (rrw.psa.VG_Premium__c!=null?rrw.psa.VG_Premium__c:0);                                          
            //}
            
            /*if(MTAType  ==  'Revision of Cover' || MTAType == 'Reinstatement Premium'){
                If(seletedProrateoption == 'Flat' || ps.Seleted_Prorate_Option__c == 'Flat'){
                    RiskPremium  =  RiskPremium;
                    EndorsementPremium  =  EndorsementPremium;                
                }else If(seletedProrateoption == 'Prorated'){
                    RiskPremium  =  RiskPremium * proRata;
                    endorsementPremium  =  endorsementPremium * proRata;                    
                }
            }else{
                If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){   
                    RiskPremium  =  RiskPremium * proRata;
                    EndorsementPremium  =  EndorsementPremium * proRata;   
                }
            }  */
            System.debug('RiskPremium::'+RiskPremium);
            netModelPremium  =  RiskPremium + EndorsementPremium;
            
            //If(RateChange==0.00 && policy.VG_Is_Renewal__c == false)
                // RateChange=null;
            uwPremium=netModelPremium +(adjustmentTechPremium!=null?adjustmentTechPremium:0);
            if(uwPremium !=null)
                grossWrittenPremium = uwPremium+(adjustment!=null?adjustment:0);
            If(sharePercent!=0 && sharePercent!=null)
                grossWrittenPremium2 =grossWrittenPremium*(sharePercent/100);
            brokerageAmount = grossWrittenPremium2 *((brokerage!=null?brokerage:0)/100);
            actualPremium=grossWrittenPremium2 -brokerageAmount;
            techModelPremium = netModelPremium*(sharePercent/100);                
            If(sharePercent!=null){
                sumInsured=(lmt!=null?lmt:0)*(sharePercent/100);    
            } 
            String CPList = '';
            VFPsectionNoList = new List<SelectOption>();
            VFPsectionNoList.add(new SelectOption('--None--','--None--'));
            VFPsectionNoList.add(new SelectOption('SAPI','SAPI'));
                  
            updatePSDetails();
            if(ps.VG_Entity_Split_Required__c){
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,  'You have chosen to split entities. Please refer to the individual entity sections for split.')); 

                Decimal NonEEAShare = NonEEAps.VG_Entity_Share__c == null ? 0 : NonEEAps.VG_Entity_Share__c;
                Decimal EEAShare = EEAps.VG_Entity_Share__c == null ? 0 : EEAps.VG_Entity_Share__c;
                String NonEEAEntity = NonEEAps.VG_Volante_Entities__c;
                String EEAEntity = EEAps.VG_Volante_Entities__c;
                String NonEEACapacityPaper = NonEEAps.VG_Capacity_Paper__c;
                String EEACapacityPaper = EEAps.VG_Capacity_Paper__c;
                ps.name = ps.name.remove('/NonEEA').remove('/EEA');
                NonEEAps = ps.clone(false,true,false,false);
                NonEEAps.VG_Entity_Share__c = NonEEAShare;
                NonEEAps.VG_Volante_Entities__c = NonEEAEntity;
                if(policy.VG_Inception_Date__c.year() > 2020)                       
                   NonEEAps.Name += '/NonEEA';
                NonEEAps.Split_Type__c = 'Non EEA';
                NonEEAps.VG_Capacity_Paper__c = NonEEACapacityPaper;
                NonEEAps = VG_ManageBrexitSolutionController.summarayCalc(NonEEAps);
                EEAps = ps.clone(false,true,false,false);
                EEAps.VG_Entity_Share__c = EEAShare;
                EEAps.VG_Volante_Entities__c = EEAEntity;
                if(policy.VG_Inception_Date__c.year() > 2020)   
                    EEAps.Name += '/EEA';
                EEAps.Split_Type__c = 'EEA';
                EEAps.VG_Capacity_Paper__c = EEACapacityPaper;
                EEAps = VG_ManageBrexitSolutionController.summarayCalc(EEAps);
            }
            Map<String, List<String>> MapEntityList = new Map<String, List<String>>();           
            System.debug('MTAType::'+MTAType);
            If(MTAType==null && ps.VG_MTA_Type__c  ==  null){
                MapEntityList = Utilities.Entities('EEA',ps.Policy__r.VG_Inception_Date__c,'SAPI',null);
                MapEntityList = Utilities.Entities('Non EEA',ps.Policy__r.VG_Inception_Date__c,'SAPI',null);                                            
            }else if(MTAType!=null && MTAStartDate!=null){
                MapEntityList = Utilities.Entities('EEA',Date.valueOf(MTAStartDate),'SAPI',null);
                MapEntityList = Utilities.Entities('Non EEA',Date.valueOf(MTAStartDate),'SAPI',null);                                       
            }else{
                MapEntityList = Utilities.Entities('EEA',ps.VG_MTA_Start_Date__c,'SAPI',null);
                MapEntityList = Utilities.Entities('Non EEA',ps.VG_MTA_Start_Date__c,'SAPI',null);                                   
            }  
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
            system.debug('e::'+e.getMessage()+'::'+e.getLineNumber());
            showError(e);
        }                                    
    }
    
    Public Void updatePSDetails(){
        ps.id=PSID;
        ps.VG_Lloyds_Product__c=LProduct;
        ps.Product__c=Product;
        ps.Net_Premium__c = netModelPremium;
        ps.Risk_Premium_Pro__c = RiskPremium;
        ps.Endorsement_Premium_Pro__c=EndorsementPremium;
        ps.Limit__c=lmt;
        ps.Attachment__c=attachment;
        ps.Order_Share__c   = orderShare ;
        ps.ILF_Layer__c = layer ;
        ps.Written_share__c = writtenShare ;
        ps.Share__c=sharePercent;
        ps.Actual_GWP__c=actualPremium;
        ps.VG_Brokerage_Percent__c = brokerage;
        ps.VG_Brokerage_Amount__c=brokerageAmount;
        ps.VG_Technical_Loss_Ratio__c = ExpectedLossRatio;
        If(Product!='W&I'){
            ps.Gross_Written_Premium__c = grossWrittenPremium2;
            ps.VG_Gross_Written_Premium_100__c = grossWrittenPremium;
        }else{
            ps.Gross_Written_Premium__c = grossWrittenPremium;
            ps.VG_Gross_Written_Premium_100__c=0;
        }    
        ps.Premium_Adjustment__c = adjustmentTechPremium;
        ps.Premium_Adjustment_2__c = adjustment;
        ps.IPT__c=IPTAmount;
        ps.IPT_Percent__c = IPTPercent;
        ps.Sum_Insured__c = sumInsured;
        // If(RateChange == 0.00 && policy.VG_Is_Renewal__c   == false)       
        //     ps.VG_Rate_Change__c   =   null;
        // else
            ps.VG_Rate_Change__c   =  RateChange;
        ps.VG_Capacity_Paper__c=CapacityPaper;
        ps.Technical_UW_Premium__c = uwPremium;
        ps.VG_Technical_Model_Premium__c = techModelPremium;
        ps.Gross_or_Net_Premium__c = GrossOrNet ;
        ps.VG_Base_Policy__c=true;
        if(seletedProrateoption !=null && MTAType != 'Bad Debt Provision' && MTAType != 'Run-off')
            ps.Seleted_Prorate_Option__c = seletedProrateoption;
        
        if(MTAType == 'Run-Off' || ps.VG_MTA_Type__c == 'Run-Off'){
            system.debug('<><>'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
            ps.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
            ps.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
            ps.Base_Creation_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
            ps.Base_Creation_End_Date__c = tempPS.VG_Risk_End_Date__c ; 
            ps.VG_MTA_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
            ps.VG_MTA_End_Date__c = tempPS.VG_Risk_End_Date__c;
            ps.Product__c=Product;           
        }
        
        If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision' ){
            ps.VG_Type_Of_Operation__c = rc.VG_Industry__c;          
        }  
        if(!ps.VG_Is_MTA__c && ps.Base_Creation_End_Date__c==null && ps.Base_Creation_Start_Date__c==null){
            ps.Base_Creation_Start_Date__c = ps.Policy__r.VG_Inception_Date__c;
            ps.Base_Creation_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;   
        }
    }
    
    Public PageReference cancel(){
        return new PageReference('/'+ps.id);
    }
    
    
    Public PageReference finish(){
        Savepoint sp = Database.setSavepoint();
        try{
            
            List<Policy_Schedule__c> updatepslist = new List<Policy_Schedule__c>();
            system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
            updatePSDetails(); 
            system.debug('::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
            System.debug('dates::'+ps.VG_Risk_Start_Date__c+'::'+ ps.VG_Risk_End_Date__c);           
            If( MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                
                endToBeUpdated  =  new List<VG_Policy_Schedule_Endorsement__c>();
                endToBeInserted  =  new List<VG_Policy_Schedule_Endorsement__c>();
                assetToBeInserted  =  new List<VG_Policy_Schedule_Asset__c>();
                assetToBeUpdated  =  new List<VG_Policy_Schedule_Asset__c>();        
                
                Set<ID> pseIds = new Set<ID>();
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements){
                    endToBeInserted.add(pse);
                }
                for(VG_Policy_Schedule_Endorsement__c pse : existingEndorsements1){
                    endToBeInserted.add(pse);
                }
                
                if(!endToBeInserted.IsEmpty()){
                    Integer psecount = 1;
                    Integer psesbcount = 1;
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
                for(RRWrapper rrw : riskRatingList){
                    assetToBeInserted.add(rrw.psa);
                }
                Integer psacount = 1;
                if(!assetToBeInserted.IsEmpty()){
                    for(VG_Policy_Schedule_Asset__c psa : assetToBeInserted){
                        psa.Name = ps.Name+'/RR/'+psacount;
                        psa.VG_Policy_Schedule__c = ps.id;
                        psa.CurrencyISOCode = ps.CurrencyISOCode;
                        psacount++;
                    }
                }
            }
            System.debug('PSID::'+PSID+'::'+ps.Name);
                    
            if(MTAType !=  'Revision of Cover' && MTAType != 'Reinstatement Premium' && MTAType !=  'Run-off' && MTAType!='Bad Debt Provision'){ 
                
            }else{
                List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([select id, Name, Policy__r.Name,VG_MTA_Type__c,Order_Share__c  from Policy_Schedule__c where Policy__c = :ps.Policy__c]);
                rocps=ps;
                System.debug('PSID::'+PSID+'::'+ps.Name);
                    
                rocps.VG_Is_MTA__c = true;
                
                If(MTAType == 'Bad Debt Provision'){
                    rocps.VG_MTA_Type__c = 'Bad Debt Provision';
                    System.debug('MTAType::'+rocps.VG_MTA_Type__c); 
                     System.debug('MTAEndDate::'+MTAEndDate+'MTAStartDate::'+MTAStartDate);
                    If(MTAEndDate!=null)
                        rocps.VG_MTA_End_Date__c=Date.valueOf(MTAEndDate);
                    If(MTAStartDate!=null){
                        rocps.VG_MTA_Start_Date__c=Date.valueOf(MTAStartDate);
                        rocps.VG_Risk_Start_Date__c = Date.valueOf(MTAStartDate);
                    }
                                
                }
                If(MTAType  ==  'Revision of Cover'){
                    rocps.VG_MTA_Type__c = 'Revision of Cover';
                    rocps.VG_MTA_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;
                        
                }
                If(MTAType == 'Reinstatement Premium'){
                    rocps.VG_MTA_Type__c = 'Reinstatement Premium';
                    rocps.VG_MTA_End_Date__c = ps.Policy__r.VG_Expiry_Date__c;                    
                }
                If(MTAType  ==  'Run-off'){
                    rocps.VG_MTA_Type__c  =  'Run-off';
                    System.debug('tempPS::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
                    rocps.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                    rocps.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c ;
                    System.debug('rocPS::'+rocps.VG_Risk_Start_Date__c+'::'+rocps.VG_Risk_End_Date__c);                    
                    If(MTAEndDate!=null)
                        rocps.VG_MTA_End_Date__c=Date.valueOf(MTAEndDate);
                    System.debug('pslist::'+psList.size());
                    If(psList.size() <= 1){
                        policy.VG_Expiry_Date__c = rocps.VG_MTA_End_Date__c;
                        try{
                            update policy;
                        }Catch(Exception e){
                            System.debug('Exception1:'+e.getMessage()+e);
                            
                        }                                               
                    }                                   
                }
                
                If(MTAStartDate!=null)
                    rocps.VG_MTA_Start_Date__c=Date.valueOf(MTAStartDate);
                rocps.IPT__c = null;
                rocps.IPT_Percent__c = null; 
                rocps.Base_Creation_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                rocps.Base_Creation_End_Date__c=rocps.VG_MTA_End_Date__c;
                rocps.MTA_Parent_Policy_Schedule__c=PSID;
                System.debug('rocps.MTA_Parent_Policy_Schedule__c::'+rocps.MTA_Parent_Policy_Schedule__c+'::'+PSID);
                rocps.VG_Base_Policy__c=true;
                integer tmp;
                String[] tempDetail;
                String temp;
                if(psList.size()>0){
                    List<Integer> nums = new List<Integer>();
                    for(Policy_Schedule__c ps : psList){
                        If(ps.Name.contains('/PS/')){
                            tempDetail = ps.Name.split('/PS/');
                            if(tempDetail[1].contains('/EEA'))
                                temp = tempDetail[1].remove('/EEA');
                            else
                                temp = tempDetail[1].remove('/NonEEA');
                        }else If(ps.Name.contains('/MTA/')){
                            tempDetail = ps.Name.split('/MTA/');
                            if(tempDetail[1].contains('/EEA'))
                                temp = tempDetail[1].remove('/EEA');
                            else
                                temp = tempDetail[1].remove('/NonEEA');
                        }
                        tmp = Integer.valueOf(temp);
                        nums.add(tmp);
                    }
                    nums.sort();
                    System.debug('max::'+nums[0]+'::'+nums[nums.size()-1]);
                    rocps.Name = ps.Policy__r.Name+'/MTA/'+(nums[nums.size()-1]+1);
                }              
                Boolean checkRunoff = false;
                List<Policy_Schedule__c> psList2 = new List<Policy_Schedule__c>([select id, VG_Volante_Entities__c, Name, Policy__r.VG_Renewal_Policy_Id__c,Policy__r.Policy_Status__c,Policy__r.MTA_Cancel_List__c,Policy__r.VG_Is_Renewal__c,Policy__r.Name,  VG_MTA_Type__c,Policy__c, CurrencyISOCode, Policy__r.VG_Expiry_Date__c, Policy__r.VG_Inception_Date__c, Split_Type__c,Order_Share__c  from Policy_Schedule__c where (Policy__c = : policy.Id OR Id =: rocps.Id)]);
                List<Policy_Schedule__c> runoffpsList = new List<Policy_Schedule__c>();
                List<Policy_Schedule__c> notrunoffpsList = new List<Policy_Schedule__c>();
                for(Policy_Schedule__c ps: psList2){
                    System.debug('MTAType::'+ps.VG_MTA_Type__c+'::'+rocps.VG_MTA_Type__c);
                    if(ps.VG_MTA_Type__c == 'Run-off'){
                        System.debug('MTAType::'+ps.VG_MTA_Type__c+'::'+rocps.VG_MTA_Type__c);
                        runoffpsList.add(ps);
                        System.debug('runoffpsList::'+runoffpsList); 
                    }
                    if(ps.VG_MTA_Type__c == null)
                        notrunoffpsList.add(ps);            
                }
                if(runoffpsList.size() == notrunoffpsList.size()){ 
                    policy.VG_Expiry_Date__c = rocps.VG_MTA_End_Date__c;                    
                }                                        
            }
            List<sObject> recordsToBeDeleted = new List<sObject>();
            List<sObject> recordsToBeInserted = new List<sObject>();
            if(!ps.VG_Entity_Split_Required__c){
                if(!skipSplit && (ps.Split_Type__c == null || ps.Split_Type__c == '--None--')){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please select a split type.'));   
                    return null;
                }
                if(ps.VG_Volante_Entities__c != null && ps.VG_Volante_Entities__c != '--None--' && policy.VG_Volante_Entities__c != null && !policy.VG_Volante_Entities__c.contains(ps.VG_Volante_Entities__c)){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Entity selected on Policy Schedule must match the entity on Policy.'));   
                    return null;
                }
                If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                    Set<String> eeaCountries = new Set<String>();
                    eeaCountries.addAll(Label.EEA_Countries.split(';'));
                    if(rc.VG_Company_Domicile__c != null && ps.Split_Type__c == 'EEA' && (!eeaCountries.contains(rc.VG_Company_Domicile__c)) && MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please check company domicile as policy schedule split is for EEA and company domicile is Non EEA'));
                        return null;
                    }else if(rc.VG_Company_Domicile__c != null && ps.Split_Type__c == 'Non EEA' && (eeaCountries.contains(rc.VG_Company_Domicile__c)) && MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Please check company domicile as policy schedule split is for Non EEA and company domicile is EEA'));
                        return null;
                    }
                }
                if(MTAType !=  'Revision of Cover' && MTAType != 'Reinstatement Premium' && MTAType !=  'Run-off' && MTAType!='Bad Debt Provision'){ 
                    ps.Name = ps.Name.remove('/EEA').remove('/NonEEA');
                    System.debug(ps.Name);
                    if(ps.Name.contains('MTA')){
                        ps.VG_Is_MTA__c = True;
                    }
                    system.debug('??::'+DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                    String basePSName, otherPSName;
                    if(ps.Split_Type__c == 'EEA'){
                        system.debug('??1::'+DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        if(policy.VG_Inception_Date__c.year() > 2020)
                            ps.Name += '/EEA';
                        ps.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        ps.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c;
                        if((MTAType == 'Run-off' || ps.VG_MTA_Type__c == 'Run-Off')){
                            system.debug('1::');
                            ps.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            ps.VG_MTA_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.VG_MTA_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            ps.Base_Creation_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.Base_Creation_End_Date__c = tempPS.VG_Risk_End_Date__c ; 
                            if((ps.Product__c =='Pre-paid D&O Run-off' || ps.Product__c == 'D&O Run-off')){
                                policy.VG_Expiry_Date__c = tempPS.VG_Risk_End_Date__c;
                                update policy;
                            }
                        }
                        otherPSName = ps.Name.replace('EEA','NonEEA');
                    }else if(ps.Split_Type__c == 'Non EEA'){
                        system.debug('??2::'+DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        if(policy.VG_Inception_Date__c.year() > 2020)
                            ps.Name += '/NonEEA';
                        ps.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        ps.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c ;
                        if((MTAType == 'Run-off' || ps.VG_MTA_Type__c == 'Run-Off')){
                            system.debug('2::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
                            ps.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            ps.VG_MTA_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.VG_MTA_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            ps.Base_Creation_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            ps.Base_Creation_End_Date__c = tempPS.VG_Risk_End_Date__c ; 
                            system.debug('ps.Product__c::'+ps.Product__c);
                            if(ps.Product__c =='Pre-paid D&O Run-off' || ps.Product__c == 'D&O Run-off'){
                                system.debug('xx::');
                                policy.VG_Expiry_Date__c = tempPS.VG_Risk_End_Date__c;
                                update policy;
                            }
                        }
                        otherPSName = ps.Name.replace('NonEEA','EEA');
                    }        
                    basePSName = ps.Name.remove('/EEA').remove('/NonEEA');     
                    List<Policy_Schedule__c> psDelList = [Select Id from Policy_Schedule__c where (Name =: basePSName OR Name =: otherPSName OR Name =: ps.Name) AND Id <>: ps.Id];
                    Utilities.avoidRecursionSet.add('deleteSplitPairPS');
                    Delete psDelList;
                    //Utilities.clearMethods();
                    Utilities.SkipMethods('Trigger Context SAPI');
                    Utilities.SkipMethods('Trigger Context2');                   
                    //ps.Id = null;
                    //Utilities.SkipMethods('FIDO_ROC_Revise_Context');
                    PolicyScheduleTriggerFunction.allowInsertRI = True;
                    updatepslist.add(ps);
                    Upsert updatepslist;
                        
                    If(MTAType  !=  'Bad Debt Provision' && ps.VG_MTA_Type__c != 'Bad Debt Provision'){
                        RC.Name =  ps.Name+'/RD/0';
                        //RC.Id = null;
                        RC.Policy_Schedule__c = ps.Id;
                        Update RC;
                        List<VG_Policy_Schedule_Asset__c> psaDelList = [Select Id from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c =: ps.Id];
                        List<VG_Policy_Schedule_Endorsement__c> pseDelList = [Select Id from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c =: ps.Id];
                        Delete psaDelList;
                        Delete pseDelList;
                        List<VG_Payment_Frequency__c> pfList = [Select Id from VG_Payment_Frequency__c where VG_Policy_Schedule__c =: ps.Id]; 
                        if(!pfList.IsEmpty()){
                            Integer pfCount = 0;
                            for(VG_Payment_Frequency__c pf : pfList){
                                pf.Name = ps.Name + '/PF/' + pfCount;
                                pfCount++;
                            }
                            Update pfList;
                        }
                        psacount = 1;                   
                        if(!assetToBeInserted.IsEmpty()){
                            for(VG_Policy_Schedule_Asset__c psa : assetToBeInserted){
                                VG_Policy_Schedule_Asset__c tempPSA = psa.clone(false, true, false, false);
                                tempPSA.VG_Policy_Schedule__c = ps.Id;
                                tempPSA.Name = ps.Name+'/RR/'+psacount;
                                recordsToBeInserted.add(tempPSA);
                                psacount++;
                            }
                        }
    
                        if(!endToBeInserted.IsEmpty()){
                            Integer psecount = 1;
                            Integer psesbcount = 1;
                            for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                                VG_Policy_Schedule_Endorsement__c tempPSE = pse.clone(false, true, false, false);
                                if(tempPSE.VG_Type__c  ==  'Endorsements'){
                                    tempPSE.Name = ps.Name+'/PE/'+psecount;
                                    psecount++;
                                }
                                else{
                                    tempPSE.Name = ps.Name+'/PESB/'+psesbcount;
                                    psesbcount++;
                                }
                                tempPSE.VG_Policy_Schedule__c = ps.Id;
                                recordsToBeInserted.add(tempPSE);
                                pse.VG_Policy_Schedule__c = ps.Id;
                            }
                        }
                        //Utilities.SkipMethods('Trigger Context');
                        //Utilities.SkipMethods('Trigger Context2');
                        Insert recordsToBeInserted;
                    }
                    return new PageReference('/'+ps.Id);
                }else{
                    rocps.Name = rocps.Name.remove('/EEA').remove('/NonEEA').replace('PS','MTA');
                    String basePSName = rocps.Name;
                    String otherPSName;
                    List<Policy_Schedule__c> psDelList;
                    if(rocps.Split_Type__c == 'EEA'){    
                        if(policy.VG_Inception_Date__c.year() > 2020)                       
                            rocps.Name += '/EEA';
                        otherPSName = rocps.Name.replace('EEA','NonEEA');
                    }else if(rocps.Split_Type__c == 'Non EEA'){
                        if(policy.VG_Inception_Date__c.year() > 2020)
                            rocps.Name += '/NonEEA';
                        otherPSName = rocps.Name.replace('NonEEA','EEA');
                    }
                    Utilities.SkipMethods('Trigger Context SAPI');
                    Utilities.SkipMethods('Trigger Context2');
                    Policy_Schedule__c psInsert = rocps.clone(false, true, false, false);
                    psInsert.Id = null;
                    psInsert.VG_Is_MTA__c = True;
                    //psDelList = [Select Id from Policy_Schedule__c where Name =: basePSName OR Name =: rocps.Name OR Name =: otherPSName];
                    //Delete psDelList;
                    PolicyScheduleTriggerFunction.allowInsertRI  =  True;
                    Insert psInsert;
                    //if(ps.Id != null)
                    //    recordsToBeDeleted.add(ps);
                    If(MTAType != 'Bad Debt Provision'){            
                        List<Policy_Schedule__c> TriggerNew  =  new List<Policy_Schedule__c>();
                        TriggerNew.add(psInsert);
                        Risk_Capture__c rocrc = new Risk_Capture__c();
                        rocrc = rc.clone(false, true, false, false);
                        rocrc.id = null;
                        rocrc.Policy_Schedule__c = psInsert.id;
                        rocrc.Name = psInsert.Name+'/RD/0';
                        recordsToBeInserted.add(rocrc);
                        //if(rc.Id != null)
                        //    recordsToBeDeleted.add(rc);
                        Integer psacounter = 0;
                        for(VG_Policy_Schedule_Asset__c  psa : assetToBeInserted){
                            VG_Policy_Schedule_Asset__c tpsa = psa.clone(false, true, false, false);
                            tpsa.VG_Policy_Schedule__c = psInsert.id;
                            tpsa.Name = psInsert.Name+'/RR/'+psacounter;
                            psacounter++;  
                            recordsToBeInserted.add(tpsa);
                            //if(psa.Id != null)
                            //    recordsToBeDeleted.add(psa);                 
                        }
                        Integer psecounter = 0;
                        Integer psesbcounter = 0;
                        for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                            VG_Policy_Schedule_Endorsement__c tpse = pse.clone(false, true, false, false);
                            tpse.VG_Policy_Schedule__c = psInsert.id;
                            if(tpse.VG_Type__c  ==  'Endorsements'){
                                tpse.Name = psInsert.Name+'/PE/'+psecounter;
                                psecounter++;
                            }else{
                                tpse.Name = psInsert.Name+'/PESB/'+psesbcounter;
                                psesbcounter++;
                            }
                            recordsToBeInserted.add(tpse);
                            //if(pse.Id != null)
                            //    recordsToBeDeleted.add(pse); 
                        }
                        //Utilities.SkipMethods('Trigger Context');
                        //Utilities.SkipMethods('Trigger Context2');
                        Insert recordsToBeInserted;                      
                    }
                    Database.delete(recordsToBeDeleted, False);
                    return new PageReference('/'+psInsert.Id); 
                }
            }else{
                if(NonEEAps.VG_Entity_Share__c + EEAps.VG_Entity_Share__c != 100){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'All entity shares must add up to 100%'));   
                    return null;
                }
                System.debug('VG_Volante_Entities__c::'+EEAPS.VG_Volante_Entities__c+ps.VG_Volante_Entities__c);
                if(policy.VG_Volante_Entities__c != null && EEAPS.VG_Volante_Entities__c !=null && EEAPS.VG_Volante_Entities__c != '--None--' && EEAPS.VG_Volante_Entities__c != '' && !policy.VG_Volante_Entities__c.contains(EEAps.VG_Volante_Entities__c)){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Entity selected on EEA Policy Schedule must match the entity on Policy.'));   
                    return null;
                }
                if(policy.VG_Volante_Entities__c != null && NonEEAps.VG_Volante_Entities__c !=null && NonEEAps.VG_Volante_Entities__c != '--None--' && NonEEAps.VG_Volante_Entities__c != '' && !policy.VG_Volante_Entities__c.contains(NonEEAps.VG_Volante_Entities__c)){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Entity selected on Non EEA Policy Schedule must match the entity on Policy.'));   
                    return null;
                }
                if(NonEEAps.VG_Entity_Share__c ==0  || EEAps.VG_Entity_Share__c == 0){
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'All entity shares must be greater than 0%'));   
                    return null;
                }
                System.debug('PSID::'+PSID+'::'+NonEEAps.Name+'::'+EEAps.Name);
                if(MTAType !=  'Revision of Cover' && MTAType != 'Reinstatement Premium' && MTAType !=  'Run-off'){ 
                    if(EEAPS.Name.contains('MTA')){
                        EEAPS.VG_Is_MTA__c = True;
                    }    
                    if(NonEEAPS.Name.contains('MTA')){
                        NonEEAPS.VG_Is_MTA__c = True;
                    }
                    if(ps.VG_Entity_Split_Required__c){
                        system.debug('??::'+DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        system.debug('BothUpdateDatePS::'+ DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        EEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        EEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c ;
                        NonEEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        NonEEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c;
                        
                        //run-off revise
                        //if(MTAType != null){
                            /*system.debug('BothUpdateMTA::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c+'::'+MTAType+'::'+ps.Product__c+'::'+ps.VG_MTA_Type__c);
                            EEAPS.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            EEAPS.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            NonEEAPS.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            NonEEAPS.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;*/
                            if((Product=='Pre-paid D&O Run-off' || Product== 'D&O Run-off') && MTAType != 'Run-off' && ps.VG_MTA_Type__c != 'Run-Off' ){
                                 system.debug('Pre-paid Run-off::');
                                 EEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                                 EEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c ;
                                 NonEEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                                 NonEEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c ;
                            }
                            if((ps.Product__c =='Pre-paid D&O Run-off' || ps.Product__c == 'D&O Run-off') && ps.VG_MTA_Type__c == 'Run-off'){
                                system.debug('xx10::');
                                policy.VG_Expiry_Date__c = tempPS.VG_Risk_End_Date__c;
                                update policy;
                            }
                        //}
                    }
                       
                        
                    String basePSName = EEAPS.Name.remove('/EEA').remove('/NonEEA');
                    Map<Id, Policy_Schedule__c> psDelList = new Map<Id, Policy_Schedule__c>([Select Id from Policy_Schedule__c where (Name =: basePSName OR Name =: EEAPS.Name OR Name =: NonEEAPS.Name) AND (Id <>: EEAPSID AND ID <>: NonEEAPSID)]);
                    EEAPS.Id = EEAPSID;
                    NonEEAPS.Id = NonEEAPSID;
                    Set<Id> exPSIds = new Set<ID>();
                    if(EEAPSId != null)
                        exPSIds.add(EEAPSId);
                    if(NonEEAPSId != null)
                        exPSIds.add(NonEEAPSId);
                    NonEEAps.IPT__c = 0;
                    NonEEAps.VG_Tax_Amount_GWP_100__c = 0;
                    EEAps.IPT__c = 0;
                    EEAps.VG_Tax_Amount_GWP_100__c = 0;
                    if(!exPSIds.IsEmpty()){
                        List<VG_Taxes__c> existingTaxes = [Select Id, VG_Tax_Paid_By__c, VG_Tax_Amount_GWP_100__c, VG_Tax_Amount__c, VG_Tax_Administered_By__c, VG_Policy_Schedule__c from VG_Taxes__c where VG_Policy_Schedule__c IN: exPSIds];
                        List<VG_Taxes__c> subListOfAllTaxes;
                        Map<Id,  List<VG_Taxes__c>> PSTaxMap  =  new Map<Id,  List<VG_Taxes__c>>();
                        for(VG_Taxes__c tx: existingTaxes){
                            if(PSTaxMap.get(tx.VG_Policy_Schedule__c)  ==  null){
                                subListOfAllTaxes  =  new List<VG_Taxes__c>();
                            }else{
                                subListOfAllTaxes  =  PSTaxMap.get(tx.VG_Policy_Schedule__c);
                            }
                            subListOfAllTaxes.add(tx);
                            PSTaxMap.put(tx.VG_Policy_Schedule__c,  subListOfAllTaxes);
                        }
                        if(!PSTaxMap.IsEmpty() && PSTaxMap.containsKey(EEAPSId)){
                            Decimal IPT = 0;
                            Decimal IPTHun = 0;
                            for(VG_Taxes__c tx: PSTaxMap.get(EEAPSId)){ 
                                if((tx.VG_Tax_Administered_By__c == 'Insured' && tx.VG_Tax_Paid_By__c=='Insurer') || (tx.VG_Tax_Administered_By__c == 'Broker' && tx.VG_Tax_Paid_By__c=='Insurer') || (tx.VG_Tax_Administered_By__c == 'Insurer' && tx.VG_Tax_Paid_By__c=='Insured')){
                                    IPT = IPT+tx.VG_Tax_Amount__c;
                                    IPTHun = IPTHun + (tx.VG_Tax_Amount_GWP_100__c !=null ? tx.VG_Tax_Amount_GWP_100__c : 0) ;
                                }    
                            }
                            EEAps.IPT__c = IPT;
                            EEAps.VG_Tax_Amount_GWP_100__c = IPTHun;
                        }
                        if(!PSTaxMap.IsEmpty() && PSTaxMap.containsKey(NonEEAPSId)){
                            Decimal IPT = 0;
                            Decimal IPTHun = 0;
                            for(VG_Taxes__c tx: PSTaxMap.get(NonEEAPSId)){ 
                                if((tx.VG_Tax_Administered_By__c == 'Insured' && tx.VG_Tax_Paid_By__c=='Insurer') || (tx.VG_Tax_Administered_By__c == 'Broker' && tx.VG_Tax_Paid_By__c=='Insurer') || (tx.VG_Tax_Administered_By__c == 'Insurer' && tx.VG_Tax_Paid_By__c=='Insured')){
                                    IPT = IPT+tx.VG_Tax_Amount__c;
                                    IPTHun = IPTHun + (tx.VG_Tax_Amount_GWP_100__c !=null ? tx.VG_Tax_Amount_GWP_100__c : 0) ;
                                }    
                            }
                            NonEEAps.IPT__c = IPT;
                            NonEEAps.VG_Tax_Amount_GWP_100__c = IPTHun;
                        }
                    }
                    updatepslist.add(EEAps);
                    updatepslist.add(NonEEAps);
                    Utilities.SkipMethods('Trigger Context SAPI');
                    Utilities.SkipMethods('Trigger Context2');
                    PolicyScheduleTriggerFunction.allowInsertRI  =  True;
                    
                    Upsert updatepslist;
                    Utilities.avoidRecursionSet.add('deleteSplitPairPS');
                    Delete psDelList.values();
                    //Utilities.clearMethods();                    
                    
                    List<VG_Policy_Schedule_Asset__c> finalListPSA = [Select Id from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c =: EEAPS.Id OR VG_Policy_Schedule__c =: NonEEAPS.Id];
                    List<VG_Policy_Schedule_Endorsement__c> finalListPSE = [Select Id from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c =: EEAPS.Id OR VG_Policy_Schedule__c =: NonEEAPS.Id ];
                    List<Risk_Capture__c> finalListRC = [Select Id from Risk_Capture__c where Policy_Schedule__c =: EEAPS.Id OR Policy_Schedule__c =: NonEEAPS.Id ];
                    recordsToBeDeleted.addAll(finalListPSA);
                    recordsToBeDeleted.addAll(finalListPSE);
                    recordsToBeDeleted.addAll(finalListRC);
                    List<VG_Payment_Frequency__c> pfList = [Select Id, Name from VG_Payment_Frequency__c where VG_Policy_Schedule__c =: EEAPS.Id OR VG_Policy_Schedule__c =: NonEEAPS.Id]; 
                    if(!pfList.IsEmpty()){
                        Integer pfCountEEA = 0;
                        Integer pfCountNonEEA = 0;
                        for(VG_Payment_Frequency__c pf : pfList){
                            if(ps.Name.contains('/EEA')){
                                pf.Name = ps.Name + '/PF/' + pfCountEEA;
                                pfCountEEA++;
                            }
                            if(ps.Name.contains('/NonEEA')){
                                pf.Name = ps.Name + '/PF/' + pfCountNonEEA;
                                pfCountNonEEA++;
                            }
                        }
                        Update pfList;
                    }
                    List<Risk_Capture__c> rcList = new List<Risk_Capture__c>();
                    for(Policy_Schedule__c entityPS : updatepslist){
                        Risk_Capture__c entityrc = rc.clone(false, true, false, false);
                        entityrc.id = null;
                        entityrc.Policy_Schedule__c = entityPS.id;
                        entityrc.Name = entityPS.Name+'/RD/0';
                        recordsToBeInserted.add(entityrc);
                    }
                    
                    psacount = 1;
                    if(!assetToBeInserted.IsEmpty()){
                        for(VG_Policy_Schedule_Asset__c  psa : assetToBeInserted){
                            VG_Policy_Schedule_Asset__c tempPSA = psa.clone(false,true,false,false);
                            tempPSA.VG_Policy_Schedule__c = EEAPS.Id;
                            tempPSA.id = null;
                            tempPSA.Name = EEAPS.Name+'/RR/'+psacount;
                            recordsToBeInserted.add(tempPSA);
                            tempPSA = psa.clone(false,true,false,false);
                            tempPSA.VG_Policy_Schedule__c = NonEEAPS.Id;
                            tempPSA.id = null;
                            tempPSA.Name = NonEEAPS.Name+'/RR/'+psacount;
                            recordsToBeInserted.add(tempPSA);
                            psacount++;
                        }
                    }
                    Integer psecount = 1;
                    Integer psesbcount = 1;
                    if(!endToBeInserted.IsEmpty()){
                        for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                            VG_Policy_Schedule_Endorsement__c tempPSE = pse.clone(false,true,false,false);
                            tempPSE.VG_Policy_Schedule__c = EEAPS.Id;
                            tempPSE.id = null;
                            if(tempPSE.VG_Type__c  ==  'Endorsements'){
                                tempPSE.Name = EEAPS.Name+'/PE/'+psecount;
                            }
                            else{
                                tempPSE.Name = EEAPS.Name+'/PESB/'+psesbcount;
                            }
                            recordsToBeInserted.add(temppse);
                            tempPSE = pse.clone(false,true,false,false);
                            tempPSE.VG_Policy_Schedule__c = NonEEAPS.Id;
                            tempPSE.id = null;
                            if(tempPSE.VG_Type__c  ==  'Endorsements'){
                                tempPSE.Name = NonEEAPS.Name+'/PE/'+psecount;
                                psecount++;
                            }
                            else{
                                tempPSE.Name = NonEEAPS.Name+'/PESB/'+psesbcount;
                                psesbcount++;
                            }
                            recordsToBeInserted.add(tempPSE);
                        }
                    }
                    Utilities.SkipMethods('FIDO_ROC_Revise_Context');
                    Insert recordsToBeInserted;
                    //Database.delete(recordsToBeDeleted,False);
                    Delete recordsToBeDeleted;
                    return new PageReference('/'+policyId);
                }else{
                    List<Policy_Schedule__c> InsertpsList = new List<Policy_Schedule__c>();
                    Set<String> mtaParents = new Set<String>();
                    //mtaParents.add(ps.Name+'/EEA');
                    //mtaParents.add(ps.Name+'/NonEEA');
                    mtaParents.add(EEAPS.Name);
                    mtaParents.add(NonEEAPS.Name);
                    System.debug('mtaParents::'+mtaParents);
                    List<Policy_Schedule__c> mtaParentsList = [Select Id, Split_Type__c from Policy_Schedule__c where Name IN: mtaParents];
                    System.Debug('mtaParentsList::'+mtaParentsList);
                    for(Policy_Schedule__c mps : mtaParentsList){
                        if(mps.Split_Type__c == 'EEA'){
                            EEAPS.MTA_Parent_Policy_Schedule__c = mps.Id;
                        }else if(mps.Split_Type__c == 'Non EEA'){
                            NonEEAPS.MTA_Parent_Policy_Schedule__c = mps.Id;
                        }
                    }
                    System.debug('EEAPS.MTA_Parent_Policy_Schedule__c::'+EEAPS.MTA_Parent_Policy_Schedule__c+'::'+EEAPS.MTA_Parent_Policy_Schedule__c);
                    NonEEAPS.id=null; 
                    if(policy.VG_Inception_Date__c.year() > 2020)                       
                        NonEEAPS.Name = rocps.Name + '/NonEEA'; 
                    if((MTAType  ==  'Revision of Cover' || NonEEAPS.VG_MTA_Type__c == 'Revision of Cover')){                                           
                        NonEEAPS.VG_MTA_Type__c = 'Revision of Cover'; 
                    }
                    if((NonEEAPS.VG_MTA_Type__c == 'Reinstatement Premium' || MTAType == 'Reinstatement Premium')){                                           
                        NonEEAPS.VG_MTA_Type__c = 'Reinstatement Premium'; 
                    }
                    if((MTAType  ==  'Run-off' || NonEEAPS.VG_MTA_Type__c == 'Run-off')){
                        NonEEAPS.VG_MTA_Type__c = 'Run-off'; 
                    }             
                    NonEEAPS.Split_Type__c = 'Non EEA';
                    NonEEAPS.VG_Is_MTA__c = true;
                    NonEEAPS.VG_MTA_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                    NonEEAPS.VG_MTA_End_Date__c=rocps.VG_MTA_End_Date__c;
                    NonEEAPS.Base_Creation_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                    NonEEAPS.Base_Creation_End_Date__c=rocps.VG_MTA_End_Date__c;
                    NonEEAPS.VG_Base_Policy__c=true;
                    
                    EEAPS.id=null;  
                    if(policy.VG_Inception_Date__c.year() > 2020)                            
                        EEAPS.Name = rocps.Name + '/EEA';  
                    if((MTAType  ==  'Revision of Cover' || EEAPS.VG_MTA_Type__c == 'Revision of Cover')){                                           
                        EEAPS.VG_MTA_Type__c = 'Revision of Cover'; 
                    }
                    if((MTAType == 'Reinstatement Premium' || EEAPS.VG_MTA_Type__c == 'Reinstatement Premium')){                                           
                        EEAPS.VG_MTA_Type__c = 'Reinstatement Premium'; 
                    }
                    if((MTAType  ==  'Run-off' || EEAPS.VG_MTA_Type__c == 'Run-off')){
                        EEAPS.VG_MTA_Type__c = 'Run-off'; 
                    }                                     
                    EEAPS.Split_Type__c = 'EEA';
                    EEAPS.VG_Is_MTA__c = true;
                    EEAPS.VG_MTA_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                    EEAPS.VG_MTA_End_Date__c=rocps.VG_MTA_End_Date__c;
                    EEAPS.Base_Creation_Start_Date__c=rocps.VG_MTA_Start_Date__c;
                    EEAPS.Base_Creation_End_Date__c=rocps.VG_MTA_End_Date__c;
                    EEAPS.VG_Base_Policy__c=true;
                    
                    String otherpsName;
                    if(!rocps.Name.contains('/NonEEA')){
                        otherpsName = rocps.Name.replace('/EEA','/NonEEA');
                    }else{
                        otherpsName = rocps.Name.replace('/NonEEA','/EEA');
                    }

                    if(ps.VG_Entity_Split_Required__c){
                        system.debug('??::'+DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        system.debug('checkBothUpdateDatePS::'+ DatePS.VG_Risk_Start_Date__c+'::'+DatePS.VG_Risk_End_Date__c);
                        EEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        EEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c ;
                        NonEEAPS.VG_Risk_Start_Date__c = DatePS.VG_Risk_Start_Date__c;
                        NonEEAPS.VG_Risk_End_Date__c = DatePS.VG_Risk_End_Date__c;
                        if((MTAType == 'Run-off' || ps.VG_MTA_Type__c == 'Run-Off')){
                            system.debug('checkBothUpdatetempPS::'+tempPS.VG_Risk_Start_Date__c+'::'+tempPS.VG_Risk_End_Date__c);
                            EEAPS.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            EEAPS.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            EEAPS.VG_MTA_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            EEAPS.VG_MTA_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            EEAPS.Base_Creation_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            EEAPS.Base_Creation_End_Date__c = tempPS.VG_Risk_End_Date__c ; 
                            NonEEAPS.Base_Creation_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            NonEEAPS.Base_Creation_End_Date__c = tempPS.VG_Risk_End_Date__c ; 
                            NonEEAPS.VG_MTA_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            NonEEAPS.VG_MTA_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            NonEEAPS.VG_Risk_Start_Date__c = tempPS.VG_Risk_Start_Date__c;
                            NonEEAPS.VG_Risk_End_Date__c = tempPS.VG_Risk_End_Date__c;
                            //if((ps.Product__c =='Pre-paid D&O Run-off' || ps.Product__c == 'D&O Run-off')){
                                system.debug('xx1::');
                                policy.VG_Expiry_Date__c = tempPS.VG_Risk_End_Date__c;
                                update policy;
                            //}
                        }
                    } 
                    
                    String basePSName = rocps.Name.remove('/EEA').remove('/NonEEA');
                    List<Policy_Schedule__c> psDelList = [Select Id from Policy_Schedule__c where Name =: basePSName];
                    Delete psDelList;
                    Utilities.SkipMethods('Trigger Context SAPI');
                    Utilities.SkipMethods('Trigger Context2');
                    PolicyScheduleTriggerFunction.allowInsertRI  =  True;
                    InsertpsList.add(EEAPS);
                    InsertpsList.add(NonEEAPS);
                    //Utilities.SkipMethods('Trigger Context');
                    //Utilities.SkipMethods('Trigger Context2');
                    Upsert InsertpsList;
                    If(MTAType != 'Bad Debt Provision'){            
                        List<Risk_Capture__c> rcList = new List<Risk_Capture__c>();
                        for(Policy_Schedule__c entityPS : InsertpsList){
                            Risk_Capture__c rocrc = new Risk_Capture__c();
                            rocrc = rc.clone(false, true, false, false);
                            rocrc.id = null;
                            rocrc.Policy_Schedule__c = entityPS.id;
                            rocrc.Name = entityPS.Name+'/RD/0';
                            rcList.add(rocrc);
                        }
                        Insert rcList;
                        List<VG_Policy_Schedule_Asset__c> psaList = new List<VG_Policy_Schedule_Asset__c>();
                        for(Policy_Schedule__c entityPS : InsertpsList){
                            Integer psacounter = 0;
                            for(VG_Policy_Schedule_Asset__c  psa : assetToBeInserted){
                                VG_Policy_Schedule_Asset__c tempPSA = psa.clone(false, true, false, false);
                                tempPSA.VG_Policy_Schedule__c = entityPS.id;
                                tempPSA.Name = entityPS.Name+'/RR/'+psacounter;
                                psacounter++;   
                                psaList.add(tempPSA);                
                            }
                        }
                        
                        List<VG_Policy_Schedule_Endorsement__c> pseList = new List<VG_Policy_Schedule_Endorsement__c>();
                        for(Policy_Schedule__c entityPS : InsertpsList){
                            Integer psecounter = 0;
                            Integer psesbcounter = 0;
                            for(VG_Policy_Schedule_Endorsement__c pse : endToBeInserted){
                                VG_Policy_Schedule_Endorsement__c tempPSE = pse.clone(false, true, false, false);
                                tempPSE.VG_Policy_Schedule__c = entityPS.id;
                                if(tempPSE.VG_Type__c  ==  'Endorsements'){
                                    tempPSE.Name = entityPS.Name+'/PE/'+psecounter;
                                    psecounter++;
                                }else{
                                    tempPSE.Name = entityPS.Name+'/PESB/'+psesbcounter;
                                    psesbcounter++;
                                }
                                pseList.add(tempPSE);
                            }
                        }
                        //Utilities.SkipMethods('Trigger Context');
                        //Utilities.SkipMethods('Trigger Context2');
                        //Utilities.SkipMethods('FIDO_ROC_Revise_Context');
                        Insert psaList;
                        Insert pseList;
                    }
                    Utilities.clearMethods();
                    return new PageReference('/'+policyId);
                }
                
            }
        }Catch(Exception e){
            Database.rollback(sp);
            showError(e);
            system.debug('e::'+e.getLineNumber()+e.getMessage());
            return null;
        }  
    }
   
    Public void showError(Exception e){
        String refId = ErrorTrace.insertLog(e , PSID);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin with this reference id '+refId));     
    }
    
    
    Public class RRWrapper{
        Public VG_Policy_Schedule_Asset__c psa{get;set;}
        Public String Counter{get;set;}
        Public Decimal share {get; set;}
        Public Decimal totalfeeAmt {get; set;}
        Public String CoverageSelected{get;set;}
        Public String TerritorialLimitsSelected{get;set;}
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