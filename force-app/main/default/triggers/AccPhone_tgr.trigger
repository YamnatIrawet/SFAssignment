trigger AccPhone_tgr on Account (before insert, before update) {
    Account[] ac= trigger.new;
for(Account acc:ac) {
if(acc.Phone==null){
    acc.Phone ='9990000009';
    }
}

}