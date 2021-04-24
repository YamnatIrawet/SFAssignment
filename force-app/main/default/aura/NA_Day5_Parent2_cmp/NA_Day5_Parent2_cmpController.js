({
    handleClick : function(component, event, helper) {
        var childCmp = component.find("childOpptList");
       // call the aura:method in the child component
       var auraMethodResult =  childCmp.sampleMethod();
   }
})