global class batchDeletedata implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('Hi::');
        return Database.getQueryLocator('SELECT Batch_Size__c, Date_From__c, Date_To__c, List_of_Objects__c, User_Id__c  FROM DeleteNote__mdt');
    }
    
    global void execute( Database.BatchableContext BC, List<DeleteNote__mdt> deln) {
        system.debug('Hi2::');
        Map<String, String> delDataList = new Map<String, String>();
        for(DeleteNote__mdt md: deln){
            system.debug('md::'+md);
            String[] objList = md.List_of_Objects__c.split(',');
            
            DateTime fromDates = DateTime.newInstance(md.Date_From__c.year(),md.Date_From__c.month(), md.Date_From__c.day());
            DateTime toDates = DateTime.newInstance(md.Date_To__c.year(),md.Date_To__c.month(), md.Date_To__c.day());
            system.debug('date Check::'+fromDates+'To ::'+toDates);
            
            String fromdateStr = fromDates.format('yyyy-MM-dd');
            String todateStr = toDates.format('yyyy-MM-dd');
            system.debug('fromdateStr::'+fromdateStr+' To ::'+todateStr);
            
            String fromDate = fromdateStr+'T00:00:00Z';
            String toDate = todateStr+'T00:00:00Z';
            
            system.debug('objList::'+objList);
            for(String s: objList){
                system.debug('s::'+s);
                if(delDataList.containsKey(s)){
                    String query = delDataList.get(s)+' OR ( CreatedById =\''+md.User_Id__c+'\')';
                    system.debug('queryIF::'+query);
                    delDataList.put(s, query);
                }else{
                    String query = 'Select id from '+s+ ' where ( (CreatedDate > '+fromDate+' AND CreatedDate < '+toDate+') AND (CreatedById = \''+md.User_Id__c+'\') )';
                    system.debug('queryELSE::'+query);
                    delDataList.put(s, query);
                }
            }
        }
        system.debug('delDataList::'+delDataList);
        system.debug('delDataList.values()::'+delDataList.values());
        list<sObject> sObjectlist = new list<sObject>();
        for(String s: delDataList.values()){
            system.debug('s::'+s);
            List<sObject> sobjList = Database.query(s);
            system.debug('sobjList::'+sobjList);
            sObjectlist.addall(sobjList);
            system.debug('sObjectlist0::'+sObjectlist);
        }
        system.debug('sObjectlist::'+sObjectlist);
        //delete sObjectlist;
    }
    
    global void finish( Database.BatchableContext BC ) {
        
    }
    
    
}

/*batchDeletedata bt = new batchDeletedata();
Database.executeBatch(bt); */