global class CheckBasePSProductBatch implements Database.Batchable<sObject>,Database.Stateful {
    global Map<Id,List<String>> polProdMap = new Map<Id,List<String>>();
    global Map<Id,Boolean> allowPolMap = new Map<Id,Boolean>();
    global String ProductCheck;
    global String thStyle;
    global String tdStyleOdd;
    global String tdStyleEven;
    global String baseUrl;
    global Integer count = 0;
    global Date createDate = Date.valueOf(System.Label.CreatedDate);
    
    global List<Policy_Schedule__c> start(Database.BatchableContext BC) {
        Set<Id> polIds = new Set<Id>();
        List<Policy__c> polList = new List<Policy__c>([SELECT Id, Name, RecordType.Name, (SELECT Id FROM Policy_Schedules__r WHERE VG_MTA_Type__c = null AND RecordType.Name != 'VFP' AND RecordType.Name != 'Edison Motor' AND RecordType.Name != 'Affinity' AND RecordType.Name != 'Aesir') FROM Policy__c WHERE RecordType.Name !='VFP' AND RecordType.Name !='Edison Motor' AND RecordType.Name !='Affinity' AND RecordType.Name != 'Aesir']);
        for(Policy__c pol: polList){
            if(pol.Policy_Schedules__r.size()>1)
            	polIds.add(pol.Id);
        }
        
        return new List<Policy_Schedule__c>([SELECT Id,Name,Product__c,Policy__c,RecordType.Name,VG_MTA_Type__c,createdDate FROM Policy_Schedule__c WHERE Policy__c=:polIds AND VG_MTA_Type__c = null AND RecordType.Name != 'VFP' AND RecordType.Name != 'Edison Motor' AND RecordType.Name != 'Affinity' AND RecordType.Name != 'Aesir' AND createdDate >: createDate]);
    }
    global void execute( Database.BatchableContext BC, List<Policy_Schedule__c> psList) {
        system.debug('psList::'+psList.size()+'::'+psList);
        if(!psList.IsEmpty()){
            for(Policy_Schedule__c ps: psList){
                if(polProdMap.containsKey(ps.Policy__c)){
                    List<String> tempList = polProdMap.get(ps.Policy__c);
                    tempList.add(ps.Product__c);
                    polProdMap.put(ps.Policy__c, tempList);
                }else{
                    polProdMap.put(ps.Policy__c, new List<String>{ps.Product__c});
                }
            }
            
            system.debug('polProdMap::'+polProdMap);
            for(Id polId: polProdMap.keySet()){
                Set<String> tmpSet = new Set<String>();
                boolean flag = false;
                for(String prod: polProdMap.get(polId)){
                    system.debug('::'+polProdMap.get(polId));
                    system.debug('::'+tmpSet.contains(prod));
                    if(tmpSet.contains(prod)){
                        flag = true;
                    }else{
                        tmpSet.add(prod);
                    }
                }
                allowPolMap.put(polId, flag);
            }
            system.debug('allowPolMap::'+allowPolMap);
        }
    }        
    global void finish( Database.BatchableContext BC ) {
        system.debug('polProdMap finish::'+polProdMap.size()+'::'+polProdMap);
        List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>([SELECT Id,Name,Policy__r.Name,Policy__c,VG_MTA_Type__c,Product__c,RecordType.Name FROM Policy_Schedule__c Where Policy__c=:polProdMap.keyset() AND VG_MTA_Type__c = null AND RecordType.Name != 'VFP' AND RecordType.Name != 'Aesir' AND RecordType.Name != 'Edison Motor' AND RecordType.Name != 'Affinity' AND createdDate >: createDate]);
        system.debug('psList finish::'+psList.size()+'::'+psList);
        count = 0;
        thStyle = 'style=\'padding-top: 12px; padding-bottom: 12px; padding-left: 15px;padding-right: 15px; text-align: center; background-color: #fa922a; color: white;\'';
        tdStyleOdd = 'style=\'border: 1px solid #ddd; padding: 8px;background-color: #f2f2f2;\'';
        tdStyleEven = 'style=\'border: 1px solid #ddd; padding: 8px;\'';
        baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        
        ProductCheck = '<table>';
        ProductCheck += '<th '+thStyle+'>Policy Name</th>';
        ProductCheck += '<th '+thStyle+'>Policy Schedule Name</th>';
        ProductCheck += '<th '+thStyle+'>Product</th>';
        for(Policy_Schedule__c ps: psList){
            if(polProdMap.get(ps.Policy__c).contains(ps.Product__c) && allowPolMap.get(ps.Policy__c)){
                Count++;
                String currentTdStyle = Math.mod(Count,2) == 0 ? tdStyleEven : tdStyleOdd;
                ProductCheck += '<tr>';
                ProductCheck += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.Policy__c+'">'+ps.Policy__r.Name+'</a></td>';
                ProductCheck += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.id+'">'+ps.Name+'</a></td>';
                ProductCheck += '<td '+currentTdStyle+'>'+ps.Product__c+'</td>';
                ProductCheck += '</tr>';
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
        email1.setSubject('Mulitiple Policy Schedule Products in Same Policy.');
        email1.setHTMLBody('<b>Below Policy Schedule have same Mulitiple Products Policy Schedule in Same Policy. :\n</b><br/><br/>'+ProductCheck);
        email1.setSenderDisplayName('Developer Team');
        emailsList.add(email1);
        messaging.sendEmail(emailsList);
        
        MTAProductCheckBatch bt = new MTAProductCheckBatch();
        Database.executeBatch(bt);
    }
}

/*CheckBasePSProductBatch bt = new CheckBasePSProductBatch();
Database.executeBatch(bt); */