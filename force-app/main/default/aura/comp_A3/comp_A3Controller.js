({
    doInit : function(component, event, helper) {
        console.log("firing in comp_A3");
        var cmpEvt= component.getEvent("CmpEvt_A");
        cmpEvt.fire();
    },
    handleBubbling : function(component, event, helper) {
		console.log('handler bubble in ---comp_A3');
	},
    handleCompEvent : function(component, event, helper) {
		console.log('handler capture in ---comp_A3');
	}
})