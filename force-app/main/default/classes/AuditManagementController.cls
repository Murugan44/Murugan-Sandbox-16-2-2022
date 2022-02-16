public class AuditManagementController {
    // public static List<Audit_Program__c> apList = new List<Audit_Program__c>();
    // public static List<Account> accList= new List<Account>();
    // public static List<Contact> conList= new List<Contact>();
    // public static Set<Id> setAccId = new Set<Id>();
    // @AuraEnabled(cacheable=true)
    // public static List<sObject> getAcc(Id clientId, Id auditeeClientId){
    //     if(clientId == null && auditeeClientId == null){
    //         apList = new List<Audit_Program__c>([Select Id,Name,Bill_Rate__c,Due_Date__c,Client__c,Client__r.Name,(Select Id, Name,Status__c from Audits__r)  from Audit_Program__c]);
    //          for(Audit_Program__c acc: apList){
    //             setAccId.add(acc.Client__c);
    //         }
    //         accList= new List<Account>([SELECT Id, Name,(Select Id,Name FROM Contacts) FROM Account WHERE Id IN: setAccId]);
    //         return accList;
    //     }else if(auditeeClientId != null){
    //         conList = new List<Contact>([Select Id,Name,AccountId FROM Contact WHERE AccountId=:auditeeClientId]);
    //         return conList;
    //     }else{
    //         apList = new List<Audit_Program__c>([Select Id,Name,Bill_Rate__c,Due_Date__c,Client__c,Client__r.Name,(Select Id, Name,Status__c,Auditee__c,Auditee__r.Name from Audits__r)  from Audit_Program__c where Client__c=:clientId]);
    //         return apList;
    //     }
        
    // }

    // @AuraEnabled(cacheable=true)
    // public static List<Audit_Program__c> getAp(Id apId){
    //     apList = new List<Audit_Program__c>([Select Id,Name,Bill_Rate__c,Due_Date__c,Client__c,Client__r.Name,(Select Id, Name,Status__c,Auditee__c,Auditee__r.Name from Audits__r)  from Audit_Program__c where Id=:apId]);
    //     return apList;
    // }

    @AuraEnabled(cacheable=true)
    public static List<Event> fetchAllEvents(){
        List<Event> eventList = new List<Event>();
        eventList = [Select Id, Subject, WhatId, WhoId,Description, EndDate, EndDateTime, OwnerId,ActivityDate, ActivityDateTime From Event LIMIT 100];
        return eventList;
    }

    @AuraEnabled
    public static Id createEvent(String event){

        //The following logic to be replaced with your respective event object
        if(String.isBlank(event)){
            return null;
        }
        Map<String, Object> eventMap = (Map<String, Object>) JSON.deserializeUntyped(event);
        Event newEvent = new Event();
        newEvent.Subject = eventMap.get('title') != null ? (String)eventMap.get('title') : null;
        String startdate = eventMap.get('start') != null ? 
                            ((String)eventMap.get('start')).replace('T', ' ').replace('.000Z', '') : 
                            null;
        String endDate = eventMap.get('end') != null ? 
                            ((String)eventMap.get('end')).replace('T', ' ').replace('.000Z', '') : 
                            null;
        newEvent.StartDateTime = startdate != null ? Datetime.valueOfGmt(startdate) : null;
        newEvent.EndDateTime = endDate != null ? Datetime.valueOfGmt(endDate) : null;
        newEvent.WhoId = eventMap.get('auditeeId') != null ? (String)eventMap.get('auditeeId') : null;
        newEvent.WhatId = eventMap.get('clinetId') != null ? (String)eventMap.get('clinetId') : null;
        // newEvent.IsAllDayEvent = eventMap.get('start') != null ? eventMap.get('start') : null;
        insert newEvent;
        return newEvent.Id;
    }

    @AuraEnabled
    public static void deleteEvent(Id eventid) {
        if(eventid != null){
            delete [SELECT Id FROM Event Where Id=:eventid];
        }else{
            // throw new Exception('Event id is not passed');
        }
    }
}