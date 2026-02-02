/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : IoTRiskQueueable
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

public class IoTRiskQueueable implements Queueable, Database.AllowsCallouts {

    private Id accountId;

    public IoTRiskQueueable(Id accId) {
        this.accountId = accId;
    }

    public void execute(QueueableContext context) {

        // 1️⃣ Get High Risk Assets
        List<Asset> assets = [
            SELECT Id, Failure_Risk__c
            FROM Asset
            WHERE AccountId = :accountId
            AND High_Risk__c = true
        ];

        if(assets.isEmpty()) return;

        // 2️⃣ Simulate REST Call (Mock IoT Response)
        // Random risk value between 10 - 100
        for(Asset a : assets) {
            Integer fakeRisk = Math.mod(Crypto.getRandomInteger(), 90) + 10;
            a.Failure_Risk__c = fakeRisk;
        }

        // 3️⃣ Update Assets
        update assets;
    }
}