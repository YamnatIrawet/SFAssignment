({
    handleLoadonCreate: function (cmp, event, helper) {
        var pageRef = cmp.get("v.pageReference");
        var defaultFieldValues = 
        cmp.find("pageRefUtils").decodeDefaultFieldValues(pageRef.state.defaultFieldValues);
        var nameFieldValue = cmp.find("OpportunityNamefield").set("v.value", defaultFieldValues.Name);
        var numOfEmpFieldValue = cmp.find("AccountNameField").set("v.value", defaultFieldValues.AccountId);
        var ownerIdFieldValue = cmp.find("amountField").set("v.value", defaultFieldValues.amount);
        var customCheckFieldValue = cmp.find("OrderNumberField").set("v.value", defaultFieldValues.OrderNumber__c);
    }
})