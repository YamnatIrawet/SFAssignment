public class MyHelloWorld {
    public integer x;
    double y; long z; 
    
        
    public static void applyDiscount(Toy_Factory__c[] toys){
        for(Toy_Factory__c toy: toys){
            toy.TPrice__C*=0.9;
            
        }
    }

}