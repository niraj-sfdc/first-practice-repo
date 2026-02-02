/*Do NOT allow an Asset to be deleted if
1️⃣ It has any service cost (Total_Service_Cost__c > 0)
OR
2️⃣ It has any Cases (open or closed)

If either is true → stop deletion.*/

trigger assetTrigger_seventeen on Asset(before delete) {
   Set<Id> assetIds = new Set<Id>();

    for (Asset a : Trigger.old) {
        assetIds.add(a.Id);
    }

    // Query case count
    Map<Id, Integer> caseCountMap = new Map<Id, Integer>();

    for (AggregateResult ar : [
        SELECT AssetId assetId, COUNT(Id) total
        FROM Case
        WHERE AssetId IN :assetIds
        GROUP BY AssetId
    ]) {
        caseCountMap.put(
            (Id) ar.get('assetId'),
            (Integer) ar.get('total')
        );
    }

    // Validate deletion
    for (Asset a : Trigger.old) {

        Boolean hasCost = a.Total_Service_Cost__c != null &&
                          a.Total_Service_Cost__c > 0;

        Boolean hasCases = caseCountMap.containsKey(a.Id);

        if (hasCost || hasCases) {
            a.addError(
                'Cannot delete Asset with service cost or existing Cases.'
            );
        }
    }
}