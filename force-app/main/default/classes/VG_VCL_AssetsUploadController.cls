public class VG_VCL_AssetsUploadController{
    Public VG_Attachment__c obj {get; set;}
    Public Id id {get;set;}
    public String description {get;set;} 
    public String AttName {get;set;}
    public String fileName {get;set;}
    public String updatedFileBody {get;set;}
    public string nameFile{get;set;}
    String[] filelines  =  new String[]{};
        public Blob fileBody {get;set;}
    Public Static Boolean coverCatchBlocks  =  False;
    Public Static Boolean AssetAttachment  =  True;
    public List<Asset__c> VCLAssetsupload;
    public List < SelectOption > statusOptions {get;set;}
    public String sObjectType {get; set;}
    public String attType {get; set;}
    public Boolean isAttTypeGiven {get; set;}
    public Document templateFile {get; set;}
    public Boolean policyPageBlockSection {get;set;}
    public List < SelectOption > policyFolderOptions {get;set;}
    Public Account AccName {get; set;}
    Public String Message{get; set;}
    public VG_VCL_AssetsUploadController(){
        obj  =  new VG_Attachment__c();
        id  =  apexpages.currentpage().getparameters().get('id');
        sObjectType  =  apexpages.currentpage().getparameters().get('sObjectType');
        attType  =  apexpages.currentpage().getparameters().get('attType');
        AccName = [Select Id, Name From Account where Id = :id];
        if(attType  ==  null){
            isAttTypeGiven  =  False;
        }else{
            isAttTypeGiven  =  True;
            obj.VG_Attachment_Type__c  =  attType;
        }
        templateFile  =  [Select Id from Document where Name  =  'VCL Assets upload'];        
        VCLAssetsupload = new List<Asset__c>();
        Id attRecordTypeId  =  Schema.SObjectType.VG_Attachment__c.getRecordTypeInfosByName().get('Account').getRecordTypeId();
        obj.RecordTypeId  =  attRecordTypeId;
        statusOptions  =  new List <SelectOption>();
        Schema.DescribeFieldResult statusFieldDescription  =  Schema.VG_Attachment__c.VG_Attachment_Type__c.getDescribe();
        for (Schema.Picklistentry picklistEntry: statusFieldDescription.getPicklistValues()) {
            if(picklistEntry.getValue() !=  'Assets File'){
                statusOptions.add(new SelectOption(pickListEntry.getValue(),  pickListEntry.getLabel()));            
                
            }
            if (picklistEntry.isDefaultValue()) {
                obj.VG_Attachment_Type__c  =  picklistEntry.getValue();
            }
        }
    }
    public Database.SaveResult saveCustomAttachment(){
        obj.Id  =  null;
        obj.VG_Account__c = id;
        obj.VG_Attachment_Type__c  =  attType;
        if(Description != null && Description!= '' )
            obj.VG_Description__c = Description;
        if(attType  ==  'Assets File')
            ReadFile();                
        if(AssetAttachment){
            return Database.insert(obj);
        }else{
            return null;   
        }        
    }
    
    
    public Database.SaveResult saveStandardAttachment(Id parentId){       
        System.debug('coverCatchBlocks:'+coverCatchBlocks+parentId);
        if(coverCatchBlocks){
            Database.SaveResult result = null;
            return result;
        }else{
            Database.SaveResult result;
            Attachment attachment  =  new Attachment();
            attachment.body  =  this.fileBody;
            if(AttName != null && AttName !=  ''){
                String ext  = this.fileName.substringAfter('.');
                if(AttName.length() > 80){
                    AttName = AttName.left(80);
                }
                attachment.Name  =  AttName+'.'+ext;
            }else{
                if(fileName.length() > 80){
                    String ext  = this.fileName.substringAfter('.');
                    fileName = fileName.left(75)+'.'+ext;
                }
                
                attachment.Name  =  this.fileName;
            }
            
            attachment.parentId  =  parentId;
            System.debug('attachment.body::'+attachment.body);
            result  =  Database.insert(attachment);
            fileBody  =  Blob.valueOf(' ');
            return result;
        }
    }
    
    public PageReference processUpload(){
        if(fileBody  ==  null){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Please Upload a file'));
            return null;
        }
        Database.SaveResult customAttachmentResult  =  saveCustomAttachment();        
        if (customAttachmentResult  ==  null || !customAttachmentResult.isSuccess()){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'Could not save attachment.'));
            return null;
        }       
        Database.SaveResult attachmentResult  =  saveStandardAttachment(id);        
        if (attachmentResult  ==  null || !attachmentResult.isSuccess()){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'Could not save attachment.'));            
            return null;
        }else{
            VG_Attachment__c customAttachment  =  [select id from VG_Attachment__c where id  =  :customAttachmentResult.getId()];         
            customAttachment.VG_Attachment__c  =  attachmentResult.getId();
            
            //Get attachment
            Attachment attach = [SELECT Id, OwnerId, Name, Body, ContentType, ParentId From Attachment WHERE ID=:attachmentResult.id LIMIT 1];
            
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
            cDocLink.LinkedEntityId = attach.parentId;//Add attachment parentId
            cDocLink.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            
            customAttachment.VG_Attachment__c = cVersion.Id;
            customAttachment.VG_Account__c = attach.parentId;
            
            if(AttName != null)
                customAttachment.Name = AttName ;
            else
                customAttachment.Name = this.fileName ;
            
            update customAttachment;
            delete attach;
            
            System.debug('Type::'+obj.VG_Attachment_Type__c);
            if(obj.VG_Attachment_Type__c  ==  'TOBA'){
                Account acc  =  new Account();
                acc.Id  =  id;
                acc.VG_TOBA_Uploaded__c  =  True;
                Update acc;
            }
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'File Successfully Attached..', 'File Successfully Attached..'));
            description  =  '';
            return null;
        }
    }  
    
    
    public PageReference back(){
        return new PageReference('/'+id);
    } 
    
    public Pagereference ReadFile(){ 
        try{  
            nameFile = PaymentDetailsController.decode(fileBody, 'ISO-8859-1'); //fileBody.toString();
            String regNum;
            if(nameFile!= null)
                filelines  =  nameFile.split('\n');
            System.debug('Filelines1::'+filelines+'Filelines::'+filelines.size()+'nameFile::'+nameFile);        
            updatedFileBody  =  '';
            for (Integer i = 1;i<filelines.size();i++){
                String[] inputvalues  =  new String[]{};
                    String[] headervalues  =  new String[]{};                             
                        inputvalues  =  filelines[i].split(',');                             
                headervalues  =  filelines[0].split(',');
                System.debug('header::'+headervalues[0]);            
                Asset__c ass  =  new Asset__c();
                ass.VG_Account__c  =  id;
                Map<ID, Schema.RecordTypeInfo> ass_rt_Map  =  Asset__c.sObjectType.getDescribe().getRecordTypeInfosById();        
                Id VCLRecordTypeId  =  Schema.SObjectType.Asset__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
                ass.RecordTypeId = VCLRecordTypeId;
                
                if(headervalues[0] == 'Location'){          
                    if(inputvalues[0] !=  '' && inputvalues[0] != null)
                        ass.VG_Location__c = inputvalues[0].trim(); 
                    if(inputvalues[1] !=  '')
                        ass.VG_Site_Name__c =  inputvalues[1].trim();
                    if(inputvalues[2] !=  '')
                        ass.VG_Combined_Address__c =  inputvalues[2].trim();
                    if(inputvalues[3] !=  '')
                        ass.VG_Street_Number__c  =  inputvalues[3].trim();   
                    if(inputvalues[4] !=  '')
                        ass.VG_Street_Name__c =  inputvalues[4].trim();                
                    if(inputvalues[5] !=  '')   
                        ass.VG_City__c  =  inputvalues[5].trim();
                    if(inputvalues[6] !=  '')     
                        ass.VG_Province_State__c  =  inputvalues[6].trim();
                    if(inputvalues[7] !=  '')
                        ass.VG_Country__c  =  inputvalues[7].trim();
                    if(inputvalues[8] !=  '')
                        ass.VG_Postal_Code__c  =  inputvalues[8].trim();
                    if(inputvalues[9] !=  '')
                        ass.VG_Latitude__c =  inputvalues[9].trim();  
                    if(inputvalues[10] !=  '')
                        ass.VG_Longitude__c =  inputvalues[10].trim();    
                    if(inputvalues[11] !=  '')
                        ass.VG_Flood_Zone__c =  inputvalues[11].trim();  
                    if(inputvalues[12] !=  '')
                        ass.VG_EQ_Hazard__c =  inputvalues[12].trim(); 
                    if(inputvalues[13] !=  '')   
                        ass.VG_Cresta_Zone__c = inputvalues[13].trim();                    
                    if(inputvalues[14] !=  '')
                        ass.CurrencyIsoCode  =  inputvalues[14].trim();
                    if(inputvalues[15] !=  '')
                        ass.VG_Building_SI__c  =  Decimal.valueOf(inputvalues[15].trim());    
                    if(inputvalues[16] !=  '')
                        ass.VG_Contents_SI__c  =  Decimal.valueOf(inputvalues[16].trim());
                    if(inputvalues[17] !=  '')
                        ass.VG_Total_Business_Interruption_SI__c  =  Decimal.valueOf(inputvalues[17].trim());
                    if(inputvalues[18] !=  '')
                        ass.VG_BI_Indemnity_Period__c = inputvalues[18].trim();
                    if(inputvalues[19] !=  '')
                        ass.VG_Total_TIV__c  =  Decimal.valueOf(inputvalues[19].trim());
                    if(inputvalues[20] !=  '')
                        ass.VG_Occupancy__c  =  inputvalues[20].trim();
                    if(inputvalues[21] !=  '')
                        ass.VG_Construction__c  =  inputvalues[21].trim();
                    if(inputvalues[22] !=  '')
                        ass.VG_Storeys_above_grade__c =  Decimal.valueOf(inputvalues[22].trim());
                    if(inputvalues[23] !=  '')
                        ass.VG_Storeys_below_grade__c =  Decimal.valueOf(inputvalues[23].trim());
                    if(inputvalues[24] !=  '')
                        ass.VG_Automatic_sprinklers__c  =  inputvalues[24].trim();
                    if(inputvalues[25] !=  '')   
                        ass.VG_FUS_Zone__c = inputvalues[25].trim();
                    if(inputvalues[26] !=  '')   
                        ass.VG_PD_MFL__c =  Decimal.valueOf(inputvalues[26].trim());
                    if(inputvalues[27] !=  '')
                        ass.VG_PD_MFL_Percent__c = Decimal.valueOf(inputvalues[27].trim());
                    if(inputvalues[28] !=  '')   
                        ass.VG_BI_MFL__c = Decimal.valueOf(inputvalues[28].trim());
                    if(inputvalues[29] !=  '')
                        ass.VG_BI_MFL_Percent__c = Decimal.valueOf(inputvalues[29].trim());
                    if(inputvalues[30] !=  '')
                        ass.VG_Lloyds_Constuction_Code__c = inputvalues[30].trim();
                    if(inputvalues[31] !=  '')
                        ass.VG_Lloyd_s_Occupancy_Code__c = inputvalues[31].trim();
                    if(inputvalues[32] !=  '')
                        ass.VG_Year_Built__c = inputvalues[32].trim();
                    if(inputvalues[33] !=  '') 
                        ass.VG_Occupancy_By_Insured__c = inputvalues[33].trim();
                    if(inputvalues[34] !=  '')
                        ass.VG_Occupancy_By_Others__c = inputvalues[34].trim();
                    if(inputvalues[35] !=  '')
                        ass.VG_Construction_Type__c = inputvalues[35].trim();
                    if(inputvalues[36] !=  '')
                        ass.VG_Fire_Protection__c = inputvalues[36].trim();
                    if(inputvalues[37] !=  '')
                        ass.VG_Has_Sprinkler_System__c = inputvalues[37].trim();
                    if(inputvalues[38] !=  '')
                        ass.VG_Current_Year_Rate__c = inputvalues[38].trim();
                    if(inputvalues[39] !=  '')
                        ass.VG_Expiring_Rate__c = inputvalues[39].trim();                       
                    if(inputvalues[40] !=  '')
                        ass.VG_Is_Flood_Covered__c = inputvalues[40].trim();
                    if(inputvalues[41] !=  '')
                        ass.VG_Last_Year_Structurally_Updated_YYYY__c = inputvalues[41].trim();
                    if(inputvalues[42] !=  '')
                        ass.VG_Population__c = inputvalues[42].trim();
                    if(inputvalues[43] !=  '')
                        ass.VG_Participation_Schedule__c = inputvalues[43].trim();
                    if(ass_rt_Map.get(ass.RecordTypeId).getName() == 'VCL')                 
                        ass.Name = ass.VG_Site_Name__c+ass.VG_Street_Number__c+', '+ass.VG_City__c;                     
                }else if(headervalues[0] == 'SFDC Record Id'){
                    if(inputvalues[0] !=  '')
                        ass.id  =  inputvalues[0].trim(); 
                    if(inputvalues[1] !=  '' && inputvalues[1] != null)
                        ass.VG_Location__c = inputvalues[1].trim();
                    if(inputvalues[2] !=  '' && inputvalues[2] != null)
                        ass.VG_Site_Name__c = inputvalues[2].trim(); 
                    if(inputvalues[3] !=  '')
                        ass.VG_Combined_Address__c =  inputvalues[3].trim();   
                    if(inputvalues[4] !=  '')
                        ass.VG_Street_Number__c  =  inputvalues[4].trim();   
                    if(inputvalues[5] !=  '')
                        ass.VG_Street_Name__c =  inputvalues[5].trim();                
                    if(inputvalues[6] !=  '')   
                        ass.VG_City__c  =  inputvalues[6].trim();
                    if(inputvalues[7] !=  '')     
                        ass.VG_Province_State__c  =  inputvalues[7].trim();
                    if(inputvalues[8] !=  '')
                        ass.VG_Country__c  =  inputvalues[8].trim();
                    if(inputvalues[9] !=  '')
                        ass.VG_Postal_Code__c  =  inputvalues[9].trim();
                    if(inputvalues[10] !=  '')
                        ass.VG_Latitude__c =  inputvalues[10].trim();  
                    if(inputvalues[11] !=  '')
                        ass.VG_Longitude__c =  inputvalues[11].trim();    
                    if(inputvalues[12] !=  '')
                        ass.VG_Flood_Zone__c =  inputvalues[12].trim(); 
                    if(inputvalues[13] !=  '')
                        ass.VG_EQ_Hazard__c=  inputvalues[13].trim(); 
                    if(inputvalues[14] !=  '')   
                        ass.VG_Cresta_Zone__c = inputvalues[14].trim();                           
                    if(inputvalues[15] !=  '')
                        ass.CurrencyIsoCode  =  inputvalues[15].trim();
                    if(inputvalues[16] !=  '')
                        ass.VG_Building_SI__c  =  Decimal.valueOf(inputvalues[16].trim());    
                    if(inputvalues[17] !=  '')
                        ass.VG_Contents_SI__c  =  Decimal.valueOf(inputvalues[17].trim());
                    if(inputvalues[18] !=  '')
                        ass.VG_Total_Business_Interruption_SI__c  =  Decimal.valueOf(inputvalues[18].trim());
                    if(inputvalues[19] !=  '')
                        ass.VG_BI_Indemnity_Period__c = inputvalues[19].trim();
                    if(inputvalues[20] !=  '')
                        ass.VG_Total_TIV__c  =  Decimal.valueOf(inputvalues[20].trim());
                    if(inputvalues[21] !=  '')
                        ass.VG_Occupancy__c  =  inputvalues[21].trim();
                    if(inputvalues[22] !=  '')
                        ass.VG_Construction__c  =  inputvalues[22].trim();
                    if(inputvalues[23] !=  '')
                        ass.VG_Storeys_above_grade__c =  Decimal.valueOf(inputvalues[23].trim());
                    if(inputvalues[24] !=  '')
                        ass.VG_Storeys_below_grade__c =  Decimal.valueOf(inputvalues[24].trim());
                    if(inputvalues[25] !=  '')
                        ass.VG_Automatic_sprinklers__c  =  inputvalues[25].trim();
                    if(inputvalues[26] !=  '')   
                        ass.VG_FUS_Zone__c = inputvalues[26].trim();
                    if(inputvalues[27] !=  '')   
                        ass.VG_PD_MFL__c =  Decimal.valueOf(inputvalues[27].trim());
                    if(inputvalues[28] !=  '')
                        ass.VG_PD_MFL_Percent__c = Decimal.valueOf(inputvalues[28].trim());
                    if(inputvalues[29] !=  '')   
                        ass.VG_BI_MFL__c = Decimal.valueOf(inputvalues[29].trim());
                    if(inputvalues[30] !=  '')
                        ass.VG_BI_MFL_Percent__c = Decimal.valueOf(inputvalues[30].trim()); 
                    if(inputvalues[31] !=  '')
                        ass.VG_Lloyds_Constuction_Code__c = inputvalues[31].trim();
                    if(inputvalues[32] !=  '')
                        ass.VG_Lloyd_s_Occupancy_Code__c = inputvalues[32].trim();
                    if(inputvalues[33] !=  '')
                        ass.VG_Year_Built__c= inputvalues[33].trim();
                    if(inputvalues[34] !=  '')
                        ass.VG_Occupancy_By_Insured__c = inputvalues[34].trim();
                    if(inputvalues[35] !=  '')
                        ass.VG_Occupancy_By_Others__c = inputvalues[35].trim();
                    if(inputvalues[36] !=  '')
                        ass.VG_Construction_Type__c= inputvalues[36].trim();
                    if(inputvalues[37] !=  '')
                        ass.VG_Fire_Protection__c = inputvalues[37].trim();
                    if(inputvalues[38] !=  '')
                        ass.VG_Has_Sprinkler_System__c = inputvalues[38].trim();
                    if(inputvalues[39] !=  '')
                        ass.VG_Current_Year_Rate__c = inputvalues[39].trim();
                    if(inputvalues[40] !=  '')
                        ass.VG_Expiring_Rate__c = inputvalues[40].trim();
                    if(inputvalues[41] !=  '')
                        ass.VG_Is_Flood_Covered__c = inputvalues[41].trim();
                    if(inputvalues[42] !=  '')
                        ass.VG_Last_Year_Structurally_Updated_YYYY__c = inputvalues[42].trim();
                    if(inputvalues[43] !=  '')
                        ass.VG_Population__c = inputvalues[43].trim();
                    if(inputvalues[44] !=  '')
                        ass.VG_Participation_Schedule__c = inputvalues[44].trim();
                }
                if(ass.VG_Site_Name__c!= null && ass.VG_Street_Number__c!= null && ass.VG_City__c != null)
                    VCLAssetsupload.add(ass);
                    System.debug(':VCLAssetsupload:'+VCLAssetsupload.size());

            }
            updatedFileBody  =  'SFDC Record Id,Location,Site Name,Combined Address,Street Number,Street Name,City,Province/State,Country,Postal Code / Zip Code,Latitude,Longitude,Flood Zone,EQ Hazard,Cresta Zone,Currency,Building SI,Contents SI,Annual Business Interruption SI,BI Indemnity Period (months),Total TIV,Occupancy,Construction type,Storeys above grade,Storeys below grade,Automatic sprinklers,FUS Zone,PD MFL,PD MFL %,BI MFL,BI MFL %,Occupancy By Insured,Occupancy By Others,Construction Type,Fire Protection,Has Sprinkler System,Current Year Rate,Expiring Rate,Is Flood Covered?,Last Year Structurally Updated,Population,Participation Schedule \n';        
            List<Asset__c> insAss = new List<Asset__c>();
            List<Asset__c> updAss = new List<Asset__c>();
            for(Asset__c ass:VCLAssetsupload){
            System.debug(':VCLAssetsupload:'+VCLAssetsupload.size());
                if(ass.id == null){
                    System.debug(':if:');
                    ass.VG_Acc_Name_with_St_City__c = AccName.Name+'_'+ass.VG_Street_Number__c+', '+ass.VG_City__c;     
                    insAss.add(ass);
                }else{
                    System.debug(':else:');
                    updAss.add(ass);
                }
            }
            
            if(!insAss.IsEmpty()){
                upsert insAss VG_Acc_Name_with_St_City__c;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Assets created successfully...'));                  
                
            }
            
            if(!updAss.IsEmpty()){
                update updAss;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Assets Updated successfully...'));                  
                
            }
            for(Asset__c a : VCLAssetsupload){ 
                updatedFileBody  =  updatedFileBody + a.Id;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Location__c;  
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Site_Name__c;  
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Combined_Address__c;                                             
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Street_Number__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Street_Name__c;           
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_City__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Province_State__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Country__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Postal_Code__c; 
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Latitude__c; 
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Longitude__c; 
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Flood_Zone__c; 
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_EQ_Hazard__c; 
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Cresta_Zone__c;                                            
                updatedFileBody  =  updatedFileBody + ', ' + a.CurrencyIsoCode;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Building_SI__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Contents_SI__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Total_Business_Interruption_SI__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_BI_Indemnity_Period__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Total_TIV__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Occupancy__c ;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Construction__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Storeys_above_grade__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Storeys_below_grade__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Automatic_sprinklers__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_FUS_Zone__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_PD_MFL__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_PD_MFL_Percent__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_BI_MFL__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_BI_MFL_Percent__c;            
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Lloyds_Constuction_Code__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Lloyd_s_Occupancy_Code__c;
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Year_Built__c;             
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Occupancy_By_Insured__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Occupancy_By_Others__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Construction_Type__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Fire_Protection__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Has_Sprinkler_System__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Current_Year_Rate__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Expiring_Rate__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Is_Flood_Covered__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Last_Year_Structurally_Updated_YYYY__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Population__c;              
                updatedFileBody  =  updatedFileBody + ', ' + a.VG_Participation_Schedule__c+'\n';         
            }
            fileBody  =  Blob.valueOf(updatedFileBody);                
            AssetAttachment = True;
            return null;
        }catch(Exception e){                                  
            AssetAttachment = false;
            if(e.getMessage().contains('Duplicate external id specified')){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Please check the file ....the combination of Street, Street Number and City already available.'));
                return null;
            }else{
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Error::'+e.getMessage()));
                return null;
            }
            //ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,   'CSV File Format only Accepted. Please check your file format.'));
            //return null;
        }                 
    }
    
}