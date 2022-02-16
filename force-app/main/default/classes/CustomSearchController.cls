/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-16-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CustomSearchController {
    @AuraEnabled
    public static list <ApexClass> apexClasses(String apexKey){
        try{
            //system.debug("apexkey:"+apexKey);
            apexKey = '%' + apexKey + '%';
            list <ApexClass> apexClasses = new List<ApexClass>([select id,Name from ApexClass where Name like :apexKey  AND NamespacePrefix = null AND Status = 'Active' ORDER BY Name ASC]);
            return apexClasses;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled
    public static list <ApexPage> apexPages(String pageKey){
        try{
            //system.debug("apexkey:"+apexKey);
            pageKey = '%' + pageKey + '%';
            list <ApexPage> ApexPage = new List<ApexPage>([select id,Name from ApexPage where Name like :pageKey  AND NamespacePrefix = null ORDER BY Name ASC]);
            return ApexPage;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}