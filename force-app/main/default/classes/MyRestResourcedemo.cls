@RestResource(urlMapping='/v2/Account/*')
global with sharing class MyRestResourcedemo{
    
    //User defined Class
    
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
    
    @HttpPost
    global static ResponseWrapper doPost(RequestWrapper reqst){
        
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
        return resp;
    }
    
    /* {
    "reqst" :
        {
            "acct" : { 
                        "Name" : "Test Account 1",
                       "AccountNumber" : "00000001",
                       "Site" : "Site1",
                       "Website" : "www.site1.com"
                       
                     },
        
            "cons":
                [
                    { "Name": "Test Contact1", "email" : "testcontact1@test.com", "LastName":"TLName2"},
                    { "Name": "Test Contact2", "email" : "testcontact2@test.com", "LastName":"TLName3"},
                    { "Name": "Test Contact3", "email" : "testcontact3@test.com", "LastName" : "TLName"}
                ]
        }
} */
}