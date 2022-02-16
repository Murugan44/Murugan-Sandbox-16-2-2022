/*

 *Created By : Murugan
 
 *Created On : 30-04-2021
 
*/

trigger contentVersionTrigger on ContentVersion (after update) {
    VG_Functionality_Switches__c cs = VG_Functionality_Switches__c.getInstance();
    if(!cs.Skip_Triggers__c)
        ContentVersionTriggerFunction.Handler(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap, Trigger.IsBefore, Trigger.IsAfter, Trigger.IsInsert, Trigger.IsUpdate, Trigger.IsDelete);
}