/*Share Assets with High_Risk__c = true with Role Field Service Manager via AssetShare (assuming Asset OWD is Private).
If an Asset becomes High Risk,
then all users with role “Field Service Manager”
should be able to see that Asset,
even though Asset OWD is Private*/

trigger assetTrigger_Twelve on Asset(after update) {


    List<AssetShare> shares = new List<AssetShare>();
    Set<Id> assetIds = new Set<Id>();

    for (Asset a : Trigger.new) {
        Asset oldA = Trigger.oldMap.get(a.Id);

        if (a.High_Risk__c == true && oldA.High_Risk__c == false) {
            assetIds.add(a.Id);
        }
    }

    if (assetIds.isEmpty()) return;

    // Find Role Id
    Id roleId = [
        SELECT Id FROM UserRole
        WHERE Name = 'Field Service Manager'
        LIMIT 1
    ].Id;

    // Create Shares
    for (Id assetId : assetIds) {

        AssetShare s = new AssetShare();
   s.AssetId = assetId;                 // ✅ correct
        s.UserOrGroupId = roleId;
        s.AssetAccessLevel = 'Read';
        s.RowCause = Schema.AssetShare.RowCause.Manual;

        shares.add(s);
    }

    insert shares;
}