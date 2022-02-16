global class BudgetUpdateBatch implements Database.Batchable<sObject> , Schedulable, Database.Stateful {
    
    global List<Budget__c> start(Database.BatchableContext BC){
        return new List<Budget__c>([Select Id, Plan_Start_Date__c, Plan_End_Date__c, Planned_Premium__c, Actual_Premium__c, Team__c from Budget__c]);         
    }
 
    global void execute(Database.BatchableContext BC, List<Budget__c> budList){
         Budget__c budget = budList[0];
         List<VG_ReInsurance__c> RIList = [Select Id, VG_Ceded_Premium_USD__c from VG_ReInsurance__c where 
                                             VG_Policy_Schedule__r.RecordType.Name =: budget.Team__c AND 
                                             VG_Policy_Schedule__r.Policy__r.VG_Inception_Date__c >=: budget.Plan_Start_Date__c AND 
                                             VG_Policy_Schedule__r.Policy__r.VG_Inception_Date__c <=: budget.Plan_End_Date__c AND 
                                             (VG_Policy_Schedule__r.Policy__r.Policy_Status__c = 'Booked' OR VG_Policy_Schedule__r.Policy__r.Policy_Status__c = 'Bound') AND 
                                             VG_UMR__r.VG_Retrocession__c = 'No' AND
                                             VG_Policy_Schedule__r.VG_Co_Insurance_type__c != 'Child'];
         System.debug(RIList.size());
         Decimal actualPremium = 0;
         for(VG_ReInsurance__c ri : RIList){
             actualPremium = actualPremium + ri.VG_Ceded_Premium_USD__c;
         }
         budget.Actual_Premium__c = actualPremium; 
         Update budget;
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
    
    global void execute(SchedulableContext ctx) {
        BudgetUpdateBatch BudgetUpdateBatchCalculation = new BudgetUpdateBatch();
        database.executebatch(BudgetUpdateBatchCalculation,1);
    }
}