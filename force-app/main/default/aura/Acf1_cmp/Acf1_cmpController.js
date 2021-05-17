({
   handleChange : function(component, event, helper) {
      // When an option is selected, navigate to the next screen
      var response = event.getSource().getLocalId();
      component.set("v.value", response);
       console.log('===in controller ==>>1',JSON.stringify(response));
      var navigate = component.get("v.navigateFlow");
              console.log('===in controller ==>>2');
              if (component.get("v.value")=="Participate_Yes"){
                         console.log('===in controller ==>>3');
                  navigate("NEXT");}
       else{
                  console.log('===in controller ==>>4');
           navigate("PREVIOUS");
       }
              console.log('===in controller ==>>5');
   }
})