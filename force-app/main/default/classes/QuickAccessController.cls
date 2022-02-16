public with sharing class QuickAccessController {
    @AuraEnabled
    public static list <ApexClass> apexClasses(String apexKey){
        try{
            //system.debug("apexkey:"+apexKey);
            apexKey = '%' + apexKey + '%';
            list <ApexClass> apexClasses = new List<ApexClass>([select id,Name from ApexClass where Name like :apexKey  AND NamespacePrefix = null AND Status = 'Active' ORDER BY Name ASC]);
            return apexClasses;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()+' <----> '+e.getLineNumber());
        }
    }
    
    @AuraEnabled
    public static list <ApexPage> apexPages(String pageKey){
        try{
            //system.debug("apexkey:"+apexKey);
            system.debug('');
            pageKey = '%' + pageKey + '%';
            list <ApexPage> ApexPage = new List<ApexPage>([select id,Name from ApexPage where Name like :pageKey  AND NamespacePrefix = null ORDER BY Name ASC]);
            return ApexPage;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled
    public static list <userWrapper> getUserList(String userNameKey){
        try{
            List<userWrapper> userWrapperList = new List<userWrapper>();
            //system.debug("apexkey:"+apexKey);
            if(userNameKey != null){
                userNameKey = '%' + userNameKey + '%';
                list <User> userList = new List<User>([SELECT Id, Name, Username, Profile.Name,ProfileId, IsActive, Read_Write_Access__c, VG_Underwriter__c, Line_Of_Business__c, Underwriter_Access__c, Underwriter_Product__c FROM User Where Name like :userNameKey AND IsActive=true ORDER BY Name ASC]);
                for(User u: userList){
                    userWrapper uw = new userWrapper();
                    uw.userId = u.Id;
                    uw.Name = u.Name;
                    uw.isActive = u.IsActive;
                    uw.Username = u.Username;
                    uw.ProfileName = u.Profile.Name;
                    system.debug('u.Read_Write_Access__c::'+u.Read_Write_Access__c);
                    if(u.Read_Write_Access__c != null)
                        uw.ReadWriteAccess = u.Read_Write_Access__c;
                    if(u.Read_Write_Access__c != null)
                        uw.UWAccess = u.Underwriter_Access__c;
                    uw.UWCheck = u.VG_Underwriter__c;
                    userWrapperList.add(uw);
                }
                system.debug('userWrapperList::'+userWrapperList);
            }
            
            return userWrapperList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()+e.getLineNumber());
        }
    }
    
    @AuraEnabled
    public static list <userWrapper> getUserListByFilter(String userRWAccess, Boolean underwriterCheck){
        try{
            if(underwriterCheck == null)
                underwriterCheck = false;
            List<userWrapper> userWrapperList = new List<userWrapper>();
            system.debug('userRWAccess::'+userRWAccess+'::'+underwriterCheck);
            String RWAccess = userRWAccess;
            list <User> userList = new List<User>([SELECT Id, Name, Username, Profile.Name,ProfileId, IsActive, Read_Write_Access__c, VG_Underwriter__c, Line_Of_Business__c, Underwriter_Access__c, Underwriter_Product__c FROM User Where Read_Write_Access__c INCLUDES(:RWAccess) AND IsActive=true AND VG_Underwriter__c=:underwriterCheck  ORDER BY Name ASC]);
            for(User u: userList){
                userWrapper uw = new userWrapper();
                uw.userId = u.Id;
                uw.Name = u.Name;
                uw.isActive = u.IsActive;
                uw.Username = u.Username;
                uw.ProfileName = u.Profile.Name;
                system.debug('u.Read_Write_Access__c::'+u.Read_Write_Access__c);
                if(u.Read_Write_Access__c != null)
                    uw.ReadWriteAccess = u.Read_Write_Access__c;
                if(u.Read_Write_Access__c != null)
                    uw.UWAccess = u.Underwriter_Access__c;
                uw.UWCheck = u.VG_Underwriter__c;
                userWrapperList.add(uw);
            }
            system.debug('userWrapperList::'+userWrapperList);
            return userWrapperList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()+e.getLineNumber());
        }
    }
    
    @AuraEnabled
    public static list <customLabelWrapper> getCustomLabel(){
        try{
            List<customLabelWrapper> customLabelWrapperList = new List<customLabelWrapper>();
            Id customLabelIdValue;
            String customLabelNameValue;
            
            // Tooling API - using tooling api to query custom labels
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID()); //Get user Session ID
            req.setHeader('Content-Type', 'application/json');
            String SFdomainUrl=URL.getOrgDomainUrl().toExternalForm();
            String query= 'Select+id,Name+From+CustomLabel';
            //String query='Select+id,FullName,createdDate,TableEnumOrId,ValidationName,Metadata+from+ValidationRule';
            //string query='Select+id,Name+from+WorkflowRule'; //use this query to get Workflow Rule
            req.setEndpoint(SFdomainUrl+'/services/data/v53.0/tooling/query/?q='+query);
            req.setMethod('GET');
            Http h = new Http();
            HttpResponse response = h.send(req);
            String jsonData = response.getBody();
            system.debug('JsonData::'+jsonData);
            
            JSONParser parser = JSON.createParser(jsonData);
            while (parser.nextToken() != null) {
                if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                    while (parser.nextToken() != null) {
                        if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                            system.debug('parser1::'+parser.nextValue()+':::'+parser.getCurrentToken());
                            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                                system.debug('parser2::'+parser.nextValue()+'::'+parser.getText()+'::'+JSONToken.values());
                                system.debug('val::'+parser.nextToken()+'::'+parser.getCurrentToken()+'::'+JSONToken.FIELD_NAME);
                                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                    system.debug('parser3::'+parser.nextValue());
                                    system.debug('val2::'+parser.nextToken()+'::'+parser.getCurrentToken()+'::'+JSONToken.FIELD_NAME);
                                    if (parser.getCurrentToken() == JSONToken.END_OBJECT) {
                                        system.debug('parser4::'+parser.nextValue()+'::'+parser.getText());
                                        customLabelIdValue = parser.getText(); // custom label Id
                                        system.debug('val3::'+parser.nextToken()+'::'+parser.getCurrentToken()+'::'+JSONToken.FIELD_NAME);
                                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                            system.debug('parser5::'+parser.nextValue()+'::'+parser.getText());
                                            //if(parser.nextValue() == JSONToken.VALUE_STRING){
                                                customLabelNameValue = parser.getText(); // custom label name
                                            //}
                                            system.debug('val4::'+parser.nextToken()+'::'+parser.getCurrentToken()+'::'+JSONToken.FIELD_NAME);
                                            system.debug('customLabelNameValue::'+customLabelNameValue+'::'+'customLabelIdValue::'+customLabelIdValue);
                                            // custom label wrapper
                                            customLabelWrapper clw = new customLabelWrapper();
                                            clw.labelIds = customLabelIdValue;
                                            clw.Name = customLabelNameValue;
                                            customLabelWrapperList.add(clw);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            system.debug('List<customLabelWrapper>::'+customLabelWrapperList);
            system.debug('List<customLabelWrapper>::'+customLabelWrapperList.size());
            return customLabelWrapperList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static map<string, string> getAllObjects(){
        map<string, string> objectList = new map<string, string>();
        for(Schema.SObjectType o : Schema.getGlobalDescribe().values() ){
            Schema.DescribeSObjectResult objResult = o.getDescribe();
            objectList.put(objResult.getName(), objResult.getLabel());
        }
        return objectList;
    }

    @AuraEnabled
    public static List<String> getAllFields(string selectedObject){
        SObjectType objType = Schema.getGlobalDescribe().get(selectedObject);
        Map<String,Schema.SObjectField> mfields = objType.getDescribe().fields.getMap();
        List<String> sObjectDetailsList = new List<String>();
        for(String s : mfields.keySet()){
            sObjectDetailsList.add(String.valueOf(mfields.get(s)));
        }
        return sObjectDetailsList;
    }

    @AuraEnabled
    public static List<sObject> getListOfRecords(string query){
        List<sObject> sobjList = Database.query(query);
        return sobjList;
    }
    
    Public Class userWrapper{
        @AuraEnabled
        Public Id userId{get;set;}
        @AuraEnabled
        Public Boolean isActive{get;set;}
        @AuraEnabled
        Public String Name{get;set;}
        @AuraEnabled
        Public String Username{get;set;}
        @AuraEnabled
        Public String ProfileName{get;set;}
        @AuraEnabled
        Public String ReadWriteAccess{get;set;}
        @AuraEnabled
        Public String UWAccess{get;set;}
        @AuraEnabled
        Public Boolean UWCheck{get;set;}
    }
    
    Public Class customLabelWrapper{
        @AuraEnabled
        Public Id labelIds{get; set;}
        @AuraEnabled
        Public String Name{get; set;}
    }
    
}