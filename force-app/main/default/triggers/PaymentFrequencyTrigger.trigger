trigger PaymentFrequencyTrigger on VG_Payment_Frequency__c(Before Insert, After Insert, Before Update, After Update, Before Delete, After Delete) {
     VG_Functionality_Switches__c cs = VG_Functionality_Switches__c.getInstance();
    if(!cs.Skip_Triggers__c)
        PaymentFrequencyTriggerFunction.Handler(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap, Trigger.IsBefore, Trigger.IsAfter, Trigger.IsInsert, Trigger.IsUpdate, Trigger.IsDelete);
}