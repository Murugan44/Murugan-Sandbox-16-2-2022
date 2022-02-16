@RestResource(urlMapping='/v3/Account/*')
global with sharing class HttpPostMethod_RESR_API {
    
    @HttpPost
    global static RequestWrapper doPost(RequestWrapper reqst){
        ResponseWrapper resp = new ResponseWrapper();
        
        try{
            insert reqst.acct;
            for(Contact c:reqst.cons){
                c.AccountId = reqst.acct.Id;
            }
            Upsert reqst.cons;
        }
        catch( Exception e ){
            resp.statusCode = 'Error';
            resp.statusMessage = 'Exception : ' + e.getMessage();
        }
        resp.statusCode = 'Done';
        resp.statusMessage = 'Test success message';
        resp.acct = reqst.acct;
        resp.cons = reqst.cons;
        return reqst;
    }
    global class RequestWrapper{
        Account acct;
        Contact[] cons;
    }
    
    //Response Wrapper Class
    
    global class ResponseWrapper{           
        public String StatusCode;
        public String StatusMessage;
        public Account acct;
        public Contact[] cons;    
    }
}