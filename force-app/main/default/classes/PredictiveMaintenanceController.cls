/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : PredictiveMaintenanceController
 * Author          : <YourName>
 * Created Date    : Jan 22, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Jan 22, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Jan 22, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

	public with sharing class PredictiveMaintenanceController {

    @AuraEnabled(cacheable=true)
    public static List<Asset> getHighRiskAssets(Id accountId) {
        return [
            SELECT Id, Name, Failure_Risk__c
            FROM Asset
            WHERE AccountId = :accountId
            AND High_Risk__c = true
        ];
    }

    @AuraEnabled
public static void runIoTRiskJob(Id accountId) {
    System.enqueueJob(new IoTRiskQueueable(accountId));
}

}