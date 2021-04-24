trigger ActiveContactsOfAccount on Contact (After insert, After update, After delete, After Undelete) {
    list<contact> Ncnts = trigger.new;
    list<contact> Ocnts = trigger.old;
    for(Contact con : Ncnts){
        if(con.Active__c = True){
            
        }
    }
}