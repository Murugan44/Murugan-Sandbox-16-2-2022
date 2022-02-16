trigger eventTrigger on Event (after insert) {
    String title;
    String loaction;
    DateTime startDateTime;
    DateTime endDateTime;
    String email;
    Id contactId;
    Id accountId;
    Set<Id> eventId = new Set<Id>();
    for(Event evts: Trigger.New) {
        eventId.add(evts.id);
    }
    List<Event> eventList = new List<Event>([Select Id,Location, Subject, WhatId, WhoId,Description, EndDate,StartDateTime, EndDateTime, OwnerId,AccountId,Account.Name,Account.Google_Meet_Email__c From Event Where Id IN: eventId]);
    if(!eventList.isEmpty()){
        for(Event evt: eventList) {
            eventId.add(evt.id);
            system.debug('evet::'+evt);
            title = evt.Subject;
            loaction = evt.Location;
            startDateTime = DateTime.newInstance(evt.StartDateTime.year(),evt.StartDateTime.month(),evt.StartDateTime.day());
            endDateTime = DateTime.newInstance(evt.EndDateTime.year(),evt.EndDateTime.month(),evt.EndDateTime.day());
            email = evt.Account.Google_Meet_Email__c;
            contactId = evt.WhoId;
            accountId = evt.AccountId;
        }
        String fromdateStr = startDateTime.format('yyyy-MM-dd');
        String todateStr = endDateTime.format('yyyy-MM-dd');
        
        String fromDate = fromdateStr+'T00:00:00Z';
        String toDate = todateStr+'T00:00:00Z';
        system.debug('fromDate::'+fromDate+'::'+toDate);
        GoogleWebService.getMyCalendar(title,loaction,fromDate,toDate,email,contactId,accountId);
    }
}