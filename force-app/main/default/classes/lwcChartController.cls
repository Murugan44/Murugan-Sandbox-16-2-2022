/**
 * @description       : 
 * @author            : Murugan.SFDoc
 * @group             : 
 * @last modified on  : 07-05-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-05-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class lwcChartController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        try {
            return [select Industry from Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Policy__c> getPol(){
        try {
            return [select Policy_Status__c from Policy__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}