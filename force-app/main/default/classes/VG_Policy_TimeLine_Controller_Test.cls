@IsTest(SeeAllData=False)
public class VG_Policy_TimeLine_Controller_Test {
    Public Static TestMethod Void testMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer'); 
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        Insert ps;
        VG_Policy_TimeLine_Controller.getPolicySchedule(pol.Id);
    }
}