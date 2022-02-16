/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 05-23-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
* Modifications Log 
* Ver   Date         Author                               Modification
* 1.0   05-19-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class newPS {
    
    @AuraEnabled (cacheable=true)
    public static Map<String, List<String>> getRFoptionList(){
        Map<String, List<String>> rfMap = new Map<String, List<String>>();
        List<Rating_Factors__c> rfList = [Select Id,Name,Factor__c From Rating_Factors__c ];
        for(Rating_Factors__c rf: rfList){
            if(rfMap.containsKey(rf.Name)){
                List<String> tempList = rfMap.get(rf.Name);
                tempList.add(rf.Factor__c);
                rfMap.put(rf.Name,tempList);
            }else{
                rfMap.put(rf.Name,new List<String>{rf.Factor__c});
            }
            
        }
        return rfMap;
    }
    
     // * Rating Factors tab component method
    @AuraEnabled (cacheable=true)
    public static Map<String, List<Id>> getRatingFactorList(){
        Map<String, List<Id>> rfMap = new Map<String, List<Id>>();
        List<Rating_Factors__c> rfList1 = [Select Id,Name,Factor__c From Rating_Factors__c ];
        system.debug('rfList1::'+rfList1);
        for(Rating_Factors__c rf: rfList1){
            if(rfMap.containsKey(rf.Name)){
                List<Id> tempList1 = rfMap.get(rf.Name);
                tempList1.add(rf.Id);
                rfMap.put(rf.Name,tempList1);
            }else{
                rfMap.put(rf.Name,new List<Id>{rf.Id});
            }
            
        }
        system.debug('rfMap::'+rfMap);
            return rfMap;
    }
    
    // * Rating Factors tab component method
    @AuraEnabled
    public static Rating_Factors__c insertRatingFactor(Rating_Factors__c rfRec){
        system.debug('insertRatingFactor::'+rfRec);
        
        insert rfRec;
        return rfRec;
    }
    
    // * Search Rating Factor
    @AuraEnabled(Cacheable = true)
    public static Map<String, List<Id>> retriveRatingFactor(String strRFName) {
        system.debug('strRFName::'+strRFName);
        strRFName = '%' + strRFName + '%';

		List<Rating_Factors__c> listRF = [Select Id,Name,Factor__c,Relative_Score__c From Rating_Factors__c WHERE Name LIKE :strRFName];
        system.debug('listRF::'+listRF);
        Map<String, List<Id>> rfsMap = new Map<String, List<Id>>();
        
        for(Rating_Factors__c rfs: listRF){
            if(rfsMap.containsKey(rfs.Name)){
                List<Id> tempList0 = rfsMap.get(rfs.Name);
                tempList0.add(rfs.Id);
                rfsMap.put(rfs.Name,tempList0);
            }else{
                rfsMap.put(rfs.Name,new List<Id>{rfs.Id});
            }
            
        }
        system.debug('rfsMap::'+rfsMap);

        if(rfsMap.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return rfsMap; 
    }
    
    
}