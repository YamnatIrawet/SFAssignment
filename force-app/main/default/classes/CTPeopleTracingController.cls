public with sharing class CTPeopleTracingController {
    public CTPeopleTracingController() {

    }

    public static list<People_Tracing__c> getTraces(String personId){
        return [SELECT Id, Contact_Date__c, Person_1__c,Person_1__r.Health_Status__c,
        Person_1__r.Token__C, Person_2__c,Person_2__r.Health_Status__c,Person_2__r.Token__C 
        FROM People_Tracing__c where Person_1__C =: personId Or Person_2__C =: personId 
        order by contact_Date__C DESC];
    }

    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> newPeopleTraces){
        Set<Id>  personIds = new set<Id>();
        for(People_Tracing__c trace: newPeopleTraces){
            personIds.add(trace.Person_1__c);
            personIds.add(trace.Person_2__c);            
        }
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();
        Map<Id,set<id>> mapOfExistingRecords = new map<id,set<id>>();
        List<People_Tracing__c> existingRecords = [Select id,person_1__c,Person_2__C from People_Tracing__c 
                                                    where Person_1__C IN :personIds Or Person_2__C in :personIds];
        if(existingRecords !=null && existingRecords.size() >0){
            for(People_Tracing__c trace: existingRecords){
                if(! mapOfExistingRecords.containsKey(trace.Person_1__c)){
                    mapOfExistingRecords.put(trace.Person_1__c, new set<id>());
                }
                mapOfExistingRecords.get(trace.Person_1__c).add(trace.Person_2__c);
                //build map for person 2
                if(! mapOfExistingRecords.containsKey(trace.Person_2__c)){
                    mapOfExistingRecords.put(trace.Person_2__c, new set<id>());
                }
                mapOfExistingRecords.get(trace.Person_2__c).add(trace.Person_1__c);
            }
            for (People_Tracing__c trace: newPeopleTraces){
                if(
                    (mapOfExistingRecords.containsKey(trace.Person_1__c) && mapOfExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c))
                    ||
                    (mapOfExistingRecords.containsKey(trace.Person_2__c) && mapOfExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c)))
                    {
                                duplicates.add(trace);
                }
            }
        }
        return duplicates;                                            
    }
}