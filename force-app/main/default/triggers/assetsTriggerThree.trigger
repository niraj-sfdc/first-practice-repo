trigger assetsTriggerThree on Asset(before update) {

 Set<Id> assetIds = new Set<Id>();

    // Step 1: Find assets changing to Retired
    for (Asset a : Trigger.new) {
        Asset oldA = Trigger.oldMap.get(a.Id);

        if (a.Status == 'Retired' && oldA.Status != 'Retired') {
            assetIds.add(a.Id);
        }
    }

    if (assetIds.isEmpty()) return;

    // Step 2: Query open cases
    Map<Id, Integer> assetOpenCaseMap = new Map<Id, Integer>();

    for (AggregateResult ar : [
        SELECT AssetId assetId, COUNT(Id) total
        FROM Case
        WHERE AssetId IN :assetIds
        AND IsClosed = false
        GROUP BY AssetId
    ]) {
        assetOpenCaseMap.put(
            (Id) ar.get('assetId'),
            (Integer) ar.get('total')
        );
    }

    // Step 3: Block save
    for (Asset a : Trigger.new) {
        if (assetOpenCaseMap.containsKey(a.Id)) {
            a.addError('Cannot retire Asset while open Cases exist.');
        }
    }
	
}