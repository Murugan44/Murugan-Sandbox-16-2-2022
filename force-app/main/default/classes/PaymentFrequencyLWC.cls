public with sharing class PaymentFrequencyLWC {
    
    @AuraEnabled
    public static Decimal clactotalpercent(List<VG_Payment_Frequency__c> pfList,Decimal totpercent){
        //system.debug('>>'+rrPIList.size());
        system.debug('>>'+pfList);
        totpercent = 0;
        for(VG_Payment_Frequency__c pf: pfList){
            totpercent = totpercent + pf.VG_Payment_Percent__c;
            system.debug('pf:::'+totpercent);
        }
        system.debug('>>'+totpercent);
        return totpercent;
    }
    
    @AuraEnabled
    public static Decimal caltotalGWP(Decimal percent, String psId, Decimal gwpVal){
        system.debug('>>'+percent);
        Policy_Schedule__c ps = [SELECT Id,Name,Policy__c,Gross_Written_Premium__c,VG_Gross_Written_Premium_100__c,VG_MTA_Type__c,VG_Payment_Due_Date__c FROM Policy_Schedule__c where id=:psId];
        system.debug('ps::'+ps);
        gwpVal = ps.Gross_Written_Premium__c*(percent/100);
        //totalGWP = 0;
        //totalGWP = totalGWP + totgwp; 
        system.debug('>>'+gwpVal);
        return gwpVal;
    }
    
    @AuraEnabled 
    public static List<VG_Payment_Frequency__c> addPF(String psId, List<VG_Payment_Frequency__c> pfList){
        system.debug('addPF::'+psId+'::'+pfList);
        
        Policy_Schedule__c ps = [SELECT Id,Name,Policy__c,Gross_Written_Premium__c,VG_Gross_Written_Premium_100__c,VG_MTA_Type__c,VG_Payment_Due_Date__c FROM Policy_Schedule__c where id=:psId];
        //pfRec = [SELECT CurrencyIsoCode,Id,Name,VG_Broker__c,VG_Comment__c,VG_Due_Date__c,VG_GWP_This_Time__c,VG_Is_Temp_Delete__c,VG_Payment_Percent__c,VG_Policy_Schedule__c FROM VG_Payment_Frequency__c where id=:psId];
        system.debug('ps::'+ps);
        system.debug('pfRec::'+pfList);
        for(VG_Payment_Frequency__c pf: pfList){
            if(pf.VG_Policy_Schedule__c == null){
                pf.VG_Policy_Schedule__c = ps.id;
                pf.VG_GWP_This_Time__c = ps.Gross_Written_Premium__c*(pf.VG_Payment_Percent__c/100);
            }
        }
        insert pfList;
        return pfList;
    }
}