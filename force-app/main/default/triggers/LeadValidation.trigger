//7 
trigger LeadValidation on Lead (before insert, before update) {
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Lead l : Trigger.new){
            if(l.Industry  == 'Banking'){
                if(l.Phone == null || l.Phone == ''){
                    l.addError('Phone is required for Banking leads.');
                }
                if(l.Email == null || l.Email == ''){
                    l.addError('Email is required for Banking leads.');
                }
            }
        }   
       
        
    }
}