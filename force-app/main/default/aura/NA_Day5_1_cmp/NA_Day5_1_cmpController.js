({
    getParentDetails : function(component, event, helper) {
        let params = event.getParam('arguments');
        if(params){
            let acbstr = params.acb;
            console.log("boolean value is: "+ acbstr);
            let accIdstr = params.accId;
            console.log("Account Id is: "+ accIdstr);
            component.set("v.value",acbstr);
            return " Account Id is: "+accIdstr;
        }
    }
})