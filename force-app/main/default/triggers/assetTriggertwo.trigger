trigger assetTriggertwo on Asset(after insert) {

List<Task> lsttask = new List<Task>();

for(asset a : trigger.new){
	Task t = new Task();
	t.Subject = 'Initial Installation Check';
 t.ActivityDate = Date.today().addDays(7);
 t.OwnerId = a.OwnerId;
        t.WhatId = a.ID;
		

		lsttask.add(t);
}


    if (!lsttask.isEmpty()) {
        insert lsttask;
    }
}