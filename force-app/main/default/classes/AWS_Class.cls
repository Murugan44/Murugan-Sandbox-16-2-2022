public class AWS_Class {
    
    public void getAWS(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:AWS_S3/');
        req.setMethod('GET');
        req.setHeader('Content-Type','application/xml');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        System.debug(res.getStatusCode());
        System.debug(res.getStatus());
    }
}