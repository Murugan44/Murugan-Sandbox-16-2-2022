public class VG_VCL_PS_Button_Controller {
    
    @AuraEnabled
    public static Policy_Schedule__c getPolicySchedule(Id psId){
        Policy_Schedule__c ps = [select id, Name, CurrencyIsoCode, Policy__c,VG_Type_Of_Operation__c, Policy__r.MTA_Cancel_List__c, Policy__r.Policy_Status__c, Policy__r.VG_Sub_Status__c, VG_Status__c, VG_MTA_Type__c, VG_Is_MTA__c, Product__c from Policy_Schedule__c where id=:psId limit 1];
        return ps;
    }
    
    @AuraEnabled
    public static String getCurrentUser(){
        String user = UserInfo.getName();
        return user;
    }
    
    @AuraEnabled
    public static String deletePolicySchedule(Id psId){
        Policy_Schedule__c ps = [select id, Policy__c from Policy_Schedule__c where id=:psId limit 1];
        String policyId = ps.Policy__c;   
        delete ps;
        return policyId;
    }  
    
    @AuraEnabled
    public static void bookPolicySchedule(Id psId){
        List<Policy_Schedule__c> tbu = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps = new Policy_Schedule__c();
        ps = [Select Id, Name, VG_Entity_Split_Required__c from Policy_Schedule__c where Id =: psId];
        ps.VG_Status__c='Booked';
        tbu.add(ps);
        if(ps.VG_Entity_Split_Required__c){
            String otherPSName = ps.Name.remove('/EEA').remove('/NonEEA');
            if(ps.Name.contains('/EEA')){
                otherPSName += '/NonEEA';
            }
            if(ps.Name.contains('/NonEEA')){
                otherPSName += '/EEA';
            }
            try{
                Policy_Schedule__c otherPS = [Select Id, Name, VG_Status__c, VG_Entity_Split_Required__c from Policy_Schedule__c where Name =: otherPSName];
                otherPS.VG_Status__c='Booked';
                tbu.add(otherPS);
            }catch(Exception ex){
            
            }
        }
        update tbu;
    }
    
    @AuraEnabled
    Public Static Void createVCl_Liability_Attachment(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_Liability_Document;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'Underlying Liability Schedule'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    @AuraEnabled
    Public Static Void create_VCL_OPCF19A_Attachment(Id PSId){
        
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_OPCF19A;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'OPCF19A'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    @AuraEnabled
    Public Static Void create_VCL_OPCF2_Attachment(Id PSId){
        
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_OPCF2;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'Motor Endorsement Document'+System.today().format()+'.pdf';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
        
    @AuraEnabled
    Public Static Void create_VCL_Commercial_GLPL_Attachment(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_Commercial_GLPL;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            attachment.body = body;
            attachment.name = 'VCL Commercial GLPL'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    
    @AuraEnabled
    Public Static Void create_VCL_Wrap_UP_Attachment(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_Wrap_UP;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            attachment.body = body;
            attachment.name = 'VCL Wrap Up'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    
    @AuraEnabled
    Public Static Void create_VCL_VolantePropertyDeclaration(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c, VG_Type_Of_Operation__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_VolantePropertyDeclaration;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'Volante Property Declaration'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    
    @AuraEnabled
    Public Static Void create_VCL_VolanteUmbrellaDeclaration(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c,Policy__r.Policy_Status__c, VG_Status__c, VG_Type_Of_Operation__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_VolanteUmbrellaDeclaration;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'Volante Umbrella Declaration'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    
    @AuraEnabled
    Public Static Void create_VCL_VolanteExcessDeclaration(Id PSId){
        Policy_Schedule__c ps = [select id, Name, Product__c, VG_Status__c, VG_Type_Of_Operation__c from Policy_Schedule__c where id=:PSId limit 1];
        System.debug('Stat2::'+ps);    
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VCL_VolanteExcessDeclaration;
        policyPDF.getParameters().put('Id',psId);
        policyPDF.setRedirect(true);
        if(policyPDF != null){
            Blob body;
            if(!test.isRunningTest()){
                body = policyPDF.getContent();//policyPDF.getContentAsPDF();
            }else{
                body = blob.valueof('TEST');
            }
            //body = policyPDF.getContentAsPDF();
            System.debug('Body is:'+body);
            attachment.body = body;
            attachment.name = 'Volante Excess Declaration'+System.today().format()+'.doc';                   
            attachment.parentId = psId;
            Insert attachment;
            System.debug('attachment::'+attachment);
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachment.id LIMIT 1];
            
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
            cVersion.PathOnClient = attach.Name;//File name with extention
            cVersion.Origin = 'C';//C-Content Origin. H-Chatter Origin.
            cVersion.OwnerId = attach.OwnerId;//Owner of the file
            cVersion.Title = attach.Name;//Name of the file
            cVersion.VersionData = attach.Body;//File content
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;//Add ContentDocumentId
            cDocLink.LinkedEntityId = attach.ParentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment = new VG_Attachment__c();
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Folder__c = 'Policy Documentation';
            customAttachment.VG_Policy_Schedule__c = attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
}