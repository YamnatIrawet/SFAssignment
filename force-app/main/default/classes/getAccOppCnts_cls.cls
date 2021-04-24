public with sharing class getAccOppCnts_cls {
    @AuraEnabled
    public static acwrp printMe(String acid){
        try {
            acwrp Accwrp = new acwrp();
            Accwrp.opportunityList = [Select StageName,Amount,Id,Name,Type from Opportunity where AccountId = :acid]; 
           // Accwrp.opportunityList = [Select StageName,Amount,Id,Name,Type from Opportunity limit 25]; 
            Accwrp.contactList =  [Select Name,Phone,Department,LeadSource,Birthdate FROM Contact where AccountId = :acid];
           // Accwrp.contactList = [SELECT firstName, LastName, Department,LeadSource from contact Limit 25];
        
            return Accwrp;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

   
    public class acwrp{
        @AuraEnabled
        public List<Opportunity> opportunityList{get;set;}
        @AuraEnabled
        public List<Contact> contactList{get;set;}  
    }
}