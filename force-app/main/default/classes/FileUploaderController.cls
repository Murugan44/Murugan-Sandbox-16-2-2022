/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 04-28-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
* Modifications Log 
* Ver   Date         Author                               Modification
* 1.0   02-14-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class FileUploaderController {
    @AuraEnabled
    public static list<Id> uploadFile(Id idParent,String strFileDescription,list<Object> fileList){
        system.debug('11:::'+'::'+fileList);
        system.debug('from lwc::'+idParent+'::'+strFileDescription);
        list<Id> cvIds = new list<Id>();
        for (Object file : fileList) {
            system.debug('file2::'+file);
            FileInfo fileData = (FileInfo)JSON.deserialize(JSON.serialize(file), FileInfo.class);
            system.debug('fileData::'+fileData);
            cvIds.add(fileData.documentId);
            //cvIds = file.documentId;
        }
		system.debug('cvIds::'+cvIds);        
        List<ContentVersion> cvList = new List<ContentVersion>([SELECT Id, ContentDocumentId, Title, Description FROM ContentVersion WHERE ContentDocumentId IN: cvIds]);
        system.debug('cvList::'+cvList);
        
        if(strFileDescription == 'Submission'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }
        
        /*list<Id> cvIds = new list<Id>();
        List<ContentVersion> cvToInsert = new List<ContentVersion>();
        List<ContentDocumentLink> cdlToInsert = new List<ContentDocumentLink>();
        
        for (Object file : filesToInsert) {
            FileInfo fileData = (FileInfo)JSON.deserialize(JSON.serialize(file), FileInfo.class);
            system.debug('fileData::'+fileData);
            ContentVersion objCV = new ContentVersion();
            objCV.PathOnClient = fileData.Title;
            objCV.Title = fileData.Title;
            objCV.VersionData = fileData.VersionData;
            objCV.Description = strFileDescription;
            cvToInsert.add(objCV);
            system.debug('cvToInsert::'+cvToInsert);
        }
        
        list<Database.saveResult> res = Database.insert(cvToInsert);
        for (Database.SaveResult saveResult : res) {
            if(saveResult.isSuccess()) {
                cvIds.add(saveResult.getId());
                
            }
        }
        //return cvIds;
        system.debug('cvIds::'+cvIds);
        
        List<ContentDocument> cdList = new List<ContentDocument>([SELECT Id, OwnerId, Title, LatestPublishedVersionId, ParentId, ContentSize, FileType, FileExtension FROM ContentDocument where LatestPublishedVersionId IN:cvIds]);
        system.debug('cd::'+cdList);
        for(ContentDocument cd: cdList){
            ContentDocumentLink cdl = new ContentDocumentLink();
            cdl.ContentDocumentId = cd.Id;
            system.debug('::'+cdl.LinkedEntityId);
            cdl.LinkedEntityId = idParent;
            // ShareType is either 'V', 'C', or 'I'
            // V = Viewer, C = Collaborator, I = Inferred
            cdl.ShareType = 'V';
            cdlToInsert.add(cdl);
            system.debug('cdlToInsert::'+cdlToInsert);
        } 
        insert cdlToInsert;       
        return cvIds;*/
        return cvIds;
    }
    
    
    public class FileInfo {
        public String name;
        public String documentId;
        public String contentVersionId;
    }
    
}