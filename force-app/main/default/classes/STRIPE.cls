Public Without Sharing Class STRIPE{
    
    Static FINAL String CONTENT_TYPE = 'application/x-www-form-urlencoded';
    //Static FINAL String BASE_URL = Label.STRIPE_BASE_URL;
    //Static FINAL String API_KEY = Label.STRIPE_API_KEY;

    Public Static Map<String, Object> SendRequest(String requestURL, String method){
        // rac__Gateway__c gateway = [Select Id, End_Point_URL__c, SKey__c from rac__Gateway__c where Name = 'Stripe Endowment'];
        // String BASE_URL = gateway.End_Point_URL__c;
        // String API_KEY = gateway.SKey__c;
        String BASE_URL = 'https://api.stripe.com/v1/';
        String API_KEY = 'sk_test_51K8kUbSB8m4RhRyhqLx443QZ4IG9NOgL7JIcU09mEXKtC3t0JM2jxNEY9MAyFpzou7h5UAu25u7JfKkYQ7bfxxpz00nAwqUcLe';
        requestURL = BASE_URL + requestURL;
        HttpRequest req = new HttpRequest();
        req.setMethod(method);                                    
        req.setHeader('authorization', 'Bearer '+API_KEY );    
        req.setHeader('content-type', CONTENT_TYPE );       
        req.setEndpoint(requestURL);
        Http http = new Http();   
        HttpResponse httpResponse = http.send(req);  
        if (httpResponse.getStatusCode() == 200 ) {  
          Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(httpResponse.getBody()); 
          return response;
        } else {  
          System.debug(' httpResponse ' + httpResponse.getBody() );  
          throw new CalloutException( httpResponse.getBody() );  
        }   
    }
    
    @AuraEnabled
    Public Static String NewCustomer(String name, String country, String state, String city, String line1, String line2, String postal_code, String email, String phone){
        String CUSTOMER_ID;
        String resourceURL = 'customers?';
        resourceURL += 'name='+EncodingUtil.URLENCODE(name,'UTF-8');
        resourceURL += '&shipping[name]='+EncodingUtil.URLENCODE(name,'UTF-8');
        resourceURL += '&address[country]='+EncodingUtil.URLENCODE(country,'UTF-8');
        resourceURL += '&address[state]='+EncodingUtil.URLENCODE(state,'UTF-8');
        resourceURL += '&address[city]='+EncodingUtil.URLENCODE(city,'UTF-8');
        resourceURL += '&address[line1]='+EncodingUtil.URLENCODE(line1,'UTF-8');
        resourceURL += '&address[line2]='+EncodingUtil.URLENCODE(line2,'UTF-8');
        resourceURL += '&address[postal_code]='+EncodingUtil.URLENCODE(postal_code,'UTF-8');
        resourceURL += '&shipping[address][country]='+EncodingUtil.URLENCODE(country,'UTF-8');
        resourceURL += '&shipping[address][state]='+EncodingUtil.URLENCODE(state,'UTF-8');
        resourceURL += '&shipping[address][city]='+EncodingUtil.URLENCODE(city,'UTF-8');
        resourceURL += '&shipping[address][line1]='+EncodingUtil.URLENCODE(line1,'UTF-8');
        resourceURL += '&shipping[address][line2]='+EncodingUtil.URLENCODE(line2,'UTF-8');
        resourceURL += '&shipping[address][postal_code]='+EncodingUtil.URLENCODE(postal_code,'UTF-8');
        resourceURL += '&email='+EncodingUtil.URLENCODE(email,'UTF-8');
        resourceURL += '&phone='+EncodingUtil.URLENCODE(phone,'UTF-8');
        Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
        CUSTOMER_ID = (String) response.get('id');
        return CUSTOMER_ID;
    }
    
    @AuraEnabled
    //Public Static String NewCardPaymentMethod(STRIPE.Card card){
    Public Static String NewCardPaymentMethod(list<Object> cardList){
        List<Card> cardsList = new List<Card>();
        String PAYMENT_METHOD_ID;
        String resourceURL = 'payment_methods?';
        for (Object c : cardList) {
            Card card = (Card)JSON.deserialize(JSON.serialize(c), Card.class);
            system.debug('Card::'+card);
            cardsList.add(card);
            resourceURL += 'type=card';
            resourceURL += '&card[number]='+EncodingUtil.URLENCODE(card.cardNumber,'UTF-8');
            resourceURL += '&card[exp_month]='+EncodingUtil.URLENCODE(card.exp_month,'UTF-8');
            resourceURL += '&card[exp_year]='+EncodingUtil.URLENCODE(card.exp_year,'UTF-8');
            resourceURL += '&card[cvc]='+EncodingUtil.URLENCODE(card.cvc,'UTF-8');
            Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
            PAYMENT_METHOD_ID = (String) response.get('id');
        }
        return PAYMENT_METHOD_ID;
    }
    
    @AuraEnabled
    Public Static String AttachPaymentMethodToCustomer(String paymentMethodId, String customerId){
        String PAYMENT_METHOD_ID;
        String resourceURL = 'payment_methods/'+paymentMethodId+'/attach?';
        resourceURL += 'customer='+EncodingUtil.URLENCODE(customerId,'UTF-8');
        Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
        PAYMENT_METHOD_ID = (String) response.get('id');
        return PAYMENT_METHOD_ID;
    }
    
    @AuraEnabled
    Public Static String NewSetupIntent(String paymentMethodId, String customerId){
       String SETUP_INTENT_ID;
       String resourceURL = 'setup_intents?'; 
       resourceURL += 'confirm=true';
       resourceURL += '&customer='+EncodingUtil.URLENCODE(customerId,'UTF-8');
       resourceURL += '&payment_method='+EncodingUtil.URLENCODE(paymentMethodId,'UTF-8');
       resourceURL += '&usage=off_session'; 
       Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
       SETUP_INTENT_ID = (String) response.get('id');
       return SETUP_INTENT_ID;
    }
    
    @AuraEnabled
    Public Static String CreateAndConfirmPaymentIntent(String amount, String currencyCode, String customerId, String payment_methodId, String description){
        String PAYMENT_INTENT_ID;
        System.debug(amount);
        String resourceURL = 'payment_intents?'; 
        resourceURL += 'amount='+EncodingUtil.URLENCODE(amount,'UTF-8');
        resourceURL += '&currency='+EncodingUtil.URLENCODE(currencyCode,'UTF-8');
        resourceURL += '&customer='+EncodingUtil.URLENCODE(customerId,'UTF-8');
        resourceURL += '&confirm=true';
        resourceURL += '&off_session=true';
        resourceURL += '&payment_method='+EncodingUtil.URLENCODE(payment_methodId,'UTF-8');
        resourceURL += '&description='+EncodingUtil.URLENCODE(description,'UTF-8');
        Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
        PAYMENT_INTENT_ID = (String) response.get('id');
        return PAYMENT_INTENT_ID;
    }
    
    @AuraEnabled
    Public Static String CreatePaymentIntent(String amount, String currencyCode, String customerId, String payment_methodId, String description){
        String PAYMENT_INTENT_ID;
        String resourceURL = 'payment_intents?'; 
        resourceURL += 'amount='+EncodingUtil.URLENCODE(amount,'UTF-8');
        resourceURL += '&currency='+EncodingUtil.URLENCODE(currencyCode,'UTF-8');
        resourceURL += '&customer='+EncodingUtil.URLENCODE(customerId,'UTF-8');
        //resourceURL += '&confirm=true';
        resourceURL += '&off_session=true';
        resourceURL += '&payment_method='+EncodingUtil.URLENCODE(payment_methodId,'UTF-8');
        resourceURL += '&description='+EncodingUtil.URLENCODE(description,'UTF-8');
        Map<String, Object> response = STRIPE.SendRequest(resourceURL, 'POST');
        PAYMENT_INTENT_ID = (String) response.get('id');
        return PAYMENT_INTENT_ID;
    }
    
    Public Static String ConfirmPaymentIntent(String amount, String currencyCode, String customerId, String payment_methodId, String description){
        String PAYMENT_INTENT_ID;
        
        
        return PAYMENT_INTENT_ID;
    }
    
    Public Class Card{
        Public String cardNumber {get; set;}
        Public String exp_month {get; set;}
        Public String exp_year {get; set;}
        Public String cvc {get; set;}
    }
}