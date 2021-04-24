public with sharing class OverrideSAVE {
    
    ApexPages.StandardController con;
    public OverrideSAVE(ApexPages.StandardController controller) {
        con=controller;
    }
    public static PageReference listView(Schema.sObjectType destinationSObject) {
        Schema.DescribeSObjectResult destination = destinationSObject.getDescribe();
        PageReference pageRef = new PageReference('/' + destination.getKeyPrefix() );
        pageRef.setRedirect(true);
        return pageRef;
    }
    public pagereference dosave(){
        con.save();
        Fine__C fine = new Fine__C();
        Borrowed_By__c brby = (Borrowed_By__c)con.getRecord();
        fine.Amount__c = 20;
        fine.Status__c = 'Paid';
        fine.Fine_Type__c = 'Late Fee'; 
        fine.Borrowed_By__c = brby.Id ;
        /* pagereference ref=new pagereference('/apex/FineVFpage');
			ref.getParameters().put('Book', 'Book3');// replace by actual names    
			ref.getParameters().put('BorrowedBy', 'some test var');// replace by actual names
			ref.setredirect(true);
			return ref; */ 
        if(brby.Return_Date__c > brby.Due_Date__c){
            insert fine;
            pagereference ref=new pagereference('/apex/FineVFpage?id='+fine.Id);
            return ref; }
        else{ 
            pagereference ref=new pagereference('/apex/BorrowedByOverride?id='+brby.Id);
            return listView(Book__c.sObjectType);
        }
    }
    
}