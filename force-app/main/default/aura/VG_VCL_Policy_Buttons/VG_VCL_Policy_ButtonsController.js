({
    handlePSClick : function(component, event, helper) {	
        var status;
        var recordId=component.get('v.recordId');
        var InsAcc=component.get('v.InsuredAcc');
        var CC=component.get('v.CurCode');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_VCL_Step_1?id=')+recordId;
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
        // $A.enqueueAction(action);
    },
    handleMTAClick : function(component, event, helper) {	
        var status;
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_MTA_Step1?PId=')+recordId;
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
    },
    uploadDocuments : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_LSAssetsUpload?id=')+recordId+encodeURIComponent('&attType=null&sObjectType=Policy__c');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
    },
    
    doInit : function(component, event, helper) {
        var pol;
        var renewalPol;
        var polList;        
        var recordId=component.get('v.recordId');
        var action = component.get("c.getPolicyStatus");
        action.setParams({
            "polId": recordId
        });
        action.setCallback(this, function(response) {
            var state=response.getState();
            if(state=="SUCCESS"){
                polList=response.getReturnValue();
                if(polList.length > 1){
                    pol=polList[0];
                    renewalPol=polList[1];
                }else{
                    pol=polList[0];
                }
                if(pol.Policy_Schedules__r != undefined || pol.Policy_Schedules__r != null){
                    pol.Policy_Schedules__r.forEach(item => {
                        if(item.Product__c == 'Property' || item.Product__c == 'Property BI&I')
                            component.set("v.property", true);
                    })
                }
                component.set("v.CurCode", pol.CurrencyIsoCode);
                component.set("v.InsuredAcc", pol.Insured__c);
                if(pol.Policy_Status__c=='Booked'){
                    component.set("v.mta", false);
                    
                }else{     
                    component.set("v.mta", true);
                    //component.set("v.ps", false);
                }
                if(pol.Policy_Status__c=='Booked' && pol.MTA_Cancel_List__c>0){
                    component.set("v.ps", false);
                }else if(pol.Policy_Status__c=='Booked' && pol.MTA_Cancel_List__c==0){
                    component.set("v.ps", true);                   
                }
                if(pol.Policy_Status__c == 'Booked'){
                    component.set("v.allowBrokerEdit", true);
                }
            }else{
                alert('state is '+state+' something wrong reload window '+response.getError());
            }
        });
        $A.enqueueAction(action);
    },  
     GenerateVolantePropertyDeclaration : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        alert('recordId'+recordId);
        var action = component.get("c.create_VCL_VolantePropertyDeclaration");
        action.setParams({
            "polId": recordId
        });
        action.setCallback(this,
                           function(response){
                               if(response.getState() == "SUCCESS"){
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "type": "success",
                                       "message": "Volante Property Declaration added to the Policy Successfully."
                                   });
                                   toastEvent.fire(); 
                               }else{
                                   
                               }
                           }
                          );
        $A.enqueueAction(action);        
    },
    handleEditClick : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var editPolicyEvent = $A.get("e.force:editRecord");
        editPolicyEvent.setParams({
            "recordId": recordId
        });
        editPolicyEvent.fire();
    },
    createClaim : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var createClaim = $A.get("e.force:createRecord");
        var InsAcc=component.get('v.InsuredAcc');
        createClaim.setParams({
            "entityApiName": "Claim__c",
            "defaultFieldValues": {
                'Policy_Number__c' : recordId,
                'Account__c'	   : InsAcc
            }
        });
        createClaim.fire();
    },
    handleGCClick : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_Edit_Governance_Compliance?id=')+recordId;
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
    },
    setBrokerEditFlag : function(component, event, helper) {
        component.set("v.BrokerEdit", true);
    },
    cancelBroker : function(component, event, helper) {
        component.set("v.BrokerEdit", false);
    },
    updateBroker : function(component, event, helper) {
        component.set("v.BrokerEdit", false);
        var recordId = component.get('v.recordId');
        var Brokervalue = component.find("broker").get("v.value");  
        component.set("v.Policy.Broker_Name__c",Brokervalue);
        component.find("record").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": recordId,
                    "slideDevName": "detail"
                });
                navEvt.fire();
                component.find('notifLib').showToast({
                    "variant": "success",
                    "message": "Broker updated sucessfully",
                    "mode" : "sticky"
                });
            } else {
                alert(saveResult.error[0].message);
                component.find('notifLib').showToast({
                    "variant": "info",
                    "message": saveResult.error[0].message,
                    "mode" : "sticky"
                });
            }
        }));
    }
})