({
    getAccWrp : function(component, event, helper) {
        console.log("====>in client controller");
        helper.getAW(component, event);
    },
    handleClick : function(component,event,helper){
        helper.clickhandler(component,event);
    }
})