@RestResource(urlMapping='/v1/Account/*')
global with sharing class AccountRestApex{

    /*@HttpPost
    global static Account postAccount(String accName,String accIndustry,Integer accNumberOfEmployees,String accDescription){
        Account accRec = new Account();
        accRec.Name = accName;
        accRec.Industry = accIndustry;
        accRec.NumberOfEmployees = accNumberOfEmployees;
        accRec.Description = accDescription;
        
        system.debug('accRec::'+accRec);
        //insert accRec;
        return accRec;*/
       
        
        /*String Body = json.serialize(accRec);
        system.debug('Body::'+ Body);
        // Instantiate a new http object
        Http http = new Http();
        // Instantiate a new HTTP request, specify the method (POST) as well as the endpoint
        HttpRequest req = new HttpRequest(); 
        //req.setEndpoint('http://your-end-point.com/');
		req.setEndpoint('https://volante--murugan.my.salesforce.com/services/data/v53.0/sobjects/Account/');
        req.setMethod('POST');
        //Content-Type  header is set to let the service know that the sent data is in JSON format
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //Specify the body to be send (contains JSON data)
        req.setBody(Body); 
        
        
        try {  
            HttpResponse res =  http.send(req); 
            // Send the request, and return a response
            System.debug(res.toString()); 
        	System.debug( res.getBody());
            
        } catch(System.CalloutException e) {  
            System.debug('Callout error: '+ e); 
            
        } 
        
        system.debug('accRec::'+accRec);*/
        
   // }

    @httpGet
    global static accWrapper accinfo(){
        RestRequest request = RestContext.request;
        String requestURI = request.requestURI;
        String AccId = requestURI.subStringAfterLast('/');
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Id=:AccId];
        List<Contact> ContaList = [SELECT Id,Name,AccountId FROM Contact WHERE AccountId=:AccId];
        accWrapper aw = new accWrapper();
        if(!accList.isEmpty()){
            //aw.accRecs = accList.get(0);
            aw.acclists = acclist;
            aw.contList = ContaList;
        }

        return aw;
    }
    
    @httpPost
    global static AccountWrapper acc(AccountWrapper accInfo){
        try{
            insert accInfo.acct;
            for(Contact c:accInfo.cons){
                c.AccountId = accInfo.acct.Id;
            }
            Upsert accInfo.cons;
            
        }catch( Exception e ){
            system.debug('e::'+e.getMessage());
        }
        return accInfo;
    }

    global class accWrapper{
        //global Account accRecs;
        global List<Account> acclists;
        global List<Contact> contList;
    }
    
    global class AccountWrapper{
        Account acct;
        Contact[] cons;
    }
}

/* JSON Format*/
/*{
    "accInfo" :
    {
        "acct" : { 
            "Name" : "new acc with contact"
                },
        "cons":
        [
            { "FirstName": "Test", "LastName":"Contact1"},
            { "FirstName": "Test", "email" : "testcontact3@test.com", "LastName" : "TLName"}
        ]
    }
}*/

/* XML Format*/
/*
<request>
	<accInfo> 
		<acct>
			<Name>new acc with contact</Name>
		</acct>
		<cons>
			<FirstName>Test</FirstName>
			<LastName>API</LastName>
		</cons>
	</accInfo>
</request>
*/