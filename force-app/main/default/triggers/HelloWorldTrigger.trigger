trigger HelloWorldTrigger on Toy_Factory__c (before insert) {

    Toy_Factory__C[] toys= trigger.new;
    
    MyHelloWorld.applyDiscount(toys);
}