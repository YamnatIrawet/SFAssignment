public class phase2Assignments {
    
    //////////////1) insert result set for 10 account records with mandatory fields (some of them will pass some will fail) 
    public void agn1(){
        List <Account> accts = new List<Account>{
            new Account(Name='AccountTest1'),
                new Account(Name='AccountTest2'),
                new Account(Name='Accounttest3'),
                new Account(Name='Accounttest4'),
                new Account(Name='Accounttest5'),
                new Account(),
                new Account(Name='Accounttest7'),
                new Account(Name='Accounttest8'),
                new Account(),
                new Account(Name='Accounttest10')};
                    Database.SaveResult[] srList = Database.insert(accts, false);
        for (Database.SaveResult sr : srList) {
            if (!sr.isSuccess()) {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Fields that affected this error: ' + err.getFields());
                }
            }
        }   
    }
    
    
    //////////////2) DML on List, set and map. (insert) on any SObjectType (standard or custom)
    public void agn2(){
        //a. going with list
        list<Contact> cntlist = new list<Contact>();
        for(Integer i=0;i<3;i++){
            Contact ct = new Contact(lastName='ContactTestList'+i);
            cntlist.add(ct);
        }
        System.debug('list: '+ cntlist);
        Database.insert(cntlist);
        //b. going with set
        set<Contact> cntset = new set<Contact>();
        for(Integer i=3;i<5;i++){
            Contact ct = new Contact(lastName='ContactTestsetToList'+i);
            cntset.add(ct);
        }
        System.debug('set: '+ cntset);
        // here conversion is needed
        cntlist.clear();
        cntlist.addAll(cntset);
        Database.insert(cntlist); 
        //c. going with map
        map<ID,contact> cntmap = new map<ID,contact>();
        for(contact cts : cntlist){
            cntmap.put(cts.id,cts);
        }
        System.debug('map: '+ cntmap);
        //Database.insert(cntmap);
        //Database.update(cntmap.values());
    }
    
    
    //////////////3) SOQL Need only those Accounts which have contacts only
    public void agn3(){
        list<Account> acct = [Select Id, Name From Account Where Id IN (Select AccountId From Contact)];
        System.debug('printing list....'+acct);
    }
    
    
    //////////////4) Contact Records to be viewed on Account Name, Group by Account name and not see those contacts which are not related to any account
    public void agn4(){ 
        //system.debug([SELECT accountid ids, count(id) cnts FROM Contact GROUP BY AccountID HAVING count(id) > 1]);
        System.debug([Select Account.Name,count(ID), Name nm from contact where AccountId !=null Group By Account.Name,Name]);
    }
    
    
    //////////////5) show custom exception message in log. Try catch and finally all should be used.
    public class MyException extends Exception {
        public void catchme(){
            System.debug('custom exception caught...4');
        }
    }   
    public void agn5(){
        System.debug('starting...1');
        try{System.debug('throwing my exception 2');
            throw new MyException();}
        catch(MyException e){
            System.debug('Catching my exception...3');
            e.catchme();
        }
        finally {System.debug('Finally called  .... 5');}
        System.debug('continuing with other code...6');
    }
    
    
    //////////////6) field names will pass along with object name, query on that bases and use filter condition.
    public void Myquery(list<String> fieldNames,List<String> objNames,String sqry){
        ////to do for single select query
    }
    public void agn6(){
        list<String> fNames = new list<string>();
        list<String> objNames = new list<string>();
        String sqry = 'select name, id from contact';
        fNames.add('Name');
        fNames.add('phoneNumber');
        objNames.add('Account');
        Myquery(fnames,objNames,sqry);
    }
}