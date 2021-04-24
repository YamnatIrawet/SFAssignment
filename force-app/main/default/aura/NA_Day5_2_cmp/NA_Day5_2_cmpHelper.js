({
    callServerAction : function(cmp) {
        
        let action = cmp.get('c.lstOpportunity');
        action.setParams({'recordId':cmp.get('v.AccountId'),'recordId1':'test'});
        action.setCallback(this,function(result){
            let state = result.getState();
            if(state==='SUCCESS')
            {cmp.set('v.oppList',result.getReturnValue());
            }else if (state === "ERROR") {
                var errors = result.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
            
        });
        $A.enqueueAction(action);
    }
})