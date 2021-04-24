public with sharing class getOppByName_cls {
    public getOppByName_cls() {

    }
    @AuraEnabled
    public static acwrp getCOppByName(String opName){
        try {
            acwrp Accwrp = new acwrp();
            String opNameStr='%'+opName+'%';
            Accwrp.opportunityList =[Select StageName,Amount,Id,Name,Type from Opportunity where Name LIKE :opNameStr];
            Accwrp.contactList =  [Select Name,Phone,Department,LeadSource,Birthdate FROM Contact where Name LIKE :opNameStr];
            return (Accwrp);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class acwrp{
        @AuraEnabled
        public List<Opportunity> opportunityList;
        @AuraEnabled
        public List<Contact> contactList; 
    }
}