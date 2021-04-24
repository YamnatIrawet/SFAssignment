({
    getoppt : function(component, event) {
          
        console.log('===in child helper==>>1');
        let oppList = component.get('c.getCOppByName');
        console.log('===in child helper==>>2');
       // oppList.setParams({"opName":component.get('v.childAttribute')});
        oppList.setParams({"opName":"test"});
        console.log('===in child helper==>>3');
        oppList.setCallback(this,function(response){
            let state=response.getState();
            if(state==="SUCCESS"){
        
                    console.log(JSON.stringify(response.getReturnValue()));
                    console.log('===in child helper==>>5');
                    component.set("v.op",response.getReturnValue().opportunityList);
                    component.set("v.oc",response.getReturnValue().contactList);
                console.log('===in child helper==>>7');
               // let cmpEvent=component.getEvent("cmpEvt");
               /// cmpEvent.setParams({'OppRecords':component.get('v.op'),'ConRecords':component.get('v.oc')});
               // console.log('===in child helper oppList==>>8'+JSON.stringify(component.get("v.op")));
               // console.log('===in child helper conList==>>9'+JSON.stringify(component.get("v.oc")));
               // cmpEvent.fire();
               // console.log('===in child helper==>>10');
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