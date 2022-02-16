public class DeleteApexLog {
    
    @AuraEnabled(cacheable=true) 
    public static List<Apexlog> getApexLog(){
        List <Apexlog> loglist = [Select Id from Apexlog];
        return loglist;
    }
    
    @AuraEnabled 
    public static string delApexLog(){
        //DeleteApexLog.log();
        List <Apexlog> loglist = [Select Id from Apexlog LIMIT 100];
        for(Apexlog log: loglist){
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(Url.getOrgDomainUrl().toExternalForm()
                            + '/services/data/v53.0/sobjects/Apexlog/'+log.Id);
            req.setMethod('DELETE');
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            system.debug('req::'+req);
            HttpResponse res = h.send(req);
            System.debug('::'+res.getStatusCode());
        }
        return null;
    }
    
}