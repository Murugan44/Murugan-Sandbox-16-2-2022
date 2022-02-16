/*
Every Hour Cron Exp :
MissingCBXAlert mcbx = new MissingCBXAlert();
String sch = '0 0 * * * ?';
system.schedule('MissingCBXAlert', sch, mcbx);
*/
global class MissingCBXAlert implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<messaging.Email> emailsList = new List<messaging.Email>();
        Boolean sendAlert = False;
        String MissingCBX='';
        String thStyle = 'style=\'padding-top: 12px; padding-bottom: 12px; padding-left: 15px;padding-right: 15px; text-align: center; background-color: #fa922a; color: white;\'';
        String tdStyleOdd = 'style=\'border: 1px solid #ddd; padding: 8px;background-color: #f2f2f2;\'';
        String tdStyleEven = 'style=\'border: 1px solid #ddd; padding: 8px;\'';
        String baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        List<VG_ReInsurance__c> RIList = [Select Id, CreatedDate, VG_UMR__c, VG_UMR__r.Name, VG_UMR__r.RecordType.Name, VG_UMR__r.VG_Capacity_Paper__c, VG_UMR__r.VG_Account__r.Name, VG_UMR__r.VG_Retrocession__c, VG_UMR__r.VG_RI_Inception_Date__c, VG_UMR__r.VG_RI_Expiry_Date__c, VG_Policy_Schedule__r.Name, VG_Policy_Schedule__r.Policy__r.Name, VG_Policy_Schedule__r.Policy__r.Policy_Status__c, VG_Policy_Schedule__r.Policy__r.VG_Expiry_Date__c, VG_Policy_Schedule__r.Policy__r.Insured__r.Name, VG_Policy_Schedule__r.RecordType.Name, VG_Policy_Schedule__c, VG_Policy_Schedule__r.VG_Capacity_Paper__c, VG_Policy_Schedule__r.Policy__r.VG_Inception_Date__c from VG_ReInsurance__c];
        Map<Id, Policy_Schedule__c> psMap = new Map<Id, Policy_Schedule__c>([Select Id,Policy__r.Insured__r.Name, Policy__r.Underwriter__r.Name, Policy__r.Name, LastModifiedDate, LastModifiedBy.Name, Policy__r.Policy_Status__c, Name, Policy__r.VG_Inception_Date__c, Policy__r.VG_Expiry_Date__c, VG_Capacity_Paper__c from Policy_Schedule__c where Policy__r.Policy_Status__c !='NTU/Decline' AND Policy__r.Policy_Status__c !='Prospect']);
        Set<Id> setIds = new Set<Id>();
        Integer count = 0;
        for(VG_ReInsurance__c RI : RIList){
            setIds.add(RI.VG_Policy_Schedule__c);
        }
        MissingCBX = '<table>';
        MissingCBX += '<th '+thStyle+'>Policy Schedule</th>';
        MissingCBX += '<th '+thStyle+'>Last Modified By</th>';
        MissingCBX += '<th '+thStyle+'>Last Modified Date</th>';
        MissingCBX += '<th '+thStyle+'>Insured</th>';
        MissingCBX += '<th '+thStyle+'>Underwriter</th>';
        MissingCBX += '<th '+thStyle+'>Capacity Paper</th>';
        for(Id psId : psMap.keySet()){
            if(!setIds.contains(psId)){
                Count++;
                sendAlert = True;
                String currentTdStyle = Math.mod(Count,2) == 0 ? tdStyleEven : tdStyleOdd;
                MissingCBX += '<tr>';
                Policy_Schedule__c ps = psMap.get(psId);
                String lastModified = ps.LastModifiedDate.format('dd/MM/yyyy hh:mm a');
                MissingCBX += '<td '+currentTdStyle+'><a href="'+baseUrl+'/'+ps.Id+'">'+ps.Name+'</a></td>';
                MissingCBX += '<td '+currentTdStyle+'>'+ps.LastModifiedBy.Name+'</td>';
                MissingCBX += '<td '+currentTdStyle+'>'+lastModified+'</td>';
                MissingCBX += '<td '+currentTdStyle+'>'+ps.Policy__r.Insured__r.Name+'</td>';
                MissingCBX += '<td '+currentTdStyle+'>'+ps.Policy__r.Underwriter__r.Name+'</td>';
                MissingCBX += '<td '+currentTdStyle+'>'+ps.VG_Capacity_Paper__c+'</td>';
                MissingCBX += '</tr>';
            }
        }
        MissingCBX += '</table>';
        string[]toAdd=new string[]{Label.EmailID_DuplicatePolicyNumberDetector};
        string []ccAdd=new string[]{Label.EmailID2_DuplicatePolicyNumberDetector};
        messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
        if(sendAlert){
            email1.setToAddresses(toAdd);
            email1.setCcAddresses(ccAdd);
            email1.setSubject('Missing Capacity Bordereaux Alert.');
            email1.setHTMLBody('<b>Below Policy Schedules are missing capacity bordereaux :\n</b><br/><br/>'+MissingCBX);
            email1.setSenderDisplayName('Developer Team');
            emailsList.add(email1);
            messaging.sendEmail(emailsList);
        }
    }

}