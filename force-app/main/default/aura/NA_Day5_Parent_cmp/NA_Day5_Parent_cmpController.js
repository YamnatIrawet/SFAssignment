({
    callChildMethod1 : function(component, event, helper) {       
        var childCmp = component.find("child1");
        // call the aura:method in the child component
        var auraMethodResult = 
          childCmp.getParentDetails("true",component.get('v.recordId'));
        console.log("auraMethodResult: " + auraMethodResult);
        component.set("v.childReturnValue",auraMethodResult);
    }
})