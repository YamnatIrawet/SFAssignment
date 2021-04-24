public with sharing class getAccOpportunities_cls {
    public getAccOpportunities_cls() {
       
    }
    @AuraEnabled
    public static List<Opportunity> getAccOpp(String AccId){
        try {
            String acid=AccId;
            return ([Select StageName,Amount,Id,Name,Type from Opportunity where AccountId = :acid]);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}