@IsTest(SeeAllData=False)
public class VG_Revise_SAPIProductSteps_Test {
    public static testMethod void TestMethodExtra(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        pol.VG_Inception_Date__c=Date.newInstance(2018, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2019, 3, 2);
        update pol;
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps.Base_Creation_End_Date__c = pol.VG_Expiry_Date__c;
        ps.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps.VG_Entity_Split_Required__c = true;
        ps.Split_Type__c = 'Non EEA';
        ps.Premium_Adjustment_2__c = 11;
        ps.VG_Entity_Share__c = 50;
        ps.Premium_Adjustment__c = 11;
        ps.VG_MTA_Type__c = null;
        update ps;
        Endorsement_Library__c sEL = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        Risk_Capture__c rc=VG_TU.createRiskCapture(ps.id);
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);
        
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps1.Base_Creation_End_Date__c = pol.VG_Expiry_Date__c;
        ps1.VG_MTA_Type__c = null;
        ps1.VG_Entity_Split_Required__c = true;
        ps1.Split_Type__c = 'EEA';
        ps1.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps1.Premium_Adjustment_2__c = 12;
        ps1.VG_Entity_Share__c = 50;
        ps1.Premium_Adjustment__c = 12;
        update ps1;
        Endorsement_Library__c sEL1=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL2=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse2=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        VG_Policy_Schedule_Endorsement__c pse3=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        Risk_Capture__c rc1=VG_TU.createRiskCapture(ps1.id);
        VG_Policy_Schedule_Asset__c psa1=VG_TU.createPolicyScheduleAsset(ps1.id);
        
        Policy_Schedule__c ps2=VG_Tu.createPolicySchedule(pol.id);
        ps2.VG_Entity_Split_Required__c = false;
        ps2.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps2.Base_Creation_End_Date__c = pol.VG_Expiry_Date__c;
        ps2.Split_Type__c = 'EEA';
        ps2.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps2.VG_MTA_Type__c = null;
        ps2.Premium_Adjustment_2__c = 13;
        ps2.VG_Entity_Share__c = 50;
        ps2.Premium_Adjustment__c = 13;
        update ps2;
        Endorsement_Library__c sEL3=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL4=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse4=VG_TU.createPolicyScheduleEndorsement(ps2.id);
        VG_Policy_Schedule_Endorsement__c pse5=VG_TU.createPolicyScheduleEndorsement(ps2.id);
        Risk_Capture__c rc2=VG_TU.createRiskCapture(ps2.id);
        VG_Policy_Schedule_Asset__c psa2=VG_TU.createPolicyScheduleAsset(ps2.id);
        
        Policy_Schedule__c ps3=VG_Tu.createPolicySchedule(pol.id);
        ps3.VG_Entity_Split_Required__c = false;
        ps3.Split_Type__c = 'Non EEA';
        ps3.VG_MTA_Type__c = null;
        ps3.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps3.Premium_Adjustment_2__c = 12;
        ps3.Premium_Adjustment__c = 13;
        ps3.VG_Entity_Share__c = 50;
        update ps3;
         VG_Policy_Schedule_Endorsement__c pse6=VG_TU.createPolicyScheduleEndorsement(ps3.id);
         Risk_Capture__c rc3=VG_TU.createRiskCapture(ps3.id);
        VG_Policy_Schedule_Asset__c psa3=VG_TU.createPolicyScheduleAsset(ps3.id);
        
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        ApexPages.currentPage().getParameters().put('MTAType', null);
        ApexPages.currentPage().getParameters().put('MTAStartDate', null);
        VG_Revise_SAPIProductSteps SAPI=new VG_Revise_SAPIProductSteps();
        SAPI.gotostep1();
        SAPI.gotostep2();
        SAPI.CapacityPaper = '--None--';
        SAPI.gotostep2();
        SAPI.Product = '--None--';
        SAPI.gotostep2();
        SAPI.LProduct = '--None--';
        SAPI.gotostep2();
        SAPI.LProduct='D7-EPL excl USA';
        SAPI.Product='SAPI';
        SAPI.gotostep3();
        SAPI.gotostep4();
        SAPI.addRR();        
        SAPI.riskRatingList[0].psa.VG_Coverage__c='BB-Crime';
        SAPI.riskRatingList[0].psa.VG_Territorial_Limits__c='Nordic';
        SAPI.riskRatingList[0].psa.VG_Share__c=25.6;
        SAPI.riskRatingList[0].psa.VG_Deductible__c=5000;
        SAPI.riskRatingList[0].psa.VG_Sub_limit__c=2000;
        SAPI.riskRatingList[0].psa.VG_Premium__c=1500;
        SAPI.riskRatingList[0].psa.VG_Fee_Amounts__c=1500;
        SAPI.Index='1';
        SAPI.Product = 'Cyber';
        SAPI.gotostep4();
        SAPI.existingEndorsements1.add(pse);
        //SAPI.ElList1.add(elib);
        SAPI.gotostep4();
        SAPI.RemoveRR();
        SAPI.fileBody = Blob.valueOf('Company Domicle,Market Cap,Industry,RTR Score,Attack Probability,Loss Cost,Country (%),Market Cap,Market Cap (%),Business Segment (%),Revenue,Financial Score ,Governance Score,Operational Score,M&A Score,Shareholders Score,Company Ticker,Activist Insight Upload Date\nAustria,1000,Trustees,100,16,5870,20,Communication Services,25,30,8000,250,300,700,900,870,,\n');
        SAPI.processuploadAsset();
        SAPI.RRCalc();
        SAPI.gotostep4b();
        //SAPI.LibraryWrapperList1[0].IsSelected=True;
        SAPI.existingEndorsements1.add(pse);
        VG_Revise_SAPIProductSteps.LibraryWrapper lw = new VG_Revise_SAPIProductSteps.LibraryWrapper();
        lw.isSelected = true;
        lw.EL = sEL3;
        SAPI.LibraryWrapperList1.add(lw);
        SAPI.gotostep4b();
        SAPI.total();
        SAPI.AddCustom();
        SAPI.RemoveCustom();
        SAPI.Product = 'SAPI';
        SAPI.setLPList();
        SAPI.existingEndorsements.add(pse);
        Endorsement_Library__c EL4=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        EL4.VG_Product__c = 'SAPI';
        update EL4;
        SAPI.gotostep5();
        VG_Revise_SAPIProductSteps.LibraryWrapper lw1 = new VG_Revise_SAPIProductSteps.LibraryWrapper();
        lw1.isSelected = true;
        lw1.EL = EL4;
        SAPI.LibraryWrapperList.add(lw1);
        SAPI.gotostep5b(); 
        //SAPI.LibraryWrapperList[0].IsSelected=True;
        SAPI.gotostep5b(); 
        SAPI.gotostep6();
        SAPI.Product='PI';
        SAPI.gotostep6();
        SAPI.Product='SAPI';
        SAPI.existingEndorsements.add(pse);
        SAPI.existingEndorsements1.add(pse1);
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        
        SAPI.netModelPremium=20000;
        SAPI.RiskPremium=10000;
        SAPI.lmt=2000;
        SAPI.attachment=2000;
        SAPI.writtenShare =12.3;
        SAPI.sharePercent=12.3;
        SAPI.actualPremium=15000;
        SAPI.brokerage=12.3;
        SAPI.brokerageAmount=2000;
        SAPI.grossWrittenPremium =20000;
        SAPI.adjustmentTechPremium=12000;
        SAPI.adjustment=2000;
        SAPI.IPTAmount=2000;
        SAPI.IPTPercent=22;
        SAPI.sumInsured=400000;
        SAPI.taxamount=500;
        SAPI.uwPremium=5000;
        SAPI.techModelPremium=5000;
        SAPI.GrossOrNet ='NET';
        SAPI.Product = 'Pre-paid D&O Run-off';
        SAPI.finish();
        Test.stopTest();
    }
       
    public static testMethod void TestMethodROC(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        pol.VG_Inception_Date__c=Date.newInstance(2018, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2019, 3, 2);
        update pol;
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps.VG_Entity_Split_Required__c = true;
        ps.Split_Type__c = 'Non EEA';
        ps.Premium_Adjustment_2__c = 11;
        ps.VG_Entity_Share__c = 50;
        ps.Premium_Adjustment__c = 11;
        ps.Seleted_Prorate_Option__c = 'Flat';
        ps.Product__c = 'SAPI';
        ps.VG_MTA_Type__c = 'Revision of Cover';
        update ps;
        Endorsement_Library__c sEL = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        Risk_Capture__c rc=VG_TU.createRiskCapture(ps.id);
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);
        
        Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps1.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps1.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps1.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps1.VG_Entity_Split_Required__c = true;
        ps1.Split_Type__c = 'EEA';
        ps1.Premium_Adjustment_2__c = 11;
        ps1.VG_Entity_Share__c = 50;
        ps1.Premium_Adjustment__c = 11;
        ps1.Product__c = 'SAPI';
        ps1.Seleted_Prorate_Option__c = 'Flat';
        ps1.VG_MTA_Type__c = 'Revision of Cover';
        update ps1;
        Endorsement_Library__c sEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse3=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        VG_Policy_Schedule_Endorsement__c pse2=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        Risk_Capture__c rc1=VG_TU.createRiskCapture(ps1.id);
        VG_Policy_Schedule_Asset__c psa1=VG_TU.createPolicyScheduleAsset(ps1.id);
        
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        ApexPages.currentPage().getParameters().put('MTAType', 'Revision of Cover');
        ApexPages.currentPage().getParameters().put('MTAStartDate', String.ValueOf(Date.newInstance(2017, 12, 18)));

        VG_Revise_SAPIProductSteps SAPI=new VG_Revise_SAPIProductSteps();
        SAPI.seletedProrateoption = 'Prorated';
        SAPI.gotostep6();
        SAPI.seletedProrateoption = 'Flat';
        SAPI.gotostep6();
        SAPI.Product='SAPI';
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        
        Endorsement_Library__c EL4=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        EL4.VG_Product__c = 'SAPI';
        update EL4;
        SAPI.gotostep5();
        VG_Revise_SAPIProductSteps.LibraryWrapper lw1 = new VG_Revise_SAPIProductSteps.LibraryWrapper();
        lw1.isSelected = true;
        lw1.EL = EL4;
        SAPI.LibraryWrapperList.add(lw1);
        SAPI.gotostep5b(); 
        
        SAPI.netModelPremium=20000;
        SAPI.RiskPremium=10000;
        SAPI.lmt=2000;
        SAPI.attachment=2000;
        SAPI.writtenShare =12.3;
        SAPI.sharePercent=12.3;
        SAPI.actualPremium=15000;
        SAPI.brokerage=12.3;
        SAPI.brokerageAmount=2000;
        SAPI.grossWrittenPremium =20000;
        SAPI.adjustmentTechPremium=12000;
        SAPI.adjustment=2000;
        SAPI.IPTAmount=2000;
        SAPI.IPTPercent=22;
        SAPI.sumInsured=400000;
        SAPI.taxamount=500;
        SAPI.uwPremium=5000;
        SAPI.techModelPremium=5000;
        SAPI.GrossOrNet ='NET';
        
        SAPI.finish();
        Test.stopTest();
    }
    
    public static testMethod void TestMethodRO(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        pol.VG_Inception_Date__c=Date.newInstance(2018, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2019, 3, 2);
        update pol;
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps.VG_Entity_Split_Required__c = true;
        ps.Split_Type__c = 'Non EEA';
        ps.Premium_Adjustment_2__c = 11;
        ps.VG_Entity_Share__c = 50;
        ps.Premium_Adjustment__c = 11;
        ps.Seleted_Prorate_Option__c = 'Flat';
        ps.Product__c = 'SAPI';
        ps.VG_MTA_Type__c = 'Run-off';
        update ps;
        Endorsement_Library__c sEL = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        Risk_Capture__c rc=VG_TU.createRiskCapture(ps.id);
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);
        
        Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps1.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps1.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps1.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps1.VG_Entity_Split_Required__c = true;
        ps1.Split_Type__c = 'EEA';
        ps1.Premium_Adjustment_2__c = 11;
        ps1.VG_Entity_Share__c = 50;
        ps1.Premium_Adjustment__c = 11;
        ps1.Product__c = 'SAPI';
        ps1.Seleted_Prorate_Option__c = 'Flat';
        ps1.VG_MTA_Type__c = 'Revision of Cover';
        update ps1;
        Endorsement_Library__c sEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse3=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        VG_Policy_Schedule_Endorsement__c pse2=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        Risk_Capture__c rc1=VG_TU.createRiskCapture(ps1.id);
        VG_Policy_Schedule_Asset__c psa1=VG_TU.createPolicyScheduleAsset(ps1.id);
        
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        ApexPages.currentPage().getParameters().put('MTAType', 'Run-off');
        ApexPages.currentPage().getParameters().put('MTAStartDate', String.ValueOf(Date.newInstance(2017, 12, 18)));

        VG_Revise_SAPIProductSteps SAPI=new VG_Revise_SAPIProductSteps();
        SAPI.seletedProrateoption = 'Prorated';
        SAPI.gotostep6();
        SAPI.seletedProrateoption = 'Flat';
        SAPI.gotostep6();
        SAPI.Product='SAPI';
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        
        SAPI.netModelPremium=20000;
        SAPI.RiskPremium=10000;
        SAPI.lmt=2000;
        SAPI.attachment=2000;
        SAPI.writtenShare =12.3;
        SAPI.sharePercent=12.3;
        SAPI.actualPremium=15000;
        SAPI.brokerage=12.3;
        SAPI.brokerageAmount=2000;
        SAPI.grossWrittenPremium =20000;
        SAPI.adjustmentTechPremium=12000;
        SAPI.adjustment=2000;
        SAPI.IPTAmount=2000;
        SAPI.IPTPercent=22;
        SAPI.sumInsured=400000;
        SAPI.taxamount=500;
        SAPI.uwPremium=5000;
        SAPI.techModelPremium=5000;
        SAPI.GrossOrNet ='NET';
        SAPI.finish();
        SAPI.ps.VG_Entity_Split_Required__c = false;
        SAPI.finish();
        Test.stopTest();
    }
    
      public static testMethod void TestMethodBAD(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        pol.VG_Inception_Date__c=Date.newInstance(2018, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2019, 3, 2);
        update pol;
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps.VG_Entity_Split_Required__c = false;
        ps.Split_Type__c = 'Non EEA';
        ps.Premium_Adjustment_2__c = 11;
        ps.VG_Entity_Share__c = 50;
        ps.Premium_Adjustment__c = 11;
        ps.Seleted_Prorate_Option__c = 'Flat';
        ps.Product__c = 'SAPI';
        ps.VG_MTA_Type__c = 'Bad Debt Provision';
        update ps;
        Endorsement_Library__c sEL = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        Risk_Capture__c rc=VG_TU.createRiskCapture(ps.id);
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);
        
       /* Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps1.Base_Creation_Start_Date__c = pol.VG_Inception_Date__c;
        ps1.Base_Creation_Start_Date__c = pol.VG_Expiry_Date__c;
        ps1.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        ps1.VG_Entity_Split_Required__c = false;
        ps1.Split_Type__c = 'EEA';
        ps1.Premium_Adjustment_2__c = 11;
        ps1.VG_Entity_Share__c = 50;
        ps1.Premium_Adjustment__c = 11;
        ps1.Product__c = 'SAPI';
        ps1.Seleted_Prorate_Option__c = 'Flat';
        ps1.VG_MTA_Type__c = 'Revision of Cover';
        update ps1;
        Endorsement_Library__c sEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c pEL1 = VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse3=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        VG_Policy_Schedule_Endorsement__c pse2=VG_TU.createPolicyScheduleEndorsement(ps1.id);
        Risk_Capture__c rc1=VG_TU.createRiskCapture(ps1.id);
        VG_Policy_Schedule_Asset__c psa1=VG_TU.createPolicyScheduleAsset(ps1.id);*/
        
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        ApexPages.currentPage().getParameters().put('MTAType', 'Bad Debt Provision');
        ApexPages.currentPage().getParameters().put('MTAStartDate', String.ValueOf(Date.newInstance(2017, 12, 18)));

        VG_Revise_SAPIProductSteps SAPI=new VG_Revise_SAPIProductSteps();
        SAPI.seletedProrateoption = 'Prorated';
        SAPI.gotostep6();
        SAPI.seletedProrateoption = 'Flat';
        SAPI.gotostep6();
        SAPI.Product='SAPI';
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        
        SAPI.netModelPremium=20000;
        SAPI.RiskPremium=10000;
        SAPI.lmt=2000;
        SAPI.attachment=2000;
        SAPI.writtenShare =12.3;
        SAPI.sharePercent=12.3;
        SAPI.actualPremium=15000;
        SAPI.brokerage=12.3;
        SAPI.brokerageAmount=2000;
        SAPI.grossWrittenPremium =20000;
        SAPI.adjustmentTechPremium=12000;
        SAPI.adjustment=2000;
        SAPI.IPTAmount=2000;
        SAPI.IPTPercent=22;
        SAPI.sumInsured=400000;
        SAPI.taxamount=500;
        SAPI.uwPremium=5000;
        SAPI.techModelPremium=5000;
        SAPI.GrossOrNet ='NET';
        SAPI.finish();
        SAPI.ps.VG_Entity_Split_Required__c = false;
        SAPI.finish();
        Test.stopTest();
    }
    
    
	/*public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('SAPI',acc.id);
        pol.VG_Inception_Date__c=Date.newInstance(2018, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2019, 3, 2);
        update pol;
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        Endorsement_Library__c EL1=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        Endorsement_Library__c EL2=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps.id);
        Risk_Capture__c rc=VG_TU.createRiskCapture(ps.id);
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        ApexPages.currentPage().getParameters().put('MTAType', 'Revision of Cover');
        ApexPages.currentPage().getParameters().put('MTAStartDate', String.ValueOf(Date.newInstance(2017, 12, 18)));
        VG_Revise_SAPIProductSteps SAPI1=new VG_Revise_SAPIProductSteps();
        SAPI1.gotostep1();
        SAPI1.LProduct='D7-EPL excl USA';
        SAPI1.Product='SAPI';
        SAPI1.cancel();
        pol.VG_Inception_Date__c=Date.newInstance(2019, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2020, 2, 27);
        update pol;
        VG_Revise_SAPIProductSteps SAPI2=new VG_Revise_SAPIProductSteps();
        SAPI2.gotostep1();
        SAPI2.LProduct='D7-EPL excl USA';
        SAPI2.Product='SAPI';
        SAPI2.cancel();
        pol.VG_Inception_Date__c=Date.newInstance(2020, 3, 30);
        pol.VG_Expiry_Date__c=Date.newInstance(2021, 3, 30);
        update pol;
        VG_Revise_SAPIProductSteps SAPI3=new VG_Revise_SAPIProductSteps();
        SAPI3.gotostep1();
        SAPI3.LProduct='D7-EPL excl USA';
        SAPI3.Product='SAPI';
        SAPI3.cancel();
        pol.VG_Inception_Date__c=Date.newInstance(2020, 2, 28);
        pol.VG_Expiry_Date__c=Date.newInstance(2021, 2, 27);
        update pol;
        VG_Revise_SAPIProductSteps SAPI4=new VG_Revise_SAPIProductSteps();
        SAPI4.gotostep1();
        SAPI4.LProduct='D7-EPL excl USA';
        SAPI4.Product='SAPI';
        SAPI4.cancel();
        VG_Revise_SAPIProductSteps SAPI=new VG_Revise_SAPIProductSteps();        
        SAPI.LProduct='D7-EPL excl USA';
        SAPI.Product='SAPI';
        SAPI.netModelPremium=20000;
        SAPI.RiskPremium=10000;
        SAPI.lmt=2000;
        SAPI.attachment=2000;
        SAPI.writtenShare =12.3;
        SAPI.sharePercent=12.3;
        SAPI.actualPremium=15000;
        SAPI.brokerage=12.3;
        SAPI.brokerageAmount=2000;
        SAPI.grossWrittenPremium =20000;
        SAPI.adjustmentTechPremium=12000;
        SAPI.adjustment=2000;
        SAPI.IPTAmount=2000;
        SAPI.IPTPercent=22;
        SAPI.sumInsured=400000;
        SAPI.taxamount=500;
        SAPI.uwPremium=5000;
        SAPI.techModelPremium=5000;
        SAPI.GrossOrNet ='NET';
        SAPI.Product='FI - D&O';
        SAPI.setLPList();
        SAPI.Product='FI - PI';
        SAPI.setLPList();
        SAPI.Product='FI - Crime';
        SAPI.setLPList();
        SAPI.Product='FI - Fiduciary';
        SAPI.setLPList();
        SAPI.Product='FI - Cyber';
        SAPI.setLPList();
        SAPI.Product='FI - Blend';
        SAPI.setLPList();
        SAPI.Product='D&O';
        SAPI.setLPList();
        SAPI.Product='PI';
        SAPI.setLPList();
        SAPI.Product='SAPI';
        SAPI.setLPList();
        SAPI.LProduct='D7-EPL excl USA';
        SAPI.gotostep2();
        //Constructor Code
        //Step 2 Code
        SAPI.fileBody = Blob.valueOf('Company Domicle,Market Cap,Industry,RTR Score,Attack Probability,Loss Cost,Country (%),Market Cap,Market Cap (%),Business Segment (%),Revenue,Financial Score ,Governance Score,Operational Score,M&A Score,Shareholders Score,Company Ticker,Activist Insight Upload Date\nAustria,1000,Trustees,100,16,5870,20,Communication Services,25,30,8000,250,300,700,900,870,,\n');
        SAPI.processuploadAsset();
        SAPI.gotostep3();  
        SAPI.addRR();        
        SAPI.riskRatingList[0].psa.VG_Coverage__c='BB-Crime';
        SAPI.riskRatingList[0].psa.VG_Territorial_Limits__c='Nordic';
        SAPI.riskRatingList[0].psa.VG_Share__c=25.6;
        SAPI.riskRatingList[0].psa.VG_Deductible__c=5000;
        SAPI.riskRatingList[0].psa.VG_Sub_limit__c=2000;
        SAPI.riskRatingList[0].psa.VG_Premium__c=1500;
        SAPI.riskRatingList[0].psa.VG_Fee_Amounts__c=1500;
        SAPI.Index='1';
        SAPI.RemoveRR();
        SAPI.RRCalc();
        SAPI.gotostep3();
        //Step 2 Code
        //Step 3 Code
        SAPI.addRR();
        SAPI.Index='1';
        //Step 3 Code
        //Step 4 and 4b code
        Endorsement_Library__c EL3=VG_TU.createEndorsementLibraryCustom('SAPI','Sub-limits');
        SAPI.existingEndorsements1.add(pse);
        SAPI.gotostep4();
        SAPI.gotostep4b();
        //SAPI.LibraryWrapperList1[0].IsSelected=True;
        SAPI.existingEndorsements1.add(pse);
        SAPI.gotostep4b();
        //Step 4 and 4b code
        //Step 5 and 5b code
        SAPI.existingEndorsements.add(pse);
        Endorsement_Library__c EL4=VG_TU.createEndorsementLibraryCustom('SAPI','Endorsements');
        SAPI.gotostep5();
        SAPI.gotostep5b(); 
        //SAPI.LibraryWrapperList[0].IsSelected=True;
        SAPI.gotostep5b(); 
        SAPI.AddCustom();
        //Step 5 and 5b code
        //Step 6 Code
        SAPI.gotostep6();
        SAPI.Product='PI';
        SAPI.gotostep6();
        SAPI.Product='SAPI';
        SAPI.existingEndorsements.add(pse);
        SAPI.existingEndorsements1.add(pse1);
        SAPI.cancel();
        SAPI.GrossOrNet='Gross';
        SAPI.layer='Primary';
        SAPI.ps.RecordTypeId = Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('SAPI').getRecordTypeId();
        SAPI.UpdateFinalCalculations();
        SAPI.Index='0';
        SAPI.RemoveRR();
        SAPI.finish();
        //Step 6 Code
    }*/
}