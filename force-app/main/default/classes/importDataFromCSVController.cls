public class importDataFromCSVController {
    
    public Blob csvFileBody{get;set;}
    public String csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<object> obj{get;set;}
    Public List<nonSummary> nonSummaryWrapperList{get;set;}
    public importDataFromCSVController(){
        nonSummaryWrapperList = new List<nonSummary>();
        csvFileLines = new String[]{};
            obj= New List<object>(); 
    }
   
    public void importCSVFile(){
        //csvAsString = csvFileBody.toString();
        //string csvBody = EncodingUtil.base64Encode(csvFileBody);
        //CsvParserClass.parseCSV(csvFileBody);
       String jsonData = parseCSV.parseCSV(csvFileBody);
       // Parse entire JSON response.
        JSONParser parser = JSON.createParser(jsonData);
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
        system.debug('nonSummaryWrapperList::'+nonSummaryWrapperList);
        
        /*try{
            
            
            //nonSummaryList= New List<nonSummary>();
            // Read CSV file body and store it in variable
            
            // Split CSV String to lines
            csvFileLines = csvAsString.split('\n'); 
            
            // Iterate CSV file lines and retrieve one column at a time.
            for(Integer i=1; i < csvFileLines.size(); i++){
                nonSummary nonSum = new nonSummary() ;
                csvFileLines[i].trim().remove('');
                String[] csvRecordData = csvFileLines[i].split(',');
                
                nonSummary nonSum = new nonSummary() ;
                nonSum.Prov = csvRecordData[0];
                nonSum.STAT_Territory = csvRecordData[1];
                nonSum.Veh_Type = csvRecordData[2];
                nonSum.ClassVal = csvRecordData[3];
                nonSum.DrivingRecord = csvRecordData[4];
                nonSum.Ded_PDDC = csvRecordData[5];
                nonSum.Ded_CL = csvRecordData[6];
                nonSum.Ded_CM = csvRecordData[7];
                nonSum.Ded_SP = csvRecordData[8];
                nonSum.RG_AB = csvRecordData[9];
                nonSum.RG_CL_DC = csvRecordData[10];
                nonSum.RG_CM = csvRecordData[11];
                nonSum.RG_MSRP = csvRecordData[12];
                nonSum.NA = csvRecordData[13];
                nonSum.Unit = csvRecordData[14];
                nonSum.Limit1 = csvRecordData[15];
                nonSum.Age = csvRecordData[16];
                nonSum.Engine_CC = csvRecordData[17];
                nonSum.ATV_Type = csvRecordData[18];
                nonSum.Campers = csvRecordData[19];
                nonSum.Limit2 = csvRecordData[20];
                nonSum.Owner = csvRecordData[21];
                nonSum.Ambulance_Type = csvRecordData[22];
                system.debug('nonSum::'+nonSum);                                                                          
                nonSummaryList.add(nonSum);   
            }
            system.debug('nonSummaryList::'+nonSummaryList); 
            // if all correct then insert Account into Org
            //if(nonSummaryList.size()>0)
            //insert nonSummaryList;
        }
        catch (Exception e){
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importing data into Salesforce. Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }*/
    }
    
    Public Class nonSummary{
        Public String Prov{get;set;}
        Public String STATTerritory{get;set;}
        Public String VehType {get;set;}
        Public String ClassVal {get;set;}
        Public String DrivingRecord {get;set;}
        /*Public String Ded_PDDC {get;set;}
        Public String Ded_CL {get;set;}
        Public String Ded_CM {get;set;}
        Public String Ded_SP {get;set;}
        Public String RG_AB {get;set;}
        Public String RG_CL_DC {get;set;}
        Public String RG_CM {get;set;}
        Public String RG_MSRP {get;set;}
        Public String NA {get;set;}
        Public String Unit {get;set;}
        Public String Limit1 {get;set;}
        Public String Age {get;set;}
        Public String Engine_CC {get;set;}
        Public String ATV_Type {get;set;}
        Public String Campers {get;set;}
        Public String Limit2 {get;set;}
        Public String Owner {get;set;}
        Public String Ambulance_Type {get;set;}
        Public String Seating {get;set;}
        Public String Distance {get;set;}
        Public String Trailer {get;set;}
        Public String CamperPrice {get;set;}
        Public String BusPrice {get;set;}
        Public String YearLicense {get;set;}
        Public String MSRPCost {get;set;}
        Public String ModelYear {get;set;}
        Public String TPL_Manual {get;set;}
        Public String Sect_A_Manual {get;set;}
        Public String BI_Manual {get;set;}
        Public String PDT_Manual {get;set;}
        Public String PDDC_Manual {get;set;}
        Public String CL_Manual {get;set;}
        Public String CM_Manual {get;set;}
        Public String AP_Manual {get;set;}
        Public String SP_Manual {get;set;}
        Public String AB_Manual {get;set;}
        Public String UA_Manual {get;set;}
        Public String SEF44_Manual {get;set;}
        Public String ENDORSE_Manual {get;set;}
        Public String SURCHARGE_Manual {get;set;}
        Public String OPT_AB_Manual {get;set;}
        Public String Total_Manual {get;set;}
        Public String Endorse_Detail {get;set;}
        Public String Surcharge_Detail {get;set;}
        Public String Opt_AB_Detail {get;set;}*/
    }
    
}