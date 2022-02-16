@IsTest(seeAllData =False)
public class VG_FIDO_PS_Button_Controller_Test {
	public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Vendor');
        Utilities.SkipMethods('Trigger Context');
        Utilities.SkipMethods('Trigger Context2');
        Utilities.SkipMethods('FIDO_ROC_Revise_Context');
        Policy__c pol=VG_TU.createPolicy('VFP', acc.id);        
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c='W&I';
        //ps.VG_Entity_Split_Required__c = true;
        //ps.Split_Type__c = 'EEA';
        update ps;
        Policy_Schedule__c ps2=VG_TU.createPolicySchedule(pol.id);
        ps2.Product__c='PI';
        update ps2;
        Policy_Schedule__c ps3=VG_TU.createPolicySchedule(pol.id);
        ps3.Product__c='PI';
        ps3.VG_Risk_Start_Date__c =Date.newInstance(2020, 12, 19);
        ps3.VG_Risk_End_Date__c=Date.newInstance(2020, 12, 20);
        update ps3;
        VG_FIDO_PS_Button_Controller fc=new VG_FIDO_PS_Button_Controller();
        VG_FIDO_PS_Button_Controller.getPolicySchedule(ps.Id);
        VG_FIDO_PS_Button_Controller.createPI_Quote_SheetAttachment(ps.Id);
        VG_FIDO_PS_Button_Controller.bookPolicySchedule(ps.id);
        VG_FIDO_PS_Button_Controller.deletePolicySchedule(ps.id);
        VG_FIDO_PS_Button_Controller.getCurrentUser();
        VG_FIDO_PS_Button_Controller.createPI_Schedule_Attachment(ps2.Id);
        //VG_FIDO_PS_Button_Controller.updateRiskDatePS(ps3, ps3.Id);
    }
}