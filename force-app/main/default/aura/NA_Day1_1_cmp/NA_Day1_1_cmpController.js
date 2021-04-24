({
	handleInit : function(component, event, helper) {
		let arg1 = component.get("v.showText");
        console.log("Get component"+arg1);
             console.log("Get component",arg1);
        component.set("v.showText","my value 2");
        component.set("v.state","Arizona");
        component.set("v.town","Gila Bend");
	}
})