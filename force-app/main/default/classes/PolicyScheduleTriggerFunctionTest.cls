/*

*Created By : Siddik

*Created On : 24-11-2017

*JIRA.No    : VG-11

*/

@IsTest(SeeAllData=False)
Public Class PolicyScheduleTriggerFunctionTest{    
    Public Static TestMethod Void testMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Vendor');
        VG_UMR__c u = VG_TU.createUMRwithEntity(acc.id,'Edison Motor','VIL');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        PolicyScheduleTriggerFunction.allowInsertRI=True;
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c = 'Commercial';
        ps.VG_Status__c='Booked';
        ps.VG_Volante_Entities__c='VIL';
        ps.Gross_Written_Premium__c=50000;
        ps.IPT__c=50000;
        ps.Levies__c=5000;
        ps.VG_Brokerage_Amount__c=50000;  
        PolicyScheduleTriggerFunction.isBasePsProduct = True;
        PolicyScheduleTriggerFunction.stopCOIFlag = True;
        PolicyScheduleTriggerFunction.allowCOI_Ext_Cac_Reduc_Flag = True;
        PolicyScheduleTriggerFunction.allowInsertRI = True;
        update ps;
        VG_Payment_Frequency__c pf=VG_TU.createPaymentFrequency(ps.id);
        
    }
    Public Static TestMethod Void testMethod2(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Vendor');
        VG_UMR__c u = VG_TU.createUMRwithEntity(acc.id,'Bridge','BUAB');        
        Policy__c pol=VG_TU.createPolicy('Bridge', acc.id);
        PolicyScheduleTriggerFunction.allowInsertRI=True;
        Policy_Schedule__c ps0=new Policy_Schedule__c();
        ps0.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('Bridge').getRecordTypeId();
        ps0.Name='BDG/CC/0000/2020/1/PS/0/EEA';
        ps0.Policy__c=pol.id; 
        ps0.Base_Creation_Start_Date__c =Date.newInstance(2018, 12, 18);        
        ps0.Base_Creation_End_Date__c=Date.newInstance(2019, 12, 19);
        ps0.VG_Co_Insurance_type__c = 'Parent';        
        ps0.VG_Is_Co_Insurance__c = true;
        ps0.Net_Premium__c =44;
        ps0.Share__c=100;
        ps0.Limit__c=800;
        ps0.Technical_Layer_Premium__c=7000;
        ps0.Premium_Adjustment__c=7800;
        ps0.Premium_Adjustment_2__c=8744;
        ps0.VG_Brokerage_Percent__c=15;
        ps0.Product__c = 'Commercial Combined - Property';       
        Insert ps0;    
        //VG_ReInsurance__c ri =VG_TU.createReInsurance(ps0.id,u.id);
        
        Policy_Schedule__c ps0child=new Policy_Schedule__c();
        ps0child.RecordTypeId=Schema.SObjectType.Policy_Schedule__c.getRecordTypeInfosByName().get('Bridge').getRecordTypeId();
        ps0child.Name='BDG/CC/0000/2020/1/PS/1/EEA';
        ps0child.Product__c = 'Commercial Combined - Property';        
        ps0child.Policy__c=pol.id; 
        ps0child.Base_Creation_Start_Date__c =Date.newInstance(2018, 12, 18);        
        ps0child.Base_Creation_End_Date__c=Date.newInstance(2019, 12, 19);
        ps0child.VG_Co_Insurance_Parent__c = ps0.id;
        ps0child.Share__c=100;
        ps0child.Limit__c=800;
        Insert ps0child; 
        VG_Policy_Schedule_Asset__c rr1=VG_TU.createPolicyScheduleAsset(ps0child.id); 
        VG_Policy_Schedule_Endorsement__c pse1=VG_TU.createPolicyScheduleEndorsement(ps0child.id);        
        Risk_Capture__c rc1 = VG_TU.createRiskCapture(ps0child.id);  
        PolicyScheduleTriggerFunction.createCOInsuranceChildsforMTAPS(ps0child.id,ps0.id);
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c = 'Commercial Combined - Property';
        ps.VG_Is_MTA__c = true;
        ps.VG_MTA_Type__c = 'Revision of Cover'; 
        ps.VG_Co_Insurance_type__c = 'Parent';        
        ps.VG_Is_Co_Insurance__c = true;
        ps.MTA_Parent_Policy_Schedule__c=ps0.id;
        ps.VG_Status__c='Booked';
        ps.Split_Type__c = 'EEA';
        ps.Name = ps.Name +' /EEA';
        ps.VG_Volante_Entities__c='BUAB';
        ps.Gross_Written_Premium__c=50000;
        ps.IPT__c=50000;
        ps.Levies__c=5000;
        ps.VG_Brokerage_Amount__c=60000; 
        ps.Net_Premium__c =44;
        ps.Share__c=100;
        ps.Limit__c=800;
        ps.VG_Technical_Model_Premium__c = 5400;
        ps.Technical_Layer_Premium__c=7000;
        ps.Premium_Adjustment__c=7800;
        ps.Premium_Adjustment_2__c=8744;
        ps.VG_Brokerage_Percent__c=15;
        update ps;
        PolicyScheduleTriggerFunction.createCOInsuranceChildsforMTAPS(ps0.id,ps.id);
        PolicyScheduleTriggerFunction.isBasePsProduct=true;
        PolicyScheduleTriggerFunction.stopCOIFlag = True;
        PolicyScheduleTriggerFunction.allowCOI_Ext_Cac_Reduc_Flag = True;
        PolicyScheduleTriggerFunction.allowInsertRI = True;
        ps0.Name = ps0.Name+'/NonEEA';
        update ps0;
       /* Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        VG_Payment_Frequency__c pf=VG_TU.createPaymentFrequency(ps1.id);
		pf.VG_Due_Date__c= Date.newInstance(2022, 1, 1);
        pf.VG_Payment_Percent__c=100;
        pf.VG_Policy_Schedule__c=ps1.id;
        update pf;
        VG_Taxes__c tax = new VG_Taxes__c();
        tax.Name = 'income Tax';
        tax.VG_Policy_Schedule__c=ps1.id;
        tax.VG_Tax_Administered_By__c='Insured';
        tax.VG_Tax_Paid_By__c='Insured';
        ps1.Product__c = 'Commercial Combined - Property';
        ps1.VG_Co_Insurance_type__c='Child';
        ps1.VG_Co_Insurance_Parent__c = ps.id;
        ps1.MTA_Parent_Policy_Schedule__c = ps0child.id;
        //ps1.VG_Is_Co_Insurance__c = true;
        ps1.VG_Status__c='Booked';
        ps1.VG_Volante_Entities__c='BUAB';
        update ps1;
        ps.Name = ps.Name+'/NonEEA';
        update ps;*/        
    }
    
    public static testmethod void testmethod3(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('Bridge',acc.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.VG_MTA_Type__c=null;
        ps1.Name= 'BDM/MTR/00040/2017/1/PS/1';
        ps1.Product__c = 'Commercial Combined - Property';               
        update ps1;
        Policy_Schedule__c ps= new Policy_Schedule__c();
        ps.Policy__c = pol.id; 
        ps.Name= 'BDM/MTR/00040/2017/1/PS/0';
        ps.Product__c = 'Commercial Combined - Property';  
        ps.VG_MTA_Type__c=null;
        ps.Net_Premium__c =44;
        ps.Share__c=100;
        ps.Limit__c=800;
        ps.VG_Technical_Model_Premium__c = 5400;
        ps.Technical_Layer_Premium__c=7000;
        ps.Premium_Adjustment__c=7800;
        ps.Premium_Adjustment_2__c=8744;
        ps.VG_Brokerage_Percent__c=15;
        ps.VG_Co_Insurance_Parent__c=ps1.id;
        ps.VG_Co_Insurance_type__c = 'child';
        insert ps;
		PolicyScheduleTriggerFunction.isBasePsProduct=true;
        PolicyScheduleTriggerFunction.stopCOIFlag = True;
        PolicyScheduleTriggerFunction.allowCOI_Ext_Cac_Reduc_Flag = True;
        PolicyScheduleTriggerFunction.allowInsertRI = True;
		ps1.Name = ps1.Name+'/EEA';
		update ps1;        
        Policy_Schedule__c ps2=VG_Tu.createPolicySchedule(pol.id);
        ps2.VG_MTA_Type__c= 'Revision of Cover';
        ps2.MTA_Parent_Policy_Schedule__c = ps1.id;
        ps2.Name= 'BDM/MTR/00040/2017/1/PS/1';
        ps2.Product__c = 'Commercial Combined - Property';               
        update ps2;
        VG_UMR__c umr=VG_TU.createUMR(acc.id);
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id); 
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id);        
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps.id);  
        List<VG_Exposure_Premium__c> expList=new List<VG_Exposure_Premium__c>();
        VG_Exposure_Premium__c exp1 =new VG_Exposure_Premium__c();
        exp1.VG_Factor_Name__c='Hazardous Activity';
        exp1.VG_Other_Factor__c=false;
        exp1.VG_Policy_Schedule__c=ps.id;
        exp1.VG_Rate__c=0.8000;
        exp1.VG_Rating_Factor__c='0.80>Low';
        expList.add(exp1);
        VG_Exposure_Premium__c exp2 =new VG_Exposure_Premium__c();
        exp2.VG_Factor_Name__c='Hazardous Product';
        exp2.VG_Other_Factor__c=false;
        exp2.VG_Policy_Schedule__c=ps.id;
        exp2.VG_Rate__c=1.0000;
        exp2.VG_Rating_Factor__c='1.00>Medium Low';
        expList.add(exp2);        
        Insert expList;
    }
    public static testmethod void testmethod4(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VFP',acc.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.Name = ps1.Name+'/EEA';
		update ps1;
        VG_UMR__c umr=VG_TU.createUMR(acc.id);       
        VG_ReInsurance__c ri =VG_TU.createReInsurance(ps1.id,umr.id);
    }
}