public with sharing class oppList_cls {
  
    @AuraEnabled
    public static list<Opportunity> lstOpportunity(String recordId,String recordId1){
        try {
            System.debug('Record id 1 is ======>'+recordId1);
            return [select name,id from Opportunity where AccountId=:recordId];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}