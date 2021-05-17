trigger CountContactOnAcount_trg on Contact (after insert, after update, after delete, after undelete) {
    //---> on delete we use Trigger.Old, all else, Trigger.new
    List<Contact> contacts = Trigger.isDelete ? Trigger.old : Trigger.new;
    //---> using Set class for finding the unique values in a list
    Set<Id> acctIds = new Set<Id>();
    
    for (Contact c : contacts) {
        //handling contact without an account
        if (c.AccountId != null) {
            acctIds.add(c.AccountId);
        }
    }
    // if an update happens then in case of account replacement old account value should also reduce so taking that account also
    if(Trigger.isUpdate){
        contacts=Trigger.old;
        for (Contact c : contacts) {
            if (c.AccountId != null) {
                acctIds.add(c.AccountId);
            }
        }
    }
    
    List<Account> acctsToRollup = new List<Account>();
    
    //****** using aggregate query----------starts------------------------
    /*
list<AggregateResult> ars =  [SELECT AccountId ActId, Count(id) CCount 
FROM Contact 
WHERE AccountId in: acctIds 
GROUP BY AccountId];
if(ars.size()>0){
for (AggregateResult ar :ars){
Account a = new Account();
a.Id = (Id) ar.get('ActId'); //getting the handle of account using AccountId alias called ActId defined in above query
a.Contact_Count__c = (Integer) ar.get('CCount'); //CCount is alias for total count of countact
acctsToRollup.add(a);
}
}
else{
for(Id ar1:acctIds)
{system.debug('test....1: '+ar1);
Account a = new Account();
a.Id = ar1; //getting the handle of account using AccountId alias called ActId defined in above query
a.Contact_Count__c = 0; //CCount is alias for total count of countact
acctsToRollup.add(a);
system.debug('test....2: '+ar1);
}
}

update acctsToRollup; */ 
    //****** using aggregate query----------ends------------------------
    //
    ////****** using Map------------------starts------------------------
    updateContactCount((list<contact>)Trigger.new,(list<contact>)Trigger.old);
    // below is the method used above
    void updateContactCount(list<contact> lstnewContact , list<contact> lstOldContact)
    {
        list<Account> lstAccount = new list<Account>();

        map<id,Account> mapOfAccount = new map<id,Account>([select id,(select id from contacts) from Account where id=:acctIds]);
        
        system.debug('mapOfAccount====>key set=====>>'+mapOfAccount.keySet());
        system.debug('mapOfAccount====>values=====>>'+mapOfAccount.values());
        
        for(id eachId : mapOfAccount.keyset())
        {
            lstAccount.add(new Account( id=eachId , Contact_Count__c =mapOfAccount.get(eachId).contacts.size()));
        }
        update lstAccount;
    }
    ////****** using Map------------------ends--------------------------
}