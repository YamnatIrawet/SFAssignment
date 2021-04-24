@isTest
public class HelloWorldTestClass {
    
    static testMethod void validateHelloWorld(){
        Toy_Factory__c toy = new Toy_Factory__c(Name='toy1',TPrice__c=100);
        System.debug('Price before inserting the toy: '+ toy.TPrice__c);
        insert toy;
        
        //Retrive the new toy 
        toy= [Select TPrice__c from Toy_Factory__c where ID = :toy.Id];
          System.debug('Price after the trigger is fired: '+toy.TPrice__c);
        System.assertEquals(90, toy.TPrice__c);
    }

}