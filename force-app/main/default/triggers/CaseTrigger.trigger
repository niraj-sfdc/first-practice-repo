trigger CaseTrigger on Case (before insert,before update) {
    if(Trigger.isInsert || Trigger.isUpdate){
        for(Case c : Trigger.new){
            if(c.Priority == 'High'){
                if(c.AccountId == null || c.ContactId == null){
                    c.addError('High priority cases must be associated with an Account and a Contact.');
                }
            }
        }
    }
}