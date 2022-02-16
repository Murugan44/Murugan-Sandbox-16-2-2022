public with sharing class uploadFileLWCControlller {
	@AuraEnabled
    public static list<Id> uploadFile(Id idParent,String strFileDescription,list<Object> fileList){
        system.debug(':::'+'::'+fileList);
        system.debug('from lwc::'+idParent+'::'+strFileDescription);
        list<Id> cvIds = new list<Id>();
        for (Object file : fileList) {
            system.debug('file::'+file);
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
        }else if(strFileDescription == 'Underwriting'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }else if(strFileDescription == 'Policy Documentation'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }else if(strFileDescription == 'Pricing Spreadsheet'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }else if(strFileDescription == 'Finance'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }else if(strFileDescription == 'Reinsurance'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }else if(strFileDescription == 'Claims'){
            for(ContentVersion cv : cvList){
                cv.Description = strFileDescription;
            }
            system.debug('update cvList::'+cvList);
            update cvList;
        }
        
        return cvIds;
    }
    
    public class FileInfo {
        public String name;
        public String documentId;
        public String contentVersionId;
    }
}