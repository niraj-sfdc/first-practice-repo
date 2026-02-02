/*When a Case related to an Asset is closed,
and the Resolution__c text contains “Replacement”,
then automatically update the Asset Status to
“Needs Replacement”.*/

trigger CaseTrigger_Eighteen on Case (after update) {

    Set<Id> assetIds = new Set<Id>();

    // Step 1: Identify qualifying cases
    for (Case c : Trigger.new) {
        Case oldC = Trigger.oldMap.get(c.Id);

        if (oldC.IsClosed == false &&
            c.IsClosed == true &&
            c.Resolution__c != null &&
            c.Resolution__c.contains('Replacement') &&
            c.AssetId != null
        ) {
            assetIds.add(c.AssetId);
        }
    }

    if (assetIds.isEmpty()) return;

    // Step 2: Update Assets
    List<Asset> updates = new List<Asset>();

    for (Id assetId : assetIds) {
        updates.add(new Asset(
            Id = assetId,
            Status = 'Needs Replacement'
        ));
    }

    update updates;
}