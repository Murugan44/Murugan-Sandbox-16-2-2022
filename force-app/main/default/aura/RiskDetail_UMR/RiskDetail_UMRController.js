({
	doInit : function(component, event, helper) {
        var rdRecord = component.get('v.RDRecord');
        if (rdRecord.Name.toUpperCase().indexOf("ASR") === -1) { 
            component.set("v.recordType","Others");
        }else{
            component.set("v.recordType","Aesir");
        }
    }
})