public class VG_PolicyPaymentTaxController {
    Public ID PolicyId {get; set;} 
    Public Policy__c policy{get;set;}
    Public Policy_Payment__c polPay{get;set;}
    Public Policy_Tax__c polTax{get; set;}
    
    public Map<Id,Policy_Schedule__c> psMap{get;set;}
    public Map<Id,  PaymentFrequencyWrapper> ppwMap {get; set;}
    public Map<Id,  TaxWrapper> taxwMap {get; set;}
    public Map<String, List<PaymentFrequencyWrapper>> pfwMap {get; set;}
    public Map<Id, Decimal> pfwMap1{get; set;}
    public Map<Id, String> pfwMap2{get; set;}
    public Map<String, List<TaxWrapper>> twMap {get; set;}
    public Map<Id, String> twMap1{get; set;}
    public Map<Id, String> twMap2{get; set;}
    Public Map<String,  Policy_Payment__c> policyPaymentToBeInserted{get; set;}
    Public Map<String,  Policy_Tax__c> policyTaxToBeInserted{get; set;}
    
    Public List<PolicyPaymentWrapper> ppWrapperList {get; set;}
    Public List<PolicyTaxWrapper> taxWrapperList {get; set;}
    Public List<Policy_Payment__c> InsertedPPList{get;set;}
    Public List<VG_Payment_Frequency__c> InsertedPFList{get;set;}
    Public List<Policy_Tax__c> InsertedPolTaxList{get;set;}
    Public List<VG_Taxes__c> InsertedTaxList{get;set;}
    Public List<Policy_Schedule__c> psList {get;set;}
    
    Public List<SelectOption> psNameList{get;set;}
    Public List < SelectOption > taxTypeList{get;set;}
    Public List < SelectOption > taxJurisdictionList{get;set;}
    
    Public Integer PPcounter {get; set;}
    Public Integer Taxcounter {get; set;}
    
    Public String IndexCounterPP{get;set;}
    Public String Index{get;set;}
    Public String IndexT{get;set;}
    
    Public Decimal totalPaymentAmount{get;set;}
    
    Public Boolean showBtnpp{get; set;}
    
    Public VG_PolicyPaymentTaxController(){
        PolicyId =  ApexPages.currentPage().getParameters().get('id');
        policy=[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:policyId];
        psMap=new Map<Id,Policy_schedule__c>([select id,Name,Policy__r.CreatedDate,Limit__c,Attachment__c,Sum_Insured__c,Share__c,VG_Total_Layer_Premium__c,Product__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c from Policy_Schedule__c where Policy__c =: policy.id]);
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =: policy.id]);
        InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList]);
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Policy__c =: policy.id]);
        InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Tax_Jurisdiction__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        
        totalPaymentAmount = 0;
        PPcounter = 0;
        Taxcounter = 0;
        Index='0';
        IndexCounterPP = '0';
        IndexT = '0';
        showBtnpp = false;
        polPay = new Policy_Payment__c();
        polTax = new Policy_Tax__c();
        ppWrapperList = new List<PolicyPaymentWrapper>();
        taxWrapperList = new List<PolicyTaxWrapper>();
        pfwMap =  new Map<String, List<PaymentFrequencyWrapper>>();
        pfwMap1 =  new Map<Id, Decimal>();
        pfwMap2 =  new Map<Id, String>();
        twMap =  new Map<String, List<TaxWrapper>>();
        twMap1 =  new Map<Id, String>();
        twMap2 =  new Map<Id, String>();
        ppwMap =  new Map<Id,  PaymentFrequencyWrapper>();
        taxwMap =  new Map<Id,  TaxWrapper>();
        
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                if(pfwMap.containsKey(pf.Policy_Payment__r.Id)){
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.psSelected = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    List<PaymentFrequencyWrapper> tempPFList = pfwMap.get(pf.Policy_Payment__r.Id);
                    tempPFList.add(pfw);
                    pfwMap1.put(pf.Policy_Payment__r.Id,pf.Policy_Payment__r.VG_Policy_Payment_Amount__c);
                    pfwMap2.put(pf.Policy_Payment__r.Id,string.valueOf(pf.Policy_Payment__r.Due_Date__c));
                    pfwMap.put(pf.Policy_Payment__r.Id, tempPFList);
                }else{
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.psSelected = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    pfwMap1.put(pf.Policy_Payment__r.Id,pf.Policy_Payment__r.VG_Policy_Payment_Amount__c);
                    pfwMap2.put(pf.Policy_Payment__r.Id,string.valueOf(pf.Policy_Payment__r.Due_Date__c));
                    pfwMap.put(pf.Policy_Payment__r.Id,new List<PaymentFrequencyWrapper>{pfw});
                }
            }
        }
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    List<TaxWrapper> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(taxw);
                    twMap1.put(t.Policy_Tax__r.Id,t.Policy_Tax__r.Tax_Type__c);
                    twMap2.put(t.Policy_Tax__r.Id,t.VG_Tax_Jurisdiction__c);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                }else{
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    twMap1.put(t.Policy_Tax__r.Id,t.Policy_Tax__r.Tax_Type__c);
                    twMap2.put(t.Policy_Tax__r.Id,t.VG_Tax_Jurisdiction__c);
                    twMap.put(t.Policy_Tax__r.Id, new List<TaxWrapper>{taxw});
                }
            }
        }
    
        psNameList=new List<SelectOption>();
        psMap.values().sort();
        psNameList.add(new SelectOption('--None--','--None--'));
        for(Policy_Schedule__c ps: psMap.values()){
            psNameList.add(new SelectOption(ps.id,ps.Name));
        }
        taxTypeList =new List<SelectOption>();
        taxTypeList.add(new SelectOption('--None--','--None--'));
        for(String s: Label.Tax_Type_1.split(';')){
            taxTypeList.add(new SelectOption(s,s));
        }
        for(String s: Label.Tax_Type_2.split(';')){
            taxTypeList.add(new SelectOption(s,s));
        }
        
        taxJurisdictionList = new List < SelectOption >();
        taxJurisdictionList.add(new SelectOption('--None--','--None--'));                
         /*if(ps.RecordType.Name=='Imara'){
            for(String s : Label.Tax_Jurisdiction5.split(';')){
                taxJurisdictionList.add(new SelectOption(s,s));
            }
            for(String s : Label.Tax_Jurisdiction6.split(';')){
                taxJurisdictionList.add(new SelectOption(s,s));
            }
        }else{ */               
            for(String s : Label.Tax_Jurisdiction1.split(';')){
                taxJurisdictionList.add(new SelectOption(s,s));
            }
            for(String s : Label.Tax_Jurisdiction2.split(';')){
                taxJurisdictionList.add(new SelectOption(s,s));
            }
            for(String s : Label.Tax_Jurisdiction3.split(';')){
                taxJurisdictionList.add(new SelectOption(s,s));
            } 
        //}
    }
    
    public PageReference addPolicyPayment(){
        PolicyPaymentWrapper ppW= new PolicyPaymentWrapper();
        ppw.Counter = string.valueOf(PPcounter);
        ppw.pp  =  polPay;
        ppw.policyPaymenyAmount = 0;
        ppw.showBtnpf = false;
        ppw.pfWrapperList.clear();
        ppWrapperList.add(ppW);   
        PPcounter++;
        showBtnpp = false;
        return null;
    }
    
    public PageReference addPayment(){
        PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
        pfw.psSelected = '';
        Integer counter = 0;
        pfw.Counter = ppWrapperList[integer.valueOf(Index)].pfWrapperList.size() > 0 ? String.valueOf(ppWrapperList[integer.valueOf(Index)].pfWrapperList.size()):'0';
        pfw.paymentAmount = 0;
        pfw.policyPaymentName = Index;
        ppWrapperList[integer.valueOf(Index)].pfWrapperList.add(pfw);
        return null;
    }
    
    public void calc(){
        try{
            PaymentFrequencyWrapper pfw = ppWrapperList[integer.valueOf(Index)].pfWrapperList[integer.valueOf(IndexCounterPP)];
            for(Policy_schedule__c ps: psMap.values()){
                if(ps.Id == ppWrapperList[integer.valueOf(Index)].pfWrapperList[integer.valueOf(IndexCounterPP)].psSelected){
                    ppWrapperList[integer.valueOf(Index)].pfWrapperList[integer.valueOf(IndexCounterPP)].GWP = ps.Gross_Written_Premium__c*(ppWrapperList[integer.valueOf(Index)].policyPaymenyAmount/100);
                }
            }
        }catch(ListException e){
            System.debug('List exception fired::'+e.getLineNumber()+'::'+e.getMessage());
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'An error occurred please contact admin'));   
        }
    }
    public void polCalc(){
        if(ppWrapperList[integer.valueOf(Index)].policyPaymenyAmount > 100){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Cant add new Payment Frequency because sum of Payment (%) reached 100 ..')); 
            ppWrapperList[integer.valueOf(Index)].showBtnpf = true;
            showBtnpp = true;
        }else{
            ppWrapperList[integer.valueOf(Index)].showBtnpf = false;
            showBtnpp = false;
        }           
    }
    public PageReference addPolicyTax(){
        PolicyTaxWrapper taxw= new PolicyTaxWrapper();
        taxw.Counter = string.valueOf(Taxcounter);
        taxw.pt = polTax;
        taxw.taxSelected = '';
        taxw.taxWList.clear();
        taxWrapperList.add(taxw); 
        system.debug('tax::'+taxWrapperList);
        Taxcounter++;
        return null;
    }
    public PageReference addTax(){
        TaxWrapper taxw = new TaxWrapper();
        taxw.psSelected = '';
        taxw.taxAmount = 0;
        taxw.policyTaxName = IndexT;
        taxWrapperList[integer.valueOf(IndexT)].taxWList.add(taxw);
        system.debug('taxWrapperList::'+ taxWrapperList);
        return null;
    }
    
    public PageReference finish(){
        policyPaymentToBeInserted = new Map<String,  Policy_Payment__c>();
        policyTaxToBeInserted = new Map<String,  Policy_Tax__c>();
        List<VG_Payment_Frequency__c> pfToBeInserted = new List<VG_Payment_Frequency__c>();
        List<VG_Taxes__c > toInserttaxList = new List<VG_Taxes__c >();
        List<Integer> psNumList=new List<Integer>();
        String Name;
        
        if(InsertedPPList.size() > 0){
            String bsname;
            for(Policy_Payment__c ppName: InsertedPPList){
                bsname = ppName.Name;
                if(bsname.contains('/PP/'))
                    psNumList.add(Integer.valueOf(bsname.split('/PP/')[1]));
                //else if(bsname.contains('/MTA/'))
                //   psNumList.add(Integer.valueOf(bsname.split('/MTA/')[1]));
            }
            psNumList.sort();
            Name  =  policy.Name+'/PP/'+((psNumList[psNumList.size()-1])+1); 
        }else{
            Name  =  policy.Name+'/PP/0';
        }
        for(PolicyPaymentWrapper ppw: ppWrapperList){
            for(PaymentFrequencyWrapper pfw: ppw.pfWrapperList){
                if(ppwMap.containsKey(pfw.psSelected)){
                    ppwMap.put(pfw.psSelected,pfw);
                }else{
                    ppwMap.put(pfw.psSelected, pfw);
                }
            }
        }
        
        Integer ppcount=1;
        for(PolicyPaymentWrapper ppw: ppWrapperList){
            ppw.pp = new Policy_Payment__c();
            ppw.pp.Name = Name;
            ppw.pp.Policy__c = policy.id;
            ppw.pp.Due_Date__c = ppw.dueDate;
            ppw.pp.VG_Policy_Payment_Amount__c = ppw.policyPaymenyAmount;
            policyPaymentToBeInserted.put(ppw.Counter,ppw.pp);
            ppcount++;
        }
        if(policyPaymentToBeInserted.size() > 0){
            upsert policyPaymentToBeInserted.values();
        }
        Integer pfc = 0;
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyPaymentWrapper ppw: ppWrapperList){
                for(PaymentFrequencyWrapper pfw: ppw.pfWrapperList){
                    if(ppwMap.containsKey(pfw.psSelected)){
                        pfw.pf.VG_Policy_Schedule__c = pfw.psSelected;
                        pfw.pf.VG_Due_Date__c = ppw.pp.Due_Date__c;
                        pfw.pf.VG_GWP_This_Time__c = pfw.GWP;
                        pfw.pf.VG_Payment_Percent__c = ppw.policyPaymenyAmount;
                        pfw.pf.Name = ps.Name+'/PF/'+pfc;
                        pfw.pf.Policy_Payment__c = policyPaymentToBeInserted.get(pfw.policyPaymentName).id;
                        pfToBeInserted.add(pfw.pf);
                        pfc++;
                    }
                }
            }
            break;
        }
        if(!pfToBeInserted.isEmpty()){
            upsert pfToBeInserted;
        }
        
        
        for(PolicyTaxWrapper ptw: taxWrapperList){
            for(TaxWrapper taxw: ptw.taxWList){
                if(taxwMap.containsKey(taxw.psSelected)){
                    taxwMap.put(taxw.psSelected,taxw);
                }else{
                    taxwMap.put(taxw.psSelected,taxw);
                }
            }
        }
        
        for(PolicyTaxWrapper polTaxW: taxWrapperList){
            polTaxW.pt = new Policy_Tax__c();
            polTaxW.pt.Name = polTaxW.taxSelected;
            polTaxW.pt.Tax_Type__c = polTaxW.taxSelected;
            polTaxW.pt.Policy__c = policy.id;
            policyTaxToBeInserted.put(polTaxW.Counter, polTaxW.pt);
        }
        if(policyTaxToBeInserted.size() > 0){
            upsert policyTaxToBeInserted.values();
        }
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyTaxWrapper ptaxw: taxWrapperList){
                for(TaxWrapper tw: ptaxw.taxWList){
                    if(taxwMap.containsKey(tw.psSelected)){
                        tw.tax.VG_Policy_Schedule__c = tw.psSelected;
                        tw.tax.VG_Tax_Amount__c = tw.taxAmount;
                        tw.tax.Name = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Type__c = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Jurisdiction__c  = ptaxw.taxJurisdictionListSelected;
                        tw.tax.Policy_Tax__c = policyTaxToBeInserted.get(tw.policyTaxName).id;
                        toInserttaxList.add(tw.tax);
                    }
                }
            }
            break;
        }
        if(!toInserttaxList.isEmpty()){
            upsert toInserttaxList;
        }
        return new PageReference('/'+policyId);
    }
    
    public PageReference cancel(){
        return new PageReference('/'+policyId);
    }
    
    Public Class PolicyPaymentWrapper{
        Public List<PaymentFrequencyWrapper> pfWrapperList{get;set;}
        Public Policy_Payment__c pp{get;set;}
        Public Boolean showBtnpf{get;set;}
        Public String Counter{get;set;}
        Public Date dueDate{get;set;}
        Public Decimal policyPaymenyAmount{get;set;}
        public PolicyPaymentWrapper(){
            pfWrapperList = new List<PaymentFrequencyWrapper>();
            pp = new Policy_Payment__c();
            showBtnpf = false;
        }
    }
    
    Public Class PaymentFrequencyWrapper{
        Public String psSelected{get;set;}
        Public String Counter{get;set;}
        Public Decimal paymentAmount{get;set;}
        Public Decimal GWP{get;set;}
        Public Decimal policyPaymentAmount{get;set;}
        Public VG_Payment_Frequency__c pf{get;set;}
        Public String policyPaymentName{get;set;}
        public PaymentFrequencyWrapper(){
            pf = new VG_Payment_Frequency__c();
        }
    }
    
    Public Class PolicyTaxWrapper{
        Public List<TaxWrapper> taxWList{get;set;}
        Public Policy_Tax__c pt{get;set;}
        Public String Counter{get;set;}
        Public String taxSelected{get; set;}
        Public String taxJurisdictionListSelected{get;set;}
        public PolicyTaxWrapper(){
            taxWList = new List<TaxWrapper>();
            pt = new Policy_Tax__c();
        }
    }
    Public Class TaxWrapper{
        Public String psSelected{get;set;}
        Public Decimal taxAmount{get;set;}
        Public String taxtype{get;set;}
        Public VG_Taxes__c  tax{get;set;}
        Public String policyTaxName{get;set;}
        public TaxWrapper(){
            tax = new VG_Taxes__c();
        }
    }
}