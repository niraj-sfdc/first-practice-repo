public class AssetRegistrationQueueable 
    implements Queueable, Database.AllowsCallouts {

    private Id assetId;

    public AssetRegistrationQueueable(Id assetId) {
        this.assetId = assetId;
    }

    public void execute(QueueableContext context) {

        Asset ast = [
            SELECT Id, SerialNumber,
                   Account.Name, Product2.Name
            FROM Asset
            WHERE Id = :assetId
        ];

        AssetIoTService.registerDevice(ast);
    }
}