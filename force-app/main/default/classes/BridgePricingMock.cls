@isTest
global class BridgePricingMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {

        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"ilfPremium":"100000"}');
        res.setBody('{"finalILFCurrentLayer":"0.56"}');
        res.setStatusCode(200);
        return res;
    }
}