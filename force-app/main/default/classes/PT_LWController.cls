public with sharing class PT_LWController {
    Public static Policy__c policy; 
    Public static List<PolicyPaymentWrapper> ppWrapperList = new List<PolicyPaymentWrapper>(); 
    Public static List<Policy_Payment__c> InsertedPPList = new List<Policy_Payment__c>();
    Public static Map<Id,Policy_Schedule__c> psMap = new Map<Id,Policy_Schedule__c>();
    Public static Map<String,  Policy_Payment__c>policyPaymentToBeInserted = new Map<String,  Policy_Payment__c>();
    public static Decimal InvoiceNumberUpdate{get;set;} 
    Public static List<PolicyTaxWrapper> taxWrapperList = new List<PolicyTaxWrapper>();
    Public static Map<String,  Policy_Tax__c> policyTaxToBeInserted = new Map<String,  Policy_Tax__c>(); 
    Public static List<Policy_Tax__c>InsertedPolTaxList = new List<Policy_Tax__c>();
    
    @AuraEnabled(cacheable=true)   
    public static Map<Id,Policy_Schedule__c> getPsList(Id policyId){
        Map<Id,Policy_schedule__c> psMap=new Map<Id,Policy_schedule__c>([select id,Name,Policy__r.CreatedDate,Limit__c,Attachment__c,Sum_Insured__c,Share__c,VG_Total_Layer_Premium__c,Product__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c from Policy_Schedule__c where Policy__c =: policyId]);
        return psMap;
    }
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<VG_Payment_Frequency__c>> getPP(Id policyId){
        try{
            Map<String, List<VG_Payment_Frequency__c>> pfMap =  new Map<String, List<VG_Payment_Frequency__c>>();
            InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
            system.debug('InsertedPPListTest::'+InsertedPPList);
            List<VG_Payment_Frequency__c> InsertedPFList = new List<VG_Payment_Frequency__c>([SELECT Id, Name,VG_Payment_Percent__c,VG_Debt_Details__c,VG_Broker__c,VG_Broker__r.Name,VG_Comment__c,VG_Due_Date__c,Policy_Payment__r.Due_Date__c,Policy_Payment__r.Id,VG_Policy_Schedule__r.Name, VG_Policy_Schedule__c, VG_GWP_This_Time__c, Policy_Payment__c, Policy_Payment__r.VG_Policy_Payment_Amount__c,CreatedDate  FROM VG_Payment_Frequency__c where Policy_Payment__c IN: InsertedPPList Order By Policy_Payment__r.Due_Date__c DESC]);
            system.debug('InsertedPFListTest::'+InsertedPFList.size()+'::'+InsertedPFList);
            if(InsertedPFList.size() > 0){
                for(VG_Payment_Frequency__c pf:InsertedPFList){
                    if(pfMap.containsKey(pf.Policy_Payment__r.Id)){
                        List<VG_Payment_Frequency__c> tempPFList = pfMap.get(pf.Policy_Payment__r.Id);
                        tempPFList.add(pf);
                        pfMap.put(pf.Policy_Payment__r.Id,tempPFList);
                    }else{
                        pfMap.put(pf.Policy_Payment__r.Id,new List<VG_Payment_Frequency__c>{pf});
                    }
                }
            }
            return pfMap;
        }catch(Exception e){
            system.debug('::'+e.getMessage()+'::'+e.getLineNumber());
            String errorMsg = e.getMessage()+e.getLineNumber();
            throw new AuraHandledException(ErrorMsg);
        }
        
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
    public static Boolean getCheckValidationPS(String psId,  Decimal gwp){
        Policy_schedule__c ps = [select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Id=:psId Limit 1];
        List<VG_Payment_Frequency__c> pfList = new List<VG_Payment_Frequency__c>([SELECT Id, Name, VG_GWP_This_Time__c, VG_Policy_Schedule__c FROM VG_Payment_Frequency__c Where VG_Policy_Schedule__c=: ps.id]);
        system.debug('ps.Gross_Written_Premium__c ::'+ps.Gross_Written_Premium__c.setScale(2) +'gwp::'+gwp+':: pf ::'+ pfList);
        Decimal totalGWP=0; 
        for(VG_Payment_Frequency__c pf: pfList){
            totalGWP = totalGWP+pf.VG_GWP_This_Time__c.setScale(2);
            system.debug('totalGWP::'+totalGWP);
        }
        
        system.debug('totalGWP::'+totalGWP);
        Decimal gwpTotal = gwp.setScale(2) + totalGWP;
        system.debug('::'+gwpTotal+'::'+ps.Gross_Written_Premium__c.setScale(2));
        Boolean isError = false;
        if(ps.Gross_Written_Premium__c.setScale(0) < gwpTotal.setScale(0)){
            isError = true;
        }else{
            isError = false;
        }
        return isError;
    }
    @AuraEnabled   
    public static String insertPolicyPayment(List<Object> policypaymentList, Id policyId){
        try{
            Boolean isInsert = true;
            ppWrapperList.clear();
            InsertedPPList.clear();
            for(Object p: policypaymentList){
                PolicyPaymentWrapper pp = (PolicyPaymentWrapper)JSON.deserialize(JSON.serialize(p), PolicyPaymentWrapper.class);
                ppWrapperList.add(pp);
            }
            system.debug('::'+ppWrapperList);
            system.debug('isInsert::'+isInsert);
            for(PolicyPaymentWrapper ppwrapper: ppWrapperList){
                system.debug('ppwrapper.ppId::'+ppwrapper.ppId);
                if(ppwrapper.ppId !=null && ppwrapper.ppId != '')
                    isInsert = false;
                system.debug('isInsert::'+isInsert);
            }
            system.debug('isInsert::'+isInsert);
            system.debug('ppWrapperList::'+ppWrapperList);
            Map<Id,  PaymentFrequencyWrapper> ppwMap =  new Map<Id,  PaymentFrequencyWrapper>();
            for(PolicyPaymentWrapper pp: ppWrapperList){
                for(PaymentFrequencyWrapper pfw: pp.pfList){
                    if(ppwMap.containsKey(pfw.ps)){
                        ppwMap.put(pfw.ps,pfw);
                    }else{
                        ppwMap.put(pfw.ps, pfw);
                    }
                }
            }
            system.debug('ppwMap::'+ppwMap);
            List<VG_Payment_Frequency__c> pfToBeInserted = new List<VG_Payment_Frequency__c>();
            policy = [Select Id,Name,CurrencyIsoCode from Policy__c where Id=:policyId];
            psMap=new Map<Id,Policy_schedule__c>([select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Policy__c=:policyId]);
            InsertedPPList = new List<Policy_Payment__c>([select id, Name,Policy__c,VG_Policy_Payment_Amount__c  FROM Policy_Payment__c where Policy__c =:policyId]);
            List<Integer> psNumList=new List<Integer>();
            String Name;
            system.debug('isInsert::'+isInsert+'::'+InsertedPPList);
            if(isInsert){
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
            }
            system.debug('Name::'+Name);
            for(PolicyPaymentWrapper ppwrapper: ppWrapperList){
                system.debug('ppwrapper.ppName::'+ppwrapper.ppName);
                Policy_Payment__c pp = new Policy_Payment__c();
                //if(ppwrapper.ppId !=null || ppwrapper.ppId != '')
                pp.Id = ppwrapper.ppId;
                //if(ppwrapper.ppName !=null && ppwrapper.ppName != '')
                if(isInsert)
                    pp.Name = Name;
                //else
                //   pp.Name = Name;
                pp.Policy__c = policyId;
                pp.CurrencyIsoCode = policy.CurrencyIsoCode;
                pp.Due_Date__c = Date.valueof(ppwrapper.dueDate);
                policyPaymentToBeInserted.put(ppwrapper.counter,pp);
            }
            system.debug('policyPaymentToBeInserted::'+policyPaymentToBeInserted);
            if(policyPaymentToBeInserted.size() > 0){
                Utilities.SkipMethods('Policy Payment Tax');
                upsert policyPaymentToBeInserted.values();
            }
            system.debug('policyPaymentToBeInserted 2::'+policyPaymentToBeInserted);
            Utilities.clearMethods();
            Integer pfc = 0;
            // Id BridgeRecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('Bridge').getRecordTypeId();
            SystemConstants__c InvoiceNumber = [Select Id, DocumentId__c from SystemConstants__c where Name = 'Invoice Number' FOR UPDATE];           
        
            for(Policy_schedule__c ps: psMap.values()){
                for(PolicyPaymentWrapper ppwW: ppWrapperList){
                    for(PaymentFrequencyWrapper pfw: ppwW.pfList){
                        system.debug('pfw.ps in for::'+pfw.ps);
                        if(ppwMap.containsKey(pfw.ps)){
                            system.debug('pfw.ps in for if::'+pfw.ps);
                            VG_Payment_Frequency__c pf = new VG_Payment_Frequency__c();
                            if(pfw.pfId !=null && pfw.pfId != '')
                                pf.Id = pfw.pfId;
                            pf.VG_Policy_Schedule__c = pfw.ps;
                            pf.CurrencyIsoCode = policy.CurrencyIsoCode;
                            pf.VG_Due_Date__c = Date.valueof(ppwW.dueDate);
                            pf.VG_GWP_This_Time__c = pfw.gwp;
                            // if(ps.RecordTypeId == BridgeRecordTypeId){
                                InvoiceNumberUpdate = Decimal.valueOf(InvoiceNumber.DocumentId__c)+1;
                                InvoiceNumber.DocumentId__c  =  String.valueOf(InvoiceNumberUpdate);             
                                pf.VG_Invoice_Number__c = String.valueOf(InvoiceNumberUpdate);
                            // }
                            if(ppwW.policyPaymenyPercent !='')
                                pf.VG_Payment_Percent__c = Decimal.valueOf(ppwW.policyPaymenyPercent);
                            if(ppwW.broker != null && ppwW.broker != '')
                                pf.VG_Broker__c = ppwW.broker;
                            pf.VG_Comment__c = ppwW.comment;
                            if(isInsert)
                                pf.Name = ps.Name+'/PF/'+pfc;
                            system.debug('::'+policyPaymentToBeInserted.get(pfw.ppcounter));
                            if(policyPaymentToBeInserted.get(pfw.ppcounter) != null){
                                pf.Policy_Payment__c = policyPaymentToBeInserted.get(pfw.ppcounter).id;
                            }else{
                                pf.Policy_Payment__c = ppwW.ppId;
                            }
                            pfToBeInserted.add(pf);
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
            
            
            
            return null;
        }catch(Exception e){
            system.debug('::'+e.getMessage()+'::'+e.getLineNumber());
            String errorMsg = e.getMessage()+e.getLineNumber();
            throw new AuraHandledException(ErrorMsg);
        }
        
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
    
    @AuraEnabled(cacheable=true) 
    public static Map<String, List<VG_Taxes__c>> getPolicyTax(Id policyId){
        Map<String, List<VG_Taxes__c>> twMap =  new Map<String, List<VG_Taxes__c>>();
        InsertedPolTaxList = new List<Policy_Tax__c>([SELECT Tax_Type__c, Policy__c, Id, Name FROM Policy_Tax__c where Policy__c =: policyId]);
        List<VG_Taxes__c> InsertedTaxList = new List<VG_Taxes__c>([SELECT Id, Name,VG_Taxable_Amount__c,VG_Tax_Percent__c,VG_Override__c ,VG_Comment__c ,VG_Tax_Jurisdiction__c,VG_Tax_Paid_By__c,VG_Tax_Administered_By__c,Policy_Tax__r.Id,VG_Policy_Schedule__r.Name,Policy_Tax__r.Tax_Type__c, VG_Policy_Schedule__c, VG_Tax_Amount__c, VG_Tax_Type__c, Policy_Tax__c FROM VG_Taxes__c where Policy_Tax__c IN: InsertedPolTaxList]);
        if(InsertedTaxList.size() > 0){
            for(VG_Taxes__c t: InsertedTaxList){
                if(twMap.containsKey(t.Policy_Tax__r.Id)){
                    List<VG_Taxes__c> tempTaxList = twMap.get(t.Policy_Tax__r.Id);
                    tempTaxList.add(t);
                    twMap.put(t.Policy_Tax__r.Id, tempTaxList);
                }else{
                    twMap.put(t.Policy_Tax__r.Id, new List<VG_Taxes__c>{t});
                }
            }
        }
        return twMap;
    }
    
    
    @AuraEnabled   
    public static String insertPolicyTax(List<Object> policyTaxList, Id policyId){
         Boolean isInsert = true;
        for(Object pt: policyTaxList){
            PolicyTaxWrapper ptaxw = (PolicyTaxWrapper)JSON.deserialize(JSON.serialize(pt), PolicyTaxWrapper.class);
            taxWrapperList.add(ptaxw);
        }
        for(PolicyTaxWrapper polTaxW: taxWrapperList){
            if(polTaxW.pTaxId != null && polTaxW.pTaxId !='')
                isInsert = false;
        }
        system.debug('taxWrapperList::'+taxWrapperList);
        policy = [Select Id,Name,CurrencyIsoCode from Policy__c where Id=:policyId];
        psMap=new Map<Id,Policy_schedule__c>([select id,Name,Gross_Written_Premium__c,Policy__c from Policy_schedule__c where Policy__c=:policyId]);
        Map<Id,  TaxWrapper> taxwMap =  new Map<Id,  TaxWrapper>();
        List<VG_Taxes__c > toInserttaxList = new List<VG_Taxes__c >();
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
            Policy_Tax__c pt = new Policy_Tax__c();
            pt.id = polTaxW.pTaxId;
            pt.Name = polTaxW.taxType;
            pt.Tax_Type__c = polTaxW.taxType;
            pt.CurrencyIsoCode = policy.CurrencyIsoCode;
            pt.Policy__c = policyId;
            policyTaxToBeInserted.put(polTaxW.counter,pt);
        }
        if(policyTaxToBeInserted.size() > 0){
            upsert policyTaxToBeInserted.values();
            system.debug('policyTaxToBeInserted::'+policyTaxToBeInserted);
        }
        
        for(Policy_schedule__c ps: psMap.values()){
            for(PolicyTaxWrapper ptaxw: taxWrapperList){
                for(TaxWrapper tw: ptaxw.taxWList){
                    system.debug('tw.psSelected::'+tw.psSelected);
                    system.debug('tw.psSelected::'+tw.psSelected+'::'+taxwMap.containsKey(tw.psSelected));
                    if(taxwMap.containsKey(tw.psSelected)){
                        system.debug('tw.psSelected::'+tw.psSelected);
                        VG_Taxes__c tax = new VG_Taxes__c();
                        if(tw.taxId !=null && tw.taxId !='')
                            tax.id = tw.taxId;
                        tax.VG_Policy_Schedule__c = tw.psSelected;
                        if(tw.taxAmount !='' && tw.taxAmount != null)
                            tax.VG_Tax_Amount__c = Decimal.valueOf(tw.taxAmount);
                        tax.VG_Taxable_Amount__c = tw.taxableAmount;
                        tax.CurrencyIsoCode = policy.CurrencyIsoCode;
                        tax.Name = ptaxw.taxType;
                        tax.VG_Tax_Type__c = ptaxw.taxType;
                        tax.VG_Tax_Jurisdiction__c  = ptaxw.taxJurisdiction;
                        tax.VG_Tax_Paid_By__c  = ptaxw.taxPaidBy;
                        tax.VG_Comment__c = ptaxw.comment;
                        if(tw.taxPercent !='' && tw.taxAmount != null)
                            tax.VG_Tax_Percent__c = Decimal.valueOf(tw.taxPercent);
                        tax.VG_Override__c = ptaxw.taxIncluded;
                        tax.VG_Tax_Administered_By__c  = ptaxw.taxAdministeredBy;
                        if(policyTaxToBeInserted.get(tw.ptcounter) != null)
                            tax.Policy_Tax__c = policyTaxToBeInserted.get(tw.ptcounter).id;
                        system.debug('tax::'+tax);
                        toInserttaxList.add(tax);
                    }
                }
            }
            break;
        }
        system.debug('toInserttaxList::'+toInserttaxList);
        if(!toInserttaxList.isEmpty()){
            Utilities.SkipMethods('Policy Payment Tax');
            upsert toInserttaxList;
            system.debug('toInserttaxList::'+toInserttaxList);
        }
        Utilities.clearMethods();
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
    
    Public Class PolicyPaymentWrapper{
        @AuraEnabled
        Public List<PaymentFrequencyWrapper> pfList{get;set;}
        @AuraEnabled
        Public String counter{get;set;}
        @AuraEnabled
        Public String dueDate{get;set;}
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public String broker{get;set;}
        @AuraEnabled
        Public String ppId{get;set;}
        @AuraEnabled
        Public String policyPaymenyPercent{get;set;}
        @AuraEnabled
        Public String ppName{get;set;}
        
        public PolicyPaymentWrapper(){
            pfList = new List<PaymentFrequencyWrapper>();
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
        Public Decimal gwp{get;set;}
        @AuraEnabled
        Public String pfId{get;set;}
    }
    
    Public Class PolicyTaxWrapper{
        @AuraEnabled
        Public List<TaxWrapper> taxWList{get;set;}
        @AuraEnabled
        Public String counter{get;set;}
        @AuraEnabled
        Public String taxType{get; set;}
        @AuraEnabled
        Public String taxJurisdiction{get;set;}
        @AuraEnabled
        Public String taxPaidBy{get; set;}
        @AuraEnabled
        Public String taxAdministeredBy{get;set;}
        @AuraEnabled
        Public String comment{get;set;}
        @AuraEnabled
        Public Boolean taxIncluded{get;set;}
        // @AuraEnabled
        // Public String taxPercent{get;set;}
        @AuraEnabled
        Public String pTaxId{get;set;}
        
        public PolicyTaxWrapper(){
            taxWList = new List<TaxWrapper>();
        }
    }
    Public Class TaxWrapper{
        @AuraEnabled
        Public String psSelected{get;set;}
        @AuraEnabled
        Public Decimal taxableAmount{get;set;}
        @AuraEnabled
        Public String taxAmount{get;set;}
        @AuraEnabled
        Public String ptcounter{get;set;}
        @AuraEnabled
        Public String taxCounter{get;set;}
        @AuraEnabled
        Public String taxId{get;set;}
        @AuraEnabled
        Public String taxPercent{get;set;}
    }
}