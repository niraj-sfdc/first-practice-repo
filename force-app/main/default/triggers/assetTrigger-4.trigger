//When Asset is created, set Warranty_End_Date__c using Hierarchy Custom Setting Warranty_Config__c based on Product and Warranty Term.

trigger AssetTrigger-4 on Asset (before insert) {

    Warranty_Config__c config = Warranty_Config__c.getInstance();

    Integer warrantyMonths = 0;

    if (config != null && config.Default_Warranty_Months__c != null) {
        warrantyMonths = Integer.valueOf(config.Default_Warranty_Months__c);
    }

    for (Asset a : Trigger.new) {

        if (a.Warranty_End_Date__c == null && warrantyMonths > 0) {

            Date startDate = Date.today();  // or Purchase_Date__c
            a.Warranty_End_Date__c = startDate.addMonths(warrantyMonths);
        }
    }
}
