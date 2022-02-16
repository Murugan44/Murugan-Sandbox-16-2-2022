global class EmailServiceController implements Messaging.InboundEmailHandler{
    global String jsonDataCsv{get;set;}
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        //system.debug('emaill::'+email.plainTextBody);
        String EmailBody = utils.parseEmail(email.plainTextBody);
        //system.debug('email.binaryAttachments::'+email.binaryAttachments);
        
        if(email.binaryAttachments!=null){
            for(Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments){
                jsonDataCsv = Utils.parseCSV(bAttachment.body);
            }
        }
        System.debug('jsonData from EmailBody::' + EmailBody);
        system.debug('jsonDataCsv from attach::'+jsonDataCsv);
        return null;
    }
}