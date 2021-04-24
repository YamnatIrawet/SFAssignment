public class Ganga {
 public list<list_w> lw {set;get;}
 public lead mylead {set;get;}   
 public Ganga(){
 list<list_W> lw1 = new list<list_W>(); 
 mylead=new lead();
 }
 public pageReference create(){
 insert mylead;
     pagereference pgL=new pagereference('/'+mylead.Id);
     return pgl;
 }
 public void refresh(){
 mylead=new lead();
 }
 public void saveandnew(){
 insert mylead;
 mylead=new lead();
 }
        public class List_W{
        public string name {set;get;}
        public integer age {set;get;}
    }
    public class list_W1{  
         Ganga gn ;
        public list_W1(){    
            this.gn = gn;
            list_W aa = new list_W();
            aa.name = 'Amit';
            aa.age = 30;
            gn.lw.add(aa);
        }
    }
}