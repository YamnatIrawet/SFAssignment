public with sharing class CTPersonController {
    public CTPersonController() {

    }
    public static String getToken(String mobileNumber){
        Blob value = Blob.valueOf(mobilenumber);
        Blob hash = Crypto.generateDigest('MD5', value);
        return EncodingUtil.base64Encode(hash);
    }
    
    public static List<Person__c> getRecentHealthChanges(){
       return [SELECT Id, Name, Health_Status__c, Mobile__c, Token__c, Status_Update_Date__c FROM Person__c Order By Status_Update_Date__c DESC Limit 100 ];

    }

    public static List<Person__C> SearchPeople(String SearchTerm){
        searchTerm = searchTerm+'%';
       return [SELECT Id, Name, Health_Status__c, Mobile__c, Token__c, Status_Update_Date__c FROM Person__c where Name like :searchTerm OR Mobile__C like :searchTerm OR Token__C like :searchTerm Order By Status_Update_Date__c DESC Nulls Last];
    }

    public static Person__c getPersonByID(String PersonID){
        list <Person__C> pple= [SELECT Id, Name, Health_Status__c, Mobile__c, Token__c, Status_Update_Date__c FROM Person__c where Id = :PersonID];
        if(pple !=null && pple.size()>0){
            return pple[0];
        }
        return null;
    }

    public static Map<String,Integer>getHealthStatusCount(){
        Map<String,Integer> healthCountMap  = new map<String,Integer>();
        for(AggregateResult ar : [select Health_Status__c, count(Id) total from Person__C 
                group by Health_Status__C]){
                    //healthCountMap.put((String)ar.get('Health_Status__C'), (Integer)ar.get('total'));
                    String healthStatus = String.valueOf(ar.get('Health_Status_C'));
                    Integer count = Integer.valueOf(ar.get('total'));
                    healthCountMap.put(healthStatus, count);

        }
        return healthCountMap;
    }
}