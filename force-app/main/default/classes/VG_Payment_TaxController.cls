public class VG_Payment_TaxController {
    public ID PolicyId {get; set;} 
    public String psid{get;set;}
    public Policy__c policy{get;set;}
    public Policy_Schedule__c ps{get;set;}
    public Policy_Payment__c polPay{get;set;}
    public Map<Id,Policy_Schedule__c> psMap{get;set;}
    public List<SelectOption> psList{get;set;}
    Public List<PPWrapper> polPaymentList {get; set;}
    Public List<PPWrapper> polPaymentList1 {get; set;}
    public Map<String,  PPWrapper> ppwMap {get; set;}
    Public List<Policy_Schedule__c> psids {get;set;}
    
    public Decimal policyAmount{get; set;}
    
    Public Boolean showPaymetTax{get;set;}
    Public Boolean showSplit{get;set;}
    
    public Integer PPcounter {get; set;}
    public Integer PP1counter {get; set;}
    
    public VG_Payment_TaxController(){
        PolicyId =  ApexPages.currentPage().getParameters().get('id');
        system.debug('pId::'+PolicyId);
        policy=[select id,VG_Deadline__c,Name,VG_Governance_Compliance__c,RecordType.Name,Type_of_Insurance__c,Line_Of_Business__c,VG_Inception_Date__c,VG_Lead_or_Follow__c,Broker_Name__r.Name,Insured__r.Name,Insured__r.Business_Description__c,VG_Expiry_Date__c,VG_Territorial_Limits__c,VG_Wording__c,VG_Policy_Currency__c from Policy__c where id=:policyId];
        psMap=new Map<Id,Policy_schedule__c>([select id,Name,Policy__r.CreatedDate,Limit__c,Attachment__c,Sum_Insured__c,Share__c,VG_Total_Layer_Premium__c,Product__c,Gross_Written_Premium__c,VG_Brokerage_Amount__c from Policy_Schedule__c where Policy__c =: policy.id]);
        System.debug('Recordtype::'+policy.RecordType.Name);
        polPaymentList = new List<PPWrapper>();
        polPaymentList1 = new List<PPWrapper>();
        ppwMap =  new Map<String,  PPWrapper>();
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
        PPWrapper PPW  =  new PPWrapper();
        PPW.pp  =  polPay;
        PPW.counter  =  '0';
        PPW.paymentAmount = 0;
        PPW.psSelected = '';
        polPaymentList1.add(PPW);
    }
    
    public void setPSValues(){
        if(psid !='--None--'){
            ps=psMap.get(psid);
            system.debug('ps::'+ps);
            psids.add(ps);
            system.debug('psIds::'+psids);
            system.debug('psIds::'+psids.size());
        }
    }
    
    Public void splitPaymentTax(){
        showPaymetTax = true;
        showSplit = false;
    }
    
    Public PageReference finish(){
        List<Policy_Payment__c> policyPaymentToBeInserted = new List<Policy_Payment__c>();
        List<VG_Payment_Frequency__c> pfToBeInserted = new List<VG_Payment_Frequency__c>();
        
        for(PPWrapper ppw: polPaymentList1){
            if(ppwMap.containsKey(ppw.psSelected)){
                ppwMap.put(ppw.psSelected,ppw);
                //system.debug('map if::'+ppwMap);
            }else{
                ppwMap.put(ppw.psSelected, ppw);
                //system.debug('map else::'+ppwMap);
            }
        }
        
        Integer pfc = 0;
        for(Policy_schedule__c ps: psMap.values()){
            if(ppwMap.containsKey(ps.Id)){
                system.debug('ppwMap::'+ppwMap);
                for(PPWrapper ppw: polPaymentList1){
                    if(ppwMap.containsKey(ppw.psSelected)){
                        VG_Payment_Frequency__c pf = new VG_Payment_Frequency__c();
                        pf.VG_Policy_Schedule__c = ps.id;
                        pf.VG_GWP_This_Time__c = ppw.paymentAmount;
                        system.debug('paymentAmount  :: '+ppw.paymentAmount);
                        pf.Name = ps.Name+'/PF/'+pfc;
                        pf.Policy_Payment__c = ppw.pp.id;
                        pfToBeInserted.add(pf);
                        pfc++;
                        system.debug('PF::'+pfToBeInserted);
                        break;
                    }
                }
            }
        }
        
        Integer ppcount=1;
        for(PPWrapper ppw : polPaymentList){
            ppw.pp.Name = policy.Name + '/PP/' + ppcount;
            ppw.pp.Policy__c = policy.Id;
            policyPaymentToBeInserted.add(ppw.pp);
            system.debug('PP::'+policyPaymentToBeInserted);
            ppcount++;
        }
        
        if(!policyPaymentToBeInserted.IsEmpty()){
            //Insert policyPaymentToBeInserted;
            system.debug('inserted PP::'+policyPaymentToBeInserted);
        }
        if(!pfToBeInserted.IsEmpty()){
            //Insert pfToBeInserted;
            system.debug('inserted pf::'+pfToBeInserted);
        }
        //return new PageReference('/'+policyId);
        return null;
    }
    
    Public PageReference  cancel(){
        return new PageReference('/'+policyId);
    }
    Public void addPayment(){
        Boolean allOkToAddNewPayemnt = True;
        PPWrapper waNew=new PPWrapper();
        waNew.Counter=string.valueOf(PPcounter);
        system.debug('Counter::'+ waNew.Counter);
        if(allOkToAddNewPayemnt){
            Policy_Payment__c ppNew =new Policy_Payment__c();
            ppNew.VG_Policy_Payment_Amount__c  = 0;
            waNew.psSelected = '';
            waNew.paymentAmount = 0;
            waNew.pp=ppNew;
            polPaymentList1.add(waNew);
            system.debug('polPaymentList::'+polPaymentList1);
            PP1counter++;
            system.debug('PPcounter::'+PP1counter);
        }
    }
    
    Public void addP(){
        
        //polPaymentList1.clear();
        PPWrapper waNew=new PPWrapper();
        waNew.showSplit = true;
        waNew.Counter=string.valueOf(PPcounter);
        system.debug('Counter::'+ waNew.Counter);
            Policy_Payment__c ppNew =new Policy_Payment__c();
            ppNew.VG_Policy_Payment_Amount__c  = 0;
            waNew.psSelected = '';
            waNew.paymentAmount = 0;
            waNew.pp=ppNew;
            polPaymentList.add(waNew);
            PPcounter++;
            system.debug('polPaymentList::'+polPaymentList);
    }
    
    Public class PPWrapper{
        Public Policy_Payment__c pp{get;set;}
        Public String Counter{get;set;}
        Public String psSelected{get;set;}
        Public Decimal paymentAmount{get;set;}
        Public Boolean showSplit{get;set;}
    }
}