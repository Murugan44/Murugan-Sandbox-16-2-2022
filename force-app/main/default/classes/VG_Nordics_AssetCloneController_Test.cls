@IsTest(SeeAllData=False)
public class VG_Nordics_AssetCloneController_Test {
	public static testmethod void testmethod3(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Asset__c ass = VG_TU.createAsset(acc.id);
        /*Policy__c pol=VG_TU.createPolicy('Bridge',acc.id);
        Policy_Schedule__c ps1=VG_Tu.createPolicySchedule(pol.id);
        ps1.VG_MTA_Type__c=null;
        ps1.Name= 'BDM/MTR/00040/2017/1/PS/1';
        ps1.Product__c = 'Commercial Combined - Property';               
        update ps1;*/
        VG_Nordics_AssetCloneController.getAssetRecord(ass.Id);
        VG_Nordics_AssetCloneController.updateOldAssetStatus(ass.Id);
        VG_Nordics_AssetCloneController.deleteAssetRecord(ass.Id);
    }
}