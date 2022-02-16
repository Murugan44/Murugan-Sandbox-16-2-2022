global class CheckParticipationCededBatchJob implements Database.Batchable<sObject>,Database.Stateful {
    global List<Policy_Schedule__c> psList = new List<Policy_Schedule__c>();
    global String bdxCheck;
    global String thStyle;
    global String tdStyleOdd;
    global String tdStyleEven;
    global String baseUrl;
    global Integer count = 0;
    global Date createDate = Date.valueOf(System.Label.CreatedDate);

    global List<Policy_Schedule__c> start(Database.BatchableContext BC) {
        Set<Id> polIds = new Set<Id>();
        List<Policy__c> polList = new List<Policy__c>([SELECT Id, Name, RecordType.Name FROM Policy__c WHERE RecordType.Name != 'VFP' AND RecordType.Name != 'Aesir' AND RecordType.Name != 'Edison Motor' AND RecordType.Name != 'Affinity']);
        for(Policy__c pol: polList){
            polIds.add(pol.Id);
        }
        psList = new List<Policy_Schedule__c>([SELECT Id,Name,Product__c,Policy__c,RecordType.Name,VG_MTA_Type__c,(SELECT Id, Name, VG_Policy_Schedule__c, VG_UMR__c,VG_UMR__r.VG_Retrocession__c, Participation_Ceded__c FROM ReInsurances__r Where VG_UMR__r.VG_Retrocession__c ='No' AND Participation_Ceded__c !=100 ) FROM Policy_Schedule__c WHERE Policy__c=:polIds AND createdDate >: createDate]);
        return psList;
    }
    global void execute( Database.BatchableContext BC, List<Policy_Schedule__c> psList) {
        system.debug('psList::'+psList.size()+'::'+psList);
        
    }

    global void finish( Database.BatchableContext BC ) {
        count = 0;
        thStyle = 'style=\'padding-top: 12px; padding-bottom: 12px; padding-left: 15px;padding-right: 15px; text-align: center; background-color: #fa922a; color: white;\'';
        tdStyleOdd = 'style=\'border: 1px solid #ddd; padding: 8px;background-color: #f2f2f2;\'';
        tdStyleEven = 'style=\'border: 1px solid #ddd; padding: 8px;\'';
        baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        
        bdxCheck = '<table>';
        bdxCheck += '<th '+thStyle+'>Policy Schedule Name</th>';
        bdxCheck += '<th colspan="3"'+thStyle+'>Capacity Bordereaux Details</th>';
        for(Policy_Schedule__c ps: psList){
            if(ps.ReInsurances__r.size() > 0){
                Count++;
                String currentTdStyle = Math.mod(Count,2) == 0 ? tdStyleEven : tdStyleOdd;
                bdxCheck += '<tr>';
                bdxCheck += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.id+'">'+ps.Name+'</a></td>';
                bdxCheck += '<td>';
                bdxCheck += '<table>';
                bdxCheck += '<th '+thStyle+'>Capacity Bordereaux Name</th>';
                bdxCheck += '<th '+thStyle+'>Retrocession</th>';
                bdxCheck += '<th '+thStyle+'>Participation Ceded</th>';
                for(VG_ReInsurance__c ri: ps.ReInsurances__r){
                    bdxCheck += '<tr>';
                    bdxCheck += '<td '+currentTdStyle+'>'+ri.Name+'</td>';
                    bdxCheck += '<td '+currentTdStyle+'>'+ri.VG_UMR__r.VG_Retrocession__c+'</td>';
                    bdxCheck += '<td '+currentTdStyle+'>'+ri.Participation_Ceded__c+'%</td>';
                    bdxCheck += '</tr>'; 
                }
                bdxCheck += '</table>';
                bdxCheck += '</td>';
                bdxCheck += '</tr>';
            }
        //     system.debug('bdxCheck::'+bdxCheck);
        }
        bdxCheck += '</table>';
        system.debug('bdxCheck::'+bdxCheck);

        List<messaging.Email> emailsList = new List<messaging.Email>();
        messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
        //string[]toAdd=new string[]{'murugan.bm@clovetrix.com'}; // setup -> Deliverability
        string []ccAdd=new string[]{Label.ccEmaill_For_Syndicate_teams};
        string[]toAdd=new string[]{Label.Emaill_For_Syndicate_teams};
        email1.setToAddresses(toAdd);
        email1.setCcAddresses(ccAdd);
        email1.setSubject('Checking Participation Ceded 100% in Capacity Bordereaux.');
        email1.setHTMLBody('<b>Below Policy Schedule have less than or greater than 100% Participation Ceded in Capacity Bordereaux. :\n</b><br/><br/>'+bdxCheck);
        email1.setSenderDisplayName('Developer Team');
        emailsList.add(email1);
        messaging.sendEmail(emailsList);
    }
}