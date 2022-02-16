@IsTest(seeAllData =False)
public class VG_VCLDocumentController_Test {
	public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL',acc.id);
        Policy_Schedule__c ps=VG_Tu.createPolicySchedule(pol.id);
        ps.Product__c = 'Property';
        ps.CurrencyIsoCode ='USD';
        update ps;
        Risk_Capture__c rc = new Risk_Capture__c();
        rc.Name = 'Test';
        rc.VG_Additional_Information__c='wrapUp:Test<br>adjustableBasis:Yes<br>MDPremium:2000<br>UEPolicies:Yes<br>Test:<br>Test:<br>Test:<br>';
        rc.Policy_Schedule__c = ps.Id;
        Insert rc;
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.id); 
        pse.VG_Type__c = 'Endorsements';
        update pse;
        VG_Policy_Schedule_Endorsement__c pseS= new VG_Policy_Schedule_Endorsement__c(); //VG_TU.createPolicyScheduleEndorsement(ps.id);
        pseS.VG_Policy_Schedule__c = ps.id;
        pseS.VG_Type__c = 'Sub-limits';
        pseS.VG_Title__c = 'Earthquake';
        pseS.CurrencyIsoCode = ps.CurrencyIsoCode;
        insert pseS;
        
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.Product__c = 'Umbrella - Occurrence, Excluding USA';
        ps1.CurrencyIsoCode ='USD';
        update ps1;
        Risk_Capture__c rc1 = new Risk_Capture__c();
        rc1.Name = 'Test';
        rc1.VG_Additional_Information__c='wrapUp:Test<br>adjustableBasis:Yes<br>MDPremium:2000<br>UEPolicies:Yes<br>Test:<br>Test:<br>Test:<br>';
        rc1.Policy_Schedule__c = ps1.Id;
        Insert rc1;
        
        document doc = new document();
        doc.Name = 'VCL_Lloyds';
        doc.FolderId = '00l0O000002n3zY';
        insert doc;            
        document doc1 = new document();
        doc1.Name = 'ROB Sign';
        doc1.FolderId = '00l0O000002n3zY';
        insert doc1;
        document doc2 = new document();
        doc2.Name = 'Liability_Sign_Url';
        doc2.FolderId = '00l0O000002n3zY';
        insert doc2;
        document doc3 = new document();
        doc3.Name = 'VG_VCL_Lloyds';
        doc3.FolderId = '00l0O000002n3zY';
        insert doc3;
        Apexpages.currentpage().getparameters().put('Id',ps.id);
        Apexpages.currentpage().getparameters().put('PolId',pol.id);
        VG_VCLDocumentController vdc=new VG_VCLDocumentController();
        
        Apexpages.currentpage().getparameters().put('Id',ps1.id);
        Apexpages.currentpage().getparameters().put('PolId',pol.id);
        VG_VCLDocumentController vdc1=new VG_VCLDocumentController();
    }
    
}