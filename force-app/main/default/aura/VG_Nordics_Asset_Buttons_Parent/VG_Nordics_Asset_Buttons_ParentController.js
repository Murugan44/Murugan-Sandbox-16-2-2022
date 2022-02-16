({
    handleEditClick : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var cloneAsset;
        var action = component.get("c.getAssetRecord");
        action.setParams({
            "assId": recordId
        });        
        action.setCallback(this, function(response) {
            var state=response.getState();
            if(state=="SUCCESS"){
                cloneAsset=response.getReturnValue();   
                component.set("v.assCloneId", cloneAsset.Id);
                component.set("v.assName", cloneAsset.Name);
                component.set("v.isOpen", true);                
            }   
        });          
        $A.enqueueAction(action);
    },
    
    save : function(component, event, helper) {
         var assStatus;
         var recordId=component.get('v.recordId');
         var action = component.get("c.updateOldAssetStatus");
         action.setParams({
             "assId": recordId
         }); 
         action.setCallback(this, function(response) {
             var state=response.getState();
             if(state=="SUCCESS"){               
                 assStatus = response.getReturnValue();                    
             }   
         });
         component.find("edit").get("e.recordSave").fire();
         var assCloneId = component.get("v.assCloneId");
         var toastEvent = $A.get("e.force:showToast");
         toastEvent.setParams({
             "title": "Success!",
             "message": "My Custom Record Saved Successfully"
         });
         toastEvent.fire();
         var navEvt = $A.get("e.force:navigateToSObject");
         navEvt.setParams({
             "recordId": assCloneId,
             "slideDevName": "related"
         });
         navEvt.fire(); 
         $A.enqueueAction(action);     
		 
    },   
    
    cancel :function(component, event) {
        var assCloneId = component.get("v.assCloneId");
        var action = component.get("c.deleteAssetRecord");
        action.setParams({
            "assId": assCloneId            
        });        
        action.setCallback(this, function(response) {
            var state=response.getState();
            if(state=="SUCCESS"){               
                component.set("v.isOpen", false);
            }   
        });           
        $A.enqueueAction(action);  
    }
})