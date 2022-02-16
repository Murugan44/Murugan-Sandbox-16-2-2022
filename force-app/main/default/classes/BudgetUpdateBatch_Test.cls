@isTest(SeeAllData = false)
public class BudgetUpdateBatch_Test {
	public static testMethod void TestMethod1(){
        Budget__c bd = new Budget__c();
        bd.Plan_Start_Date__c =Date.newInstance(2019, 12, 18);
        bd.Plan_Start_Date__c =Date.newInstance(2020, 12, 17);
        insert bd;
        Test.startTest();
        BudgetUpdateBatch ba= new BudgetUpdateBatch();
        Id jobid= Database.executeBatch(ba,5);
        Test.stopTest(); 
        
    }
    public static testMethod void TestMethod2(){
        Budget__c bd = new Budget__c();
        bd.Plan_Start_Date__c =Date.newInstance(2019, 12, 18);
        bd.Plan_Start_Date__c =Date.newInstance(2020, 12, 17);
        insert bd;
        Test.startTest();
        BudgetUpdateBatch ba= new BudgetUpdateBatch();
        String sch = '0 0 23 * * ?';
		system.schedule('Test status Check', sch, ba );
		Test.stopTest();
    }
}