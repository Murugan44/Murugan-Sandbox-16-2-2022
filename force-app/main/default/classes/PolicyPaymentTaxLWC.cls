/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 10-02-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PolicyPaymentTaxLWC {
    Public ID PolicyId {get; set;} 
    
    Public static Policy_Payment__c polPay = new Policy_Payment__c();
    Public static Policy__c policy; 
    Public static Map<String,  Policy_Payment__c>policyPaymentToBeInserted = new Map<String,  Policy_Payment__c>();
    Public static Map<String,  Policy_Tax__c> policyTaxToBeInserted = new Map<String,  Policy_Tax__c>();    
    
    Public static Map<Id,Policy_Schedule__c> psMap = new Map<Id,Policy_Schedule__c>();
    Public static Map<String, List<PaymentFrequencyWrapper>> pfwMap =  new Map<String, List<PaymentFrequencyWrapper>>();
    Public static Map<Id,  PaymentFrequencyWrapper> ppwMap =  new Map<Id,  PaymentFrequencyWrapper>();
    Public static Map<String, List<TaxWrapper>> twMap =  new Map<String, List<TaxWrapper>>();
    Public static Map<Id,  TaxWrapper> taxwMap =  new Map<Id,  TaxWrapper>();
    
    Public static List<PolicyPaymentWrapper> ppWrapperList = new List<PolicyPaymentWrapper>(); 
    Public static List<PolicyTaxWrapper> taxWrapperList = new List<PolicyTaxWrapper>();
    Public static List<Policy_Payment__c> InsertedPPList = new List<Policy_Payment__c>();
    Public static List<Policy_Tax__c>InsertedPolTaxList = new List<Policy_Tax__c>();
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<PaymentFrequencyWrapper>> getPP(Id policyId){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        system.debug('InsertedPFList::'+InsertedPFList);
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                if(pfwMap.containsKey(pf.Policy_Payment__r.Id)){
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    List<PaymentFrequencyWrapper> tempPFList = pfwMap.get(pf.Policy_Payment__r.Id);
                    tempPFList.add(pfw);
                    pfwMap.put(pf.Policy_Payment__r.Id,tempPFList);
                }else{
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfwMap.put(pf.Policy_Payment__r.Id,new List<PaymentFrequencyWrapper>{pfw});
                }
            }
        }
        system.debug('pfwMap::'+pfwMap);
        return pfwMap;
    }
    
    @AuraEnabled 
    public static Map<String, List<PaymentFrequencyWrapper>> editPayments(Id paymentId){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,Policy_Payment_Amount__c  FROM Policy_Payment__c where Id =:paymentId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        system.debug('InsertedPFList::'+InsertedPFList);
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                if(pfwMap.containsKey(pf.Policy_Payment__r.Id)){
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    List<PaymentFrequencyWrapper> tempPFList = pfwMap.get(pf.Policy_Payment__r.Id);
                    tempPFList.add(pfw);
                    pfwMap.put(pf.Policy_Payment__r.Id,tempPFList);
                }else{
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfwMap.put(pf.Policy_Payment__r.Id,new List<PaymentFrequencyWrapper>{pfw});
                }
            }
        }
        system.debug('pfwMap::'+pfwMap);
        return pfwMap;
    }
    
    @AuraEnabled
    public static String updatePaymentValues(Id paymentId, Date updateDueDate, Decimal updateAmount){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,Policy_Payment_Amount__c,Due_Date__c  FROM Policy_Payment__c where Id =:paymentId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Policy_Schedule__r.Gross_Written_Premium__c,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        List<VG_Payment_Frequency__c> updatePFList = new List<VG_Payment_Frequency__c>();
        List<Policy_Payment__c> updatePPList = new List<Policy_Payment__c>();
        
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                pf.VG_Due_Date__c = updateDueDate;
                pf.Policy_Payment__r.Policy_Payment_Amount__c = updateAmount;
                pf.Policy_Payment__r.Due_Date__c = updateDueDate;
                pf.VG_GWP_This_Time__c = pf.VG_Policy_Schedule__r.Gross_Written_Premium__c*(updateAmount/100);
                pf.VG_Payment_Percent__c = updateAmount;
                updatePFList.add(pf);
            }
        }
        if(InsertedPPList.size() > 0){
            for(Policy_Payment__c pp:InsertedPPList){
                pp.Policy_Payment_Amount__c = updateAmount;
                pp.Due_Date__c = updateDueDate;
                updatePPList.add(pp);
            }
        }
        
        if(!updatePPList.isEmpty())
            update updatePPList;
        
        if(!updatePFList.isEmpty())
            update updatePFList;
        
        return null;
    }
    
    
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<TaxWrapper>> getPolicyTax(Id policyId){
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Policy__c =: policyId]);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    List<TaxWrapper> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(taxw);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                }else{
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    twMap.put(t.Policy_Tax__r.Id, new List<TaxWrapper>{taxw});
                }
            }
        }
        return twMap;
    }
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<TaxWrapper>> editTax(Id taxId){
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Id =: taxId]);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        integer Taxcounter = 0;
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxCounter = string.valueOf(Taxcounter);
                    List<TaxWrapper> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(taxw);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                    Taxcounter++;
                }else{
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = t.VG_Tax_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxCounter = string.valueOf(Taxcounter);
                    twMap.put(t.Policy_Tax__r.Id, new List<TaxWrapper>{taxw});
                    Taxcounter++;
                }
            }
        }
        return twMap;
    }
    @AuraEnabled
    public static String updateTax(Id taxId, List<Object> taxlist){
        List<VG_Taxes__c> updateTaxList = new List<VG_Taxes__c>();
        List<Policy_Tax__c> updatePTList = new List<Policy_Tax__c>();
        
        for(Object p: taxlist){
            PolicyTaxWrapper ptaxw = (PolicyTaxWrapper)JSON.deserialize(JSON.serialize(p), PolicyTaxWrapper.class);
            taxWrapperList.add(ptaxw);
        }
        system.debug('taxWrapperList::'+taxWrapperList);
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Id =: taxId]);
        system.debug('InsertedPolTaxList::'+InsertedPolTaxList);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        system.debug('InsertedTaxList::'+InsertedTaxList);
        
        if(!InsertedTaxList.isEmpty()){
            for(PolicyTaxWrapper polTaxW: taxWrapperList){
                for(VG_Taxes__c t: InsertedTaxList){
                    for(TaxWrapper tw: polTaxW.taxWList){
                        if(tw.psSelected == t.Id){
                            system.debug('t::'+t.Id);
                            t.Name = polTaxW.taxSelected;
                            t.VG_Tax_Jurisdiction__c = polTaxW.taxJurisdictionListSelected;
                            t.VG_Tax_Administered_By__c = polTaxW.taxAdministeredBySelected;
                            t.VG_Tax_Paid_By__c = polTaxW.taxPaidBySelected;
                            t.VG_Tax_Type__c = polTaxW.taxSelected;
                            t.Policy_Tax__r.Tax_Type__c = polTaxW.taxSelected;
                            t.VG_Tax_Amount__c = tw.taxAmount;
                            updateTaxList.add(t);
                        }   
                    }
                }
                
            }
        }
        if(!updateTaxList.isEmpty()){
            update updateTaxList;
        }
        
        if(!InsertedPolTaxList.isEmpty()){
            for(PolicyTaxWrapper polTaxW: taxWrapperList){
                for(Policy_Tax__c pt: InsertedPolTaxList){
                    pt.Tax_Type__c = polTaxW.taxSelected;
                    pt.Name = polTaxW.taxSelected;
                    updatePTList.add(pt);
                }
            }
        }
        
        if(!updatePTList.isEmpty()){
            update updatePTList;
        }
        
        system.debug('updateTaxList::'+updateTaxList);
        return null;
    }
    
    @AuraEnabled(cacheable=true)   
    public static Map<Id,Policy_Schedule__c> getPsList(Id policyId){
        Map<Id,Policy_schedule__c> psMap=new Map<Id,Policy_schedule__c>([select id,Name,Policy__r.CreatedDate,Limit__c,Attachment__c,Sum_Insured__c,Share__c,VG_Total_Layer_Premium__c,Product__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c from Policy_Schedule__c where Policy__c =: policyId]);
        system.debug('psMap::'+psMap);
        return psMap;
    }
    @AuraEnabled   
    public static Decimal getcalcGWP(Id psId, Decimal polPayAmt){
        system.debug('psId::'+psId+'::'+polPayAmt);
        Policy_schedule__c ps = [select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Id=:psId Limit 1];
        system.debug('ps::'+ps);
        Decimal gwp = ps.Gross_Written_Premium__c * (polPayAmt/100);
        system.debug('gwp::'+gwp);
        return gwp;
    }
    
    @AuraEnabled   
    public static String ppWrapper(List<Object> ppw, Id policyId, List<Object> ptw){
        system.debug('ppw::'+ppw);
        system.debug('ptw::'+ptw);
        for(Object p: ppw){
            PolicyPaymentWrapper pp = (PolicyPaymentWrapper)JSON.deserialize(JSON.serialize(p), PolicyPaymentWrapper.class);
            ppWrapperList.add(pp);
        }
        system.debug('ppWrapperList out::'+ppWrapperList);
        for(Object pt: ptw){
            PolicyTaxWrapper ptaxw = (PolicyTaxWrapper)JSON.deserialize(JSON.serialize(pt), PolicyTaxWrapper.class);
            taxWrapperList.add(ptaxw);
        }
        system.debug('taxWrapperList out::'+taxWrapperList);
        
        List<VG_Payment_Frequency__c> pfToBeInserted = new List<VG_Payment_Frequency__c>();
        List<VG_Taxes__c > toInserttaxList = new List<VG_Taxes__c >();
        policy = [Select Id,Name from Policy__c where Id=:policyId];
        psMap=new Map<Id,Policy_schedule__c>([select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Policy__c=:policyId]);
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
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
        
        
        for(PolicyPaymentWrapper pp: ppWrapperList){
            for(PaymentFrequencyWrapper pfw: pp.pfList){
                if(ppwMap.containsKey(pfw.ps)){
                    ppwMap.put(pfw.ps,pfw);
                }else{
                    ppwMap.put(pfw.ps, pfw);
                }
            }
        }
        
        Integer ppcount=1;
        for(PolicyPaymentWrapper ppwrapper: ppWrapperList){
            ppwrapper.pp = new Policy_Payment__c();
            ppwrapper.pp.Name = Name;
            ppwrapper.pp.Policy__c = policyId;
            ppwrapper.pp.Due_Date__c = ppwrapper.dueDate;
            ppwrapper.pp.Policy_Payment_Amount__c = ppwrapper.policyPaymenyAmount;
            policyPaymentToBeInserted.put(ppwrapper.counter,ppwrapper.pp);
            ppcount++;
        }
        if(policyPaymentToBeInserted.size() > 0){
            system.debug('policyPaymentToBeInserted::'+policyPaymentToBeInserted);
            upsert policyPaymentToBeInserted.values();
        }
        Integer pfc = 0;
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyPaymentWrapper ppwW: ppWrapperList){
                for(PaymentFrequencyWrapper pfw: ppwW.pfList){
                    if(ppwMap.containsKey(pfw.ps)){
                        pfw.pf = new VG_Payment_Frequency__c();
                        pfw.pf.VG_Policy_Schedule__c = pfw.ps;
                        pfw.pf.VG_Due_Date__c = ppwW.pp.Due_Date__c;
                        pfw.pf.VG_GWP_This_Time__c = pfw.gwp;
                        pfw.pf.VG_Payment_Percent__c = ppwW.policyPaymenyAmount;
                        pfw.pf.Name = ps.Name+'/PF/'+pfc;
                        pfw.pf.Policy_Payment__c = policyPaymentToBeInserted.get(pfw.ppcounter).id;
                        pfToBeInserted.add(pfw.pf);
                        pfc++;
                    }
                }
            }
            break;
        }
        if(!pfToBeInserted.isEmpty()){
            upsert pfToBeInserted;
            system.debug('pfToBeInserted::'+pfToBeInserted);
        }
        
        for(PolicyTaxWrapper poltaxw: taxWrapperList){
            for(TaxWrapper taxw: poltaxw.taxWList){
                if(taxwMap.containsKey(taxw.psSelected)){
                    taxwMap.put(taxw.psSelected,taxw);
                }else{
                    taxwMap.put(taxw.psSelected,taxw);
                }
            }
        }
        system.debug('taxwMap::'+taxwMap);
        
        for(PolicyTaxWrapper polTaxW: taxWrapperList){
            polTaxW.pt = new Policy_Tax__c();
            polTaxW.pt.Name = polTaxW.taxSelected;
            polTaxW.pt.Tax_Type__c = polTaxW.taxSelected;
            polTaxW.pt.Policy__c = policyId;
            policyTaxToBeInserted.put(polTaxW.Counter, polTaxW.pt);
        }
        if(policyTaxToBeInserted.size() > 0){
            upsert policyTaxToBeInserted.values();
            system.debug('policyTaxToBeInserted::'+policyTaxToBeInserted);
        }
        
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyTaxWrapper ptaxw: taxWrapperList){
                for(TaxWrapper tw: ptaxw.taxWList){
                    if(taxwMap.containsKey(tw.psSelected)){
                        tw.tax = new VG_Taxes__c();
                        tw.tax.VG_Policy_Schedule__c = tw.psSelected;
                        tw.tax.VG_Tax_Amount__c = tw.taxAmount;
                        tw.tax.Name = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Type__c = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Jurisdiction__c  = ptaxw.taxJurisdictionListSelected;
                        tw.tax.VG_Tax_Paid_By__c  = ptaxw.taxPaidBySelected;
                        tw.tax.VG_Tax_Administered_By__c  = ptaxw.taxAdministeredBySelected;
                        tw.tax.Policy_Tax__c = policyTaxToBeInserted.get(tw.ptcounter).id;
                        toInserttaxList.add(tw.tax);
                    }
                }
            }
            break;
        }
        if(!toInserttaxList.isEmpty()){
            upsert toInserttaxList;
            system.debug('toInserttaxList::'+toInserttaxList);
        }
        
        return null;
    }
    
    public PageReference cancel(){
        PolicyId =  ApexPages.currentPage().getParameters().get('id');
        return new PageReference('/'+policyId);
    }
    
    Public Class PolicyPaymentWrapper{
        @AuraEnabled
        Public List<PaymentFrequencyWrapper> pfList{get;set;}
        @AuraEnabled
        Public Policy_Payment__c pp{get;set;}
        @AuraEnabled
        Public Boolean btnpf {get;set;}
        @AuraEnabled
        Public String counter{get;set;}
        @AuraEnabled
        Public Date dueDate{get;set;}
        @AuraEnabled
        Public Decimal policyPaymenyAmount{get;set;}
        
        public PolicyPaymentWrapper(){
            pfList = new List<PaymentFrequencyWrapper>();
            pp = new Policy_Payment__c();
            btnpf  = false;
        }
    }
    
    Public Class PaymentFrequencyWrapper{
        @AuraEnabled
        Public String ps{get;set;}
        @AuraEnabled
        Public String ppcounter{get;set;}
        @AuraEnabled
        Public String pfCounter{get;set;}
        @AuraEnabled
        Public Decimal paymentAmount{get;set;}
        @AuraEnabled
        Public Decimal gwp{get;set;}
        @AuraEnabled
        Public Decimal policyPaymentAmount{get;set;}
        @AuraEnabled
        Public VG_Payment_Frequency__c pf{get;set;}
        @AuraEnabled
        Public Date dueDate{get;set;}
        //@AuraEnabled
        //Public String policyPaymentName{get;set;}
        
        public PaymentFrequencyWrapper(){
            pf = new VG_Payment_Frequency__c();
        }
    }
    
    Public Class PolicyTaxWrapper{
        @AuraEnabled
        Public List<TaxWrapper> taxWList{get;set;}
        @AuraEnabled
        Public Policy_Tax__c pt{get;set;}
        @AuraEnabled
        Public String Counter{get;set;}
        @AuraEnabled
        Public String taxSelected{get; set;}
        @AuraEnabled
        Public String taxJurisdictionListSelected{get;set;}
        @AuraEnabled
        Public String taxPaidBySelected{get; set;}
        @AuraEnabled
        Public String taxAdministeredBySelected{get;set;}
        @AuraEnabled
        Public VG_Taxes__c  tax{get;set;}
        
        public PolicyTaxWrapper(){
            taxWList = new List<TaxWrapper>();
            pt = new Policy_Tax__c();
        }
    }
    Public Class TaxWrapper{
        @AuraEnabled
        Public String psSelected{get;set;}
        @AuraEnabled
        Public Decimal taxAmount{get;set;}
        @AuraEnabled
        Public String ptcounter{get;set;}
        @AuraEnabled
        Public String taxCounter{get;set;}
        @AuraEnabled
        Public String taxtype{get;set;}
        @AuraEnabled
        Public String taxJurisdiction{get;set;}
        @AuraEnabled
        Public String taxPaidBy{get; set;}
        @AuraEnabled
        Public String taxAdministeredBy{get;set;}
        @AuraEnabled
        Public VG_Taxes__c  tax{get;set;}
        @AuraEnabled
        Public String policyTaxName{get;set;}
        public TaxWrapper(){
            tax = new VG_Taxes__c();
        }
    }
}