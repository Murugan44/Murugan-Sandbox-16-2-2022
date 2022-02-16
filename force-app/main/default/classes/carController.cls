/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-20-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-20-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class carController {
    
    //wrapper class
    public class Filters {
        @AuraEnabled
        public String searchKey {get;set;}
        @AuraEnabled
        public Decimal maxPrice {get;set;}
        @AuraEnabled
        public String[] categories {get;set;}
        @AuraEnabled
        public String[] makeType {get;set;}
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCars(Filters  filters) {
        String key, whereClause ='';
        Decimal maxPrice;
        String[] categories, makeType, criteria = new List<String>{};
        if(filters!=null) {
            maxPrice = filters.maxPrice;
            categories = filters.categories;
            makeType = filters.makeType;

            if(!String.isEmpty(filters.searchKey)){
                key = '%'+ filters.searchKey + '%';
                criteria.add('Name LIKE :key');
            }
            if(filters.maxPrice >= 0){
                criteria.add('MSRP__c <= :maxPrice');
            }
            if(filters.categories != null){
                criteria.add('Category__c IN :categories');
            }
            if(filters.makeType != null){
                criteria.add('Make__c IN :makeType');
            }
            if(criteria.size()>0){
                whereClause =  'WHERE ' + String.join(criteria, ' AND ');
            }
        }
        String query = 'SELECT Id, Name, CurrencyIsoCode, Category__c, Control__c, Description__c, Fuel_Type__c, Make__c, MSRP__c, Number_of_Seats__c, Owner__c, Picture_URL__c FROM Car__c ' + whereClause + ' WITH SECURITY_ENFORCED ORDER BY Name';
        return Database.query(query);
        //return [SELECT Id, Name, CurrencyIsoCode, Category__c, Control__c, Description__c, Fuel_Type__c, Make__c, MSRP__c, Number_of_Seats__c, Owner__c, Picture_URL__c FROM Car__c];
    }
    
    @AuraEnabled(Cacheable=true)
    public static Car__c[] getSimilarCars(Id carId, String[] makeType){
        return [SELECT Id, Name, CurrencyIsoCode, Category__c, Control__c, Description__c, Fuel_Type__c, Make__c, MSRP__c, Number_of_Seats__c, Owner__c, Picture_URL__c FROM Car__c Car__c WHERE Make__c IN :makeType AND Id != :carId];
    }
}