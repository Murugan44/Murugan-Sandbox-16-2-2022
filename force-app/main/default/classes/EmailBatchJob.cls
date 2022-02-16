global class EmailBatchJob implements Database.Batchable<sObject> {
	global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('Hi::');
        return Database.getQueryLocator('SELECT id, Name FROM Account');
    }
    
    global void execute( Database.BatchableContext BC, List<Account> accList) {
        system.debug('Hi2::');
        for(Account ac: accList){
            system.debug('md::'+ac);
            ac.Name=ac.Name + '-' +string.valueOf(System.today());
        }
        update accList;
    }
    
    global void finish( Database.BatchableContext BC ) {
        
    }
}