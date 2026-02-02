trigger TriggerCon on Contact (before insert, before update) {

    if(Trigger.isBefore && Trigger.isInsert) {
        for(Contact con : Trigger.new){
            if(con.Email == '' || con.Email == Null){
                con.Email.addError('Bro Fill the email also...');
            }
        }
    }
   
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Contact con : Trigger.new){
            Contact oldCon = Trigger.OldMap.get(con.Id);
            
            if(con.Email == Null)
            {
                con.Email.addError('Bro! Add emai.... as you are updating.');
            }
            if(con.Email == oldCon.Email)
            {
                con.Email.addError('Why using same Email? Huhhh...');
            }
        }
    }
}