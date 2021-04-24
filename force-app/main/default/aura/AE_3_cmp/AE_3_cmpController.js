({
    fireAE : function(component, event, helper) {
        let appEvent= $A.get("e.c:AE_evt");
        appEvent.setParams({
            message:"AE Value set in A3"
        });
        appEvent.fire();
    },
    handleAppevent: function(component, event, helper) {
        console.debug("handling AE in AEcomp 3");
        component.set('v.AEValue',event.getParam('message'));
        let stpid = component.find("stpId3").get("v.checked");
        let stdid = component.find("stdId3").get("v.checked");
       // alert(event.getPhase());
        if(stpid===true){
            event.stopPropagation();
            console.debug('AE_3 stop propogation is set : '+stpid);
        }
        if(stdid==true ){
            if(event.getPhase()!="default"){
            event.preventDefault();
            console.debug('AE_3 prevent default value is: '+stdid);}
            else{alert("prevent default does not work in default phase");}
        }
    }
})