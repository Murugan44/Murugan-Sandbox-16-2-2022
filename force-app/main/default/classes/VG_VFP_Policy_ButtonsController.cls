public with sharing class VG_VFP_Policy_ButtonsController {
    @AuraEnabled
    public static List<Policy__c> getPolicyStatus(Id polId){
        List<Policy__c> polList=new List<Policy__c>();
        Policy__c pol=[select id,Name,Policy_Status__c,VG_Sub_Status__c,Broker_Name__r.Name,VG_Is_Renewal__c,CurrencyIsoCode,VG_Renewal_Policy_Id__c,Insured__c,MTA_Cancel_List__c from Policy__c where id=:polId limit 1];
        polList.add(pol);
        if(pol.VG_Renewal_Policy_Id__c!=null){
            Policy__c renewalPol=[select id,Name,Policy_Status__c,Broker_Name__r.Name,VG_Is_Renewal__c,CurrencyIsoCode,VG_Renewal_Policy_Id__c,Insured__c,MTA_Cancel_List__c from Policy__c where id=:pol.VG_Renewal_Policy_Id__c limit 1];
            polList.add(renewalPol);
        }
        return polList;
    }
    
    @AuraEnabled
    public static Boolean getCheckRunOffDates(Id polId){
        Boolean isRunOffDates = true;
        Date BaseCreationStart; 
        List<Policy_Schedule__c> nonRunOffPSList = new List<Policy_Schedule__c>();
        List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([select id, Name,Base_Creation_Start_Date__c,Base_Creation_End_Date__c,Policy__r.VG_Expiry_Date__c,VG_Risk_Start_Date__c,MTA_Parent_Policy_Schedule__r.Base_Creation_End_Date__c,VG_MTA_Start_Date__c, RecordType.Name, VG_Type_Of_Operation__c,VG_Entity_Split_Required__c,CurrencyIsoCode, Policy__c, Policy__r.MTA_Cancel_List__c, Policy__r.Policy_Status__c, Policy__r.VG_Sub_Status__c, VG_Status__c, VG_MTA_Type__c, VG_Is_MTA__c, Product__c from Policy_Schedule__c where Policy__c =: polId ORDER BY Base_Creation_Start_Date__c]);
        for(Policy_Schedule__c ps: psList){
            if(ps.VG_MTA_Type__c != 'Run-Off')
                nonRunOffPSList.add(ps);
            if(ps.VG_MTA_Type__c == 'Run-Off')
                BaseCreationStart = ps.Base_Creation_Start_Date__c-1;         
        }
        for(Policy_Schedule__c ps: nonRunOffPSList){
            if(BaseCreationStart != null){
                if(BaseCreationStart.isSameDay(ps.Base_Creation_End_Date__c)){
                    isRunOffDates = false;
                }
            }
        }
        if(BaseCreationStart == null)
           isRunOffDates = false;
        
        return isRunOffDates;
    }
    
    @AuraEnabled
    public static Boolean getVSR(Id polId){
        Boolean Is_VSR = false;
        List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([select id, Name, RecordType.Name, VG_Type_Of_Operation__c,VG_Entity_Split_Required__c,CurrencyIsoCode, Policy__c, Policy__r.MTA_Cancel_List__c, Policy__r.Policy_Status__c, Policy__r.VG_Sub_Status__c, VG_Status__c, VG_MTA_Type__c, VG_Is_MTA__c, Product__c from Policy_Schedule__c where Policy__c =: polId]);
        System.debug('psList::'+psList.size());
        for(Policy_Schedule__c ps: psList){
            If(ps.VG_Type_Of_Operation__c == 'CVE - Conservation Easement')
                Is_VSR=True;
        }
        return Is_VSR;
    }
    
    @AuraEnabled
    public static String createRenewalPolicy(Id policyId){
        return VG_RenewalController.createRenewalPolicy(policyId,'VFP');
        
    }
    
    @AuraEnabled
    public static Id getBasePolicy(Id polId){
        Policy__c pol = [select id, Name, Policy_Status__c, CurrencyIsoCode, VG_Renewal_Policy_Id__c, Insured__c, VG_Is_Renewal__c, MTA_Cancel_List__c from Policy__c where VG_Renewal_Policy_Id__c=:polId limit 1];
        System.debug('polid:'+pol.id);
        return pol.id;
    }
    
    @AuraEnabled
    Public Static Void createVSR_Quote_SheetAttachment(Id polId){
        Policy__c pol = [select id, Name, Policy_Status__c, CurrencyIsoCode, VG_Renewal_Policy_Id__c, Insured__c, VG_Is_Renewal__c, MTA_Cancel_List__c from Policy__c where Id=:polId limit 1];
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VFP_VSR_Quote;
        policyPDF.getParameters().put('Id',polId);
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
            attachment.name ='VFP VSR Quote'+System.today().format()+'.doc';                   
            attachment.parentId = polId;
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
            customAttachment.VG_Policy__c= attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
    
    @AuraEnabled
    Public Static Void createVSR_Schedule_SheetAttachment(Id polId){
        Policy__c pol = [select id, Name, Policy_Status__c, CurrencyIsoCode, VG_Renewal_Policy_Id__c, Insured__c, VG_Is_Renewal__c, MTA_Cancel_List__c from Policy__c where Id=:polId limit 1];
        VG_Attachment__c customAttachment;
        Attachment attachment = new Attachment();
        PageReference policyPDF;
        policyPDF = Page.VG_VFP_VSR_Schedule;
        policyPDF.getParameters().put('Id',polId);
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
            attachment.name ='VFP VSR Schedule'+System.today().format()+'.doc';                   
            attachment.parentId = polId;
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
            customAttachment.VG_Policy__c= attachment.parentId;
            customAttachment.Name = attachment.Name;
            Insert customAttachment;
            delete attach;
        }
    }
}