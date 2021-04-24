({
    doInit : function(component, event, helper) {
        console.log("firing in comp_A1");
        var cmpEvt= component.getEvent("CmpEvt_A");
        cmpEvt.fire();
    },
    handleCompEvent : function(component, event, helper) {
		console.log('handler capture in ---comp_A1');
	},
    handleBubbling : function(component, event, helper) {
		console.log('handler bubble in ---comp_A1');
	},
})