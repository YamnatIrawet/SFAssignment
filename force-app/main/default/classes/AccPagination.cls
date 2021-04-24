public class AccPagination {
public apexpages.StandardSetController controller {Set;get;}
public list<contact> con {set;get;}
public list<account> getacc(){
con.clear();
list<account> acc=(list<account>)controller.getrecords();
for(account b:acc){
for(contact c:b.contacts){
con.add(c);
}
}
return acc;
}
public Accpagination(){
con=new list<contact>();
list<Account> acc=[select id,name,industry,phone,(select lastname,phone,accountid from
contacts) from account];
controller=new apexpages.StandardSetController(acc);
controller.setPageSize(1);
}
}