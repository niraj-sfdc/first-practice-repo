trigger TriggerOnLeadForUpdating on Lead (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Lead le : Trigger.New){
            if(le.LeadSource == 'Web'){
                le.Rating = 'Cold';
            } else{
                le.Rating = 'Hot';
            }
        }
    }
}