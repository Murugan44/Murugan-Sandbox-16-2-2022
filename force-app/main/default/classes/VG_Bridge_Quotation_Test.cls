@IsTest(seeAllData =False)
public class VG_Bridge_Quotation_Test {
    public static testMethod void TestMethod1() {
        VG_TU.policyCustomSetting();
        Document d6=new Document();
        d6.Name='Bridge Loge For English Quote';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Document d7=new Document();
        d7.Name='Peter Forsberg';
        d7.Body=blob.valueOf('Hai');
        d7.FolderId='0050O0000078Mug';
        insert d7;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Bridge', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        ps.Gross_Written_Premium__c=150000;
        ps.VG_MTA_Type__c = null;
        Insert ps;
        ApexPages.currentPage().getParameters().put('Id', pol.id);
        VG_Bridge_Quotation quote=new VG_Bridge_Quotation(); 
        //VG_Bridge_Quotation.dummycode();
    }
}