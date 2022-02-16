Public class UnderwriterTrackHistoryTriggerFunction {
    Public Static Void Handler(List<User> TriggerNew,List<User> TriggerOld,Map<Id,User> TriggerNewMap,Map<Id,User> TriggerOldMap,Boolean IsBefore,Boolean IsAfter,Boolean IsInsert,Boolean IsUpdate,Boolean IsDelete){
        if(IsBefore && IsUpdate){
            trackHistory(TriggerNew, TriggerOldMap, IsUpdate);
        }
    }
    
    Public Static void trackHistory(List <User> TriggerNew,Map<Id, User> TriggerOldMap,Boolean IsUpdate){          
       for(User PSU : TriggerNew){    
            if(PSU.VG_Underwriter__c!= TriggerOldMap.get(PSU.Id).VG_Underwriter__c){ 
                String Name = UserInfo.getName();
                String dateTimeValue = String.valueOf(System.Now());
                if(PSU.Underwriter_track_history__c == null)
                    PSU.Underwriter_track_history__c ='';
                if(PSU.Underwriter_track_history__c ==''){
                    PSU.Underwriter_track_history__c += '<p>Track Histroy : ' +Name +' Changed Underwriter from '+TriggerOldMap.get(PSU.Id).VG_Underwriter__c+' to '+PSU.VG_Underwriter__c+' '+ dateTimeValue + '</p>';
                }else{
                    PSU.Underwriter_track_history__c += '<p>Track Histroy : ' +Name +' Changed Underwriter from '+TriggerOldMap.get(PSU.Id).VG_Underwriter__c+' to '+PSU.VG_Underwriter__c+' '+ dateTimeValue + '</p>';
                }
            }      
        }
    }
    
}