public with sharing class GoogleWebService {
    
    public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;
    
    public static void getProfile(String userEmail) {
        
        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:GoogleAPI/gmail/v1/users/' + userEmail + '/profile');
        
        response = http.send(request); 
        
        System.debug(response.getBody());
    }
    
    public static void getUserDrafts(String userEmail) {
        
        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:GoogleAPI/gmail/v1/users/' + userEmail + '/drafts');
        
        response = http.send(request); 
        
        System.debug(response.getBody());
    }
    @future(callout=true)
    public static void getMyCalendar(String title, String location, String startDateTime, String endDateTime, String email, Id contactId, Id AccId) {
        Contact cont = [SELECT Id, AccountId,Email FROM Contact Where Id =:contactId];
        /*String strURL = cont.Email;
        strURL = EncodingUtil.urlEncode(strURL, 'UTF-8');
        system.debug('strURL::'+strURL);*/
        request = new HttpRequest();
        // request.setMethod('POST');
        //request.setMethod('POST');
        //https://www.googleapis.com/calendar/v3/calendars/
        //'https://www.googleapis.com/calendar/v3/calendars/primary/events'
        request.setEndpoint('callout:GoogleCalender/calendar/v3/calendars/primary/events/?conferenceDataVersion=1&sendNotifications=true&sendUpdates=all');
        //2021-12-28T08:00:00.000-07:00
        
        JSONGenerator jsGen = JSON.createGenerator(true);
        jsGen.writeStartObject();
        	jsGen.writeStringField('summary', title);
        	jsGen.writeStringField('location', location);
        
            jsGen.writeFieldName('start');
                jsGen.writeStartObject();
                    jsGen.writeStringField('dateTime', startDateTime);
                    jsGen.writeStringField('timeZone', 'America/Los_Angeles');
                jsGen.writeEndObject();
            
            jsGen.writeFieldName('end');
                jsGen.writeStartObject();
                    jsGen.writeStringField('dateTime', endDateTime);
                    jsGen.writeStringField('timeZone', 'America/Los_Angeles');
                jsGen.writeEndObject();
            
        	jsGen.writeFieldName('recurrence');
                jsGen.writeStartArray();
                    jsGen.writeString('RRULE:FREQ=WEEKLY;UNTIL=20131226T000000Z');
                jsGen.writeEndArray();
        
            jsGen.writeFieldName('attendees');
                jsGen.writeStartArray();
                    jsGen.writeStartObject();
                    	jsGen.writeStringField('email', email);
                    jsGen.writeEndObject();
        			jsGen.writeStartObject();
                    	jsGen.writeStringField('email', cont.Email);
                    jsGen.writeEndObject();
                jsGen.writeEndArray();
        
            jsGen.writeFieldName('conferenceData');
                jsGen.writeStartObject();
        			jsGen.writeFieldName('createRequest');
                    jsGen.writeStartObject();
                    	jsGen.writeFieldName('conferenceSolutionKey');
                    		jsGen.writeStartObject();
                        		jsGen.writeStringField('type', 'hangoutsMeet');
                    		jsGen.writeEndObject();
                    	jsGen.writeStringField('requestId', '7qxalsvy0e');
                    jsGen.writeEndObject();
                jsGen.writeEndObject();
        jsGen.writeEndObject();
        String jsonData = jsGen.getAsString();
        system.debug('jsonData::'+jsonData);
        
        request.setBody(jsonData);    
        System.debug(jsonData);
        
        request.setMethod('POST');
        request.setTimeout(10000);
        
        response = http.send(request); 
        System.debug(response.getBody());
        
        String googleMeetLink;
        if(response.getStatuscode()==200){
            Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(response.getBody());
            system.debug('TokenInfo::'+TokenInfo);
            for(object o: TokenInfo.values()){
                system.debug('o::'+string.valueOf(o).contains('hangoutLink'));
                if(string.valueOf(o).contains('meet.google') && !string.valueOf(o).contains('{conferenceId=')){
                    system.debug('o::'+o);
                    googleMeetLink = string.valueOf(o);
                }
            }
          	//Contact con = [SELECT Id, AccountId,Account.Google_Meeting_Link__c, Name FROM Contact Where Id =:contactId];
            //system.debug('con::'+con);
            cont.Google_Meeting_Link__c = googleMeetLink;
            update cont;
            system.debug('AccId::'+AccId);
            Account acc = [select Id,Name,Google_Meeting_Link__c From Account Where Id=:AccId];
            acc.Google_Meeting_Link__c = googleMeetLink;
            update acc;
        }
        
        System.debug('googleMeetLink:::'+googleMeetLink);
    }
    
    public static void getFile(String fileId) {
        
        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:GoogleAPI/drive/v3/files/' + fileId);
        
        response = http.send(request); 
        
        System.debug(response.getBody());
    }
}