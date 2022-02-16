/*

*Created By : Murugan

*Created On : 30-04-2021

*/

Public Class ContentVersionTriggerFunction{
    Public Static Void Handler(List<ContentVersion> TriggerNew,List<ContentVersion> TriggerOld,Map<Id,ContentVersion> TriggerNewMap,Map<Id,ContentVersion> TriggerOldMap,Boolean IsBefore,Boolean IsAfter,Boolean IsInsert,Boolean IsUpdate,Boolean IsDelete){
        if(IsAfter && IsUpdate){
            if(!Utilities.avoidRecursionCheck('updateAttachName'))
                updateAttachName(TriggerOld,TriggerNew,IsUpdate);
        }
    }
    
    Public Static Void updateAttachName(List<ContentVersion> TriggerNew,List<ContentVersion> TriggerOld, Boolean IsUpdate){
        Set<Id> contentDocumentIdSet = new Set<Id>();
        Set<Id> cdlSet = new Set<Id>();
        Set<Id> LinkedEntityIdSet = new Set<Id>();
        Set<Id> polidsSet = new Set<Id>();
        Set<Id> psids = new Set<Id>();
        
        for(ContentVersion cv:TriggerNew){
            if(cv.ContentDocumentId != null ){
                contentDocumentIdSet.add(cv.ContentDocumentId);
            }
        }
        
        List<ContentVersion> cvList =new List<ContentVersion>();
        List<VG_Attachment__c> attachList  = new List<VG_Attachment__c>();
        List<ContentDocumentLink> cdlList= [SELECT ContentDocumentId,Id,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink WHERE ContentDocumentId IN:contentDocumentIdSet];
        
        for(ContentDocumentLink cdl: cdlList){
            cdlSet.add(cdl.ContentDocumentId);
            LinkedEntityIdSet.add(cdl.LinkedEntityId);
        }
        cvList = [SELECT Checksum,ContentBodyId,ContentDocumentId,ContentLocation,ContentModifiedById,ContentModifiedDate,ContentSize,ContentUrl,CreatedById,CreatedDate,CurrencyIsoCode,Description,ExternalDataSourceId,ExternalDocumentInfo1,ExternalDocumentInfo2,FeaturedContentBoost,FeaturedContentDate,FileExtension,FileType,FirstPublishLocationId,Id,IsAssetEnabled,IsDeleted,IsLatest,IsMajorVersion,LastModifiedById,LastModifiedDate,NegativeRatingCount,NetworkId,Origin,OwnerId,PathOnClient,PositiveRatingCount,PublishStatus,RatingCount,ReasonForChange,SharingOption,SharingPrivacy,SystemModstamp,TagCsv,TextPreview,Title,VersionData,VersionNumber FROM ContentVersion where ContentDocumentId IN: cdlSet];
        List<Policy__c> polList = [SELECT Id, name FROM Policy__c where  Id IN: LinkedEntityIdSet ];
        for(Policy__c pol: polList){
            polidsSet.add(pol.Id);
        }
        List<Policy_Schedule__c> psList = [SELECT Id, Name, Policy__c FROM Policy_Schedule__c Where id IN: LinkedEntityIdSet];
        for(Policy_Schedule__c ps: psList){
            psids.add(ps.Id);
        }
        attachList = [SELECT Id, name, VG_Attachment__c , VG_Policy__c, VG_Policy_Schedule__c FROM VG_Attachment__c where (VG_Policy__c IN:polidsSet OR VG_Policy_Schedule__c IN:psids)];
        List<VG_Attachment__c> aList = new List<VG_Attachment__c>();
        for(ContentVersion cv:cvList){
            if(attachList.size() > 0){
                for(VG_Attachment__c a : attachList){
                    if(a.VG_Attachment__c == cv.Id){
                        a.Name = cv.Title;
                        aList.add(a);
                    }
                }
            }          
        }
        if(!aList.IsEmpty()){
            Update aList;
        }  
    }
}