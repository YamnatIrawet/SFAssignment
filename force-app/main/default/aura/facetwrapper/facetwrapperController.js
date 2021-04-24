({
	doInit: function (cmp) {
        var action = cmp.get("c.getOrgDetails");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var resp = response.getReturnValue();
                cmp.set("v.org", resp);
            }
        });
        $A.enqueueAction(action);
        
        
    },
    toggle: function (cmp) {
        cmp.set('v.toggle', !cmp.get('v.toggle'));
    },
})