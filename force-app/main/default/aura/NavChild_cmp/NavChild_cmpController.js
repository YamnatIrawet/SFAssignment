({
    init: function(cmp, event, helper) {
        console.log('I came in child controller......1');
        var pageReference = cmp.get("v.pageReference");
        console.log('I came in child controller......2');
        cmp.set("v.firstName", pageReference.state.firstName);
        console.log('first name: '+pageReference.state.firstName);
        cmp.set("v.lastName", pageReference.state.lastName);
        console.log('I came in child controller......3');
    }
})