({
    callmeh:function(component,event) {
        let oppl = event.getParam("OppRecords");
        let conl = event.getParam("ConRecords");
        console.log("===in parent helper==>>1");
        if(typeof oppl !== 'undefined' && oppl.length > 0){
            component.set("v.opList",oppl);
            console.log("===in parent helper o==>>2 "+JSON.stringify(component.get("v.opList")));
            component.set("v.isoTrue",true); 
        }
        else{
            console.log("===in parent helper o==>>3");
            component.set("v.opList",null);
            component.set("v.isoTrue",false); 
        }
        console.log("===in parent helper==>>4");
        if(typeof conl !== 'undefined' && conl.length > 0){
            console.log("===in parent helper c==>>6");
            component.set("v.ocList",conl);
            console.log("===in parent helper c==>>5 "+JSON.stringify(component.get("v.ocList")));
            component.set("v.iscTrue",true); 
        }
        else{
            console.log("===in parent helper c==>>7");
            component.set("v.ocList",null);
            component.set("v.iscTrue",false); 
        }
        console.log("===in parent helper==>>8");
    }
})