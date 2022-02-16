public class Utils {
    public static String contents{get;set;}
    
    public static String decode(final Blob input,  final String charset){
        final String hex  =  EncodingUtil.convertToHex(input);
        final Integer size  =  hex.length() >> 1;
        final List<String> bytes  =  new String[size];
        
        for (Integer i  =  0; i < size; ++i) {
            bytes.set(i,  hex.mid(i << 1,  2));
        }
        System.debug(EncodingUtil.urlDecode('%' + String.join(bytes,  '%'), charset));
        return (EncodingUtil.urlDecode('%' + String.join(bytes,  '%'), charset)).remove('ï»¿');
    }
    
    public static String parseCSV(Blob csvFileBody) {    
        contents = Utils.decode(csvFileBody,'ISO-8859-1');//csvFileBody.toString();
        List<String> lines = new List<String>();  
        List<List<String>> allFields = new List<List<String>>(); 
        String[] currentLine = new String[]{};
        String[] headervalues = new String[]{};
                
        contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
        contents = contents.replaceAll('""','DBLQT');
        
        try{
            contents = contents.replaceAll('\n', ';');
            lines = contents.split('(\r\n|\r)');
            system.debug('lines.size::'+lines.size());
            if(String.isBlank(lines[lines.size()-1])) {
                lines.remove(lines.size()-1);
                system.debug('if lines.size::'+lines.size());
            }else{
                lines.remove(lines.size()-1);
                system.debug('if lines.size::'+lines.size());
            }
        }catch (System.ListException e) {    
            System.debug('Limits exceeded?' + e.getMessage());    
        } 
        
        headervalues = lines[0].split(',');
        
        for(String line : lines){ 
            if (line.replaceAll(',','').trim().length() == 0) 
                break;
            
            List<String> fields = line.split(',');          
            List<String> cleanFields = new List<String>();    
            String compositeField;  
            Boolean makeCompositeField = false;
            
            for( String field : fields ){
                if(field.startsWith('"') && field.endsWith('"')) { 
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                }else if(field.startsWith('"')){    
                    makeCompositeField = true;  
                    compositeField = field;    
                }else if(field.endsWith('"')){    
                    compositeField += ',' + field;    
                    cleanFields.add(compositeField.replaceAll('DBLQT','"'));    
                    makeCompositeField = false; 
                }else if(makeCompositeField){    
                    compositeField +=  ',' + field;    
                }else{    
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                }
            }
            
            allFields.add(cleanFields);
        }
        
        JSONGenerator jsGen = JSON.createGenerator(true);
        jsGen.writeStartArray();
        for(integer i=1; i<allFields.size(); i++ ){ 
            currentLine=allFields.get(i);
            jsGen.writeStartObject();
            for(Integer j=0;j<headervalues.size();j++){
                jsGen.writeStringField(''+headervalues[j].trim().replaceAll('[^a-zA-Z0-9,]', '')+'', currentLine[j].trim().replace(';',' '));
            }
            jsGen.writeEndObject();
        }
        jsGen.writeEndArray();
        String jsonData = jsGen.getAsString();
        System.debug('jsonData::' + jsonData);
        return jsonData;
    }
    
    Public static String parseEmail(String emailplainTextBody){
        List<string> lines = emailplainTextBody.split('\n');
        system.debug('lines::'+lines);
        JSONGenerator jsGen = JSON.createGenerator(true);
        jsGen.writeStartArray();
        jsGen.writeStartObject();
        for(String line : lines){
            List<String> fields = line.split(',');
            for(String field : fields){
                system.debug('fields:: for::'+field);
                List<String> fields2 = field.split(':'); 
                jsGen.writeStringField(''+fields2[0].trim().replaceAll('[^a-zA-Z0-9,]', '')+'', fields2[1].trim());
            }
        }
        jsGen.writeEndObject();
        jsGen.writeEndArray();
        String jsonData = jsGen.getAsString();
        return jsonData;
    }
}