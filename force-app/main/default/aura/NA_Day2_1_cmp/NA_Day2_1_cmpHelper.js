({
    getoppt : function(component, event) {
        console.log('===in helper==>>1');
        let oppList = component.get("c.getAccOpp");
        console.log('===in helper==>>2');
        oppList.setParams({"AccId":component.get('v.recordId')});
        console.log('===in helper==>>3');
        oppList.setCallback(this,function(response){
            let state=response.getState();
            if(state==="SUCCESS"){
                if(response.getReturnValue().length>0){
                    console.log(JSON.stringify(response.getReturnValue()));
                    component.set("v.oppList",response.getReturnValue());
                    component.set("v.isTrue",true);                   
                }
            }
            else if(state==="ERROR"){
                console.log("+++===>ERROR");
            }
        });
        console.log('===in helper==>>4');
        $A.enqueueAction(oppList);
    },
    clickhandler : function(component, event) {
        let btnclickGid = event.getSource().getGlobalId();
        let btnclickLid = event.getSource().getLocalId();
        let btnclickLlabel = event.getSource().get('v.label')
        console.log("====>This is the global id: "+btnclickGid+" And Local id is: "+btnclickLid+" And LABEL is:"+btnclickLlabel);
        if(btnclickLid==='test2'){
            component.set("v.isTrue",false);   
        } else{
            component.set("v.isTrue",true);
        }
    }
})