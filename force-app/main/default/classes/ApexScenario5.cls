public class ApexScenario5 {

    public static void showOpportunityReport(){
        List<String> monthList=new List<String>{'','Jan','Feb','Mar','April','May','June','July','Aug','Sep','Oct','Nov','Dec'};
         Map<String,Decimal> typeMonthToTotalAmountMap=new Map<String,Decimal>();
        for(Opportunity opp:[SELECT Id,Name,CloseDate,Amount,Type
                            FROM Opportunity
                           // WHERE Amount >0
                             ORDER BY Type,CloseDate]){
                                 Integer month=opp.CloseDate.month();
                                 Integer year=opp.CloseDate.year();
                                 String monthString=monthList.get(month)+' - '+year;
                                 String key=opp.Type+'#'+monthString;
                                 if(!typeMonthToTotalAmountMap.containsKey(key))
                                 {
                                     typeMonthToTotalAmountMap.put(key,0);
                                     
                                 }
                                 Decimal tempAmount=typeMonthToTotalAmountMap.get(key);
                                 System.debug('>>>>>1'+tempAmount);
                                 System.debug('>>>>>2'+opp.Id);
                                 System.debug('>>>>>3'+opp.Amount);
                                 System.debug('>>>>>4'+key);
                                 
                                 tempAmount+=opp.Amount;
                                 typeMonthToTotalAmountMap.put(key,tempAmount);
                             }
        for(String key:typeMonthToTotalAmountMap.keySet()){
            System.debug('...'+key+'...total amount    '+typeMonthToTotalAmountMap.get(key));
        }
    }
}