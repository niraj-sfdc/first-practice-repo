@isTest
public class AssetIoTServiceTest {

    @isTest
    static void testRegisterDevice() {

        Test.setMock(HttpCalloutMock.class, new MockIoTAPI());

        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Product2 prod = new Product2(Name = 'Laptop', IsActive = true);
        insert prod;

        Asset ast = new Asset(
            Name = 'Test Asset',
            AccountId = acc.Id,
            Product2Id = prod.Id,
            SerialNumber = 'SN001'
        );
        insert ast;

        Asset result = [
            SELECT External_Device_Id__c
            FROM Asset WHERE Id = :ast.Id
        ];

        System.assertEquals('DEV123', result.External_Device_Id__c);
    }
}