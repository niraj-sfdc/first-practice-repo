//When an Asset is created, auto-create a Task “Initial Installation Check” for the Asset Owner, due in 7 days.
trigger AssetTaskTrigger on Asset (after insert) {

    List<Task> taskList = new List<Task>();

    for (Asset a : Trigger.new) {
        Task t = new Task();
        t.Subject = 'Initial Installation Check';
        t.ActivityDate = Date.today().addDays(7);
        t.OwnerId = a.OwnerId;
        t.WhatId = a.Id;

        taskList.add(t);
    }

    if (!taskList.isEmpty()) {
        insert taskList;
    }
}