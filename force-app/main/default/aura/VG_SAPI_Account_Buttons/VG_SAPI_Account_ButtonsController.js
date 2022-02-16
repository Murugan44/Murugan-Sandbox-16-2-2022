({
    handleDocClick : function(component, event, helper) {
        var recordId=component.get('v.recordId');
        var url='/sfdcpage/'+encodeURIComponent('/apex/VG_LSAssetsUpload?id=')+recordId+encodeURIComponent('&sObjectType=Account');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
    }, 
    handlePSClick : function(component, event, helper) {
        var rt=$A.get("$Label.c.SAPI_Policy");
        var recordId=component.get('v.recordId');
        var createPolicyEvent = $A.get("e.force:createRecord");
        createPolicyEvent.setParams({
            "entityApiName": "Policy__c",
            "recordTypeId" : rt,
            "defaultFieldValues": {
                'Name' : 'Do Not Populate',
                'Insured__c' : recordId,
                'RecordTypeId':rt
            }
        });
        createPolicyEvent.fire();
    }
})