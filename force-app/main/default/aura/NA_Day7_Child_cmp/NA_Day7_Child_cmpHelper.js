({
    getoppt : function(component, event) {
          
        console.log('===in child helper==>>1');
        let oppList = component.get('c.getCOppByName');
        console.log('===in child helper==>>2');
        oppList.setParams({"opName":component.get('v.childAttribute')});
        console.log('===in child helper==>>3');
        oppList.setCallback(this,function(response){
            let state=response.getState();
            if(state==="SUCCESS"){
        
                    console.log(JSON.stringify(response.getReturnValue()));
                    console.log('===in child helper==>>5');
                    component.set("v.oppList",response.getReturnValue().opportunityList);
                    component.set("v.conList",response.getReturnValue().contactList);
                console.log('===in child helper==>>7');
                let cmpEvent=component.getEvent("cmpEvt");
                cmpEvent.setParams({'OppRecords':component.get('v.oppList'),'ConRecords':component.get('v.conList')});
                console.log('===in child helper oppList==>>8'+JSON.stringify(component.get("v.oppList")));
                console.log('===in child helper conList==>>9'+JSON.stringify(component.get("v.conList")));
                cmpEvent.fire();
                console.log('===in child helper==>>10');
            }
            else if(state==="ERROR"){
                console.log("+++===>ERROR");
            }
        });
        console.log('===in child helper==>>4');
        $A.enqueueAction(oppList);
                debugger;
    }
})