/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : AssetIoTService
 * Author          : <YourName>
 * Created Date    : Jan 23, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Jan 23, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Jan 23, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */
public class AssetIoTService {

    public static void registerDevice(Asset ast) {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:IoT_API');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        // 🔐 Optional Token Header
        req.setHeader('Authorization', 'Bearer dummy_token_123');

        // 📨 Request Body
        Map<String, Object> body = new Map<String, Object>();
        body.put('serialNumber', ast.SerialNumber);
        body.put('product', ast.Product2.Name);
        body.put('account', ast.Account.Name);
        req.setBody(JSON.serialize(body));

        Http http = new Http();
        HttpResponse res = http.send(req);

        try {
            // ✅ SUCCESS
            if(res.getStatusCode() == 200) {

                // 📦 JSON Parsing
                Map<String, Object> result =
                    (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

                String registrationId = (String) result.get('registrationId');

               Asset upd = new Asset(
    Id = ast.Id,
    External_Device_Id__c = registrationId
);
update upd;

            }
            // ❌ ERROR RESPONSE
            else {
                createLog(ast.Id, res.getStatusCode(), res.getBody());
            }
        }
        catch(Exception e) {
            // ❌ EXCEPTION LOGGING
            createLog(ast.Id, 500, e.getMessage());
        }
    }

    // 📒 Error Logging Method
    private static void createLog(Id assetId, Integer statusCode, String message) {
        Asset_Integration_Log__c log = new Asset_Integration_Log__c();
        log.Asset__c = assetId;
        log.Status_Code__c = statusCode;
        log.Error_Message__c = message;
        insert log;
    }
}