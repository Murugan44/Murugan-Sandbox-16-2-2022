({
    doInit  : function(component, event, helper) {
        var ps;
        var recordId=component.get('v.recordId');
        var action = component.get("c.getPolicySchedule");
        action.setParams({
            "psId": recordId
        });
        action.setCallback(this, function(response) {
            var action = component.get("c.getCurrentUser");
            var user=$A.get("$Label.c.Delete_PS");
            var users = user.split(';');
            action.setCallback(this, function(response) {
                var state=response.getState();
                users.forEach(function(currentValue,Index,ActuallArray){
                    if(response.getReturnValue() == currentValue){
                        component.set("v.allowDelete", true);
                    }
                    return;
                })
            });
            $A.enqueueAction(action);
            var state=response.getState();
            if(state=="SUCCESS"){
                ps=response.getReturnValue();
                component.set("v.psProduct",ps.Product__c);
                component.set("v.policyCurrency",ps.CurrencyIsoCode);
                component.set("v.MTAType",ps.VG_MTA_Type__c);
                if(ps.RecordType.Name == 'SAPI'){
                    component.set("v.RecordTypeName", true);
                }
                if((ps.Policy__r.Policy_Status__c == 'Quoted' || ps.Policy__r.Policy_Status__c == 'NTU' || ps.Policy__r.Policy_Status__c == 'Bound' || ps.Policy__r.Policy_Status__c=='Booked')&& ps.Policy__r.VG_Sub_Status__c=='Approved'){                                                  
                    component.set("v.quote", true);
                }
                if((ps.Policy__r.Policy_Status__c == 'Bound' || ps.Policy__r.Policy_Status__c=='Booked')&& ps.Policy__r.VG_Sub_Status__c=='Approved'){                                                  
                    component.set("v.bound", true);
                }
                if((!ps.VG_Is_MTA__c && ps.Policy__r.Policy_Status__c == 'Booked')|| (ps.VG_Is_MTA__c && ps.VG_Status__c == 'Booked')){                 
                    component.set("v.mta", true);
                }
                
                //if(ps.VG_MTA_Type__c=='Run-Off' && ps.VG_Status__c == 'Booked' && (ps.Product__c =='D&O Run-off' || ps.Product__c =='Pre-paid D&O Run-off')){
                if(ps.Product__c =='D&O Run-off' || ps.Product__c =='Pre-paid D&O Run-off'){  
                    component.set("v.mtaRunOff", true);
                }
                if(ps.VG_Status__c !='Booked' && ps.VG_Is_MTA__c && (ps.VG_MTA_Type__c=='Revision of Cover'||ps.VG_MTA_Type__c=='Extension'||ps.VG_MTA_Type__c=='Cancellation'||ps.VG_MTA_Type__c=='Declaration' || ps.VG_MTA_Type__c=='Run-Off' || ps.VG_MTA_Type__c == 'Reduction')){
                    component.set("v.booked", true);
                }
                if(ps.VG_MTA_Type__c == null){
                    component.set("v.booked", false);
                }
            }
        });
        $A.enqueueAction(action);                    
    },
    handleReviseClick : function(component, event, helper) {
        var status;
        var recordId=component.get('v.recordId');
        //var policyCurrency=component.get('v.policyCurrency');
        var MTAType=component.get('v.MTAType');
        console.log('MTA>>>'+MTAType);
        if(MTAType == "Run-Off"){
            console.log('MTA1>>>'+MTAType);
            var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Revise_SAPI_Step5?Id=')+recordId;
        }else if(MTAType == "Bad Debt Provision"){
            console.log('MTA1>>>'+MTAType);
            var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Revise_SAPI_Step6?Id=')+recordId;
        }else{
            console.log('check else>>>');
            var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Revise_SAPI_Step1?Id=')+recordId;
        }
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();            
        //$A.enqueueAction(action);        
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
    
    handleROCClick : function(component, event, helper) {
        var status;
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_MTA_Step1?PSId=')+recordId+encodeURIComponent('&RecordType=SAPI');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();            
        //$A.enqueueAction(action);        
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
        
    },
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.isModalOpen", true);
    },
    
    closeModels: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.isModalOpen", false);
    },
    handleStartDateChange : function(component, event, helper) {  
        var startDate = event.getParam("value")
		component.set("v.startDate", startDate)
    },
    handleEndDateChange : function(component, event, helper) {  
        var endDate = event.getParam("value")
		component.set("v.endDate", endDate)
    },
    doSave : function(component, event, helper) {
        var sDate = component.get('v.startDate');
        var eDate = component.get('v.endDate');
        component.set('v.psObj.VG_Risk_Start_Date__c', sDate)
        component.set('v.psObj.VG_Risk_End_Date__c', eDate)
        var recordId=component.get('v.recordId');
        var action = component.get("c.updateRiskDatePS");
        var startDate = component.get('v.psObj.VG_Risk_Start_Date__c');
        var endDate = component.get('v.psObj.VG_Risk_End_Date__c');
        if(startDate != null && endDate != null && startDate !='' && endDate != ''){
            action.setParams({
                'psObj':component.get('v.psObj'),
                "psId": recordId
            });
            action.setCallback(this,function(data){           
                component.set('v.contactId',data.getReturnValue())
            });
            $A.enqueueAction(action);
            $A.get('e.force:refreshView').fire();
            component.set("v.isModalOpen", false);
        }else{
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error!",
                "type": "error",
                "message": "Please give both dates..."
            });
            toastEvent.fire(); 
            component.set("v.isModalOpen", true);
        }
    },
})