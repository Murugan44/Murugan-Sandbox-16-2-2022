/*

 *Created By : Venkat
 
 *Created On : 19-12-2017
 
 *JIRA.No    : 
 
 *Test Class : 
*/
Public Class ReInsuranceTriggerFunction{
    Public Static Void Handler(List<VG_ReInsurance__c> TriggerNew,List<VG_ReInsurance__c> TriggerOld,Map<Id,VG_ReInsurance__c> TriggerNewMap,Map<Id,VG_ReInsurance__c> TriggerOldMap,Boolean IsBefore,Boolean IsAfter,Boolean IsInsert,Boolean IsUpdate,Boolean IsDelete,Boolean IsUnDelete){
        if(IsBefore && (IsInsert || IsUpdate)){
            UMRCurrencycheck(TriggerNew, TriggerOldMap, IsInsert, IsUpdate);    
        }
        if(IsBefore && IsUpdate){          
              
        }
        
        if(IsAfter && (IsInsert || IsUpdate || IsDelete || IsUnDelete)){
            if(!Utilities.avoidRecursionCheck('RollupFields'))
                RollupFields(TriggerNew,TriggerOld,IsInsert,IsUpdate,IsDelete,IsUnDelete);             
        }
        if(IsBefore && IsDelete){
            
        }
    }
    
    public static void UMRCurrencycheck(List<VG_ReInsurance__c> TriggerNew, Map<Id,VG_ReInsurance__c> TriggerOldMap, Boolean IsInsert, Boolean IsUpdate){        
        Set<Id> UMRIds  =  new Set<Id>();
        List<CurrencyType> exchangeRates  = new List<CurrencyType>([Select Id,  ConversionRate,  IsoCode from CurrencyType]);
        Map<Id,VG_UMR__c> umrMap = new Map<Id,VG_UMR__c>([select id, Name from VG_UMR__c]);               
        List<UMR_Exchange_Rates__c> umrExchangeRateList = new List<UMR_Exchange_Rates__c>([Select Id,Name,CurrencyIsoCode,VG_Exchange_Rate_to_USD__c,VG_Capacity_Details__c from UMR_Exchange_Rates__c where VG_Capacity_Details__c IN: umrMap.keySet()]);
        Map<String,UMR_Exchange_Rates__c> EXMap = new Map<String,UMR_Exchange_Rates__c>();
        for(UMR_Exchange_Rates__c EX : umrExchangeRateList){
            String key = EX.VG_Capacity_Details__c + ':' + EX.Name;
            EXMap.put(key,EX);
        }
        Map<String,Decimal> conversionRate = new Map<String,Decimal>();
        for(CurrencyType rt : exchangeRates){
            conversionRate.put(rt.IsoCode,rt.ConversionRate);
        }
        for(VG_ReInsurance__c RI : TriggerNew){
            String key = RI.VG_UMR__c  + ':' + RI.CurrencyIsoCode;
            if(IsInsert || (IsUpdate && RI.CurrencyISOCode != TriggerOldMap.get(RI.Id).CurrencyISOCode)){
                If(EXMap.containsKey(key)){
                    RI.UMR_Specific_Exchange_Rates_USD__c = EXMap.get(key).VG_Exchange_Rate_to_USD__c;
                    RI.VG_IS_Standard_Currency_Used__c = false; 
                }else{
                    RI.UMR_Specific_Exchange_Rates_USD__c = conversionRate.get(RI.CurrencyIsoCode);
                    RI.VG_IS_Standard_Currency_Used__c = true; 
                }   
            }         
        }
    }
    
   public Static Void RollupFields(List<VG_ReInsurance__c> TriggerNew,List<VG_ReInsurance__c> TriggerOld,Boolean IsInsert, Boolean IsUpdate, Boolean IsDelete, Boolean IsUndelete){
        Set<Id> UMRIds  =  new Set<Id>();
        Set<Id> PSIds  =  new Set<Id>();
        Set<Id> TriggerNewIds  =  new Set<Id>();
        If(IsDelete){
            for(VG_ReInsurance__c RI: TriggerOld){
                UMRIds.add(RI.VG_UMR__c);
                PSIds.add(RI.VG_Policy_Schedule__c);
                TriggerNewIds.add(RI.VG_Policy_Schedule__c);
                System.debug('UMRIds::'+UMRIds+'::'+PSIds+TriggerNewIds);
            }
        }else{
            for(VG_ReInsurance__c RI: TriggerNew){
                UMRIds.add(RI.VG_UMR__c);
                PSIds.add(RI.VG_Policy_Schedule__c);
                TriggerNewIds.add(RI.VG_Policy_Schedule__c);
                System.debug('UMRIds::'+UMRIds+'::'+PSIds+TriggerNewIds);
            }
        }
        System.debug(TriggerNewIds.size());
        List<CurrencyType> exchangeRates  =  [Select Id,  ConversionRate,  IsoCode from CurrencyType ];
        Map<String, CurrencyType> currencyRateMap = new Map<String, CurrencyType>();
        for(CurrencyType cr: exchangeRates){
            currencyRateMap.put(cr.IsoCode, cr);
        }
        Map<Id, Policy_Schedule__c> psMap = new Map<Id, Policy_Schedule__c>([Select Id,  Name, VG_MGA_Commission_Amount__c  from Policy_Schedule__c where Id IN: PSIds AND VG_Status__c = 'Booked']);
        List<VG_ReInsurance__c> existingRIs  =  [Select Id, CurrencyIsoCode, VG_MGA_Commission_Amount__c,  VG_RI_Premium__c, VG_UMR__r.CurrencyIsoCode, VG_UMR__c,  VG_Policy_Schedule__c from VG_ReInsurance__c where (VG_UMR__c IN: UMRIds OR VG_Policy_Schedule__c IN: psMap.keyset()) AND (VG_Status__c  =  'Bound' OR VG_Status__c  =  'Booked')];
        System.Debug('existingRIs::'+existingRIs.size()+psMap.size()+psMap.values());
        System.Debug('existingRIs::'+existingRIs);
        Map<Id,  Decimal> UMRMGAComm  =  new Map<Id,  Decimal>();
        Map<Id,  Decimal> UMRRIPremium  =  new Map<Id,  Decimal>();
        Map<Id,  Decimal> PSMGAComm  =  new Map<Id,  Decimal>();
        List<VG_UMR__c> UMRToBeUpdated  =  new List<VG_UMR__c>();
        List<Policy_Schedule__c> PSToBeUpdated  =  new List<Policy_Schedule__c>();
        Map<id, List<VG_ReInsurance__c>> UMRRIMap  =  new Map<Id, List<VG_ReInsurance__c>>();
        for(VG_ReInsurance__c ri : existingRIs  ){
            List<VG_ReInsurance__c> reList  =  UMRRIMap.get(ri.VG_UMR__c);
            if(reList == null)
                reList = new List<VG_ReInsurance__c>();
            reList.add(ri);
            UMRRIMap.put(ri.VG_UMR__c,  reList);            
        }
        /*
        for(VG_ReInsurance__c ri : existingRIs  ){
            if(UMRRIMap.containsKey(ri.VG_UMR__c)) {
                List<VG_ReInsurance__c> reList  =  UMRRIMap.get(ri.VG_UMR__c);
                reList.add(ri);
                UMRRIMap.put(ri.VG_UMR__c,  reList);
            } else {
                UMRRIMap.put(ri.VG_UMR__c,  new List<VG_ReInsurance__c> { ri });
            }
        }
        */
        VG_UMR__c UMR;
        Policy_Schedule__c PS;
        PSIds.clear();
        Decimal CurrencyConvertion ;
        for(Id UMRId : UMRIds){
            System.debug('Updated values::'+UMRId);
            If(UMRRIMap.get(UMRId)==null){
                UMR  =  new VG_UMR__c();
                UMR.Id  =  UMRId;
                UMR.VG_MGA_Commission_Amount__c  = 0;
                UMR.VG_RI_Premium__c  =  0;
                UMRToBeUpdated.add(UMR);
            }else{
                for(VG_ReInsurance__c RI : UMRRIMap.get(UMRId)){
                    if(RI.CurrencyIsoCode != RI.VG_UMR__r.CurrencyIsoCode){
                        CurrencyConvertion = ( 1 / currencyRateMap.get(RI.CurrencyIsoCode).ConversionRate ) * currencyRateMap.get(RI.VG_UMR__r.CurrencyIsoCode).ConversionRate ;
                    }else{
                        CurrencyConvertion = 1;
                    }
                    System.debug('CurrencyConvertion ::'+CurrencyConvertion);
                    PSIds.add(RI.VG_Policy_Schedule__c);
                    if(UMRMGAComm.get(RI.VG_UMR__c)  ==  null){
                        UMRMGAComm.put(RI.VG_UMR__c,  ((RI.VG_MGA_Commission_Amount__c !=  null ? RI.VG_MGA_Commission_Amount__c:0) * CurrencyConvertion ));        
                    }else{
                        Decimal tempMGA  =  UMRMGAComm.get(RI.VG_UMR__c);
                        tempMGA  =  tempMGA + ((RI.VG_MGA_Commission_Amount__c !=  null ? RI.VG_MGA_Commission_Amount__c:0) * CurrencyConvertion );
                        UMRMGAComm.put(RI.VG_UMR__c,  tempMGA);   
                    }
                    if(UMRRIPremium.get(RI.VG_UMR__c)  ==  null){
                        UMRRIPremium.put(RI.VG_UMR__c,  (RI.VG_RI_Premium__c * CurrencyConvertion ) );        
                    }else{
                        Decimal tempPre  =  UMRRIPremium.get(RI.VG_UMR__c);
                        tempPre  =  tempPre+ (RI.VG_RI_Premium__c * CurrencyConvertion ) ;
                        UMRRIPremium.put(RI.VG_UMR__c,  tempPre);   
                    }
                    System.debug('PSMGAComm::'+RI.VG_Policy_Schedule__c+'::'+RI.VG_MGA_Commission_Amount__c+'::'+currencyRateMap.get(RI.CurrencyIsoCode).ConversionRate);
                    if(PSMGAComm.get(RI.VG_Policy_Schedule__c)  ==  null){
                        PSMGAComm.put(RI.VG_Policy_Schedule__c,  (RI.VG_MGA_Commission_Amount__c !=  null?RI.VG_MGA_Commission_Amount__c:0));        
                    }else{
                        Decimal tempMGA  =  PSMGAComm.get(RI.VG_Policy_Schedule__c);
                        tempMGA  =  tempMGA + (RI.VG_MGA_Commission_Amount__c !=  null?RI.VG_MGA_Commission_Amount__c:0);
                        tempMGA  = tempMGA.setScale(2);
                        PSMGAComm.put(RI.VG_Policy_Schedule__c,  tempMGA);   
                    }
                }
            }
        }       
        
        for(Id UMRId : UMRRIPremium.keySet()){
            System.debug('Updated values::'+UMRMGAComm.get(UMRId)+'::'+UMRRIPremium.get(UMRId));
            UMR  =  new VG_UMR__c();
            UMR.Id  =  UMRId;
            UMR.VG_MGA_Commission_Amount__c  =  UMRMGAComm.get(UMRId);
            UMR.VG_RI_Premium__c  =  UMRRIPremium.get(UMRId);
            UMRToBeUpdated.add(UMR);
        }
        System.debug(TriggerNewIds);
        System.debug(TriggerNewIds.size());
        Map<Id, Policy_Schedule__c> psMap1 = new Map<Id, Policy_Schedule__c>([Select Id,  Name, VG_MGA_Commission_Amount__c, VG_Status__c  from Policy_Schedule__c where Id IN: PSIds]);
        for(Id PSId : PSMGAComm.keySet()){
            System.debug('IF Result::'+PSId+'::'+TriggerNewIds.contains(PSId)+'::'+psMap1.containsKey(PSId)+'::'+psMap1.get(PSId).VG_Status__c+'::'+psMap1.get(PSId).VG_MGA_Commission_Amount__c);
            if(TriggerNewIds.contains(PSId) && psMap1.containsKey(PSId) && psMap1.get(PSId).VG_Status__c == 'Booked' && psMap1.get(PSId).VG_MGA_Commission_Amount__c  !=   PSMGAComm.get(PSId).setScale(2)){
                PS  =  new Policy_Schedule__c();
                PS.Id  =  PSId;
                PS.VG_MGA_Commission_Amount__c  =  PSMGAComm.get(PSId);
                PSToBeUpdated.add(PS);
            }
        }
        Utilities.SkipMethods('Trigger Context');
        Utilities.SkipMethods('LS and Edison Revise Context');
        Utilities.SkipMethods('LS_ROC_Revise_Context');
        if(!UMRToBeUpdated.IsEmpty()){
            Update UMRToBeUpdated;
        }
        if(!PSToBeUpdated.IsEmpty()){
            Update PSToBeUpdated;
        }
        Utilities.clearMethods();
        Utilities.avoidRecursionSet.add('RollupFields');
    }
}