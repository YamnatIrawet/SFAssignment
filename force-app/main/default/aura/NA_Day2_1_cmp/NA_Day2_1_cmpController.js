({
    getOpportunities : function(component, event, helper) {
        console.log("====>in client controller");
        helper.getoppt(component, event);
    },
    handleClick : function(component,event,helper){
        helper.clickhandler(component,event);
    }
})