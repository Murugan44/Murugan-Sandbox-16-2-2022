@IsTest(SeeAllData=False)
public class VG_GetProfile_Test {
    public Static Testmethod Void method1(){
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('Edison Motor',acc.id);
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.Id);
        VG_GetProfile.getProfileName();
        VG_GetProfile.getUserInfo(ps.id);
    }
}