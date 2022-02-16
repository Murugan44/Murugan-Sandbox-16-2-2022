Public Class ContentDocumentLinkTriggerFunction{
    Public Static Void Handler(List<ContentDocumentLink> TriggerNew,List<ContentDocumentLink> TriggerOld,Map<Id,ContentDocumentLink> TriggerNewMap,Map<Id,ContentDocumentLink> TriggerOldMap,Boolean IsBefore,Boolean IsAfter,Boolean IsInsert,Boolean IsUpdate,Boolean IsDelete){
        if(IsBefore && IsInsert){
            setVisibility(TriggerNew);
        }
    }
    
    Public Static Void setVisibility(List<ContentDocumentLink> TriggerNew){
        try{   
           for (ContentDocumentLink cdl : TriggerNew) {
               cdl.ShareType = 'I';
               cdl.Visibility = 'AllUsers';
           }
        }Catch(Exception e){
            System.debug('Exception::'+e.getMessage());           
        }
    }
}