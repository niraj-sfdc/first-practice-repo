trigger TriggerForCaseInserting on Case (before insert) {

    if(Trigger.isInsert && Trigger.isBefore){
        for(Case cs : Trigger.new ){
            if(cs.origin == 'Email'){
                cs.status = 'New';
                cs.priority = 'Medium';
            }      
        }
    }
}