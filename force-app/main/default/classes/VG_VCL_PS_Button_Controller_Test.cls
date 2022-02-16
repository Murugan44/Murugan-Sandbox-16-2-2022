@IsTest(SeeAllData=False)
public class VG_VCL_PS_Button_Controller_Test {
    public Static testMethod Void Testmethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('VCL', acc.id);
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        Test.startTest();
        VG_VCL_PS_Button_Controller.getPolicySchedule(ps.Id);
        VG_VCL_PS_Button_Controller.getCurrentUser();
        VG_VCL_PS_Button_Controller.bookPolicySchedule(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_Commercial_GLPL_Attachment(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_OPCF19A_Attachment(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_OPCF2_Attachment(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_VolanteExcessDeclaration(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_VolantePropertyDeclaration(ps.Id);
        VG_VCL_PS_Button_Controller.createVCl_Liability_Attachment(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_VolanteUmbrellaDeclaration(ps.Id);
        VG_VCL_PS_Button_Controller.create_VCL_Wrap_UP_Attachment(ps.Id);
        VG_VCL_PS_Button_Controller.deletePolicySchedule(ps.Id);
        Test.stopTest();
    }
}