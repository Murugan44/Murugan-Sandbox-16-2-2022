@IsTest(SeeAllData=False)
public class VG_Revise_VCLStep7Controller_Test {
    public Static Testmethod Void Testmethod1(){
        VG_TU.policyCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol = VG_TU.createPolicy('VCL', acc.id);
        Policy_Schedule__c ps = VG_TU.createPolicySchedule(pol.id);
        VG_Policy_Schedule_Asset__c rr=new VG_Policy_Schedule_Asset__c();
        rr.VG_Policy_Schedule__c = ps.id;
        rr.VG_Province__c = 'ON';
        insert rr;
        Endorsement_Library__c EL = VG_TU.createEndorsementLibraryCustom('VCL','Endorsements');
        EL.VG_Province__c = 'ON';
        EL.Text__c ='table (OPCF21B_TableContent_2_manual) (OAFSTableContent) (OAFSTableContent_2) (OAFSTableContent_3) (OAFSTableContent_4) (OAFSTableContent_manual) (OAFSTableContent_2_manual) (OPCF23A_TableContent) (OPCF23A_TableContent_manual) (OPCF28A_TableContent) (OPCF28A_TableContent_manual) (SEF_19A_TableContent) (SEF_19A_TableContent_manual) (SEF_21d_TableContent) (SEF_23A_TableContent) (SEF_21d_TableContent_manual) (SEF_23A_TableContent_manual) (QEF3TotalPremium) (QEF17TotalPremium) (QEF_21BREV_TableContent) (QEF_21BREV_TableContent_2) (QEF_21BREV_TableContent_2_manual) (PEI_SEF_21B_TableContent) (PEI_SEF_21B_TableContent_1) (PEI_SEF_21B_TableContent_manual) (PEI_SEF_21B_TableContent_1_manual) (NBEF19a_TableContent) (NBEF19a_TableContent_manual) (NSEF21b_TableContent) (NSEF21b_TableContent_manual) (NSEF21b_TableContent_1) (NSEF21b_TableContent_1_manual) (OAFSTotalPremium) (AlbertaDecTotalPremium) (tplLimit) (BI_Limit) (PD) (PDDC) (deductible) (automobile_Number) (OPCF_19A_TableContent) (OPCF_19A_TableContent_manual) (Specified_Perils_premium) (Comprehensive_premium) (Collision_premium) (All_Perils_premium) (TotalPremium) (Specified_Perils_deductible) (Comprehensive_deductible) (Collision_deductible) (All_Perils_deductible) (OPCF21B_TableContent) (OPCF21B_TableContent_2) (OPCF21B_TableContent_manual) (checkboxitem) (PolName) (InsuredName) (InsurerName) (TodayDate) (tDay) (tMonth) (tYear) (ExpiryDate) (BrokerName) (BrokerContact) (BrokerContactEmail) (InsuredPhone) (Line_Of_Business) (QuoteDate) (UnderwriterName) (UnderwriterTitle) (UnderwriterEmail) (UnderwriterPhone) (BillingStreet) (BillingCity) (BillingState) (BillingPostalCode) (liability_Limit) <td id=""noborder"" class=""noborder"" ';
        update EL;
        VG_Policy_Schedule_Endorsement__c pse = new VG_Policy_Schedule_Endorsement__c();
        pse.VG_Policy_Schedule__c = ps.Id;
        pse.VG_Province__c = 'ON';
        pse.Endorsement_Library_Id__c = EL.Id;
        pse.VG_Endorsement_Details__c = '<span style="display: none;">RiskRatingTableEnd</span> <span style="display: none;">RiskRatingTableStart</span> <span style="display: none;">RiskRatingTableEnd_2</span> <span style="display: none;">RiskRatingTableStart_2</span> <span style="display: none;">RiskRatingTableEnd_3</span> <span style="display: none;">RiskRatingTableStart_3</span> <span style="display: none;">RiskRatingTableEnd_4</span> <span style="display: none;">RiskRatingTableStart_4</span>';
        insert pse;
        VG_Policy_Schedule_Endorsement__c pse1 = new VG_Policy_Schedule_Endorsement__c();
        pse1.VG_Policy_Schedule__c = ps.Id;
        pse1.VG_Province__c = 'ON';
        pse1.Endorsement_Library_Id__c = EL.Id;
        pse1.VG_Endorsement_Number__c ='OPCF 19a';
        insert pse1;
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Revise_VCLStep7Controller rvcl = new VG_Revise_VCLStep7Controller();
        //rvcl.NextProvince();
        rvcl.cancel();
    }
}