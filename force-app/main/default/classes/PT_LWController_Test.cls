@IsTest(SeeAllData=False)
public with sharing class PT_LWController_Test {
    public Static TestMethod Void unitTestMethod1() {
        VG_TU.policyCustomSetting();
        Test.startTest();
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol = VG_TU.createPolicy('Bridge',acc.id); 
		Policy_Schedule__c ps = VG_TU.createPolicySchedule(pol.id);
        Policy_Payment__c pp = new Policy_Payment__c();
        pp.Policy__c = pol.id;
        insert pp;
        VG_Payment_Frequency__c pf = VG_TU.createPaymentFrequency(ps.id);
        pf.Policy_Payment__c = pp.id;
        update pf;
        VG_Payment_Frequency__c pf1=new VG_Payment_Frequency__c();
        pf1.Name='test/PF/1';
        pf1.Policy_Payment__c = pp.id;
        pf1.VG_Policy_Schedule__c=ps.id;
        pf1.VG_Due_Date__c=Date.newInstance(2019, 6, 8);
        pf1.VG_GWP_This_Time__c=4500;
        pf1.VG_Payment_Percent__c=50;
        Insert pf1;
        Policy_Tax__c pt = new Policy_Tax__c();
        pt.Policy__c = pol.id;
        insert pt;
        VG_Taxes__c tax = new VG_Taxes__c ();
        tax.VG_Policy_Schedule__c = ps.Id;
        tax.Policy_Tax__c = pt.id;
        insert tax;
        VG_Taxes__c tax1 = new VG_Taxes__c ();
        tax1.VG_Policy_Schedule__c = ps.Id;
        tax1.Policy_Tax__c = pt.id;
        insert tax1;
        PT_LWController.PolicyPaymentWrapper ppw = new PT_LWController.PolicyPaymentWrapper();
        ppw.counter = '0';
        ppw.comment = 'test';
        ppw.dueDate = string.valueOf(pf.VG_Due_Date__c);
        ppw.ppName = 'test';
        ppw.ppId = pp.id;
        ppw.broker = pol.Broker_Name__c;
        ppw.policyPaymenyPercent = '20';
        PT_LWController.PaymentFrequencyWrapper pfw = new PT_LWController.PaymentFrequencyWrapper();
        pfw.gwp = 1.00;
        pfw.pfCounter = '0';
        pfw.pfId = '';
        pfw.ppcounter = '0';
        pfw.ps = ps.id;
        ppw.pfList.add(pfw);
        
        PT_LWController.PolicyTaxWrapper tw = new PT_LWController.PolicyTaxWrapper();
        tw.comment = 'test';
        tw.counter = '0';
        tw.pTaxId = pt.id;
        tw.taxAdministeredBy = 'test';
        tw.taxIncluded = true;
        tw.taxJurisdiction = 'india';
        tw.taxPaidBy = 'Broker';
        tw.taxAdministeredBy = 'broker';
        tw.taxType = 'Business Turnover Tax';
        PT_LWController.TaxWrapper tww = new PT_LWController.TaxWrapper();
        tww.psSelected = ps.id;
        tww.ptcounter = '0';
        tww.taxableAmount = 22.2;
        tww.taxAmount ='213';
        tww.taxCounter = '0';
        tww.taxId = '';
        tww.taxPercent = '20';
        tw.taxWList.add(tww);
        PT_LWController.getPsList(pol.id);
        PT_LWController.getPP(pol.id);
        PT_LWController.getPolicyTax(pol.id);
        PT_LWController.getCheckValidationPS(ps.Id,22);
        PT_LWController.getcalcGWP(ps.Id,22);
        PT_LWController.deletePF(pf.id);
        PT_LWController.deleteTax(tax.Id);
        
        List<PT_LWController.PolicyPaymentWrapper>policypaymentList = new List<PT_LWController.PolicyPaymentWrapper>();
        policypaymentList.add(ppw);
        List<PT_LWController.PolicyTaxWrapper>policytaxList = new List<PT_LWController.PolicyTaxWrapper>();
        policytaxList.add(tw);
        PT_LWController.insertPolicyPayment(policypaymentList, pol.id);
        PT_LWController.insertPolicyTax(policytaxList, pol.id);
        
        Test.stopTest();
    }
}