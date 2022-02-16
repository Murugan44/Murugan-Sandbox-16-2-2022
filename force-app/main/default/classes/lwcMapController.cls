/**
 * @description       : 
 * @author            : Murugan
 * @group             : 
 * @last modified on  : 06-28-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-28-2021   Murugan                           Initial Version
**/
public with sharing class lwcMapController {
    @AuraEnabled(cacheable=true)
    public static List<Account> accountMap(){
        try {
            return [SELECT Id, Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingStateCode, ShippingCountryCode, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}