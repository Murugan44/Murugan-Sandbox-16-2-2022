public class VG_fileViewerController {
    
    @AuraEnabled 
    public static List<ContentDocumentLink> fetchContentDocument(String PolId){
        system.debug('pollll::'+Polid);
        
        return [SELECT ContentDocumentId,contentDocument.CreatedDate,contentDocument.FileType,contentDocument.ContentSize,contentDocument.Title,Id,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink WHERE LinkedEntityId =:PolId ];
    }
}