/*@Created By: Anusuya
 *
 *@Created On: 16-Nov-2017
 *
 *@JIRA Number: VG-6
 *
 *@TestClasses: ContactTriggerFunction_Test
 */

trigger ContactTrigger on Contact (Before Insert, After Insert, Before Update, After Update, Before Delete, After Delete) {
     VG_Functionality_Switches__c cs = VG_Functionality_Switches__c.getInstance();
    if(!cs.Skip_Triggers__c)
        ContactTriggerFunction.Handler(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap, Trigger.IsBefore, Trigger.IsAfter, Trigger.IsInsert, Trigger.IsUpdate, Trigger.IsDelete);
}