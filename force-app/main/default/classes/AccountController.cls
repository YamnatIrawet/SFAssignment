public class AccountController {
    public static list<Account> insertAccounts(List<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }
    
    public static list<Account> getAllAccounts(){
        List<Account> accounts = [Select Name, phone from Account];
        return Accounts;
    }
    public static  void printAllAccounts(){
        List<Account> accounts = getAllAccounts();
        for(Account acc : accounts){
            System.debug('Account Name is: '+acc.name);
            System.debug('Account phone is:'+ acc.phone);
        }
    }
    
    public static Account insertAccount(Account acc){
        insert acc;
        return acc;
    }
    
    public static Integer AccountSize(){
        list<Account> acclist = getAllAccounts();       
        return acclist.size();
    }
}