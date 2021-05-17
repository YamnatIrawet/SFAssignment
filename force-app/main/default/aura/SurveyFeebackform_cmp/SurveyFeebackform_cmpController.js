({
   init : function(cmp, event, helper) {
       
      // Figure out which buttons to display
      var availableActions = cmp.get('v.availableActions');
       console.log('===in controller ==>>1',availableActions);
      for (var i = 0; i < availableActions.length; i++) {
         if (availableActions[i] == "PAUSE") {
                    console.log('===in controller ==>>2');
            cmp.set("v.canPause", true);
         } else if (availableActions[i] == "BACK") {
               console.log('===in controller ==>>3');
            cmp.set("v.canBack", true);
         } else if (availableActions[i] == "NEXT") {
                    console.log('===in controller ==>>4');
            cmp.set("v.canNext", true);
         } else if (availableActions[i] == "FINISH") {
               console.log('===in controller ==>>5');
            cmp.set("v.canFinish", true);
         }
      }
              console.log('===in controller ==>>6');
   },
        
   onButtonPressed: function(cmp, event, helper) {
      // Figure out which action was called
      var actionClicked = event.getSource().getLocalId();
      // Fire that action
      var navigate = cmp.get('v.navigateFlow');
      navigate(actionClicked);
   }
})