trigger OpportunityDelete on Opportunity (before delete,before update, before Insert) {
   //4
       if(Trigger.isDelete && Trigger.isBefore){

    for (Opportunity opp : Trigger.old) {
        if (
            opp.StageName == 'Decision Maker' || opp.StageName == 'Negotiation/Review' ||  opp.Probability > 75 ) {
            opp.addError('You cannot delete this Opportunity because High chances to miss opp.');
        }
    }
       }
    //3
    if(Trigger.isUpdate && Trigger.isBefore){
  for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
        if (
            opp.StageName == 'Closed Won' &&
            opp.CloseDate == Date.today() &&
            opp.Probability == 100
        ) {
            opp.Description = 'Congrats! We have won Opp - ' 
                              + opp.Name 
                              + ' with amount - ' + opp.Amount
                              + ' and stage as Closed Won on - ' + opp.CloseDate;
        }
    }
    }
    
    
    //1 
    if(Trigger.isInsert && Trigger.isBefore){
  for (Opportunity opp : Trigger.new) {
      
  }
        
    }

    
    //2
    if(Trigger.isUpdate && Trigger.isBefore){
        for (Opportunity opp : Trigger.new) {
        if ((opp.StageName == 'Proposition' || opp.StageName == 'Negotiation') && opp.Probability == 75) {
            opp.CloseDate = Date.today().addDays(30);
        
    }
}

        }

    

}