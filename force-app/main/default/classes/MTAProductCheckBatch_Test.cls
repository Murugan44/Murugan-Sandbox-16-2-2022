@IsTest(SeeAllData=False)
public class MTAProductCheckBatch_Test {
    public static testMethod void TestMethod1(){
        VG_TU.policyCustomSetting();
        Account acc=VG_TU.createAccount('Customer');
        Policy__c pol=VG_TU.createPolicy('Bridge',acc.id);
        List<Policy_Schedule__c> pslist = new List<Policy_Schedule__c>();
        Policy_Schedule__c ps=VG_TU.createPolicySchedule(pol.id);
        ps.Product__c = 'PI';
        update ps;
        Policy_Schedule__c ps1=VG_TU.createPolicySchedule(pol.id);
        ps1.Product__c = 'D&O';
        update ps1;
        pslist.add(ps);
        pslist.add(ps1);    
        VG_Policy_Schedule_Asset__c rr=VG_TU.createPolicyScheduleAsset(ps.id);         
        VG_UMR__c umr = VG_TU.createUMR(acc.id);
        VG_ReInsurance__c RI = VG_TU.createReInsurance(ps.id,umr.id);
        Test.startTest(); 
        MTAProductCheckBatch M = new MTAProductCheckBatch();
        DataBase.executeBatch(M);
        M.execute(null, psList);
        M.psnewList.add(ps);
        M.psnewList.add(ps1);
        CheckBasePSProductBatch C = new CheckBasePSProductBatch();
        DataBase.executeBatch(C);
        C.execute(null, psList);
        CheckParticipationCededBatchJob P = new CheckParticipationCededBatchJob();
        DataBase.executeBatch(P);
        P.execute(null, psList);
        Test.stopTest(); 
    }
}