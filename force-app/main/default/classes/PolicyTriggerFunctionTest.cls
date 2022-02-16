@IsTest(SeeAllData=False)
Public Class PolicyTriggerFunctionTest{ 
    Public Static TestMethod Void unitTestMethod1(){  
        VG_TU.policyCustomSetting();
        Test.startTest();
        Utilities.SkipMethods('Bridge Context');
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('Edison Motor',acc.id);  
        pol.VG_Inception_Date__c=Date.newInstance(2019, 12, 18);
        pol.VG_Expiry_Date__c=Date.newInstance(2020, 12, 18);
        pol.Policy_Status__c='Working';
        pol.VG_Ignore_Validation__c = false;
        update pol; 
        pol.Policy_Status__c='Quoted';
        update pol;
        pol.VG_Sub_Status__c  = 'Approved';
        pol.VG_IsApproved__c = True;
        pol.Policy_Status__c='Bound';
        update pol;
        pol.Policy_Status__c='Booked';
        update pol;
        List<Policy__c> polList=new List<Policy__c>();
        Policy__c pol1=pol.clone(false,true,false,false);
        pol1.Policy_Status__c='Quoted';
        Policy__c pol2=pol.clone(false,true,false,false);
        pol2.VG_Quoted_Time__c=system.today();
        pol2.Policy_Status__c='Bound';
        pol2.VG_Sub_Status__c='Approved';
        polList.add(pol1);
        polList.add(pol2);
        Insert polList;
        Policy__c pol3=pol2.clone(false,true,false,false);
        pol3.VG_Bound_Time__c=system.today();
        pol3.Line_Of_Business__c='Motor';
        pol3.Policy_Status__c='Booked';
        Insert pol3;
        Test.stopTest();
    }
    Public Static TestMethod Void unitTestMethod2(){    
        VG_TU.policyCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createCustomPolicy('VIM',acc.id);  
        pol.Policy_Status__c='Working';
        update pol;
        pol.Policy_Status__c='Quoted';
        update pol;
    }   
    
    Public Static TestMethod Void unitTestMethod3(){    
        VG_TU.policyCustomSetting();
        VG_TU.ValidationCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Utilities.SkipMethods('Bridge Context');
        Policy__c pol=VG_TU.createCustomPolicy('VFP',acc.id); 
        
        /*Policy__c pol1= new Policy__c();
        pol1.RecordTypeId=Schema.SObjectType.Policy__c.getRecordTypeInfosByName().get('Bridge').getRecordTypeId();
        pol1.Insured__c=acc.id;
        pol1.Policy_Status__c='Prospect';
        pol1.Line_Of_Business__c='Motor';
        pol1.VG_Inception_Date__c=Date.newInstance(2019, 12, 18);
        pol1.VG_Expiry_Date__c=Date.newInstance(2020, 12, 18);
        pol1.Inception_Expiry_Time__c='13:05';
        pol1.CurrencyIsoCode='GBP';
        pol1.VG_Is_Renewal__c = true;
        pol1.Name = 'BDG/CC/0000/2020/2';
        insert pol1;*/
        //Policy__c pol1= new Policy__c();
        string pol1 = VG_RenewalController.createRenewalPolicy(pol.Id, 'VFP');
        pol.VG_Renewal_Policy_Id__c = pol1;
        update pol;
        Test.startTest();
        pol.VG_Inception_Date__c=Date.newInstance(2021, 12, 17);
        pol.VG_Expiry_Date__c=Date.newInstance(2022, 12, 16); 
        pol.CurrencyIsoCode = 'USD';
        /*Account ba1= new Account();
        ba1.Industry='Energy';
        ba1.ShippingStreet='Test Street';
        ba1.ShippingCity='Test City';
        ba1.ShippingCountry='India';
        ba1.Name='Broker Account';
        ba1.RecordTypeId=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Broker').getRecordTypeId();       
        ba1.Intermediary_Role__c='Local Brokers';
        ba1.VG_Intermediary_Number__c='test12345';
        ba1.Broker_Type__c='Insurance';
        ba1.Terms__c='45';
        ba1.Broker_Distribution__c='Direct';
        ba1.Regulatory_Check__c=true;
        ba1.VG_TOBA_Uploaded__c=true; 
        Insert ba1;*/
        Account ba1 = VG_TU.createChangeBrokerAccount('Broker');
        pol.Broker_Name__c=ba1.id;
        update pol;
        List<Policy_Schedule__c> pslist = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c='FIPI';
        ps.VG_Lloyds_Product__c='F2-PI FI incl USA';
        ps.Sum_Insured__c=150000;
        pslist.add(ps);
        Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps1.Product__c='FIPI';
        ps1.VG_Lloyds_Product__c='F2-PI FI incl USA';
        ps1.MTA_Parent_Policy_Schedule__c = ps.id;
        //ps1.VG_MTA_Type__c = 'Run-Off';
        ps1.VG_MTA_Start_Date__c=Date.newInstance(2020, 12, 17);
        ps1.VG_MTA_End_Date__c=Date.newInstance(2021, 1, 17);
        ps1.Sum_Insured__c=150000;
        pslist.add(ps1);
        update pslist;        
        
        VG_UMR__c umr = VG_TU.createUMR(acc.id);        
        List<VG_ReInsurance__c> riList = new List<VG_ReInsurance__c>();
        for(Policy_Schedule__c psh: pslist){
            VG_ReInsurance__c ri=new VG_ReInsurance__c();
            ri.Name='Test';
            ri.VG_Brokerage_Amount__c=25256;
            ri.VG_MGA_Commission_Override__c='';
            ri.VG_UMR__c=umr.id;
            ri.VG_Policy_Schedule__c=psh.Id;
            riList.add(ri);
        }
        Insert riList;       
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps.id);
        VG_Payment_Frequency__c pf=VG_TU.createPaymentFrequency(ps.id);  
        VG_Governance_Compliance__c gc = new VG_Governance_Compliance__c();
        gc.VG_UW_Consideration__c = 'UW Consideration';
        gc.Name = pol.Name+'gc';
        insert gc;
        pol.Policy_Status__c='Working';
        update pol;
        pol.Policy_Status__c='Quoted';
        update pol;        
        Utilities.clearMethods();
        Test.stopTest();
    }   
    
    Public Static TestMethod Void unitTestMenthod5(){    
        VG_TU.policyCustomSetting();
        //VG_TU.ValidationCustomSetting();
        Test.startTest();       
        Utilities.SkipMethods('Trigger Context');
        Utilities.SkipMethods('Trigger Context2');
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createCustomPolicy('Bridge',acc.id);
        pol.Policy_Status__c='Working';
        update pol;        
        pol.Policy_Status__c='Quoted';
        pol.VG_Sub_Status__c='Approved';
        update pol;
        pol.Policy_Status__c = 'Bound';
        update pol;        
        List<Policy_Schedule__c> pslist = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c = 'GLPL';
        ps.VG_Lloyds_Product__c='NA-GL/ PL excl Claims Made excl USA';
        ps.Sum_Insured__c=50000000;
        ps1.Product__c='Property';
        ps1.VG_Lloyds_Product__c='P3-PD Primary Layer Property excl USA';
        ps1.Sum_Insured__c=50000000;
        Policy_Schedule__c ps2=VG_TU.createPolicySchedule(pol.id);
        Policy_Schedule__c ps3=VG_TU.createPolicySchedule(pol.id);
        ps2.Product__c = 'Life Sciences';
        ps2.VG_Lloyds_Product__c='PB-Product Recall';
        ps2.Sum_Insured__c=20000000;
        ps3.Product__c='D&O';
        ps3.VG_Lloyds_Product__c='D2-D&O excl FI incl USA';
        ps2.Sum_Insured__c=350000000;
        Policy_Schedule__c ps4=VG_TU.createPolicySchedule(pol.id);
        Policy_Schedule__c ps5=VG_TU.createPolicySchedule(pol.id);
        ps4.Product__c = 'PI';
        ps4.VG_Lloyds_Product__c='E8-PI excl Legal/ Acc / Arch/ Eng/ FI incl USA';
        ps4.Sum_Insured__c=70000000;
        ps5.Product__c='FIPI';
        ps5.VG_Lloyds_Product__c='F2-PI FI incl USA';
        ps5.Sum_Insured__c=150000;
        pslist.add(ps);
        pslist.add(ps1);
        pslist.add(ps2);
        pslist.add(ps3);
        pslist.add(ps4);
        pslist.add(ps5);        
        update pslist;        
        PolicyTriggerFunction.avoidRecursion=false;
        VG_UMR__c umr = VG_TU.createUMR(acc.id);        
        List<VG_ReInsurance__c> riList = new List<VG_ReInsurance__c>();
        for(Policy_Schedule__c psh: pslist){
            VG_ReInsurance__c ri=new VG_ReInsurance__c();
            ri.Name='Test';
            ri.VG_Brokerage_Amount__c=25256;
            ri.VG_MGA_Commission_Override__c='';
            ri.VG_UMR__c=umr.id;
            ri.VG_Policy_Schedule__c=psh.Id;
            riList.add(ri);
        }
        Insert riList;       
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps.id);
        VG_Payment_Frequency__c pf=VG_TU.createPaymentFrequency(ps.id);  
        VG_Governance_Compliance__c gc = new VG_Governance_Compliance__c();
        gc.VG_UW_Consideration__c = 'UW Consideration';
        gc.Name = pol.Name+'gc';
        insert gc;
        pol.VG_Sub_Status__c='Awaiting Approval';        
        pol.Policy_Status__c = 'Booked';
        update pol;
        delete gc;
        
        Test.stopTest();
    }   
    
    Public Static TestMethod Void unitTestMenthod4(){    
        VG_TU.policyCustomSetting();
        VG_TU.ValidationCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createCustomPolicy('VFP',acc.id); 
        Test.startTest();
        List<Policy_Schedule__c> pslist = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        //Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);        
        pslist.add(ps);
        //pslist.add(ps1);        
        update pslist;                
        VG_UMR__c umr = VG_TU.createUMR(acc.id);        
        List<VG_ReInsurance__c> riList = new List<VG_ReInsurance__c>();
        VG_ReInsurance__c ri=new VG_ReInsurance__c();
        ri.Name='Test';
        ri.VG_Brokerage_Amount__c=25256;
        ri.VG_MGA_Commission_Override__c='';
        ri.VG_UMR__c=umr.id;
        ri.VG_Policy_Schedule__c=ps.Id;
        riList.add(ri);
        Insert riList;       
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);       
        Risk_Capture__c rc = VG_TU.createRiskCapture(ps.id);
        VG_Payment_Frequency__c pf=VG_TU.createPaymentFrequency(ps.id);  
        VG_Governance_Compliance__c gc = new VG_Governance_Compliance__c();
        gc.VG_UW_Consideration__c = 'UW Consideration';
        gc.Name = pol.Name+'gc';
        insert gc;        
        Test.stopTest();
    }       
}