@IsTest(SeeAllData=False)
public class companyDetailController_Test {
	public static testmethod void method1(){
        Account acc=VG_TU.createAccount('Customer');
        
        //Test.setMock(HttpCalloutMock.class, new FakeWebservices());
        companyDetailController un=new companyDetailController();
        companyDetailController.StockDetails ua = new companyDetailController.StockDetails();
        companyDetailController.getCompanyDetails(acc.id);
        
    }
}