/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 10-29-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CsvParserClass {
    public static String contents{get;set;}
    Public static String[] filelines = new String[]{};
        
        
        public static List<List<String>> parseCSV(Blob csvFileBody) { 
            contents = PaymentDetailsController.decode(csvFileBody,'ISO-8859-1');//csvFileBody.toString();
            return null;
        }
}