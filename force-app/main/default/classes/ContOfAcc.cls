public class ContOfAcc
{
    public String accToSearch {get;set;}
    public apexpages.StandardSetController controller {Set;get;}
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    list<AccountWrapper> SearchWrapList;
    
    public ContOfAcc(ApexPages.StandardController stdController)
    {
        for(account a:[SELECT Account.ID,Account.Name,(SELECT      
                                                       id,name
                                                       FROM Account.Contacts) FROM Account])
        {
            AccountWrapper accWrap=new AccountWrapper();
            list<Contact> all_contacts = new list<Contact>();
            accWrap.AccId = a.Id;
            accWrap.AccName = a.Name;
            all_contacts.addAll(a.contacts);
            for(contact cnt :a.contacts){
                ContactWrapper cntWrap = new ContactWrapper();
                cntWrap.conId = cnt.Id;
                cntWrap.conName =cnt.Name;
                accWrap.contact_List.add(cntWrap);
            }
            wraplist.add(accWrap); 
        }
    }     
    
    public list<AccountWrapper> getWrpaccounts()
    {
        if(AccToSearch == '' || AccToSearch == null){
           // controller=new apexpages.StandardSetController(wraplist);
			controller.setPageSize(1);
            return wraplist;  
        }
        else{
           // controller=new apexpages.StandardSetController(SearchWrapList);
			controller.setPageSize(1);
            return SearchWrapList;
        }
        
    }
    public String getGreeting() {
        return 'ignore case Partial match Search';
    }
    public PageReference getSearchResult(){
        SearchWrapList=new list<AccountWrapper>();
        String Maverick='No';
        AccountWrapper aw = new AccountWrapper();
        set<AccountWrapper> acset = new set<AccountWrapper>();
        for( AccountWrapper acc_wrap : wraplist){
            if(acc_wrap.AccName.containsIgnoreCase(AccToSearch)){
                acSet.add(acc_wrap);
                
            }
            else
            { aw = new AccountWrapper();
             for(ContactWrapper cont :acc_wrap.contact_List ){
                 if(cont.conName.containsIgnoreCase(AccToSearch)){                    
                     aw.contact_List.add(cont);                   
                     Maverick='Yes';
                 }
             }
             
             if(Maverick=='Yes'){
                 aw.AccID=acc_wrap.AccID;
                 aw.AccName = acc_wrap.AccName;
                 acSet.add(aw);
                 Maverick='No';
                 
             }
            }
        }
        SearchWrapList.addall(acSet);
        return null;
        
    }
    
    public class AccountWrapper
    {
        public Id AccId {get; set;}
        public String AccName {get; set;}
        public List<contactWrapper> contact_List {get; set;}
        public AccountWrapper()
        {
            contact_List=new List<contactWrapper>();
        }
    }
    public class ContactWrapper{
        public ID conId {get; set;}
        public String conName {get; set;}
    }
}