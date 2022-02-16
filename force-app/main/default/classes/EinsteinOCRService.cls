public class EinsteinOCRService {
    public static FINAL String  OCR_API         = 'https://api.einstein.ai/v2/vision/ocr';
    public static FINAL String  OCR_MODEL       = 'OCRModel';
    public static FINAL String  OCR_MODEL_TABEL = 'tabulatev2';
        
    @AuraEnabled
    public static AuraResponseWrapper readBusinessCardBase64(String sampleBusinessCard, String objectName, String accountId){
        system.debug('accountId::'+accountId);
        Account acc = [Select Id,Name from Account where Id=:accountId limit 1];
        String result = EinsteinAPIService.imageOCR(OCR_API, sampleBusinessCard, OCR_MODEL, true, true);
        EinsteinOCRResponse response = parseResponse(result);
        SObject sobjectRecord = Schema.getGlobalDescribe().get(ObjectName).newSObject() ;
        for(EinsteinOCRResponse.Probabilities prob : response.probabilities){
            switch on prob.attributes.tag {
                when 'PERSON' {
                    sobjectRecord.put('LastName',prob.label);
                }
                when 'PHONE' {
                    sobjectRecord.put('Phone',prob.label);
                }
                when 'MOBILE_PHONE'{
                    sobjectRecord.put('MobilePhone',prob.label);
                }
                when 'EMAIL'{
                    sobjectRecord.put('EMAIL',prob.label);
                }
                when 'WEBSITE' {
                    if(objectName.equals('Lead')){
                        sobjectRecord.put('Website',prob.label);
                    }
                }
                when 'ADDRESS' {
                    if(objectName.equals('Contact')){
                        sobjectRecord.put('MailingStreet',prob.label);
                    }else{
                        sobjectRecord.put('Street',prob.label);
                    }
                }
                when 'ORG' {
                    if(objectName.equals('Lead')){
                        sobjectRecord.put('Company',prob.label);
                    }
                }
            }
            sobjectRecord.put('AccountId',acc.Id);
            sobjectRecord.put('AssistantName',acc.Name);
        }
        system.debug('sobjectRecord::'+sobjectRecord);
        //insert sobjectRecord;
        AuraResponseWrapper wrapper = new AuraResponseWrapper();
        wrapper.response = result;
        wrapper.record = sobjectRecord;
        
        system.debug('wrapper::'+wrapper);
        return wrapper;
    }
    
    private static EinsteinOCRResponse parseResponse(String ressult){
        EinsteinOCRResponse response = (EinsteinOCRResponse)System.JSON.deserialize(ressult, EinsteinOCRResponse.class);
        for(EinsteinOCRResponse.Probabilities prob : response.probabilities){
            System.debug(System.LoggingLevel.DEBUG, prob.label);
        }        
        return response;
        
    }
    
    @AuraEnabled
    public static String createContactRecord(Contact newRecord){
        insert newRecord;
        return newRecord.Id;
    }

    public class AuraResponseWrapper{
        @AuraEnabled
        public string response { get; set; }
        @AuraEnabled
        public sObject record { get; set; }
    }
}