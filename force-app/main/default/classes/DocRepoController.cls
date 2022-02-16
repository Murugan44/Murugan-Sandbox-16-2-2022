/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 08-09-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DocRepoController {
    @AuraEnabled
    public static List<ContentDocumentLink> getPolicyAttachments(String fName, Id polid){
        system.debug('folder::'+fName+'::'+'Policy ID::'+polid);
        try {
            Policy__c pol = [select id, Name, Insured__c from Policy__c where id = :polid limit 1];
            system.debug('pol::'+pol);
            if(fName == 'Policy Documentation'){
                system.debug('Policy Documentation::'+fName);
                system.debug('Id::'+polid+'::'+'::'+fName);
                return[ SELECT ContentDocumentId,Id,ContentDocument.FileExtension,ContentDocument.Title,ContentDocument.Description,ContentDocument.FileType,ContentDocument.ContentSize,ContentDocument.CreatedDate,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink where (ContentDocument.Description = :fName OR ContentDocument.Description = :null) AND (LinkedEntityId = :polid)];
            }else if(fName == 'Pricing Spreadsheet'){
                return[ SELECT ContentDocumentId,Id,ContentDocument.FileExtension,ContentDocument.Title,ContentDocument.Description,ContentDocument.FileType,ContentDocument.ContentSize,ContentDocument.CreatedDate,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink where ContentDocument.Description = :'Pricing Spreadsheet' AND ( LinkedEntityId = :polid)];   
            }else{
                system.debug('Pol::'+fName);
                return[ SELECT ContentDocumentId,Id,ContentDocument.FileExtension,ContentDocument.Title,ContentDocument.Description,ContentDocument.FileType,ContentDocument.ContentSize,ContentDocument.CreatedDate,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink  where ContentDocument.Description = :fName AND ( LinkedEntityId = :polid)];   
            }    
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}