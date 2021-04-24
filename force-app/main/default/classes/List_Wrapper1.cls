public class List_Wrapper1 {
public List<List_Wrapper> W1 {set;get;}
public List<List_Wrapper> dell {set;get;}
public string Wname {set;get;}
public integer Wage {set;get;}
public string Wcity {set;get;}
public string sel {set;get;}
public string opt {set;get;}
public integer x {set;get;}
public boolean z {set;get;}
public List_Wrapper1(){
W1=new List<List_Wrapper>();
dell=new List<list_Wrapper>();
}
public void create(){
List_Wrapper W2=new List_Wrapper();
W2.name=Wname;
W2.age=Wage;
W2.city=Wcity;
W1.add(W2);
}
public void del(){
for(integer c=0;c<W1.size();c++){
if(W1[c].F1==True) {
dell.add(W1[c]);
W1.remove(c);
c--;
}
}
}
public void change(){
for(integer c=0;c<W1.size();c++){
if(W1[c].F1==True) {
W1[c].city=sel;
}
}
}
public void edit(){
for(integer c=0;c<W1.size();c++){
if(W1[c].F1==True) {
Wname=W1[c].name;
Wage=W1[c].age;
Wcity=W1[c].city;
x=c;
break;
}
}}
public void saveedited(){
W1[x].name=Wname;
W1[x].age=Wage;
W1[x].city=Wcity;
}
public void sall(){
for(integer c=0;c<W1.size();c++){
W1[c].F1=z;
}}
    public class List_Wrapper {
public string name {set;get;}
public integer age {set;get;}
public string city {set;get;}
public boolean F1 {set;get;}
}
}