/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 10-02-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class VG_PolicyPaymentTaxLWC_Controller {
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
    Public static List<UpdatePaymentWrapper> UpdatePaymentWrapperList = new List<UpdatePaymentWrapper>();
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<PaymentFrequencyWrapper>> getPP(Id policyId){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Debt_Details__c,VG_Broker__r.Name,VG_Comment__c,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        system.debug('InsertedPFList::'+InsertedPFList);
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                if(pfwMap.containsKey(pf.Policy_Payment__r.Id)){
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfw.comment = pf.VG_Comment__c;
                    pfw.broker = pf.VG_Broker__r.Name;
                    pfw.debtDetails = pf.VG_Debt_Details__c;
                    pfw.pfId = pf.Id;
                    List<PaymentFrequencyWrapper> tempPFList = pfwMap.get(pf.Policy_Payment__r.Id);
                    tempPFList.add(pfw);
                    pfwMap.put(pf.Policy_Payment__r.Id,tempPFList);
                }else{
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfw.comment = pf.VG_Comment__c;
                    pfw.broker = pf.VG_Broker__r.Name;
                    pfw.debtDetails = pf.VG_Debt_Details__c;
                    pfw.pfId = pf.Id;
                    pfwMap.put(pf.Policy_Payment__r.Id,new List<PaymentFrequencyWrapper>{pfw});
                }
            }
        }
        system.debug('pfwMap::'+pfwMap);
        return pfwMap;
    }
    
    @AuraEnabled 
    public static Map<String, List<PaymentFrequencyWrapper>> editPayments(Id paymentId){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Id =:paymentId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Debt_Details__c,VG_Broker__c,VG_Comment__c,VG_Broker__r.Name,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        system.debug('InsertedPFList::'+InsertedPFList);
        if(InsertedPFList.size() > 0){
            for(VG_Payment_Frequency__c pf:InsertedPFList){
                if(pfwMap.containsKey(pf.Policy_Payment__r.Id)){
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfw.comment = pf.VG_Comment__c;
                    pfw.broker = pf.VG_Broker__c;
                    pfw.brokerName = pf.VG_Broker__r.Name;
                    pfw.debtDetails = pf.VG_Debt_Details__c;
                    pfw.pfId = pf.Id;
                    List<PaymentFrequencyWrapper> tempPFList = pfwMap.get(pf.Policy_Payment__r.Id);
                    tempPFList.add(pfw);
                    pfwMap.put(pf.Policy_Payment__r.Id,tempPFList);
                }else{
                    PaymentFrequencyWrapper pfw = new PaymentFrequencyWrapper();
                    pfw.pf = pf;
                    pfw.ps = pf.VG_Policy_Schedule__r.Name;
                    pfw.paymentAmount = pf.VG_GWP_This_Time__c;
                    pfw.policyPaymentAmount = pf.Policy_Payment__r.VG_Policy_Payment_Amount__c;
                    pfw.dueDate = pf.Policy_Payment__r.Due_Date__c;
                    pfw.comment = pf.VG_Comment__c;
                    pfw.broker = pf.VG_Broker__c;
                    pfw.brokerName = pf.VG_Broker__r.Name;
                    pfw.debtDetails = pf.VG_Debt_Details__c;
                    pfw.pfId = pf.Id;
                    pfwMap.put(pf.Policy_Payment__r.Id,new List<PaymentFrequencyWrapper>{pfw});
                }
            }
        }
        system.debug('pfwMap::'+pfwMap);
        return pfwMap;
    }
    
    @AuraEnabled
   // public static String updatePaymentValues(Id paymentId, Date updateDueDate, Decimal updateAmount, String updateComment, String updateBroker){
    public static String updatePaymentValues(Id paymentId, List<Object> updatePaymentValuesList){
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c,Due_Date__c  FROM Policy_Payment__c where Id =:paymentId]);
        List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Debt_Details__c,VG_Policy_Schedule__r.Gross_Written_Premium__c,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
        List<VG_Payment_Frequency__c> updatePFList = new List<VG_Payment_Frequency__c>();
        List<Policy_Payment__c> updatePPList = new List<Policy_Payment__c>();
        
        for(Object p: updatePaymentValuesList){
            UpdatePaymentWrapper payw = (UpdatePaymentWrapper)JSON.deserialize(JSON.serialize(p), UpdatePaymentWrapper.class);
            UpdatePaymentWrapperList.add(payw);
        }
        Decimal totalgwp;
        if(InsertedPFList.size() > 0){
            for(UpdatePaymentWrapper payW: UpdatePaymentWrapperList){
                for(VG_Payment_Frequency__c pf:InsertedPFList){
                    pf.VG_Due_Date__c = payW.dueDate;
                    pf.Policy_Payment__r.VG_Policy_Payment_Amount__c = payW.policyPaymenyAmount;
                    pf.Policy_Payment__r.Due_Date__c = payW.dueDate;
                    totalgwp = pf.VG_Policy_Schedule__r.Gross_Written_Premium__c*(payW.policyPaymenyAmount/100);
                    pf.VG_GWP_This_Time__c = totalgwp.setScale(2);
                    pf.VG_Payment_Percent__c = payW.policyPaymenyAmount;
                    pf.VG_Comment__c = payW.comment;
                    pf.VG_Broker__c = payW.broker;
                    pf.VG_Debt_Details__c = payW.debtDetails;
                    updatePFList.add(pf);
                }
            }
        }
        if(InsertedPPList.size() > 0){
             for(UpdatePaymentWrapper payW: UpdatePaymentWrapperList){
                 for(Policy_Payment__c pp:InsertedPPList){
                     pp.VG_Policy_Payment_Amount__c = payW.policyPaymenyAmount;
                     pp.Due_Date__c = payW.dueDate;
                     updatePPList.add(pp);
                 }
             }
        }
        
        if(!updatePPList.isEmpty())
            Utilities.SkipMethods('Policy Payment Tax');
            update updatePPList;
        
        if(!updatePFList.isEmpty())
            update updatePFList;
        
        Utilities.clearMethods();
        return null;
    }
    
    
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<TaxWrapper>> getPolicyTax(Id policyId){
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Policy__c =: policyId]);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Taxable_Amount__c,VG_Tax_Percent__c,VG_Override__c ,VG_Comment__c ,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = String.valueOf(t.VG_Tax_Amount__c);
                    taxw.taxableAmount = t.VG_Taxable_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxIncluded = t.VG_Override__c;
                    taxw.comment = t.VG_Comment__c;
                    taxw.taxPercent = string.valueOf(t.VG_Tax_Percent__c);
                    List<TaxWrapper> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(taxw);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                }else{
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = String.valueOf(t.VG_Tax_Amount__c);
                    taxw.taxableAmount = t.VG_Taxable_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxIncluded = t.VG_Override__c;
                    taxw.taxPercent = string.valueOf(t.VG_Tax_Percent__c);
                    taxw.comment = t.VG_Comment__c;
                    twMap.put(t.Policy_Tax__r.Id, new List<TaxWrapper>{taxw});
                }
            }
        }
        return twMap;
    }
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<TaxWrapper>> editTax(Id taxId){
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Id =: taxId]);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Tax_Percent__c,VG_Taxable_Amount__c,VG_Override__c,VG_Comment__c,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        integer Taxcounter = 0;
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = String.valueOf(t.VG_Tax_Amount__c);
                    taxw.taxableAmount = t.VG_Taxable_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxIncluded = t.VG_Override__c;
                    taxw.comment = t.VG_Comment__c;
                    taxw.taxId = t.Id;
                    taxw.taxPercent = string.valueOf(t.VG_Tax_Percent__c);
                    taxw.taxCounter = string.valueOf(Taxcounter);
                    List<TaxWrapper> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(taxw);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                    Taxcounter++;
                }else{
                    TaxWrapper taxw = new TaxWrapper();
                    taxw.tax = t;
                    taxw.psSelected = t.VG_Policy_Schedule__r.Name;
                    taxw.taxAmount = String.valueOf(t.VG_Tax_Amount__c);
                    taxw.taxableAmount = t.VG_Taxable_Amount__c;
                    taxw.taxtype = t.Policy_Tax__r.Tax_Type__c;
                    taxw.taxJurisdiction = t.VG_Tax_Jurisdiction__c;
                    taxw.taxAdministeredBy = t.VG_Tax_Administered_By__c;
                    taxw.taxPaidBy =   t.VG_Tax_Paid_By__c;
                    taxw.taxIncluded = t.VG_Override__c;
                    taxw.comment = t.VG_Comment__c;
                    taxw.taxId = t.Id;
                    taxw.taxPercent = string.valueOf(t.VG_Tax_Percent__c);
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
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Override__c,VG_Taxable_Amount__c,VG_Tax_Percent__c,VG_Comment__c,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        system.debug('InsertedTaxList::'+InsertedTaxList);
        
        if(!InsertedTaxList.isEmpty()){
            for(PolicyTaxWrapper polTaxW: taxWrapperList){
                for(VG_Taxes__c t: InsertedTaxList){
                    for(TaxWrapper tw: polTaxW.taxWList){
                        if(tw.taxId == t.Id){
                            system.debug('t::'+t.Id);
                            t.Name = polTaxW.taxSelected;
                            t.VG_Tax_Jurisdiction__c = polTaxW.taxJurisdictionListSelected;
                            t.VG_Tax_Administered_By__c = polTaxW.taxAdministeredBySelected;
                            t.VG_Tax_Paid_By__c = polTaxW.taxPaidBySelected;
                            t.VG_Tax_Type__c = polTaxW.taxSelected;
                            t.Policy_Tax__r.Tax_Type__c = polTaxW.taxSelected;
                            t.VG_Taxable_Amount__c = tw.taxableAmount;
                            t.VG_Tax_Amount__c = tw.taxableAmount*(Decimal.valueOf(polTaxW.taxPercent)/100);
                            t.VG_Comment__c = polTaxW.comment;
                            if(polTaxW.taxPercent !='')
                            	t.VG_Tax_Percent__c = Decimal.valueOf(polTaxW.taxPercent);
                            t.VG_Override__c = polTaxW.taxIncluded;
                            updateTaxList.add(t);
                        }   
                    }
                }
                
            }
        }
        if(!updateTaxList.isEmpty()){
            Utilities.SkipMethods('Policy Payment Tax');
            update updateTaxList;
        }
        Utilities.clearMethods();
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
             Utilities.SkipMethods('Policy Payment Tax');
            update updatePTList;
        }
        
        system.debug('updateTaxList::'+updateTaxList);
        Utilities.clearMethods();
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
        return gwp.setScale(2);
    }
    
    @AuraEnabled   
    public static Decimal getGWPCalc(String psId,  Decimal amt){
        Policy_schedule__c ps = [select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Id=:psId Limit 1];
        system.debug('ps::'+ps);
        system.debug('amt::'+amt);
        Decimal gwp = ps.Gross_Written_Premium__c* (amt/100);
        system.debug('gwp::'+gwp);
        return gwp.setScale(2);
    }
    
    @AuraEnabled   
    public static Boolean getCheckValidationPS(String psId,  Decimal gwp){
        Policy_schedule__c ps = [select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Id=:psId Limit 1];
        List<VG_Payment_Frequency__c> pfList = new List<VG_Payment_Frequency__c>([SELECT Id, Name, VG_GWP_This_Time__c, VG_Policy_Schedule__c FROM VG_Payment_Frequency__c Where VG_Policy_Schedule__c=: ps.id]);
        system.debug('ps.Gross_Written_Premium__c ::'+ps.Gross_Written_Premium__c +'gwp::'+gwp+':: pf ::'+ pfList);
        Decimal totalGWP=0; 
        for(VG_Payment_Frequency__c pf: pfList){
           totalGWP = totalGWP+pf.VG_GWP_This_Time__c.setScale(2);
            system.debug('totalGWP::'+totalGWP);
        }
        
        system.debug('totalGWP::'+totalGWP);
        Decimal gwpTotal = gwp.setScale(2) + totalGWP;
        Boolean isError = false;
        if(ps.Gross_Written_Premium__c.setScale(2) < gwpTotal){
            isError = true;
        }else{
            isError = false;
        }
        return isError;
    }
    
    @AuraEnabled   
    public static Boolean getUpdateCheckValidationPS(String psId,  Decimal gwp, Decimal percent){
        Policy_schedule__c ps = [select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Id=:psId Limit 1];
        List<VG_Payment_Frequency__c> pfList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Payment_Percent__c, VG_GWP_This_Time__c, VG_Policy_Schedule__c FROM VG_Payment_Frequency__c Where VG_Policy_Schedule__c=: ps.id]);
        system.debug('ps.Gross_Written_Premium__c ::'+ps.Gross_Written_Premium__c +'gwp::'+gwp+':: pf ::'+ pfList);
        Decimal totalGWP=0; 
        for(VG_Payment_Frequency__c pf: pfList){
            system.debug('pf::'+pf.VG_Payment_Percent__c+'::'+percent);
           totalGWP = totalGWP+pf.VG_GWP_This_Time__c.setScale(2);
            system.debug('totalGWP::'+totalGWP);
        }
        
        system.debug('totalGWP::'+totalGWP);
        Decimal gwpTotal = gwp.setScale(2) + totalGWP;
        Boolean isError = false;
        if(ps.Gross_Written_Premium__c.setScale(2) < gwpTotal){
            isError = true;
        }else{
            isError = false;
        }
        return isError;
    }
    
    @AuraEnabled   
    public static String ppWrapper(List<Object> ppw, Id policyId, List<Object> ptw){
        system.debug('ppw::'+ppw+':::'+ppw.size());
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
        InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
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
            if(ppwrapper.dueDate != null && ppwrapper.dueDate != '')
            	ppwrapper.pp.Due_Date__c = Date.valueof(ppwrapper.dueDate);
            if(ppwrapper.policyPaymenyAmount != null && ppwrapper.policyPaymenyAmount != '')
            	ppwrapper.pp.VG_Policy_Payment_Amount__c = Decimal.valueOf(ppwrapper.policyPaymenyAmount);
            policyPaymentToBeInserted.put(ppwrapper.counter,ppwrapper.pp);
            ppcount++;
        }
        if(policyPaymentToBeInserted.size() > 0){
            Utilities.SkipMethods('Policy Payment Tax');
            system.debug('policyPaymentToBeInserted::'+policyPaymentToBeInserted);
            upsert policyPaymentToBeInserted.values();
        }
        Utilities.clearMethods();
        Integer pfc = 0;
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyPaymentWrapper ppwW: ppWrapperList){
                for(PaymentFrequencyWrapper pfw: ppwW.pfList){
                    if(ppwMap.containsKey(pfw.ps)){
                        pfw.pf = new VG_Payment_Frequency__c();
                        pfw.pf.VG_Policy_Schedule__c = pfw.ps;
                        pfw.pf.VG_Due_Date__c = ppwW.pp.Due_Date__c;
                        pfw.pf.VG_GWP_This_Time__c = pfw.gwp;
                        if(ppwW.policyPaymenyAmount !='')
                        	pfw.pf.VG_Payment_Percent__c = Decimal.valueOf(ppwW.policyPaymenyAmount);
                        if(ppwW.broker != null && ppwW.broker != '')
                        	pfw.pf.VG_Broker__c = ppwW.broker;
                        pfw.pf.VG_Comment__c = ppwW.comment;
                        pfw.pf.VG_Debt_Details__c = ppwW.debtDetails;
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
                        if(tw.taxAmount !='')
                        	tw.tax.VG_Tax_Amount__c = Decimal.valueOf(tw.taxAmount);
                        tw.tax.VG_Taxable_Amount__c = tw.taxableAmount;
                        tw.tax.Name = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Type__c = ptaxw.taxSelected;
                        tw.tax.VG_Tax_Jurisdiction__c  = ptaxw.taxJurisdictionListSelected;
                        tw.tax.VG_Tax_Paid_By__c  = ptaxw.taxPaidBySelected;
                        tw.tax.VG_Comment__c = ptaxw.comment;
                        if(ptaxw.taxPercent !='')
                        	tw.tax.VG_Tax_Percent__c = Decimal.valueOf(ptaxw.taxPercent);
                        tw.tax.VG_Override__c = ptaxw.taxIncluded;
                        tw.tax.VG_Tax_Administered_By__c  = ptaxw.taxAdministeredBySelected;
                        tw.tax.Policy_Tax__c = policyTaxToBeInserted.get(tw.ptcounter).id;
                        toInserttaxList.add(tw.tax);
                    }
                }
            }
            break;
        }
        if(!toInserttaxList.isEmpty()){
             Utilities.SkipMethods('Policy Payment Tax');
            upsert toInserttaxList;
            system.debug('toInserttaxList::'+toInserttaxList);
        }
        Utilities.clearMethods();
        return null;
    }
    
    public PageReference cancel(){
        PolicyId =  ApexPages.currentPage().getParameters().get('id');
        return new PageReference('/'+policyId);
    }
    
    @AuraEnabled(cacheable=true)  
    public static List<sobject> findRecords(String searchKey, String objectName) {  
        //string searchText = '\'' + String.escapeSingleQuotes(searchKey) + '%\''; 
        String searchText =  '%' + searchKey + '%';
        String query = 'SELECT Id, Name FROM ' +objectName+ ' WHERE Name LIKE '+searchText+' LIMIT 6';
        String brokerId = '0120O000000RMzI';
        String subbrokerId = '0120O000000RMzN';
        system.debug('check search::'+searchText+'::'+'brokerId::' +brokerId+'::'+'subbrokerId::'+subbrokerId);
        List<Account> acclist = [SELECT Id, Name, RecordType.Name,Regulatory_Check__c,VG_TOBA_Uploaded__c FROM Account WHERE (RecordTypeId =: brokerId OR RecordTypeId =: subbrokerId) AND Regulatory_Check__c = true AND VG_TOBA_Uploaded__c = true  AND Name LIKE :searchText ];
        system.debug('acclist::'+acclist);
       	return acclist;
        //return Database.query('SELECT Id, Name, RecordTypeId FROM ' +objectName+ 'WHERE RecordTypeId='+recordTypeId+' AND Name LIKE '+searchText+' LIMIT 6');  
    }
    
    @AuraEnabled   
    public static String deletePF(Id pfId){
        List<VG_Payment_Frequency__c > PFTobeDeleted = new List<VG_Payment_Frequency__c >();
        List<VG_Payment_Frequency__c> PFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Debt_Details__c,VG_Policy_Schedule__r.Gross_Written_Premium__c,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Id =:pfId]);
        for(VG_Payment_Frequency__c pf: PFList){
            PFTobeDeleted.add(pf);
        }
        if(!PFTobeDeleted.IsEmpty()){
            Delete PFTobeDeleted;
        }
        return null;
    }
    
    @AuraEnabled   
    public static String deleteTax(Id taxId){
        List<VG_Taxes__c > TaxTobeDeleted = new List<VG_Taxes__c >();
        List<VG_Taxes__c> TaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Override__c ,VG_Comment__c ,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Id =:taxId]);
        for(VG_Taxes__c tax: TaxList){
            TaxTobeDeleted.add(tax);
        }
        if(!TaxTobeDeleted.IsEmpty()){
            Delete TaxTobeDeleted;
        }
        return null;
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
        Public String dueDate{get;set;}
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public String broker{get;set;}
        @AuraEnabled
        Public String policyPaymenyAmount{get;set;}
        @AuraEnabled
        Public String debtDetails{get;set;}
        
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
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public String broker{get;set;}
        @AuraEnabled
        Public String brokerName{get;set;}
        @AuraEnabled
        Public String debtDetails{get;set;}
        @AuraEnabled
        Public String pfId{get;set;}
        
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
        Public String comment{get;set;}
        @AuraEnabled
        Public Boolean taxIncluded{get;set;}
        @AuraEnabled
        Public VG_Taxes__c  tax{get;set;}
        @AuraEnabled
        Public String taxPercent{get;set;}
        
        public PolicyTaxWrapper(){
            taxWList = new List<TaxWrapper>();
            pt = new Policy_Tax__c();
        }
    }
    Public Class TaxWrapper{
        @AuraEnabled
        Public String psSelected{get;set;}
        @AuraEnabled
        Public String psName{get;set;}
        @AuraEnabled
        Public Decimal taxableAmount{get;set;}
        @AuraEnabled
        Public String taxAmount{get;set;}
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
        Public String taxPercent{get;set;}
        @AuraEnabled
        Public VG_Taxes__c  tax{get;set;}
        @AuraEnabled
        Public String policyTaxName{get;set;}
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public Boolean taxIncluded{get;set;}
        @AuraEnabled
        Public String taxId{get;set;}
        public TaxWrapper(){
            tax = new VG_Taxes__c();
        }
    }
    
    Public Class UpdatePaymentWrapper{
        @AuraEnabled
        Public Date dueDate{get;set;}
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public String broker{get;set;}
        @AuraEnabled
        Public Decimal policyPaymenyAmount{get;set;}
        @AuraEnabled
        Public String debtDetails{get;set;}
    }
    
    /*Public Class gwpCalcWrapper{
        @AuraEnabled
        Public String psName{get;set;}
        @AuraEnabled
        Public String gwpValue{get;set;}
    }*/
}