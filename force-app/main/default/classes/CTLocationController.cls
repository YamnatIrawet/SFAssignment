public with sharing class CTLocationController {
    public CTLocationController() {

    }

    public static List<Location__C> getRecentstatusChanges(){
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c order by Status_Update_Date__C DESC Nulls last limit 100];
    }

    public static List<location__C> searchLocations(String searchTerm){
        searchTerm = searchTerm+'%';
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c where 
        Name like :searchTerm OR address__c like :searchTerm OR pincode__c like :searchTerm
        order by Status_Update_Date__C DESC Nulls last];
    }

    public static Location__C getLocationById(String LocationId){
       List<Location__c> lc= [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c
        Where Id=:LocationId];
        if(lc != null && lc.size()>0){
            return lc[0];
        }
        return null;
    }

}