public class GetObjectByRecordsLWCController {
	@AuraEnabled(cacheable=true)
    public static map<string, string> getAllObjects(){
        map<string, string> objectList = new map<string, string>();
        for(Schema.SObjectType o : Schema.getGlobalDescribe().values() ){
            Schema.DescribeSObjectResult objResult = o.getDescribe();
            objectList.put(objResult.getName(), objResult.getLabel());
        }
        return objectList;
    } 
    
    // @AuraEnabled
    // public static List<String> getAllFields(string selectedObject){
    //     SObjectType objType = Schema.getGlobalDescribe().get(selectedObject);
    //     Map<String,Schema.SObjectField> mfields = objType.getDescribe().fields.getMap();
    //     List<String> sObjectDetailsList = new List<String>();
    //     for(String s : mfields.keySet()){
    //         sObjectDetailsList.add(String.valueOf(mfields.get(s)));
    //     }
    //     return sObjectDetailsList;
    // }

     @AuraEnabled
    public static List<List<String>> getFieldSet(string selectedObject){
        SObjectType objType = Schema.getGlobalDescribe().get(selectedObject);
        Map<String, Schema.FieldSet> fsMap = objType.getDescribe().fieldSets.getMap();
        List<List<String>> result = new List<List<String>> ();
        string labelString = '';
        string apiNameString = '';
        // // string typeString;
        System.debug('::'+fsMap);
        List<Schema.FieldSetMember> fieldSetList;
        String commaSepratedFields = '';
        for(String s: fsMap.keySet()){
            List<Schema.FieldSetMember> fieldSetMemberList =  GetObjectByRecordsLWCController.readFieldSet(s,selectedObject);
            for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList){ 
                system.debug('API Name ====>' + fieldSetMemberObj.getFieldPath()); //api name
                // system.debug('Label ====>' + fieldSetMemberObj.getLabel());
                // system.debug('Required ====>' + fieldSetMemberObj.getRequired());
                // system.debug('DbRequired ====>' + fieldSetMemberObj.getDbRequired());
                // system.debug('Type ====>' + fieldSetMemberObj.getType());   //type - STRING,PICKLIST
                labelString = fieldSetMemberObj.getLabel();
                apiNameString = fieldSetMemberObj.getFieldPath();
                result.add(new List<String> { apiNameString,labelString });
                // if(commaSepratedFields == null || commaSepratedFields == ''){
                //     commaSepratedFields = fieldSetMemberObj.getFieldPath();
                // }else{
                //     commaSepratedFields = commaSepratedFields + ', ' + fieldSetMemberObj.getFieldPath();
                // }
            }
        }
        // String queryString = 'select '+ commaSepratedFields +' from '+ selectedObject;
        // // System.debug('logLevel::'+ result);
        // System.debug('queryString::'+queryString);
        // List<sObject> sobjList = Database.query(queryString);
        // DataTableResponse dt = new DataTableResponse();
        // dt.lstDataTableData = sobjList;
        // dt.result = result;
        // system.debug('::'+dt);
        return result;
    }

    @AuraEnabled
    public static List<String> getNumberTypeField(string selectedObject){
        List<String> numberTypeFieldList = new List<String>();

        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(selectedObject);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();

        for (String fieldName: fieldMap.keySet()) {
            //get all the fields label for Object
            String fieldLabel = fieldMap.get(fieldName).getDescribe().getLabel();

            //get data types for each fields
            Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            System.debug('fielddataType::'+fielddataType);
            if(fielddataType == Schema.DisplayType.Integer || fielddataType == Schema.DisplayType.Double){
                // build your logic if the Field data type is Integer
                System.debug('fieldName::'+fieldName);
                numberTypeFieldList.add(String.valueOf(fieldMap.get(fieldName)));
            }
        }

        return numberTypeFieldList;
    }
    
    @AuraEnabled
    public static List<sObject> getListOfRecords(string query){
        List<sObject> sobjList = Database.query(query);
        return sobjList;
    }

    public static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String ObjectName){
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();

        system.debug('====>' + DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName));

        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);

        //List<Schema.FieldSetMember> fieldSetMemberList =  fieldSetObj.getFields();
        // system.debug('fieldSetMemberList ====>' + fieldSetMemberList);  
        return fieldSetObj.getFields(); 
    }  


    // public class DataTableResponse {
    //     @AuraEnabled
    //     public List<sObject> lstDataTableData {get;set;}
    //     @AuraEnabled
    //     public List<List<String>> result {get;set;}       
    // }
}