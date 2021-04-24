public with sharing class getAccOppByName_cls {
    public getAccOppByName_cls() {

    }
    public static List<Opportunity> getOppByName(String opName){
        try {
            String opNameStr=opName;
            return ([Select StageName,Amount,Id,Name,Type from Opportunity where Name = :opNameStr]);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}