({
    /*call apex controller method "fetchContentDocument" to get salesforce file records*/
    
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchContentDocument");
        
        action.setParams({
            "PolId" : component.get("v.recordId"),
        });
        //console.log('::>>'+PolId);
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var result = response.getReturnValue()
                component.set("v.lstContentDoc",result);
                console.log('::>>'+result);
            }
        });
        $A.enqueueAction(action);
    },
    
    getSelected : function(component,event,helper){
        // display modle and set seletedDocumentId attribute with selected record Id   
        component.set("v.hasModalOpen" , true);
        component.set("v.selectedDocumentId" , event.currentTarget.getAttribute("data-Id")); 
        
    },
    closeModel: function(component, event, helper) {
        // for Close Model, set the "hasModalOpen" attribute to "FALSE"  
        component.set("v.hasModalOpen", false);
        component.set("v.selectedDocumentId" , null); 
    },
    
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.isModalOpen", true);
    },
    
    closeModels: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.isModalOpen", false);
    },
    
})