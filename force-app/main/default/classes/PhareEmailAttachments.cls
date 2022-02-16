global class PhareEmailAttachments implements Messaging.InboundEmailHandler{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        Account acc = new Account();
        acc.Name = email.fromname.substring(0,email.fromname.indexOf(' '));
        insert acc;
        system.debug('acc::'+acc);
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0){
            for (integer i = 0 ; i > email.binaryAttachments.size() ; i++){
                
                //Create Document
                ContentVersion cv = new ContentVersion();
                cv.Title = email.binaryAttachments[i].filename;
                cv.PathOnClient = email.binaryAttachments[i].filename;
                cv.VersionData = email.binaryAttachments[i].body;
                cv.IsMajorVersion = true;
                Insert cv;
                
                system.debug('cv::'+cv);
                
                //Get Content Documents
                Id conDocId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
                
                //Create ContentDocumentLink 
                ContentDocumentLink cdl = New ContentDocumentLink();
                cdl.LinkedEntityId = acc.Id;
                cdl.ContentDocumentId = conDocId;
                cdl.shareType = 'V';
                Insert cdl;
                system.debug('cdl::'+cdl);
            }
        }
        return result;
    }
}
/* Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String subToCompare = 'Create Contact';
        List<Attachment> attachmentList = new List<Attachment>();
        if(email.subject.equalsIgnoreCase(subToCompare)) {
            Contact c = new Contact();
            c.LastName = email.plainTextBody;
            insert c;
             
            // Save attachments, if any
            if(email.textAttachments!=null) {
                for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                    Attachment attachment = new Attachment();
                    attachment.Name = tAttachment.fileName;
                    attachment.Body = Blob.valueOf(tAttachment.body);
                    attachment.ParentId = c.Id;
                    attachmentList.add(attachment);
                }
            }
 
            //Save any Binary Attachment
            if(email.binaryAttachments!=null){
                for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                    Attachment attachment = new Attachment();
                    attachment.Name = bAttachment.fileName;
                    attachment.Body = bAttachment.body;
                    attachment.ParentId = c.Id;
                    attachmentList.add(attachment);
                }
            }
 
            if(!attachmentList.isEmpty()){
                insert attachmentList;
            }
        }
        result.success = true;
*/