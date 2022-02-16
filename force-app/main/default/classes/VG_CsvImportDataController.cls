public class VG_CsvImportDataController {
    public Blob csvFileBody{get;set;}
    public String csvAsString{get;set;}
    public String jsonData{get;set;}
    Public List<nonSummary> nonSummaryWrapperList{get;set;}
    
    public VG_CsvImportDataController(){
        nonSummaryWrapperList = new List<nonSummary>();
    }
    
    public void importCSVFile(){
        jsonData = VG_CsvParsingUtils.parseCSV(csvFileBody);
        
        JSONParser parser = JSON.createParser(jsonData); // Parse entire JSON response.
        system.debug('parser::'+parser);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) { // Start at the array of file.
                while (parser.nextToken() != null) { // Advance to the start object marker to
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        nonSummary inv = (nonSummary)parser.readValueAs(nonSummary.class); // Read entire nonSummary object, including its array of line items.
                        system.debug('Size of list items::' + inv);
                        nonSummaryWrapperList.add(inv);
                        String s = JSON.serialize(inv); // For debugging purposes, serialize again to verify what was parsed.
                        system.debug('Serialized::' + s);
                        parser.skipChildren(); // Skip the child start array and start object markers.
                    }
                }
            }
        }
        system.debug('nonSummaryWrapperList::'+nonSummaryWrapperList);
    }
    
    Public Class nonSummary{
        Public String Prov{get;set;}
        Public String STATTerritory{get;set;}
        Public String VehType {get;set;}
        Public String ClassVal {get;set;}
        Public String DrivingRecord {get;set;}
        Public String DedPDDC {get;set;}
        Public String DedCL {get;set;}
        Public String DedCM {get;set;}
        Public String DedSP {get;set;}
        Public String RGAB {get;set;}
        Public String RGCLDC {get;set;}
        Public String RGCM {get;set;}
        Public String RGMSRP {get;set;}
        Public String NA {get;set;}
        Public String Unit {get;set;}
        Public String Limit1 {get;set;}
        Public String Age {get;set;}
        Public String EngineCC {get;set;}
        Public String ATVType {get;set;}
        Public String Campers {get;set;}
        Public String Limit2 {get;set;}
        Public String Owner {get;set;}
        Public String AmbulanceType {get;set;}
        Public String Seating {get;set;}
        Public String Distance {get;set;}
        Public String Trailer {get;set;}
        Public String CamperPrice {get;set;}
        Public String BusPrice {get;set;}
        Public String YearLicense {get;set;}
        Public String MSRPCost {get;set;}
        Public String ModelYear {get;set;}
        Public String TPLManual {get;set;}
        Public String SectAManual {get;set;}
        Public String BIManual {get;set;}
        Public String PDTManual {get;set;}
        Public String PDDCManual {get;set;}
        Public String CLManual {get;set;}
        Public String CMManual {get;set;}
        Public String APManual {get;set;}
        Public String SPManual {get;set;}
        Public String ABManual {get;set;}
        Public String UAManual {get;set;}
        Public String SEF44Manual {get;set;}
        Public String ENDORSEManual {get;set;}
        Public String SURCHARGEManual {get;set;}
        Public String OPTABManual {get;set;}
        Public String TotalManual {get;set;}
        Public String EndorseDetail {get;set;}
        Public String SurchargeDetail {get;set;}
        Public String OptABDetail {get;set;}
        
        Public String FleetSummary {get;set;}
        Public String TPL {get;set;}
        Public String SectA {get;set;}
        Public String BI {get;set;}
        Public String PDT {get;set;}
        Public String PDDC {get;set;}
        Public String CL {get;set;}
        Public String CM {get;set;}
        Public String AP {get;set;}
        Public String SP {get;set;}
        Public String AB {get;set;}
        Public String UA {get;set;}
        Public String SEF44 {get;set;}
        Public String Endorse {get;set;}
        Public String Surcharge {get;set;}
        Public String OptAB {get;set;}
        Public String Total {get;set;}
        Public String PerUnit {get;set;}
        Public String Client {get;set;}
        Public String Underwriter {get;set;}
        Public String PolicyNumber {get;set;}
        Public String EffectiveDate {get;set;}
        Public String RecordDate {get;set;}
        Public String Comments {get;set;}
        Public String YearsofExp {get;set;}
        Public String HistoricalPeriod {get;set;}
        Public String HistoricalMandatory {get;set;}
        Public String HistoricalCL {get;set;}
        Public String HistoricalCM {get;set;}
        Public String HistoricalAP {get;set;}
        Public String HistoricalSP {get;set;}
        Public String AccidentPeriod {get;set;}
        Public String Province {get;set;}
        Public String Coverage {get;set;}
        Public String TypeofVehicle {get;set;}
        Public String Count {get;set;}
        Public String IncurredLossed {get;set;}
        Public String MSL {get;set;}
        Public String TPLFleet {get;set;}
        Public String SectAFleet {get;set;}
        Public String BIFleet {get;set;}
        Public String PDTFleet {get;set;}
        Public String PDDCFleet {get;set;}
        Public String CLFleet {get;set;}
        Public String CMFleet {get;set;}
        Public String APFleet {get;set;}
        Public String SPFleet {get;set;}
        Public String ABFleet {get;set;}
        Public String UAFleet {get;set;}
        Public String SEF44Fleet {get;set;}
        Public String EndorseFleet {get;set;}
        Public String SurchargeFleet {get;set;}
        Public String OptABFleet {get;set;}
        Public String TotalFleet {get;set;}
        Public String PerUnitFleet {get;set;}
        Public String AgeGen {get;set;}
        Public String MACoverage {get;set;}
        Public String CLCoverage {get;set;}
        Public String CMCoverage {get;set;}
        Public String APCoverage {get;set;}
        Public String SPCoverage {get;set;}
    }
}