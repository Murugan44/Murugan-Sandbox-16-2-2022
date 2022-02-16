global class EmailParse implements Messaging.InboundEmailHandler{
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        //system.debug('email::'+email);
        //String myPlainText= JSON.serialize(email.PlainTextBody);
        //system.debug('myPlainText:::'+myPlainText);
        String myPlainText= email.PlainTextBody; 
        
        system.debug('myPlainText::'+myPlainText+'::'+Json.serializePretty(myPlainText));
       
        system.debug('email.PlainTextBody 3::'+myPlainText.split('\r'));
        List<Object> bodySplitted = myPlainText.split('\r');
        system.debug('bodySplitted:::'+JSON.serialize(bodySplitted)+'::'+bodySplitted.size());
        List<contactWrapper> contWrapper = new List<contactWrapper>();
        for(Object p:bodySplitted){
            system.debug('p::'+p);
            contactWrapper ptaxw = (contactWrapper)JSON.deserialize(JSON.serialize(p), contactWrapper.class);
            contWrapper.add(ptaxw);
        }
        
        //Account acc = new Account();
        Contact contact = new Contact();
        /*String firstName = bodySplitted[0].substringAfter(': '); 
        String LastName = bodySplitted[0].substringAfter(': ');  
        String conEmail = bodySplitted[0].substringAfter(': ');   
        String phone = bodySplitted[0].substringAfter(': ');            
        String Description = bodySplitted[0].substringAfter(': ');
        //system.debug('firstName::'+firstName);
        contact.FirstName = firstName;
        contact.LastName = LastName;
        contact.Email = conEmail;
        contact.Phone = phone;
        contact.Description = Description;*/
        system.debug('contact::'+contact);
        insert contact;
        //acc.Name = myPlainText.valueOf(Name);
        //acc.Name = myPlainText.substringBetween('<AccountName>', '</AccountName>');
        //acc.AccountNumber = myPlainText.substringBetween('<AccountNo>', '</AccountNo>');
        //system.debug('acc::'+acc);
        //Database.SaveResult insertAccRecord = Database.insert(acc);
        //insert acc;
        
        /*Contact contact = new Contact();
        contact.FirstName = email.fromname.substring(0,email.fromname.indexOf(' '));
        contact.LastName = email.fromname.substring(email.fromname.indexOf(' '));
        contact.Email = envelope.fromAddress;
        insert contact;
        System.debug(' Created contact '+contact.Id);
        
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0){
            for (integer i = 0 ; i > email.binaryAttachments.size() ; i++){
                Attachment attachment = new Attachment();
                // attach to the newly created contact record
                attachment.ParentId = contact.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                insert attachment;
            }
        }*/
        
        return result;
    }
    
    global class contactWrapper{
        global String FirstName{get;set;}
        global String LastName{get;set;}
    }

}