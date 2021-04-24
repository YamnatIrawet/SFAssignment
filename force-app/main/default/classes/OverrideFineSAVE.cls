public with sharing class OverrideFineSAVE {

    public string strBook { get; set;}
    public Fine__C fine{get;set;}
    
    ApexPages.StandardController con;
    public OverrideFineSAVE(ApexPages.StandardController controller) {
        
        con=controller;                     
    }
   
    public pagereference dosave(){

    con.save();
    // pagereference ref=new pagereference('/apex/FineVFpage');
    // ref.setredirect(true);
    // return ref;
    return listView(Book__c.sObjectType);
    }
    public pagereference doremove(){
        fine = (Fine__C)con.getRecord();
        delete fine;
        return listView(Book__c.sObjectType);
    }
    public static PageReference listView(Schema.sObjectType destinationSObject) {
   Schema.DescribeSObjectResult destination = destinationSObject.getDescribe();
   PageReference pageRef = new PageReference('/' + destination.getKeyPrefix() );
   pageRef.setRedirect(true);
   return pageRef;
    }

}