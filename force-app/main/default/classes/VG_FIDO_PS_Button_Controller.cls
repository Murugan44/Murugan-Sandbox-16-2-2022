public class VG_FIDO_PS_Button_Controller {
    
    @AuraEnabled
    public static Policy_Schedule__c getPolicySchedule(Id psId){
        Policy_Schedule__c ps = [select id, Name, RecordType.Name, VG_Entity_Split_Required__c,CurrencyIsoCode, Policy__c, Policy__r.MTA_Cancel_List__c, Policy__r.Policy_Status__c, Policy__r.VG_Sub_Status__c, VG_Status__c, VG_MTA_Type__c, VG_Is_MTA__c, Product__c from Policy_Schedule__c where id=:psId limit 1];
        return ps;
    }
    
    @AuraEnabled
    public static String getCurrentUser(){
        String user = UserInfo.getName();
        return user;
    }
    
    @AuraEnabled
    public static String updateRiskDatePS(Policy_Schedule__c psObj, Id psId){
        system.debug('Strat dates::'+psObj.VG_Risk_Start_Date__c);
        system.debug('end dates::'+psObj.VG_Risk_End_Date__c);
        
        List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps = new Policy_Schedule__c();
        ps = [Select Id, Name, VG_Risk_Start_Date__c,VG_Entity_Split_Required__c, VG_Risk_End_Date__c, Policy__r.VG_Expiry_Date__c from Policy_Schedule__c where Id =: psId];
        ps.VG_Risk_Start_Date__c = psObj.VG_Risk_Start_Date__c;
        ps.VG_Risk_End_Date__c = psObj.VG_Risk_End_Date__c;
        ps.Base_Creation_End_Date__c = psObj.VG_Risk_End_Date__c;
        ps.Base_Creation_Start_Date__c = psObj.VG_Risk_Start_Date__c;
        ps.VG_MTA_Start_Date__c = psObj.VG_Risk_Start_Date__c;
        ps.VG_MTA_End_Date__c = psObj.VG_Risk_End_Date__c;
        psList.add(ps);
        system.debug('psList::>>'+psList);
        
        List<Policy__c> polList = new List<Policy__c>();
        String policyId = ps.Policy__c;
        system.debug('String policyId = ps.Policy__c::'+policyId);
        Policy__c pol = new Policy__c();
        pol = [Select Id,Name,VG_Expiry_Date__c  From Policy__c Where Id =: policyId];
        if(!psList.isEmpty()){
            pol.VG_Expiry_Date__c = psObj.VG_Risk_End_Date__c;
            polList.add(pol);
            update polList;
        }
        
        
        if(ps.VG_Entity_Split_Required__c){
        system.debug('Strat dates1::'+psObj.VG_Risk_Start_Date__c);
        system.debug('end dates1::'+psObj.VG_Risk_End_Date__c);
            String otherPSName = ps.Name.remove('/EEA').remove('/NonEEA');
            if(ps.Name.contains('/EEA')){
                otherPSName += '/NonEEA';
            }
            if(ps.Name.contains('/NonEEA')){
                otherPSName += '/EEA';
            }
            try{
                Policy_Schedule__c otherPS = [Select Id, Name, VG_Status__c, VG_Entity_Split_Required__c from Policy_Schedule__c where Name =: otherPSName];
                otherPS.VG_Risk_Start_Date__c = psObj.VG_Risk_Start_Date__c;
                otherPS.VG_Risk_End_Date__c = psObj.VG_Risk_End_Date__c;
                otherPS.Base_Creation_Start_Date__c = psObj.VG_Risk_Start_Date__c;
                otherPS.Base_Creation_End_Date__c = psObj.VG_Risk_End_Date__c;
                otherPS.VG_MTA_Start_Date__c = psObj.VG_Risk_Start_Date__c;
                otherPS.VG_MTA_End_Date__c = psObj.VG_Risk_End_Date__c;
                psList.add(otherPS);
                system.debug('psListBOTH::'+psList);
            }catch(Exception ex){
            
            }
        }
        
        
        
        update psList;
        return null;
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
    public static String deletePolicySchedule(Id psId){
        Policy_Schedule__c ps = [select id, Policy__c from Policy_Schedule__c where id=:psId limit 1];
        String policyId = ps.Policy__c;   
        delete ps;
        return policyId;
    }   
    
     @AuraEnabled
    Public Static Void createPI_Quote_SheetAttachment(Id psId){
            Policy_Schedule__c ps = [select id, Name, Product__c , VG_Status__c from Policy_Schedule__c where id=:psId limit 1];
            System.debug('Stat2::'+ps);    
            If(ps.Product__c == 'PI' || ps.Product__c == 'W&I'){
                VG_Attachment__c customAttachment;
                Attachment attachment = new Attachment();
                PageReference policyPDF;
                policyPDF = Page.VG_FIDO_PI_Quotation;
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
                    attachment.name ='VTS Quote Sheet'+System.today().format()+'.doc';                   
                    attachment.parentId = psId;
                    Insert attachment;
                    System.debug('attachment::'+attachment);
                    customAttachment = new VG_Attachment__c();
                    customAttachment.VG_Attachment__c = attachment.Id;
                    customAttachment.VG_Folder__c = 'Policy Documentation';
                    customAttachment.VG_Policy_Schedule__c = attachment.parentId;
                    customAttachment.Name = attachment.Name;
                    Insert customAttachment;
                    System.debug('customAttachment::'+customAttachment);
                }
            }
        }
        
         @AuraEnabled
    Public Static Void createPI_Schedule_Attachment(Id psId){
            Policy_Schedule__c ps = [select id, Name, Product__c , VG_Status__c from Policy_Schedule__c where id=:psId limit 1];
            System.debug('Stat2::'+ps);    
            If(ps.Product__c == 'PI'){
                VG_Attachment__c customAttachment;
                Attachment attachment = new Attachment();
                PageReference policyPDF;
                policyPDF = Page.VG_FIDO_PI_Schedule;
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
                    attachment.name ='VTS Schedule Sheet'+System.today().format()+'.doc';                   
                    attachment.parentId = psId;
                    Insert attachment;
                    System.debug('attachment::'+attachment);
                    customAttachment = new VG_Attachment__c();
                    customAttachment.VG_Attachment__c = attachment.Id;
                    customAttachment.VG_Folder__c = 'Policy Documentation';
                    customAttachment.VG_Policy_Schedule__c = attachment.parentId;
                    customAttachment.Name = attachment.Name;
                    Insert customAttachment;
                    System.debug('customAttachment::'+customAttachment);
                }
            }
        }
    }