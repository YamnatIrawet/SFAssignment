({
        getAW : function(component, event) {
            console.log('===in helper==>>1');
           let getMylist = component.get('c.printMe');
            console.log('===in helper==>>2');
            getMylist.setParams({"acid":component.get('v.recordId')});
            console.log('===in helper==>>3');
            getMylist.setCallback(this,function(response){
                console.log('===in helper==>>4');
                let state=response.getState();
                if(state==="SUCCESS"){
                    console.log('===in helper==>>5');
                        console.log(JSON.stringify(response.getReturnValue()));
                        component.set("v.OCList",response.getReturnValue());
                        //component.set("v.dcon",true);  
                       // component.set("v.dopp",true);                 
                }
                else{
                    console.log("+++===>ERROR");
                }
            });
            console.log('===in helper==>>6');
            $A.enqueueAction(getMylist);
        },
        clickhandler : function(component, event) {
            let btnclickGid = event.getSource().getGlobalId();
            let btnclickLid = event.getSource().getLocalId();
            let btnclickLlabel = event.getSource().get('v.label')
            console.log("====>This is the global id: "+btnclickGid+" And Local id is: "+btnclickLid+" And LABEL is:"+btnclickLlabel);
            switch(btnclickLid){
                case 'dconS': component.set("v.dcon",true);   
                break;
                case 'dconH': component.set("v.dcon",false);   
                    break;
                case 'doppS': component.set("v.dopp",true);
                    break;
                case 'doppH': component.set("v.dopp",false);
                    break;
                default: component.set("v.dopp",false);component.set("v.dcon",false);
                    break;
            }
        }
})