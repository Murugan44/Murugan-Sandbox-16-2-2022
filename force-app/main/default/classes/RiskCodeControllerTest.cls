@IsTest(SeeAllData=False)
public with sharing class RiskCodeControllerTest {
    public Static TestMethod Void unitTestMethod1() {
        RiskCodeController.getRiskCodeList1();
        RiskCodeController.finish('Bridge', 'PI', 'E7-PI Arch/ Eng excl USA', null, null, 'Property ');
    }
}