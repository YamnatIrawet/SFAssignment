// auraNavigatorController.js
({
    init : function(cmp, event, helper) {
        var navService = cmp.find("navService");
        var pageRef = {
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Opportunity",
                actionName: "new"
            },
            state: {
            }
        }
        // Replace with your own field values
        var defaultFieldValues = {
            Name: "Salesforce, #1=CRM",
            AccountId: "Accounttest3",
            amount: 35000,
            OrderNumber__c: '000XXX000'
        };
        pageRef.state.defaultFieldValues = cmp.find("pageRefUtils").encodeDefaultFieldValues(defaultFieldValues);
        cmp.set("v.pgRef", pageRef);
        var defaultUrl = "#";

        // Generate a Link for the Aura Link example
        navService.generateUrl(pageRef)
        .then($A.getCallback(function(url) {
            cmp.set("v.url", url ? url : defaultUrl);
        }), $A.getCallback(function(error) {
            cmp.set("v.url", defaultUrl);
        }));
    },
    
    // Navigate to the record create page for the Aura PageRef example
    handleClick : function(cmp, event, helper) {
        var navService = cmp.find("navService");
        var pageRef = cmp.get("v.pgRef");
        event.preventDefault();
        navService.navigate(pageRef);
    }
})