({
    init : function(cmp, event, helper) {
        var navService = cmp.find("navService");
        var pageReference = {
            
            "type": "standard__component",
            "attributes": {
                "componentName": "c__NavChild_cmp"    
            },    
            "state": {
                "c__firstName": "Test"  ,
                "c__lastName": "user"    
            }
        };
        cmp.set("v.pageReference", pageReference);
        var defaultUrl = "#";
        console.log('I came in parent init controller.....1');
        navService.generateUrl(pageReference)
        .then($A.getCallback(function(url) {
            console.log('I came in parent init controller.....2');
            cmp.set("v.url", url ? url : defaultUrl);
        }), $A.getCallback(function(error) {
            console.log('I came in parent init controller.....3');
            cmp.set("v.url", defaultUrl);
        }));
    },
    handleClick: function(cmp, event, helper) {
        var navService = cmp.find("navService");
        console.log('I came in click of parent controller');
        // Uses the pageReference definition in the init handler
        var pageReference = cmp.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageReference);
    }
})