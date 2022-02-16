global class UpdateInBatchAndEMail implements Database.Batchable<sObject>{
    
    //Start Method
   global Database.QueryLocator start(Database.BatchableContext BC){
   
   string query='SELECT Name FROM Account';
   return Database.getQueryLocator(query);
   
   }
   //Execute Method

   global void execute(Database.BatchableContext BC ,List<Account> Scope){
   system.debug('Scope::');
   
    for(Account ac : Scope){
    
     ac.Name=ac.Name + '-' +string.valueOf(System.today());
    }
    update Scope;
   }
   
   //Finish Method

   global void finish(Database.BatchableContext BC){
   
   {    //Email to the emailID who created the Code or the  Owner.
        /*AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email    from AsyncApexJob where Id =:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Match Merge Batch ' + a.Status);
        mail.setPlainTextBody('records processed ' + a.TotalJobItems +   'with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });*/
    } 
   }
}