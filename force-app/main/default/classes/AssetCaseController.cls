/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : AssetCaseController
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

public class AssetCaseController {

	 @AuraEnabled(cacheable=true)
    public static List<Case> getCases(Id assetId) {
        return [
            SELECT Id, CaseNumber, Status, Type, Priority
            FROM Case
            WHERE AssetId = :assetId
            ORDER BY CreatedDate DESC
        ];
    }

}