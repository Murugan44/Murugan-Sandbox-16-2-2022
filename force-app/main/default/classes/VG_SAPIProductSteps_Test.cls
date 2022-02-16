@IsTest(SeeAllData=False)
public class VG_SAPIProductSteps_Test {
    public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        Endorsement_Library__c EL=VG_TU.createEndorsementLibrary();
        EL.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        EL.VG_Product__c='SAPI';
        update EL;
        ApexPages.currentPage().getParameters().put('Id', pol.id);
        ApexPages.currentPage().getParameters().put('Currency', 'USD');
        //Constructor Code 
        VG_SAPIProductSteps SAPI=new VG_SAPIProductSteps();
        SAPI.Product='SAPI';
        SAPI.setLPList();
        SAPI.gotostep2();
        SAPI.fileBody = Blob.valueOf('Company Domicle,Market Cap,Industry,RTR Score,Attack Probability,Loss Cost,Country (%),Market Cap,Market Cap (%),Business Segment (%),Revenue,Financial Score ,Governance Score,Operational Score,M&A Score,Shareholders Score,Company Ticker,Activist Insight Upload Date\nAustria,1000,Trustees,100,16,5870,20,Communication Services,25,30,8000,250,300,700,900,870,,\n');
        SAPI.processuploadAsset();
        SAPI.gotostep3();
        SAPI.riskRatingList[0].psa.VG_Coverage__c='BB-Crime';
        SAPI.riskRatingList[0].psa.VG_Territorial_Limits__c='Nordic';
        SAPI.riskRatingList[0].psa.VG_Share__c=25.6;
        SAPI.riskRatingList[0].psa.VG_Deductible__c=5000;
        SAPI.riskRatingList[0].psa.VG_Sub_limit__c=2000;
        SAPI.riskRatingList[0].psa.VG_Premium__c=1500;
        SAPI.riskRatingList[0].psa.VG_Fee_Amounts__c=1500;
        SAPI.addRR();
        SAPI.Index='1';
        SAPI.RemoveRR();
        SAPI.RRCalc();
        //Step 3 Code
        //Step 4 and 4b code
        Endorsement_Library__c EL1=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        SAPI.existingEndorsements1.add(pse);
        SAPI.gotostep4();
        SAPI.gotostep4b();
        //SAPI.LibraryWrapperList1[0].IsSelected=True;
        SAPI.existingEndorsements1.add(pse);
        SAPI.gotostep4b();
        //Step 4 and 4b code
        //Step 5 and 5b code
        SAPI.existingEndorsements.add(pse);
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        SAPI.gotostep5();
        SAPI.gotostep5b(); 
        //SAPI.LibraryWrapperList[0].IsSelected=True;
        SAPI.gotostep5b(); 
        SAPI.AddCustom();
        //Step 5 and 5b code
        //Step 6 Code
        SAPI.gotostep6();
        SAPI.Product='PI';
        SAPI.ps.Split_Type__c = 'Both';
        SAPI.gotostep6();
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        SAPI.finish();
        SAPI.ps.VG_Entity_Split_Required__c = true;
        SAPI.finish();
        SAPI.NonEEAps.VG_Entity_Share__c = 0;
        SAPI.EEAps.VG_Entity_Share__c = 0;
        SAPI.finish();
        //Step 6 Code
    }
   public static testMethod void TestMethod2() {
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Utilities.SkipMethods('Trigger Context');
        Utilities.SkipMethods('Trigger Context2');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        ps.Product__c='PI';
        //ps.Split_Type__c = 'Both';
        ps.VG_Entity_Split_Required__c=True;
        update ps;
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);   
        Endorsement_Library__c EL1=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        
        VG_Policy_Schedule_Endorsement__c pse3=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse4=VG_TU.createPolicyScheduleEndorsement(ps.id);
        pse4.VG_Type__c = 'Sub-limits';
        update pse4;
        ApexPages.currentPage().getParameters().put('Id', pol.id);
        ApexPages.currentPage().getParameters().put('Currency', 'GBP');
        //Constructor Code 
        VG_SAPIProductSteps SAPI=new VG_SAPIProductSteps();
        SAPI.CapacityPaper = '--None--';
        SAPI.Product = 'SAPI';
        SAPI.LProduct = 'F4-Tech & Telco E&O incl USA';
        SAPI.gotostep2();
        //Constructor Code
        //Step 2 Code
        SAPI.gotostep1();
        SAPI.gotostep2();
        SAPI.fileBody = Blob.valueOf('Company Domicle,Market Cap,Industry,RTR Score,Attack Probability,Loss Cost,Country (%),Market Cap,Market Cap (%),Business Segment (%),Revenue,Financial Score ,Governance Score,Operational Score,M&A Score,Shareholders Score,Company Ticker,Activist Insight Upload Date\nAustria,1000,Trustees,100,16,5870,20,Communication Services,25,30,8000,250,300,700,900,870,,\n');
        SAPI.processuploadAsset();        
        SAPI.gotostep3();
        //Step 2 Code
        //Step 3 Code
        SAPI.riskRatingList[0].CoverageSelected ='F4-Tech & Telco E&O incl USA';
        SAPI.riskRatingList[0].psa.VG_Coverage__c='F4-Tech & Telco E&O incl USA';
        SAPI.riskRatingList[0].psa.VG_Territorial_Limits__c='Nordic';
        SAPI.riskRatingList[0].psa.VG_Share__c=25.6;
        SAPI.riskRatingList[0].psa.VG_Deductible__c=5000;
        SAPI.riskRatingList[0].psa.VG_Sub_limit__c=2000;
        SAPI.riskRatingList[0].psa.VG_Premium__c=1500;
        SAPI.riskRatingList[0].psa.VG_Fee_Amounts__c=1500;
        VG_SAPIProductSteps.RRWrapper RRW =new VG_SAPIProductSteps.RRWrapper();
        RRW.psa=rr;
        RRW.CoverageSelected='Property Damage';
        SAPI.riskRatingList.add(RRW);       
        SAPI.addRR();
        SAPI.Index='1';
        SAPI.RemoveRR();
        SAPI.RRCalc();
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        pse1.VG_Premium__c=1500;
        update pse1;
        Endorsement_Library__c EL3=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        pse.VG_Premium__c=1500;
        pse.VG_Type__c = 'Sub-limits';
        update pse; 
        SAPI.gotostep4();
        SAPI.gotostep4b();
        SAPI.gotostep5();
        SAPI.gotostep5b();
        SAPI.gotostep6();
        SAPI.gotostep4();
        SAPI.gotostep4b();
        SAPI.LibraryWrapperList1[0].IsSelected=True;
        SAPI.existingEndorsements1.add(pse);
        SAPI.gotostep4b();        
        SAPI.gotostep5();
        SAPI.gotostep5b();
        //SAPI.LibraryWrapperList[0].IsSelected=True;
        SAPI.existingEndorsements.add(pse1);
        SAPI.gotostep5b();
        SAPI.ps.Split_Type__c = 'EEA';
        SAPI.finish();
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        //Step 6 Code
    }
    
    /*public static testMethod void TestMethod3() {
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        ps.Split_Type__c = 'Non EEA';
        ps.VG_Entity_Split_Required__c=True;
        update ps;
        Endorsement_Library__c EL=VG_TU.createEndorsementLibrary();
        EL.RecordTypeId=Schema.SObjectType.Endorsement_Library__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        update EL;
        ApexPages.currentPage().getParameters().put('Id', pol.id);
        //Constructor Code 
        VG_SAPIProductSteps SAPI=new VG_SAPIProductSteps();
              
        SAPI.Product='SAPI';
        SAPI.setLPList(); 
        SAPI.LProduct='F4-Tech & Telco E&O incl USA'; 
        SAPI.gotostep1();
        SAPI.gotostep2();
        SAPI.fileBody = Blob.valueOf('Company Domicle,Market Cap,Industry,RTR Score,Attack Probability,Loss Cost,Country (%),Market Cap,Market Cap (%),Business Segment (%),Revenue,Financial Score ,Governance Score,Operational Score,M&A Score,Shareholders Score,Company Ticker,Activist Insight Upload Date\nAustria,1000,Trustees,100,16,5870,20,Communication Services,25,30,8000,250,300,700,900,870,,\n');
        SAPI.processuploadAsset();        
        SAPI.gotostep3();
        //Step 2 Code
        //Step 3 Code
        SAPI.riskRatingList[0].psa.VG_Coverage__c='F4-Tech & Telco E&O incl USA';
        SAPI.riskRatingList[0].psa.VG_Territorial_Limits__c='Nordic';
        SAPI.riskRatingList[0].psa.VG_Share__c=25.6;
        SAPI.riskRatingList[0].psa.VG_Deductible__c=5000;
        SAPI.riskRatingList[0].psa.VG_Sub_limit__c=2000;
        SAPI.riskRatingList[0].psa.VG_Premium__c=1500;
        SAPI.riskRatingList[0].psa.VG_Fee_Amounts__c=1500;
        
        SAPI.addRR();
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);   
        VG_SAPIProductSteps.RRWrapper RRW =new VG_SAPIProductSteps.RRWrapper();
        RRW.psa=rr;
        RRW.CoverageSelected='Property Damage';
        SAPI.riskRatingList.add(RRW);       
        SAPI.Index='1';
        SAPI.RemoveRR();
        SAPI.RRCalc();
        SAPI.gotostep4();
        SAPI.gotostep4b();
        SAPI.gotostep5();
        SAPI.gotostep5b(); 
        SAPI.gotostep6();
        SAPI.finish();
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        //Step 6 Code
    }*/
}