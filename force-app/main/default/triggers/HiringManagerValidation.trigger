trigger HiringManagerValidation on Hiring_Manager__c (before insert, before update) {
    for(Hiring_Manager__c h : Trigger.new){
        if(h.Location_Name__c == null || h.Location_Name__c == ''){
            h.addError('Location is required.');
        }
    }
}