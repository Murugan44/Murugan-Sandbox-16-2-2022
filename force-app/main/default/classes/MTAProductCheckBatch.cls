global class MTAProductCheckBatch implements Database.Batchable<sObject>,Database.Stateful {
    global String ProductCheck;
    global String thStyle;
    global String tdStyleOdd;
    global String tdStyleEven;
    global String baseUrl;
    global Integer count = 0;
    global List<Policy_Schedule__c> psnewList = new List<Policy_Schedule__c>();
    global Date createDate = Date.valueOf(System.Label.CreatedDate);
    
	global List<Policy_Schedule__c> start(Database.BatchableContext BC) {
        // return Database.getQueryLocator(
        return new List<Policy_Schedule__c>([SELECT id, Name, RecordType.Name,Product__c,createdDate, MTA_Parent_Policy_Schedule__c,MTA_Parent_Policy_Schedule__r.Name, MTA_Parent_Policy_Schedule__r.Product__c FROM Policy_Schedule__c WHERE MTA_Parent_Policy_Schedule__c != null AND RecordType.Name != 'VFP' AND RecordType.Name != 'Aesir' AND RecordType.Name != 'Edison Motor' AND RecordType.Name != 'Affinity' AND createdDate >: createDate]);
        // );
    }
    
    global void execute( Database.BatchableContext BC, List<Policy_Schedule__c> psList) {
        system.debug('Hi2::');
        
        system.debug('psList::'+psList.size()+'::'+psList);
        for(Policy_Schedule__c ps: psList){
            if(ps.RecordType.Name !='VFP' && ps.RecordType.Name !='Edison Motor' && ps.RecordType.Name != 'Affinity'){
                if(ps.Product__c != ps.MTA_Parent_Policy_Schedule__r.Product__c){
                    psnewList.add(ps);
                }
            }
        }
        system.debug('psnewList::'+psnewList.size()+'::'+psnewList);
    }
    
    global void finish( Database.BatchableContext BC ) {
        system.debug('psnewList::'+psnewList.size()+'::'+psnewList);
        count = 0;
        thStyle = 'style=\'padding-top: 12px; padding-bottom: 12px; padding-left: 15px;padding-right: 15px; text-align: center; background-color: #fa922a; color: white;\'';
        tdStyleOdd = 'style=\'border: 1px solid #ddd; padding: 8px;background-color: #f2f2f2;\'';
        tdStyleEven = 'style=\'border: 1px solid #ddd; padding: 8px;\'';
        baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        
        ProductCheck = '<table>';
        ProductCheck += '<th '+thStyle+'>Policy Schedule Name</th>';
        ProductCheck += '<th '+thStyle+'>Product</th>';
        ProductCheck += '<th '+thStyle+'>MTA Parent Policy Schedule Name</th>';
        ProductCheck += '<th '+thStyle+'>MTA Parent Policy Schedule Product</th>';
        for(Policy_Schedule__c ps: psnewList){
            if(ps.RecordType.Name !='VFP' && ps.RecordType.Name !='Edison Motor' && ps.RecordType.Name != 'Affinity'){
                if(ps.Product__c != ps.MTA_Parent_Policy_Schedule__r.Product__c){
                    Count++;
                    String currentTdStyle = Math.mod(Count,2) == 0 ? tdStyleEven : tdStyleOdd;
                    ProductCheck += '<tr>';
                    ProductCheck += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.Id+'">'+ps.Name+'</a></td>';
                    ProductCheck += '<td '+currentTdStyle+'>'+ps.Product__c+'</td>';
                    ProductCheck += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.MTA_Parent_Policy_Schedule__c+'">'+ps.MTA_Parent_Policy_Schedule__r.Name+'</a></td>';
                    ProductCheck += '<td '+currentTdStyle+'>'+ps.MTA_Parent_Policy_Schedule__r.Product__c+'</td>';
                    ProductCheck += '</tr>';
                }
            }
        }
        ProductCheck += '</table>';
        
        List<messaging.Email> emailsList = new List<messaging.Email>();
        messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
         //string[]toAdd=new string[]{'murugan.bm@clovetrix.com'}; // setup -> Deliverability
        string []ccAdd=new string[]{Label.ccEmaill_For_Syndicate_teams};
        string[]toAdd=new string[]{Label.Emaill_For_Syndicate_teams};
        email1.setToAddresses(toAdd);
        email1.setCcAddresses(ccAdd);
        email1.setSubject('Miss Matching MTA Parent Policy Schedule Products.');
        email1.setHTMLBody('<b>Below Policy Schedule product does not matches with the MTA parent Policy Schedule Product :\n</b><br/><br/>'+ProductCheck);
        email1.setSenderDisplayName('Developer Team');
        emailsList.add(email1);
        messaging.sendEmail(emailsList);
        
        CheckParticipationCededBatchJob cp = new CheckParticipationCededBatchJob();
        Database.executeBatch(cp);
    }
}

/*MTAProductCheckBatch bt = new MTAProductCheckBatch();
Database.executeBatch(bt); */