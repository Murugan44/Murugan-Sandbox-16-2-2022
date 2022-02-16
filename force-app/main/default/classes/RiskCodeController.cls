public with sharing class RiskCodeController {
    
    @AuraEnabled (cacheable=true)
    public static Map<String, List<RiskCodeListWrapper>> getRiskCodeList1(){
        Map<String, List<RiskCodeListWrapper>> rfMap = new Map<String, List<RiskCodeListWrapper>>();
        List<VG_PS_Risk_Codes__mdt > RcList = [Select Id,MasterLabel, Product__c , Risk_Code__c , Team__c, isActive__c from VG_PS_Risk_Codes__mdt where isActive__c = true];
        
        for(VG_PS_Risk_Codes__mdt  rf: RcList){
            if(rfMap.containsKey(rf.Team__c)){
                RiskCodeListWrapper rcw = new RiskCodeListWrapper();
                rcw.RcId = rf.Id;
                rcw.Product = rf.Product__c;
                rcw.Team = rf.Team__c;
                rcw.RiskCode = rf.Risk_Code__c;
                List<RiskCodeListWrapper> tempList = rfMap.get(rf.Team__c);
                tempList.add(rcw);
                rfMap.put(rf.Team__c,tempList);
            }else{
                RiskCodeListWrapper rcw = new RiskCodeListWrapper();
                rcw.RcId = rf.Id; 
                rcw.Product = rf.Product__c;
                rcw.Team = rf.Team__c;
                rcw.RiskCode = rf.Risk_Code__c;
                rfMap.put(rf.Team__c,new List<RiskCodeListWrapper>{rcw});
            }
        }
        return rfMap;
    }
    
    @AuraEnabled
    public static VG_PS_Risk_Codes__mdt finish(String team,String product, String riskcode, String reinsurance, String cob, String ccProduct){  
        system.debug('::'+team+'::'+product+'::'+riskcode.split(';'));
        
        List<String> riskcodeList = riskcode.split(';');
        system.debug('riskcode::'+riskcodeList.size());
        
        Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
        Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
        Metadata.CustomMetadataValue customField  = new Metadata.CustomMetadataValue();
        Integer rccount = 1;
        String label = '';
        for(String s : riskcodeList){
            Integer randomNumber = Integer.valueof((Math.random() * 5000));
            label = team+ '/RC/'+randomNumber;
            String Name =  team+ '_RC_'+randomNumber;
            
            customMetadata.label = label;
            customMetadata.fullName = 'VG_PS_Risk_Codes.'+Name; 
            
            customField.field = 'Team__c';
            customField.value = team;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'Product__c';
            customField.value = product;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'Reinsurance__c';
            customField.value = Reinsurance;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'Class_of_Business__c';
            customField.value = cob;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'Risk_Code__c';
            customField.value = s;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'isActive__c';
            customField.value = true;
            customMetadata.values.add(customField);
            
            customField = new Metadata.CustomMetadataValue();
            customField.field = 'Commercial_Combined_Product__c';
            customField.value = ccProduct;
            customMetadata.values.add(customField);
            
            mdContainer.addMetadata(customMetadata);
            System.debug( ' >>>> Created custom metadata object >>> ' + customMetadata );
            system.debug('::'+mdContainer);
            CustomMetadataCallback callback = new CustomMetadataCallback();
            Id jobId;
			if (!Test.isRunningTest())
            	jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
        }
        return null;
    }  
    
    @AuraEnabled
    public static VG_PS_Risk_Codes__mdt deleteRiskCode(Id rcId){  
        List<VG_PS_Risk_Codes__mdt > RcList = new List<VG_PS_Risk_Codes__mdt >([Select Id,MasterLabel,DeveloperName , Product__c , Risk_Code__c , Team__c, isActive__c from VG_PS_Risk_Codes__mdt WHERE Id=:rcId]);
        system.debug('delete::'+RcList);
        Map<String, Object> metadataFieldValueMap = new Map<String, Object>();
        for(VG_PS_Risk_Codes__mdt prc: RcList){
            system.debug('prc:'+prc);
            metadataFieldValueMap.put('isActive__c', false);
            system.debug('metadataFieldValueMap::'+metadataFieldValueMap);
            updateCustomMetadata('VG_PS_Risk_Codes__mdt',prc.DeveloperName,prc.MasterLabel,metadataFieldValueMap);
        }
        return null;
    }
    
    //Update Custom Metadata record
    public static void updateCustomMetadata(String metdataName, String recordDevName, String label, Map<String, Object> metadataFieldValueMap){
        system.debug('::'+metdataName+'::'+recordDevName+'::'+label+'::'+metadataFieldValueMap);
        Metadata.CustomMetadata cMetadata = new Metadata.CustomMetadata();
        cMetadata.fullName = metdataName + '.' + recordDevName;
        cMetadata.label = label;
        
        for(String key : metadataFieldValueMap.keySet()){
            system.debug('key::'+key);
            Metadata.CustomMetadataValue cMetadataValue = new Metadata.CustomMetadataValue();
            cMetadataValue.Field = key;
            cMetadataValue.Value = metadataFieldValueMap.get(key); 
            cMetadata.values.add(cMetadataValue);
        }
        
        Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
        mdContainer.addMetadata(cMetadata);
        system.debug('mdContainer::'+mdContainer);
        CustomMetadataCallback callback = new CustomMetadataCallback();
        //CustomMetadataUtils callback = new CustomMetadataUtils();
        Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
    }
    
    public class CustomMetadataCallback implements Metadata.DeployCallback {
        public void handleResult(Metadata.DeployResult result,
                                 Metadata.DeployCallbackContext context) {
                                     if (result.status == Metadata.DeployStatus.Succeeded) {
                                         System.debug(' data :: ===>'+ result);
                                     } else {
                                         // Deployment was not successful
                                         System.debug(' error :: ===> fail '+ result);
                                     }
                                 }
    }
    
    public class RiskCodeListWrapper{
        @AuraEnabled
        public Id RcId{get;set;}
        @AuraEnabled
        public String Product{get;set;}
        @AuraEnabled
        public String Team{get;set;}
        @AuraEnabled
        public String RiskCode{get;set;}
    }
    
}