trigger TriggerForAccountInserting on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc :Trigger.new){
            if(acc.Fax == Null){
                acc.Fax.addError('Fax Kon dalega?');  
            }  
            if(acc.Industry == Null){
                acc.Industry.addError('Industry is Requird');
            } 
            if(acc.Rating == Null){
                acc.Rating.addError('Rating kaha hai?');
            }
        }
        
    }
}