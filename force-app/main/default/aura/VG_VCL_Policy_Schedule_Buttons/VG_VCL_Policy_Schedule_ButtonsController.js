({
    doInit  : function(component, event, helper) {
        var ps;
        var recordId=component.get('v.recordId');
        var action = component.get("c.getPolicySchedule");
        action.setParams({
            "psId": recordId
        });
        action.setCallback(this, function(response) {
            var action1 = component.get("c.getCurrentUser");
            action1.setCallback(this, function(response) {
                var state=response.getState();
                if(state=="SUCCESS"){
                    if(response.getReturnValue() == 'admin'){                 
                    	component.set("v.allowDelete", true);
                	}
                }
            });
            $A.enqueueAction(action1);
            var state=response.getState();
            if(state=="SUCCESS"){
                ps=response.getReturnValue();
                component.set("v.psProduct",ps.Product__c);
                component.set("v.policyCurrency",ps.CurrencyIsoCode);
                if((ps.Policy__r.Policy_Status__c == 'Quoted' || ps.Policy__r.Policy_Status__c == 'NTU' || ps.Policy__r.Policy_Status__c == 'Bound' || ps.Policy__r.Policy_Status__c=='Booked')&& ps.Policy__r.VG_Sub_Status__c=='Approved'){                                                  
                    component.set("v.quote", true);
                }
                if(ps.VG_Status__c == 'Booked'){                 
                    component.set("v.mta", true);
                }
                if(ps.Product__c == 'Wrap Up Primary (Canada only)' || ps.Product__c =='Wrap Up Excess (Canada Only)' ){
                    component.set("v.wrapup", true);
                }
                if(ps.Product__c == 'GL - Claims Made, Including USA' || ps.Product__c == 'GL - Claims Made, Excluding USA' || ps.Product__c == 'GL - Occurrence, Including USA' || ps.Product__c == 'GL - Occurrence , Excluding USA'){
                    component.set("v.CommercialGLPL", true);
                }
                if(ps.Product__c == 'Umbrella - Claims Made, Including USA' || ps.Product__c == 'Umbrella - Claims Made, Excluding USA' || ps.Product__c == 'Umbrella - Occurrence, Including USA' || ps.Product__c == 'Umbrella - Occurrence, Excluding USA' ){
                    component.set("v.Umberlla", true);
                }
                if(ps.Product__c == 'Excess - Claims Made, Including USA' || ps.Product__c =='Excess - Claims Made, Excluding USA' || ps.Product__c =='Excess - Occurrence, Including USA' || ps.Product__c == 'Excess - Occurrence, Excluding USA' ){
                    component.set("v.Excess", true);
                }
                if(ps.Product__c == 'Property' || ps.Product__c == 'Property BI&I'){
                    component.set("v.Property", true);
                }
                if(ps.Product__c == 'Motor'){
                    component.set("v.Motor", true);                  
                }
                if(ps.VG_Status__c !='Booked' && ps.VG_Is_MTA__c && (ps.VG_MTA_Type__c=='Revision of Cover'||ps.VG_MTA_Type__c=='Extension'||ps.VG_MTA_Type__c=='Cancellation')){
                    component.set("v.booked", true);
                }
            }
        });
        $A.enqueueAction(action);                    
    },
    Booked : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.bookPolicySchedule");
        action.setParams({
            "psId": recordId
        });
        action.setCallback(this,
                           function(response){
                               var toastEvent = $A.get("e.force:showToast");
                               if(response.getState() == "SUCCESS"){
                                   $A.get('e.force:refreshView').fire();
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Policy Schedule Booked."
                                   });                                   
                               }else{
                                   var errors = response.getError();
                                   $A.get('e.force:refreshView').fire();                                   
                                   toastEvent.setParams({
                                       "title": "You encountered some errors when trying to save this record",
                                       "type": "info",
                                       "message": errors[0].pageErrors[0].message,
                                       "mode" : "sticky"
                                   }); 
                               }
                               toastEvent.fire(); 
                           }
                          );
        $A.enqueueAction(action);        
    },
    handleReviseClick : function(component, event, helper) {
        var status;
        var recordId=component.get('v.recordId');
        var policyCurrency=component.get('v.policyCurrency');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Revise_VCL_Step_1?Id=')+recordId+encodeURIComponent('&policyCurrency=')+policyCurrency;
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();            
        //$A.enqueueAction(action);        
    },
    handleROCClick : function(component, event, helper) {
        var status;
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_MTA_Step1?PSId=')+recordId+encodeURIComponent('&RecordType=VCL');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();            
        //$A.enqueueAction(action);        
    },
    handlePFClick : function(component, event, helper) {
        var status;
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Payment_Details?Id=')+recordId;
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();            
    },
    GenerateULDDoc : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.createVCl_Liability_Attachment");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Schedule added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    GenerateOPCF19A : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_OPCF19A_Attachment");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "OPCF19A added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    
    GenerateWrapup : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_Wrap_UP_Attachment");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "WrapUp added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    
    GenerateCommercialGLPL : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_Commercial_GLPL_Attachment");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Commercial GLPL added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    GenerateOPCF2 : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_OPCF2_Attachment");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "OPCF2 added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    GenerateVolanteUmbrellaDeclaration : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_VolanteUmbrellaDeclaration");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Volante Umbrella Declaration added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    GenerateVolanteExcessDeclaration : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_VolanteExcessDeclaration");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Volante Excess Declaration added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
     GenerateVolantePropertyDeclaration : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var action = component.get("c.create_VCL_VolantePropertyDeclaration");
        action.setParams({
            "PSId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Volante Property Declaration added to the Policy Schedule Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    deletePS : function(component, event, helper) {
        var policyID;
        var recordId=component.get('v.recordId');
        var action = component.get("c.deletePolicySchedule");
        action.setParams({
            "psId": recordId
        }); 
        action.setCallback(this, function(response) {
            var state=response.getState();
            if(state=="SUCCESS"){
                policyID=response.getReturnValue();
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": policyID,
                    "slideDevName": "detail"
                });
                navEvt.fire();
            }
        });
        $A.enqueueAction(action);
    }
})