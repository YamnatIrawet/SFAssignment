public class accConTree
{
    public String accToSearch {get;set;}
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    list<AccountWrapper> SearchWrapList;
    
    public accConTree(ApexPages.StandardController stdController)
    {
        Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
        for(account a:[SELECT CreatedbyID,Account.Name,(SELECT      
                                                        id,name
                                                        FROM Account.Contacts) FROM Account])
        {
            AccountWrapper accWrap=accMap.get(a.CreatedByID);
            if (accWrap==null)
            {
                accWrap=new AccountWrapper();
                accMap.put(a.CreatedByID, accWrap);                
            }
            accWrap.userId=a.CreatedById;
            accWrap.AccId = a.Id;
            accWrap.Name = a.Name;
            accWrap.accounts.add(a);
        }
        
        wrapList=accMap.values();
    }
    
    public list<AccountWrapper> getWrpaccounts()
    {
        if(AccToSearch == '' || AccToSearch == null){
            return wraplist;  
        }
        else{
            return SearchWrapList;
        }
        
    }
    public String getGreeting() {
        return 'ignore case Partial match Search';
    }    
    public PageReference getSearchResult(){
        SearchWrapList=new list<AccountWrapper>();
        AccountWrapper aw = new AccountWrapper();
        set<Account> acset = new set<Account>();
        list<Account> acList = new list<Account>();
        for( AccountWrapper acc_wrap : wraplist){
            for(Account act : acc_wrap.accounts){
                if(act.Name.containsIgnoreCase(AccToSearch)){
                    aw.userId=acc_wrap.userId;
                    aw.AccId = acc_wrap.AccId ;
                    aw.Name = acc_wrap.Name;
                    acSet.add(act);
                }  
            }
            acList.addall(acSet);
            aw.accounts = acList;
            SearchWrapList.add(aw);
            
        }
        return null;
        
    }
    
    public PageReference addAccWithCon(){
        list<Account> acc = new list<Account>();
        for(integer i=1;i<=2;i++){
            Account acnt = new Account();
            acnt.Name='account'+i;
            acnt.Site = 'accSite_'+i;
            acnt.Phone = '0'+Math.roundToLong(Math.random()*1000000000);
            acc.add(acnt);
        }
        insert acc;
        list<Contact> cnt = new List<Contact>();
        for(Account acnt : acc){
            for (integer j=1;j<=5000;j++){
                Contact con = new Contact();
                con.LastName = 'Contact'+j+acnt.Name;
                con.AccountId = acnt.Id;
                con.FirstName = 'ConFirstName';
                con.Department = 'Cont Test'+j+'_'+acnt.Name;
                con.Email = 'ConEmail'+j+'@geMalee.com';
                con.Phone = '01'+Math.roundToLong(Math.random()*100000000);
                con.MailingCity = 'ConCity';
                con.MailingState = 'ConState';
                //con.Phone =  String.valueOf(Math.pow(10,3) - 1);
                cnt.add(con);
            }
        }
        insert cnt;
        return null;
    }
    private class AccountWrapper
    {
        public Id userId {get; set;}
        private Id AccId {get; set;}
        public String Name {get; set;}
        public List<Account> accounts {get; set;}
        private AccountWrapper()
        {
            accounts=new List<Account>();
        }
    }
    
}