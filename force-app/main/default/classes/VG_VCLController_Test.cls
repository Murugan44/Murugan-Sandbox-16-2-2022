@isTest(SeeAllData = false)
public class VG_VCLController_Test {
    /*public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL',acc.id);      
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('VCL','Endorsements');
        Endorsement_Library__c el=new Endorsement_Library__c();
        el.Endorsement_Title__c='Test title';
        el.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el.Type__c='Endorsements';
        el.Text__c='this is test class text';
        Insert el;
        Endorsement_Library__c el5=new Endorsement_Library__c();
        el5.Endorsement_Title__c='Test title';
        el5.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el5.Type__c='Endorsements';
        el5.Text__c='this is test class text';
        Insert el5;
        List<Policy_Schedule__c> psList2=new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        psList2.add(ps);
        psList2.add(ps1);
        Risk_Capture__c rc=new Risk_Capture__c();
        rc.Name='Test';
        rc.Policy_Schedule__c=ps.id;
        rc.VG_Reinstatement_Premiums__c = '1st Reinstatement:10<br>2nd Reinstatement:20<br>3rd Reinstatement:30<br>4th Reinstatement:40';        
        rc.VG_Additional_Information__c='';
        Insert rc;
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        ApexPages.currentPage().getParameters().put('id', pol.id);   
        ApexPages.currentPage().getParameters().put('policyCurrency', pol.id);
        VG_VCLController vcl=new VG_VCLController();
        vcl.Product_Select='Property BI&I';
        vcl.gotostep1();
        vcl.setLPList();
        vcl.gotostep2();
        vcl.gotostep2c();        
        vcl.processuploadAsset();
        
        
        vcl.fileName='test.csv';
        String jsondatavalues = '{"jsondata": {'+
            '"record": ['+
            '  {'+
            ' "Location" : " 1",'+
            '"SiteName" : "Test",'+
  '"CombinedAddress" : "abc",'+
  '"StreetNumber" : "14",'+
  '"StreetName" : "Tambaram",'+
 ' "City" : "Chennai",'+
 ' "ProvinceState" : "Ontario",'+
 ' "Country" : "Canada",'+
 ' "TypeOfOperation" : "BI&I",'+
 ' "PostalCodeZipCode" : "H2P 111",'+
 ' "Latitude" : "25",'+
 ' "Longitude" : "100",'+
 ' "FloodZone" : "120",'+
 ' "EQHazard" : "East high",'+
 ' "CrestaZone" : "E3",'+
 ' "Currency" : "USD",'+
 ' "BuildingSI" : "5000000",'+
 ' "ContentsSI" : "2500000",'+
 ' "AnnualBusinessInterruptionSI" : "88000000",'+
 ' "BIIndemnityPeriodmonths" : "24",'+
 ' "TotalTIV" : "183500000",'+
 ' "Occupancy" : "Restaurant",'+
 ' "Constructiontype" : "Frame / Timber",'+
 ' "Storeysabovegrade" : "3",'+
 ' "Storeysbelowgrade" : "",'+
 ' "Automaticsprinklers" : "No sprinklers",'+
 ' "FUSZone" : "",'+
 ' "PDMFL" : "",'+
 ' "PDMFLPercentage" : "0",'+
 ' "BIMFL" : "",'+
 ' "BIMFLPercentage" : "0",'+
 ' "LloydsConstuctionCode" : "5",'+
 ' "LloydsOccupancyCode" : "5811",'+
 ' "YearBuilt" : "",'+
 ' "OccupancyByInsured" : "Y",'+
 ' "OccupancyByOthers" : "",'+
 ' "FireProtection" : "",'+
 ' "HasSprinklerSystem" : "N",'+
 ' "CurrentYearRate" : "",'+
 ' "ExpiringRate" : "",'+
 ' "IsEarthquakeShakeCovered" : "",'+
 ' "IsFloodCovered" : "Y",'+
 ' "LastYearStructurallyUpdatedyyyy" : "Q",'+
 ' "Population" : "R",'+
 ' "ParticipationSchedule" : "S",'+
 ' "TechnicalFirePremium" : "36000",'+
 ' "TechnicalFireBIPremium" : "450000",'+
 ' "TechnicalEarthquakePremium" : "50000",'+
 ' "TechnicalFloodPremium" : "0",'+
 ' "TechnicalPropertyOtherPremium" : "0",'+
 ' "TechnicalBIIPremium" : "50000",'+
 ' "TotalTechnicalPremium" : "0",'+
 ' "QuotedFirePremium" : "0",'+
 ' "QuotedFireBIPremium" : "0",'+
 ' "QuotedEarthquakePremium" : "0",'+
 ' "QuotedFloodPremium" : "0",'+
 ' "QuotedPropertyOtherPremium" : "0",'+
 ' "QuotedBIIPremium" : "0",'+
 ' "TotalQuotedPremium" : "0",'+
 ' "FirePremiumAdjustment" : "0",'+
 ' "FireBIPremiumAdjustment" : "0",'+
 ' "EarthquakePremiumAdjustment" : "0",'+
 ' "FloodPremiumAdjustment" : "0",'+
 ' "PropertyOtherPremiumAdjustment" : "0",'+
 ' "BIIPremiumAdjustment" : "0",'+
 ' "TotalPremiumAdjustment" : "0"}]}} ';
        vcl.fileBody= blob.valueOf(jsondatavalues);
        System.debug('fileBody::'+vcl.fileBody);
        vcl.processuploadAsset();
        
        
        vcl.addUI();
        vcl.RemoveUI();
        //vcl.gotostep2b();
        vcl.gotostep3();
        vcl.addRR();
        vcl.RemoveRR();
        vcl.gotostep4();
        vcl.gotostep4b();
        vcl.gotostep5();
        vcl.gotostep5b();
        vcl.updateDeductible();
        vcl.updateDeductibleEndors();
        vcl.updateSublimit();
        vcl.updateSublimitEndors();
        vcl.UpdateFinalCalculations();
        //vcl.gotostep6();
        vcl.finish();
        vcl.cancel();
        
    }
    public static testMethod void TestMethod2(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL',acc.id);
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('VCL','Endorsements');
        Endorsement_Library__c el=new Endorsement_Library__c();
        el.Endorsement_Title__c='Test title';
        el.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el.Type__c='Endorsements';
        el.Text__c='this is test class text';
        Insert el;
        Endorsement_Library__c el5=new Endorsement_Library__c();
        el5.Endorsement_Title__c='Test title';
        el5.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el5.Type__c='Endorsements';
        el5.Text__c='this is test class text';
        Insert el5;
        List<Policy_Schedule__c> psList2=new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        psList2.add(ps);
        psList2.add(ps1);
        Risk_Capture__c rc=new Risk_Capture__c();
        rc.Name='Test';
        rc.Policy_Schedule__c=ps.id;
        rc.VG_Additional_Information__c='';
        Insert rc;
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        ApexPages.currentPage().getParameters().put('id', pol.id);   
        ApexPages.currentPage().getParameters().put('policyCurrency', pol.id);
        VG_VCLController vcl=new VG_VCLController();
        vcl.Product_Select='General and Product Liability';
        vcl.gotostep1();
        vcl.gotostep2();
        vcl.RemoveRR();
        vcl.generateReinstatement();                
        vcl.addRR();
        //vcl.SaveRR();
        vcl.AddRiskRating();
        vcl.RRCalc();
        vcl.gotostep3();
        VG_VCLController.LibraryWrapper lw =new VG_VCLController.LibraryWrapper();
        lw.el=el;
        lW.isSelected=true;
        vcl.LibraryWrapperList.add(lw);
        System.debug('isselect::'+vcl.LibraryWrapperList);
        vcl.gotostep4();
        vcl.gotostep4b();
        vcl.AddCustom();
        vcl.gotostep5();
        vcl.gotostep5b();
        vcl.gotostep6();
        vcl.UpdateFinalCalculations();
        vcl.finish();
        vcl.cancel();
        
    }
      public static testMethod void TestMethod3(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL',acc.id);
        Endorsement_Library__c EL1=VG_TU.createEndorsementLibraryCustom('VCL','Sub-limits');        
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('VCL','Endorsements');
        Endorsement_Library__c el=new Endorsement_Library__c();
        el.Endorsement_Title__c='Test title';
        el.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el.Type__c='Endorsements';
        el.Text__c='this is test class text';
        Insert el;
        Endorsement_Library__c el5=new Endorsement_Library__c();
        el5.Endorsement_Title__c='Test title';
        el5.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        el5.Type__c='Endorsements';
        el5.Text__c='this is test class text';
        Insert el5;
        List<Policy_Schedule__c> psList2=new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        psList2.add(ps);
        psList2.add(ps1);
        Risk_Capture__c rc=new Risk_Capture__c();
        rc.Name='Test';
        rc.Policy_Schedule__c=ps.id;
        rc.VG_Additional_Information__c='';
        Insert rc;
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        ApexPages.currentPage().getParameters().put('id', pol.id);   
        ApexPages.currentPage().getParameters().put('policyCurrency', pol.id);
        VG_VCLController vcl=new VG_VCLController();
        vcl.Product_Select='Property-Fire';
        vcl.gotostep1();
        vcl.gotostep2();
        vcl.gotostep2c();
        vcl.addedRRList.clear();
        vcl.gotostep3();
        vcl.gotostep4();
        vcl.gotostep4b();
        vcl.gotostep5();
        vcl.gotostep5b();
        vcl.gotostep6();
        vcl.finish();
        vcl.cancel();       
    }*/
    
    public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL',acc.id);
        pol.RecordTypeId = Schema.SObjectType.Policy__c.getRecordTypeInfosByName().get('VCL').getRecordTypeId();
        update pol;
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        ApexPages.currentPage().getParameters().put('id', pol.id);
        VG_VCLController vcl=new VG_VCLController(); 
        VCL.cancel();
        VCL.gotostep3();
        VCL.gotostep1();
        VCL.gotostep2();
        VCL.Product_Select = 'Property';
        VCL.LP_Select = 'Test';
        VCL.gotostep2();
        VCL.Product_Select = 'Wrap Up Primary (Canada only)';
        VCL.gotostep2();
        VCL.Product_Select = '--None--';
        VCL.gotostep2();
        VCL.LP_Select = '--None--';
        VCL.gotostep2();
        VCL.gotostep2a();
        VCL.Product_Select = 'Motor';
        VCL.LP_Select = 'Motor';
        VCL.gotostep2a();
		VCL.LP_Select = null;
        VCL.gotostep2a();
        VCL.Product_Select = 'Property BI&I';
        VCL.gotostep2c();
        VCL.LP_Select = null;
        VCL.Product_Select = 'Motor';
        VCL.gotostep2c();
        VCL.Product_Select = '--None--';
        VCL.gotostep2c();
        VCL.setLPList();
        VCL.processuploadAsset();
        String str = 'Location,Site Name,Combined Address,Street Number,Street Name,City,Province/State,Country,Postal Code / Zip Code,Latitude,Longitude,Flood Zone,EQ Hazard,Cresta Zone,Currency,Building SI,Contents SI,Annual Business Interruption SI,BI Indemnity Period (months),Total TIV,Occupancy,Construction type,Storeys above grade,Storeys below grade,Automatic sprinklers,FUS Zone,PD MFL,PD MFL Percentage,BI MFL,BI MFL Percentage,Lloyds Constuction Code,Lloyds Occupancy Code,Year Built,Occupancy By Insured,Occupancy By Others,Fire Protection,Has Sprinkler System,Current Year Rate,Expiring Rate,Is Earthquake Shake Covered?,Is Flood Covered?,Last Year Structurally Updated (yyyy),Population,Participation Schedule,Technical Fire Premium,Technical Fire BI Premium,Technical Earthquake Premium,Technical Flood Premium,Technical Property Other Premium,Technical BI&I Premium,Total Technical Premium,Quoted Fire Premium,Quoted Fire BI Premium,Quoted Earthquake Premium,Quoted Flood Premium,Quoted Property Other Premium,Quoted BI&I Premium,Total Quoted Premium,Fire Premium Adjustment,Fire BI Premium Adjustment,Earthquake Premium Adjustment,Flood Premium Adjustment,Property Other Premium Adjustment,BI&I Premium Adjustment,Total Premium Adjustment \r\n1,test,asd,14,tsi,tn,Ontario,india,627811,34,23,234,East,e3,USD,32424,23432,435345,56,23432,Restaurant,Test,12,45,No S,0,0,0,0,0,0,0,2021,Y,Y,test,N,2021,23,Y,Y,Q,R,S,10,20,30,40,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 \r\n1,test,asd,14,tsi,tn,Ontario,india,627811,34,23,234,East,e3,USD,32424,23432,435345,56,23432,Restaurant,Test,12,45,No S,0,0,0,0,0,0,0,2021,Y,Y,test,N,2021,23,Y,Y,Q,R,S,110,220,330,440,550,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 \r\n1,test,asd,14,tsi,tn,Ontario,india,627811,34,23,234,East,e3,USD,32424,23432,435345,56,23432,Restaurant,Test,12,45,No S,0,0,0,0,0,0,0,2021,Y,Y,test,N,2021,23,Y,Y,Q,R,S,440,50,60,70,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0';
        VCL.fileBody =  Blob.valueOf(str);
        VCL.fileName = 'Property.csv';
        VCL.processuploadAsset();
        VCL.fileBody =  Blob.valueOf(str);
        VCL.Product_Select = 'Property BI&I';
        VCL.fileName = 'Property.csv';
        VCL.processuploadAsset();
        VCL.fileBody =  Blob.valueOf(str);
        VCL.fileName = 'Property';
        VCL.processuploadAsset();
        VCL.gotostep4();
        //String strMotor = 'Prov , STAT Territory , Veh Type , Class , Driving Record , Ded-PDDC , Ded-CL , Ded-CM , Ded-SP ,RG-AB,RG-CL/DC,RG-CM,RG-MSRP,NA, Unit , Limit1 , Age , Engine CC , ATV Type , Campers , Limit2 , Owner , Ambulance Type , Seating , Distance , Trailer , Camper Price , Bus Price , Year License , MSRPCost , Model Year , TPL Manual , Sect-A Manual , BI Manual , PDT Manual , PDDC Manual , CL Manual , CM Manual , AP Manual , SP Manual , AB Manual , UA Manual , SEF44 Manual , ENDORSE Manual , SURCHARGE Manual , OPT. AB Manual , Total Manual , Endorse Detail , Surcharge Detail , Opt. AB Detail ,, Fleet Summary , TPL , Sect-A , BI , PDT , PDDC , CL , CM , AP , SP , AB , UA , SEF 44 , Endorse , Surcharge , Opt. AB , Total , Per Unit , Client ,Underwriter,Policy Number, Effective Date , Record Date , Comments , Years of Exp , Historical Period , Historical Mandatory , Historical CL , Historical CM , Historical AP , Historical SP , Accident Period , Province , Coverage , Type of Vehicle , Count , Incurred Lossed , MSL ,, TPL Fleet , Sect-A Fleet , BI Fleet , PDT Fleet , PDDC Fleet , CL Fleet , CM Fleet , AP Fleet , SP Fleet , AB Fleet , UA Fleet , SEF 44 Fleet , Endorse Fleet , Surcharge Fleet , Opt. AB Fleet , Total Fleet , Per Unit Fleet , Age/Gen ,, MA Coverage , CL Coverage , CM Coverage , AP Coverage , SP Coverage \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N \r\nON ,717, MR ,7,5,,1,000,1,000,,,,,7, MA+AP ,15,2000,,,,, ,,,  ,,,,,, Please Select , Please Select , , ,11,520,405,4,110, , ,4,005, ,18,300,540,285,750, , ,39,915,20=750;,Acc=0;Ser=0;Maj=0;Min=0;Fr3=0;Fr4=0;G2 =False;G  =False;Ret=False,,,Fleet Mod,1,1,1,1,1,1,1,1,1,1,1,1,,,,,,Test rater 2,Steve V,123456,21082021,,,0,Current,435,0,0,0.0  1.0 Years Prior,Ontario,Collision,PP, 10,000 , 10,000 ,,,,, , ,17,280,608,5,343, , ,6,008, ,27,450,810,285,750, , ,58,534,3,902,,, Y , N , N , Y , N';
        String strMotor = 'Prov , STAT Territory , Veh Type , Class , Driving Record,Ded-CL , Ded-CM , Ded-SP, Ded-PDDC  ,TPLManual,Sect-A Manual,BI Manual , PDT Manual , PDDC Manual , CL Manual , CM Manual , AP Manual , SP Manual , AB Manual , UA Manual , SEF44 Manual , ENDORSE Manual , SURCHARGE Manual , OPT. AB Manual , Total Manual ,RG-AB,RG-CM,Total,Unit,RG-MSRP,RG-CL/DC,Endorse \r\nON ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nNB ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nPQ ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nAB ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nNS ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nPE ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nNF ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nYK ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nNW ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12 \r\nNU ,MR ,7,5,3,4,7,8,67,45,34,56,78,90,45,76,67,56,45,67,78,67,87,98,09,54,67,87,56,45,20,20,test,test,12';
        VCL.fileBody =   Blob.valueOf(strMotor);
        VCL.fileName = 'Motor.csv';
        VCL.gotostep2b();
        Endorsement_Library__c el=VG_TU.createEndorsementLibraryCustom('VCL','Sub-limits');
        el.VG_Product__c = 'Motor';
        update el;
        VCL.Product_Select = 'Motor';
        VCL.gotostep4();
        VG_VCLController.LibraryWrapper lw =new VG_VCLController.LibraryWrapper();
        lw.el=el;
        lW.isSelected=true;
        VCL.LibraryWrapperList1.add(lw);
        VCL.gotostep4b();
        VCL.gotostep4c();
        VCL.CheckAll();
        VG_Policy_Schedule_Endorsement__c pse=new VG_Policy_Schedule_Endorsement__c();
        VG_Policy_Schedule_Endorsement__c pse1=new VG_Policy_Schedule_Endorsement__c();
        pse.VG_Type__c = 'Sub-limits';
        pse.id = null;
        //update pse;
        pse1.id = null;
        pse1.VG_Type__c = 'Sub-limits';
        //update pse1;
        VCL.existingEndorsements1.add(pse);
        VCL.existingEndorsements1.add(pse1);
        VCL.updateDeductible();
        VCL.updateSublimit();
        VG_Policy_Schedule_Endorsement__c pse2= new VG_Policy_Schedule_Endorsement__c();
        VG_Policy_Schedule_Endorsement__c pse3=new VG_Policy_Schedule_Endorsement__c();
        pse2.VG_Type__c = 'Endorsements';
        pse2.id = null;
        //update pse2;
        pse3.id = null;
        pse3.VG_Type__c = 'Endorsements';
        //update pse3;
        VCL.existingEndorsements.add(pse2);
        VCL.existingEndorsements.add(pse3);
        VCL.updateDeductibleEndors();
        VCL.updateSublimitEndors();
        VCL.gotostep5();
        VCL.Product_Select = 'GL - Occurrence , Excluding USA';
        Endorsement_Library__c el1 =VG_TU.createEndorsementLibraryCustom('VCL','Endorsements');
        el1.VG_Product__c = 'Liability';
        update el1;
        VCL.gotostep5();
        VG_VCLController.LibraryWrapper lw1 =new VG_VCLController.LibraryWrapper();
        lw1.el=el1;
        lW1.isSelected=true;
        VCL.LibraryWrapperList.add(lw1);
        VCL.gotostep5b();
        VCL.gotostep6();
        VCL.Product_Select = 'Motor';
        VCL.gotostep6();
        VCL.Product_Select = 'Property';
        VCL.gotostep6();
        VCL.getRRIsEmpty();
        VCL.valueupdate();
        VCL.RemoveRR();
        VCL.addRR();
        VCL.AddCustom();
        VCL.AddRiskRating();
        VCL.addUI();
        VCL.RemoveUI();
        VCL.RRCalc();
       	VCL.rc.VG_No_of_Reinstatements__c = '2';
        VCL.rc.VG_No_of_Reinstatements__c.isNumeric();
        VCL.generateReinstatement();
        VCL.Product_Select = 'Property';
        VCL.finish();
        VCL.Product_Select = 'Motor';
        VCL.finish();
        VG_VCLController.csvFileWrapper csv = new VG_VCLController.csvFileWrapper();
        csv.AB = csv.AP = csv.SP = csv.UA = csv.SEF44 = csv.Surcharge = csv.OptAB = csv.PerUnit = csv.Client = csv.Underwriter = csv.PolicyNumber = csv.EffectiveDate = 'test';
        csv.ABFleet = csv.EndorseDetail = csv.SurchargeDetail = csv.OptABDetail = csv.FleetSummary = csv.TPL = csv.SectA = csv.BI = csv.PDT = csv.PDDC = csv.CL = csv.CM = 'test';
        csv.ABManual = csv.AmbulanceType = csv.Seating = csv.Distance = csv.Trailer = csv.CamperPrice = csv.BusPrice = csv.YearLicense = csv.MSRPCost = csv.ModelYear = 'hg';
        csv.AccidentPeriod = csv.ClassVal = csv.NA = csv.Limit1 = csv.Age = csv.EngineCC = csv.ATVType = csv.Campers = csv.Limit2 = csv.Owner = 'as';
        csv.RecordDate = csv.Comments = csv.YearsofExp = csv.HistoricalPeriod = csv.HistoricalMandatory = csv.HistoricalCL = csv.HistoricalCM = csv.HistoricalAP = csv.HistoricalSP = 'test';
        csv.Province = csv.Coverage = csv.TypeofVehicle = csv.Count = csv.IncurredLossed = csv.MSL = csv.TPLFleet = csv.SectAFleet = csv.BIFleet = csv.PDTFleet = 'hg';
        csv.PDDCFleet = csv.CLFleet = csv.APFleet = csv.SPFleet = csv.UAFleet = csv.SEF44Fleet = csv.EndorseFleet = csv.SurchargeFleet = csv.OptABFleet = csv.TotalFleet = 'as';
        csv.PerUnitFleet = csv.AgeGen = csv.MACoverage = csv.CLCoverage = csv.CMCoverage = csv.APCoverage = csv.SPCoverage = csv.CMFleet = 'as';
        
        VG_VCLController.AssetWrapper ass = new VG_VCLController.AssetWrapper();
        ass.Counter = ass.assName = ass.YearBuilt = ass.FireProtection = ass.HasSprinklerSystem = ass.LastYearStructurallyUpdatedyyyy = ass.Population = ass.ParticipationSchedule ='test';
        ass.QuotedFirePremium = ass.PropertyOtherPremiumAdjustment = ass.QuotedFireBIPremium = ass.QuotedEarthquakePremium = ass.QuotedFloodPremium = ass.QuotedPropertyOtherPremium = ass.QuotedBIIPremium = ass.TotalQuotedPremium =2;
        ass.FirePremiumAdjustment = ass.FireBIPremiumAdjustment = ass.EarthquakePremiumAdjustment = ass.FloodPremiumAdjustment = ass.BIIPremiumAdjustment = ass.TotalPremiumAdjustment = 3;
        
    }
}