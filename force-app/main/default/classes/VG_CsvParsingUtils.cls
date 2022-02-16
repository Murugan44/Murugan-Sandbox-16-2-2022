public class VG_CsvParsingUtils {
    public static String contents{get;set;}
     public static String contents1{get;set;}
    
    public static String parseCSV(Blob csvFileBody) {    
        contents = PaymentDetailsController.decode(csvFileBody,'ISO-8859-1');//csvFileBody.toString();
        List<String> lines = new List<String>();  
        List<List<String>> allFields = new List<List<String>>(); 
        String[] currentLine = new String[]{};
            String[] headervalues = new String[]{};
                //system.debug('contents::'+contents);
                //system.debug('contents::'+contents.replaceAll('[^a-zA-Z0-9,\\s+]', ''));    
                // replace instances where a double quote begins a field containing a comma  
                // in this case you get a double quote followed by a doubled double quote    
                // do this for beginning and end of a field    
                contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');    
        // now replace all remaining double quotes - we do this so that we can reconstruct 
        // fields with commas inside assuming they begin and end with a double quote     
        contents = contents.replaceAll('""','DBLQT');    
        // we are not attempting to handle fields with a newline inside of them  
        // so, split on newline to get the spreadsheet rows     
        //contents = contents.replaceAll('[^a-zA-Z0-9,\\s+]','');
        system.debug('contents***::'+contents.replaceAll('(\r\n|\r)','\n'));
        try {
            contents = contents.replaceAll('\n', ';');
            lines = contents.split('(\r\n|\r)');  //correction: this only accomodates windows files
            //lines = contents.split('\r'); // using carriage return accomodates windows, unix, and mac files
            system.debug('lines.size::'+lines.size());
            if(String.isBlank(lines[lines.size()-1])) {
              lines.remove(lines.size()-1);
                system.debug('if lines.size::'+lines.size());
            }else{
                lines.remove(lines.size()-1);
                system.debug('if lines.size::'+lines.size());
            }
        }  catch (System.ListException e) {    
            System.debug('Limits exceeded?' + e.getMessage());    
        }  
        system.debug('lines::'+lines);
        headervalues = lines[0].split(',');
        //system.debug('headervalues::'+headervalues);
        for(String line : lines){ 
            system.debug('for lines::'+line);
            // check for blank CSV lines (only commas)      
            if (line.replaceAll(',','').trim().length() == 0) 
                break;               
            
            List<String> fields = line.split(',');          
            List<String> cleanFields = new List<String>();    
            String compositeField;  
            Boolean makeCompositeField = false;    
            
            for ( String field : fields ) {
                //system.debug('field::'+field);
                if (field.startsWith('"') && field.endsWith('"')) { 
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                    //system.debug('cleanFields if::'+cleanFields);
                }else if(field.startsWith('"')){    
                    makeCompositeField = true;  
                    compositeField = field;    
                }else if (field.endsWith('"')){    
                    compositeField += ',' + field;    
                    cleanFields.add(compositeField.replaceAll('DBLQT','"'));    
                    makeCompositeField = false; 
                    //system.debug('cleanFields else if::'+cleanFields);
                }else if(makeCompositeField){    
                    compositeField +=  ',' + field;    
                }else{    
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                    //system.debug('cleanFields else::'+cleanFields.size());
                }
            }
            //system.debug('cleanFields::'+cleanFields);
            allFields.add(cleanFields);
            //system.debug('allFields::'+allFields);
        }
        JSONGenerator jsGen = JSON.createGenerator(true); // Create a JSONGenerator object
        jsGen.writeStartArray();
        for(integer i=1; i<allFields.size(); i++ ){ 
            currentLine=allFields.get(i);
            jsGen.writeStartObject();
            for(Integer j=0;j<headervalues.size();j++){
                system.debug('currentLine[j]::'+currentLine[j]);
                jsGen.writeStringField(''+headervalues[j].trim().replaceAll('[^a-zA-Z0-9,]', '')+'', currentLine[j].trim().replace(';',' '));
            }
            jsGen.writeEndObject();
        }
        jsGen.writeEndArray();
        String jsonData = jsGen.getAsString();
        System.debug('jsonData::' + jsonData);
        return jsonData;
    }
}