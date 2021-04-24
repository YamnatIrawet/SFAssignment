public class FacetController {
    @AuraEnabled
    public static list<contact> getOrgDetails(){
        return [Select Id , Name, Department  from contact] ; 
        
    } 
}