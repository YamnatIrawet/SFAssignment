({
  doInit : function(component, event, helper) {
    console.log("firing in comp_A2");
    var cmpEvt= component.getEvent("CmpEvt_A");
    cmpEvt.fire();
},
    handleCompEvent: function(component, event, helper) {
		console.log('handler capture in ---comp_A2');
    console.log("A2 handler for " + event.getName());
    //event.stopPropagation();
	},
  handleBubbling : function(component, event, helper) {
  console.log('handler bubble in ---comp_A2');
},
})