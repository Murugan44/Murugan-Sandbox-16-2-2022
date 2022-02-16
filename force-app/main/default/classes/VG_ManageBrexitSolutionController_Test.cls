@IsTest(SeeAllData=False)
public class VG_ManageBrexitSolutionController_Test {
	public static testmethod void testmethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VFP',acc.id);
        
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.Name= 'BDM/MTR/00040/2017/1/PS/1';
        ps1.Product__c = 'W&I';
        ps1.VG_Entity_Share__c =50;
        ps1.RecordTypeId = '0120O000000L9jdQAC';
        update ps1;
        Policy_Schedule__c ps= new Policy_Schedule__c();
        ps.Policy__c = pol.id; 
        ps.RecordTypeId = '0120O000000L9jdQAC';
        ps.Name= 'BDM/MTR/00040/2017/1/PS/0';
        ps.Product__c = 'W&I';
        ps1.VG_Entity_Share__c =50;
        ps.Net_Premium__c =44;
        ps.Share__c=100;
        ps.Limit__c=800;
        ps.Technical_Layer_Premium__c=7000;
        ps.Premium_Adjustment__c=7800;
        ps.Premium_Adjustment_2__c=8744;
        ps.VG_Brokerage_Percent__c=15;
        ps.VG_Co_Insurance_Parent__c=ps1.id;
        insert ps;
        VG_UMR__c umr=VG_TU.createUMR(acc.id);
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps1.id); 
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps1.id);        
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps1.id);  
        List<VG_Exposure_Premium__c> expList=new List<VG_Exposure_Premium__c>();
        VG_Exposure_Premium__c exp1 =new VG_Exposure_Premium__c();
        exp1.VG_Factor_Name__c='Hazardous Activity';
        exp1.VG_Other_Factor__c=false;
        exp1.VG_Policy_Schedule__c=ps1.id;
        exp1.VG_Rate__c=0.8000;
        exp1.VG_Rating_Factor__c='0.80>Low';
        expList.add(exp1);
        VG_Exposure_Premium__c exp2 =new VG_Exposure_Premium__c();
        exp2.VG_Factor_Name__c='Hazardous Product';
        exp2.VG_Other_Factor__c=false;
        exp2.VG_Policy_Schedule__c=ps1.id;
        exp2.VG_Rate__c=1.0000;
        exp2.VG_Rating_Factor__c='1.00>Medium Low';
        expList.add(exp2);        
        Insert expList;
        Test.startTest();
        ApexPages.currentPage().getParameters().put('id', ps1.id);

        VG_ManageBrexitSolutionController.BrexitSolution bs = new VG_ManageBrexitSolutionController.BrexitSolution();
        bs.sharePrecent=48;
        bs.BSId = ps.id;
        VG_ManageBrexitSolutionController mc = new VG_ManageBrexitSolutionController();
        mc.cancel();
        mc.finish();
        Test.stopTest();
        
    }
    
    	public static testmethod void testmethod2(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VFP',acc.id);
        
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.Name= 'BDM/MTR/00040/2017/1/PS/1';
        ps1.VG_Entity_Share__c =50;
        ps1.RecordTypeId = '0120O000000L9jdQAC';
        update ps1;
        Policy_Schedule__c ps= new Policy_Schedule__c();
        ps.Policy__c = pol.id; 
        ps.RecordTypeId = '0120O000000L9jdQAC';
        ps.Name= 'BDM/MTR/00040/2017/1/PS/0';
        ps.VG_Entity_Share__c =50;
        ps.Net_Premium__c =44;
        ps.Share__c=100;
        ps.Limit__c=800;
        ps.Technical_Layer_Premium__c=7000;
        ps.Premium_Adjustment__c=7800;
        ps.Premium_Adjustment_2__c=8744;
        ps.VG_Brokerage_Percent__c=15;
        ps.VG_Co_Insurance_Parent__c=ps1.id;
        insert ps;
        VG_UMR__c umr=VG_TU.createUMR(acc.id);
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps1.id); 
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps1.id);        
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps1.id);  
        List<VG_Exposure_Premium__c> expList=new List<VG_Exposure_Premium__c>();
        VG_Exposure_Premium__c exp1 =new VG_Exposure_Premium__c();
        exp1.VG_Factor_Name__c='Hazardous Activity';
        exp1.VG_Other_Factor__c=false;
        exp1.VG_Policy_Schedule__c=ps1.id;
        exp1.VG_Rate__c=0.8000;
        exp1.VG_Rating_Factor__c='0.80>Low';
        expList.add(exp1);
        VG_Exposure_Premium__c exp2 =new VG_Exposure_Premium__c();
        exp2.VG_Factor_Name__c='Hazardous Product';
        exp2.VG_Other_Factor__c=false;
        exp2.VG_Policy_Schedule__c=ps1.id;
        exp2.VG_Rate__c=1.0000;
        exp2.VG_Rating_Factor__c='1.00>Medium Low';
        expList.add(exp2);        
        Insert expList;
        Test.startTest();
        ApexPages.currentPage().getParameters().put('id', ps1.id);

        VG_ManageBrexitSolutionController.BrexitSolution bs = new VG_ManageBrexitSolutionController.BrexitSolution();
        bs.sharePrecent=48;
        bs.BSId = ps.id;
        VG_ManageBrexitSolutionController mc = new VG_ManageBrexitSolutionController();
        mc.cancel();
        mc.finish();
        mc.Index=1;
        Test.stopTest();
        
    }
}