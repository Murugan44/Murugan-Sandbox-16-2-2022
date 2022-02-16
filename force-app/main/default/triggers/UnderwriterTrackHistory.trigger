trigger UnderwriterTrackHistory on User(Before Insert, After Insert, Before Update, After Update, Before Delete, After Delete) {
    UnderwriterTrackHistoryTriggerFunction.Handler(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap, Trigger.IsBefore, Trigger.IsAfter, Trigger.IsInsert, Trigger.IsUpdate, Trigger.IsDelete);
}