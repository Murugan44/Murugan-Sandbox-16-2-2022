/*

 *Created By : Siddik
 
 *Created On : 24-11-2017
 
 *JIRA.No    : VG-11
 
 *Test Class : PolicyScheduleTriggerFunctionTest
 
*/

trigger PolicyScheduleTrigger on Policy_Schedule__c (Before Insert, After Insert, Before Update, After Update, Before Delete, After Delete, After Undelete) {
     VG_Functionality_Switches__c cs = VG_Functionality_Switches__c.getInstance();
    if(!cs.Skip_Triggers__c)
        PolicyScheduleTriggerFunction.Handler(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap, Trigger.IsBefore, Trigger.IsAfter, Trigger.IsInsert, Trigger.IsUpdate, Trigger.IsDelete, Trigger.IsUndelete);
}