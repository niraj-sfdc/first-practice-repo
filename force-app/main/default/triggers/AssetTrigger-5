//Maintain Active_Asset_Count__c on Account for Assets where Status NOT IN ('Retired', 'Scrapped').

trigger AssetTrigger-5 on Asset (
    after insert, after update, after delete, after undelete
) {

    Set<Id> accountIds = new Set<Id>();

    if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
        for (Asset a : Trigger.new) {
            if (a.AccountId != null) {
                accountIds.add(a.AccountId);
            }
        }
    }

    if (Trigger.isDelete) {
        for (Asset a : Trigger.old) {
            if (a.AccountId != null) {
                accountIds.add(a.AccountId);
            }
        }
    }

    if (accountIds.isEmpty()) return;

    Map<Id, Integer> accountCountMap = new Map<Id, Integer>();

    for (AggregateResult ar : [
        SELECT AccountId accId, COUNT(Id) total
        FROM Asset
        WHERE AccountId IN :accountIds
        AND Status NOT IN ('Retired', 'Scrapped')
        GROUP BY AccountId
    ]) {
        accountCountMap.put(
            (Id) ar.get('accId'),
            (Integer) ar.get('total')
        );
    }

    // Update Accounts
    List<Account> updates = new List<Account>();

    for (Id accId : accountIds) {
        Integer count = accountCountMap.containsKey(accId)
            ? accountCountMap.get(accId)
            : 0;

        updates.add(new Account(
            Id = accId,
            Active_Asset_Count__c = count
        ));
    }

    update updates;
}
