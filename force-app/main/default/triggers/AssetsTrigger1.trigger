trigger AssetsTrigger1 on Asset (before insert) {
// Read List Custom Setting
    Map<String, Asset_Config__c> configMap = Asset_Config__c.getAll();
    Asset_Config__c config;

    if (!configMap.isEmpty()) {
        config = configMap.values().get(0);
    }

    // Apply default status
    for (Asset a : Trigger.new) {
        if (a.Status == null && config != null && config.Default_Status__c != null) {
            a.Status = config.Default_Status__c;
        }
    }
}