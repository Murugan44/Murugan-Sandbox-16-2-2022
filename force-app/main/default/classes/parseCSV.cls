public class parseCSV {
    public static String contents{get;set;}
    //Public static List<nonSummary> nonSummaryWrapperList = new List<nonSummary>();
    
    public static String parseCSV(Blob csvFileBody) {    
        contents = PaymentDetailsController.decode(csvFileBody,'ISO-8859-1');//csvFileBody.toString();
        List<List<String>> allFields = new List<List<String>>();      
        // replace instances where a double quote begins a field containing a comma  
        // in this case you get a double quote followed by a doubled double quote    
        // do this for beginning and end of a field    
        contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');    
        // now replace all remaining double quotes - we do this so that we can reconstruct 
        // fields with commas inside assuming they begin and end with a double quote     
        contents = contents.replaceAll('""','DBLQT');    
        // we are not attempting to handle fields with a newline inside of them  
        // so, split on newline to get the spreadsheet rows     
        List<String> lines = new List<String>();      
        try {    
            lines = contents.split('\n');    
        }  catch (System.ListException e) {    
            System.debug('Limits exceeded?' + e.getMessage());    
        }     
        String[] currentLine = new String[]{};
            String[] headervalues = new String[]{};
                headervalues = lines[0].split(',');
        //system.debug('lines::'+lines);
        for(String line : lines){    
            // check for blank CSV lines (only commas)      
            if (line.replaceAll(',','').trim().length() == 0) 
                break;               
            
            List<String> fields = line.split(',');          
            List<String> cleanFields = new List<String>();    
            String compositeField;  
            Boolean makeCompositeField = false;    
            
            system.debug('fields::'+fields);
            for ( String field : fields ) {    
                if (field.startsWith('"') && field.endsWith('"')) { 
                    cleanFields.add(field.replaceAll('DBLQT','"'));    
                }else if(field.startsWith('"')){    
                    makeCompositeField = true;  
                    compositeField = field;    
                }else if (field.endsWith('"')){    
                    compositeField += ',' + field;    
                    cleanFields.add(compositeField.replaceAll('DBLQT','"'));    
                    makeCompositeField = false;    
                }else if(makeCompositeField){    
                    compositeField +=  ',' + field;    
                }else{    
                    cleanFields.add(field.replaceAll('DBLQT','"'));    
                }    
            }              
            system.debug('cleanFields::'+cleanFields);
            allFields.add(cleanFields);    
        }
        system.debug('allFields::'+allFields);
        JSONGenerator jsGen = JSON.createGenerator(true); // Create a JSONGenerator object
        jsGen.writeStartArray();
        //jsGen.writeStartObject(); 
        //jsGen.writeFieldName('List');
        for(integer i=1; i<allFields.size(); i++ ){ 
            currentLine=allFields.get(i);
            //jsGen.writeFieldName(''+i+'');
            jsGen.writeStartObject();
            for(Integer j=0;j<headervalues.size();j++){
                jsGen.writeStringField(''+headervalues[j].trim()+'', currentLine[j].trim());
            }
            jsGen.writeEndObject();
        }
        //jsGen.writeEndObject();
        jsGen.writeEndArray();
        String jsonData = jsGen.getAsString();
        System.debug('jsonData-' + jsonData);
        
        // Parse entire JSON response.
       /* JSONParser parser = JSON.createParser(jsonData);
        system.debug('parser::'+parser);
        while (parser.nextToken() != null) {
            // Start at the array of invoices.
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                while (parser.nextToken() != null) {
                    // Advance to the start object marker to
                    //  find next invoice statement object.
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        // Read entire invoice object, including its array of line items.
                        nonSummary inv = (nonSummary)parser.readValueAs(nonSummary.class);
                        system.debug('Size of list items::' + inv);
                        nonSummaryWrapperList.add(inv);
                        // For debugging purposes, serialize again to verify what was parsed.
                        String s = JSON.serialize(inv);
                        system.debug('Serialized invoice::' + s);
                        // Skip the child start array and start object markers.
                        parser.skipChildren();
                    }
                }
            }
        }
        system.debug('nonSummaryWrapperList::'+nonSummaryWrapperList);*/
        return jsonData;          
    }   
    
     Public Class nonSummary{
        Public String Prov{get;set;}
        Public String STATTerritory{get;set;}
        Public String VehType {get;set;}
        Public String ClassVal {get;set;}
        Public String DrivingRecord {get;set;}
     }
}