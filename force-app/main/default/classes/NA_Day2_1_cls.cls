public class NA_Day2_1_cls {

    @AuraEnabled
    public static list<Opportunity> listOpp(String recId){
        String searchstr;
        searchstr = recId;
        return ([select name,id from opportunity where accountId = :searchstr]);
    }
}