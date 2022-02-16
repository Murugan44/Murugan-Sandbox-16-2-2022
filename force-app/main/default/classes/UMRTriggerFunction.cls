Public Class UMRTriggerFunction{
    
    Public Static Void Handler(List<VG_UMR__c> TriggerNew, List<VG_UMR__c> TriggerOld, Map<Id, VG_UMR__c> TriggerNewMap, Map<Id, VG_UMR__c> TriggerOldMap, Boolean IsBefore, Boolean IsAfter, Boolean IsInsert, Boolean IsUpdate, Boolean IsDelete){
        if(IsAfter && IsUpdate){
            updateSharings(TriggerNewMap, TriggerOldMap);
        }
    }
    
    Public Static Void updateSharings(Map<Id, VG_UMR__c> TriggerNewMap, Map<Id, VG_UMR__c> TriggerOldMap){
        Map<Id, Id> policyRemoveIds = new Map<Id, Id>();
        Map<Id, Id> accountRemoveIds = new Map<Id, Id>(); 
        Map<Id, VG_UMR__c> umrMap = new Map<Id, VG_UMR__c>();
        for(VG_UMR__c u : TriggerNewMap.values()){
            if(u.VG_Archive__c != TriggerOldMap.get(u.Id).VG_Archive__c){
                if(u.VG_Archive__c == 'Yes'){
                    //UMRRemoveIds.add(u.Id);
                }
                if(u.VG_Archive__c == 'No'){
                   // UMRAddIds.add(u.Id);
                }
                umrMap.put(u.Id, u);
            }
        }
        if(!umrMap.IsEmpty()){
            List<VG_ReInsurance__c> removeList = new List<VG_ReInsurance__c>();
            List<UMR_Sharing_Id__mdt> sharingList  =  [Select Id,  Account_Id__c,  Record_Type__c, Sharing_Public_Group_Id__c from UMR_Sharing_Id__mdt];
            Map<String, Id> accountGroupId = new Map<String, Id>();
            for(UMR_Sharing_Id__mdt uSharing : sharingList ){
                accountGroupId.put(uSharing.Account_Id__c+uSharing.Record_Type__c, uSharing.Sharing_Public_Group_Id__c);       
            }
            List<VG_ReInsurance__c> riList = [Select Id, VG_UMR__c, VG_UMR__r.RecordType.Name, VG_UMR__r.VG_Account__c, VG_Policy_Schedule__r.Policy__c, VG_Policy_Schedule__r.Policy__r.Insured__c from VG_ReInsurance__c where VG_UMR__c IN: umrMap.keySet()];
            List<Policy__Share> policiesToBeShared = new List<Policy__Share>();
            List<AccountShare> accountToBeShared = new List<AccountShare>();
            List<Policy__Share> policiesToBeUnshared = new List<Policy__Share>();
            List<AccountShare> accountToBeUnshared = new List<AccountShare>();
            for(VG_ReInsurance__c ri : riList){
                String accId15digit = ((String)ri.VG_UMR__r.VG_Account__c).substring(0,15);
                if(umrMap.get(ri.VG_UMR__c).VG_Archive__c == 'No'){
                    if(accountGroupId.get(accId15digit+ri.VG_UMR__r.RecordType.Name)  !=   null){
                        Policy__Share tempShare  =  new Policy__Share();
                        tempShare.ParentID =  ri.VG_Policy_Schedule__r.Policy__c;
                        tempShare.UserOrGroupId  =  accountGroupId.get(accId15digit+ri.VG_UMR__r.RecordType.Name);
                        tempShare.AccessLevel  =  'Read';
                        policiesToBeShared.add(tempShare);
                        AccountShare tempAccShare  =  new AccountShare();
                        tempAccShare.AccountID  = ri.VG_Policy_Schedule__r.Policy__r.Insured__c;
                        tempAccShare.UserOrGroupId  =  accountGroupId.get(accId15digit+ri.VG_UMR__r.RecordType.Name); 
                        tempAccShare.AccountAccessLevel  =  'Read';
                        tempAccShare.OpportunityAccessLevel  =  'Read';
                        tempAccShare.CaseAccessLevel  =  'Read';
                        accountToBeShared.add(tempAccShare);
                    }
                }
                if(umrMap.get(ri.VG_UMR__c).VG_Archive__c == 'Yes'){
                    policyRemoveIds.put(ri.VG_Policy_Schedule__r.Policy__c, accountGroupId.get(accId15digit+ri.VG_UMR__r.RecordType.Name));
                    accountRemoveIds.put(ri.VG_Policy_Schedule__r.Policy__r.Insured__c, accountGroupId.get(accId15digit+ri.VG_UMR__r.RecordType.Name));
                    removeList.add(ri);
                }
            }
            List<Policy__Share> policyShare = [Select Id, ParentID, UserOrGroupId from Policy__Share where RowCause = 'Manual' AND ParentID IN: policyRemoveIds.keySet()];
            List<AccountShare> accShare = [Select Id, AccountID, UserOrGroupId from AccountShare where RowCause = 'Manual' AND AccountID IN: accountRemoveIds.keySet()];
            for(Policy__Share psh : policyShare){
                if(policyRemoveIds.containsKey(psh.ParentID) && policyRemoveIds.get(psh.ParentID) == psh.UserOrGroupId){
                    policiesToBeUnshared.add(psh);
                }
            }
            for(AccountShare ash : accShare){
                if(accountRemoveIds.containsKey(ash.AccountID) && accountRemoveIds.get(ash.AccountID) == ash.UserOrGroupId){
                    accountToBeUnshared.add(ash);
                }
            }
            if(!policiesToBeShared.IsEmpty()){
                Insert policiesToBeShared;
            }
            if(!accountToBeShared.IsEmpty()){
                Insert accountToBeShared;
            }
            if(!policiesToBeUnshared.IsEmpty()){
                Delete policiesToBeUnshared;
            }
            if(!accountToBeUnshared.IsEmpty()){
                Delete accountToBeUnshared;
            }
        }
    }
}