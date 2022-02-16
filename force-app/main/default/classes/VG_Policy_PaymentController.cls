public class VG_Policy_PaymentController {

   /* Public List<PolicyPaymentWrapper> ppWrapperList {get; set;}
    
    public ID PolicyId {get; set;} 
    public String psid{get;set;}
    public Policy__c policy{get;set;}
    public Policy_Schedule__c ps{get;set;}
    public Policy_Payment__c polPay{get;set;}
    public Map<Id,Policy_Schedule__c> psMap{get;set;}
    public List<SelectOption> psList{get;set;}
    Public List<Policy_Schedule__c> psids {get;set;}
    
    public Decimal policyAmount{get; set;}
    
    Public Boolean showPaymetTax{get;set;}
    Public Boolean showSplit{get;set;}
    
    public Integer PPcounter {get; set;}
    public Integer PP1counter {get; set;}
    
    Public VG_Policy_PaymentController(){
        PolicyId =  ApexPages.currentPage().getParameters().get('id');
        system.debug('pId::'+PolicyId);
        policy=[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:policyId];
        psMap=new Map<Id,Policy_schedule__c>([select id,Name,Policy__r.CreatedDate,Limit__c,Attachment__c,Sum_Insured__c,Share__c,VG_Total_Layer_Premium__c,Product__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c from Policy_Schedule__c where Policy__c =: policy.id]);
        System.debug('Recordtype::'+policy.RecordType.Name);
        ppWrapperList = new List<PolicyPaymentWrapper>();
        
        psids = new List<Policy_Schedule__c>();
        psMap.values().sort();
        psList=new List<SelectOption>();
        psList.add(new SelectOption('--None--','--None--'));
        PPcounter = 1;
        PP1counter =1;
        policyAmount=0;
        showPaymetTax = false;
        ps=new Policy_Schedule__c();
        for(Policy_Schedule__c ps: psMap.values()){
            System.debug('7.2.2019::'+ps);
            psList.add(new SelectOption(ps.id,ps.Name));
        }
        polPay = new Policy_Payment__c();
        PolicyPaymentWrapper PPW  =  new PolicyPaymentWrapper();
        PPW.pp  =  polPay;
        PPW.counter  =  '0';
        ppWrapperList.add(PPW);
    }
    
    Public PageReference addPolicyPayment(){
        return null;
    }

    Public Class PolicyPaymentWrapper{
        List<PaymentFrequencyWrapper> pfWrapperList{get;set;}
        Public Policy_Payment__c pp{get;set;}
        Public String Counter{get;set;}
        Public Boolean showSplit{get;set;}
    }
    
    Public Class PaymentFrequencyWrapper{
        Public String psSelected{get;set;}
        Public Decimal paymentAmount{get;set;}
    }*/
}