trigger AssetTrigger on Asset (after insert) {

    for(Asset ast : Trigger.new) {
        System.enqueueJob(
            new AssetRegistrationQueueable(ast.Id)
        );
    }
}