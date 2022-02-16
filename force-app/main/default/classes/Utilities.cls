Public Class Utilities{
    
    public static Map<String, List<String>> EntityMap = new Map<String, List<String>>();
    public static List<String> EntityList = new List<String>();
    public static Set<String> avoidRecursionSet= new Set<String>();
    public static Set<String> ExcecutionstopMethodSet= new Set<String>();
    public static Set<String> VolanteEntitySet = new Set<String>();
    public static List<String> UnderwriterProductList = new List<String>();
    public Static Decimal proRata {get;set;}
    public static String contents{get;set;}
    public static Boolean CheckMTA {get;set;}
    
    public static boolean CheckPSMTA (Id PolID){
        CheckMTA = false;
        List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([select id, Name,VG_MTA_Type__c,VG_Capacity_Paper__c, VG_Volante_Entities__c,VG_Entity_Split_Required__c,Split_Type__c, VG_Pre_MTA_Expiry_Date__c,VG_MTA_Cancellation_Date__c,VG_MTA_Reduction_Date__c,  VG_Is_Co_Insurance__c from Policy_Schedule__c where Policy__c  = : PolID]);
        for(Policy_Schedule__c ps : psList){
            If(ps.VG_MTA_Type__c == null)
                CheckMTA = True;
            else
                CheckMTA = false;
        } 
        return CheckMTA;
    }  
    
    public static boolean avoidRecursionCheck(String input){
        System.debug('avoid::'+avoidRecursionSet.contains(input));
        return avoidRecursionSet.contains(input);
    }  
    
    public static Set<String> SkipMethods(String context){
        System.debug('context::'+context);
        Skip_Context__c sc = [Select id,Recursion_Name__c,Methods__c from Skip_Context__c where Recursion_Name__c=:context];
        avoidRecursionSet.addAll(sc.Methods__c.split(';'));
        System.debug('avoidRecursionSet::'+avoidRecursionSet);
        return avoidRecursionSet;         
    }
    
    Public Static Decimal proRatingFactor(Date StartDate, Date EndDate){
        if(Math.mod(StartDate.year(), 4) !=  0){
            if(Math.mod(EndDate.year(), 4)  ==  0){
                if(EndDate <=  date.newInstance(EndDate.year(), 02, 28)){
                    proRata = Decimal.valueOf(StartDate.daysBetween(EndDate)+1)/365;
                    System.debug('proRata::'+proRata);
                }else{
                    proRata = Decimal.valueOf(StartDate.daysBetween(EndDate))/365;
                    System.debug('proRata::'+proRata);
                }
            }else{
                proRata = Decimal.valueOf(StartDate.daysBetween(EndDate)+1)/365;
                System.debug('proRata::'+proRata);
            }
            System.debug('proRata::'+proRata);
        }else{
            
            if(StartDate < date.newInstance(StartDate.year(),03,01)){
                proRata = Decimal.valueOf(StartDate.daysBetween(EndDate))/365;
            }else{
                proRata = Decimal.valueOf(StartDate.daysBetween(EndDate)+1)/365;
            }
            System.debug('proRata::'+proRata);
        }
        System.debug('proRata::'+proRata);
        return proRata;
    }
    
    public static Map<String, List<String>> Entities(String Entity,Date StartDate, String RecordType,String Product){
        List<Volante_Entities__c> Entities = [Select id,Name, VG_Split_Type__c,VG_Record_Type_Name__c,VG_Product__c,VG_End_Date__c,VG_Start_Date__c,VG_Volante_Entities_Full_Name__c from Volante_Entities__c where VG_Record_Type_Name__c=:RecordType];       
        System.debug('Entities::'+RecordType+'::'+Entities.size()+'::'+Entities+'::'+RecordType);
        EntityList = new List<String>();                
        for(Volante_Entities__c val : Entities ){
            system.debug('val::'+val);
            if((val.VG_Start_Date__c <= StartDate && val.VG_End_Date__c>=StartDate) || val.VG_Start_Date__c <= StartDate && val.VG_End_Date__c==null){
                system.debug('val::'+val);
                System.debug('valSplit::'+val.VG_Split_Type__c+'::'+val.VG_Split_Type__c.split(';').indexOf(Entity));
                if(val.VG_Split_Type__c.split(';').indexOf(Entity) != -1){
                    If(val.VG_Product__c==Product){                              
                        EntityList.add(val.Name);                 
                    }
                    System.debug('EntityList::'+EntityList);
                    System.debug('VG_Record_Type_Name__c::'+val.VG_Record_Type_Name__c+'::'+val.Name+'::'+val.VG_Split_Type__c.contains('EEA'));               
                    EntityMap.put(Entity,EntityList );
                }                
                System.debug('EntityMap::'+EntityMap);
            }           
        } 
        for(String s : EntityList){
            if(!VolanteEntitySet.contains(s))
                VolanteEntitySet.add(s);
        }  
        return EntityMap;  
    }
    
    public static List<String> underwriterProduct(String underwriterProduct){
        system.debug('check Val:::'+underwriterProduct);
        system.debug('check Val Slipt:::'+underwriterProduct.split(';'));
        UnderwriterProductList = underwriterProduct.split(';');
        system.debug('UnderwriterProduct list::'+UnderwriterProductList);
        return UnderwriterProductList;
    }
    
    public static void clearMethods(){
        avoidRecursionSet.clear();
    }
    
     public static List<String> decode(final Blob input,  final String charset){
        final String hex  =  EncodingUtil.convertToHex(input);
        final Integer size  =  hex.length() >> 1;
        final List<String> bytes  =  new String[size];
        
        for (Integer i  =  0; i < size; ++i) {
            bytes.set(i,  hex.mid(i << 1,  2));
        }
        System.debug(EncodingUtil.urlDecode('%' + String.join(bytes,  '%'), charset));
        String[] filelines  =  (EncodingUtil.urlDecode('%' + String.join(bytes,  '%'), charset)).remove('ï»¿').split('\n');
        System.debug(filelines  );
        System.debug(filelines.size());
        String[] inputvalues  =  new String[]{};
        inputvalues.add(filelines[0]);
        for (Integer j = 1;j < filelines.size();j++){
            String tmpLine =  filelines[j];
            String[] tmp =  filelines[j].split(',');  
            System.debug(tmpLine ); 
            System.debug(tmp );                   
            boolean allowAdd = false;
            for(integer k = 0; k < tmp.size(); k++){
                if(tmp[k].trim() == ''){
                    allowAdd = false;
                }else{
                    allowAdd = true;
                }
                if(allowAdd)
                    break;
            }
            if(allowAdd){
                inputvalues.add(tmpLine);
            }
            System.debug(inputvalues.size()); 
        }
        //return (EncodingUtil.urlDecode('%' + String.join(bytes,  '%'), charset)).remove('ï»¿');
        return inputvalues;
    }   
    
    public static List<String> setLloydsProduct(String team, String product,String Structure_Select, String ccProduct){
        List<String> doLPList = new List<String>();
        system.debug('team::'+team+'::'+product+'::'+Structure_Select+'::'+ccProduct);
        List<VG_PS_Risk_Codes__mdt > RcList = [Select Id,MasterLabel, Product__c , Risk_Code__c , Team__c, Reinsurance__c,isActive__c,Commercial_Combined_Product__c  from VG_PS_Risk_Codes__mdt WHERE Team__c =:team AND Product__c=:product AND isActive__c=true AND Reinsurance__c=:Structure_Select AND Commercial_Combined_Product__c=:ccProduct];
        system.debug('RcList::'+RcList);
        for(VG_PS_Risk_Codes__mdt  rf: RcList){
            doLPList.add(rf.Risk_Code__c);
        }
        return doLPList;
    }
    public static String parseCSV(Blob csvFileBody) {   
        system.debug('csvFileBody::'+csvFileBody);
        contents = PaymentDetailsController.decode(csvFileBody,'ISO-8859-1');//csvFileBody.toString();
        system.debug('contents::'+contents);
        List<String> lines = new List<String>();  
        List<List<String>> allFields = new List<List<String>>(); 
        String[] currentLine = new String[]{};
        String[] headervalues = new String[]{};
        
        contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
        system.debug('contents::'+contents);
        contents = contents.replaceAll('""','DBLQT');
        system.debug('contents::'+contents);
        try{
            contents = contents.replaceAll('\n', ';');
            system.debug('contents::'+contents);
            lines = contents.split('(\r\n|\r)');
            system.debug('lines.size::'+lines.size()+'::'+lines);
            System.debug('logLevel::' +String.isBlank(lines[lines.size()-1]));
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
        system.debug('headervalues::'+headervalues);
        
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
        System.debug('allFields::'+allFields.size()+'::'+allFields);
        System.debug('headervalues::'+headervalues.size()+'::'+headervalues);
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
}