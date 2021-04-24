public with sharing class CTLocationTracingController {
    public CTLocationTracingController() {

    }

    public static List<Location_Tracing__c> getVisitors(String locationId){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c , Person__R.Token__C, Person__r.Health_Status__C FROM Location_Tracing__c 
        where Id=:locationId
        order by Visit_Date__C DESC];
    }

    public static List<Location_Tracing__c> getLocationsByPersonIds(set<Id> personIds){
        return [SELECT Id,Person__c, Location__c FROM Location_Tracing__c 
        where Person__C IN :personIds
        AND Visit_Date__c = LAST_N_DAYS:10];
    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(set<Id> locationIds){
        return [SELECT Id,Person__c, Location__c FROM Location_Tracing__c 
        where Location__C IN :locationIds
        AND Visit_Date__c = LAST_N_DAYS:10 AND person__R.Health_Status__C='Green'];
    }

    public static list<Location_Tracing__c> checkDuplicates(list<Location_Tracing__c> newLocationTraces){
        Set<Id> locationIds = new Set<Id>();
        Set<Id> personIds = new Set<Id>();
        for(Location_Tracing__c trace: newLocationTraces){
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);            
        }

        map<id,Set<Id>> mapOfExistingRecords  = new map<id,set<id>>();
        List<Location_Tracing__c> existingRecords  = [SELECT Id,Person__c, Location__c FROM Location_Tracing__c 
        where Location__C IN :locationIds
        and Person__c IN :personIds];
        
        list<Location_Tracing__c> duplicates = new List<Location_Tracing__c>(); 
        if(existingRecords!=null && existingRecords.size() >0){
            for(Location_Tracing__c trace: existingRecords){
                if(! mapOfExistingRecords.containsKey(trace.Location__c)){
                    mapOfExistingRecords.put(trace.Location__c,new Set<id>());
                }
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
            }
            for(Location_Tracing__c trace: newLocationTraces){
                if(mapOfExistingRecords.containsKey(trace.Location__c) 
                && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
                    duplicates.add(trace);
                }
            }
        }
        return duplicates;
    }
}