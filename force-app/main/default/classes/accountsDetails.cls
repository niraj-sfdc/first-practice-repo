/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : accountsDetails
 * Author          : <YourName>
 * Created Date    : Jan 21, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Jan 21, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Jan 21, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class accountsDetails {

	@AuraEnabled
    public static List<Account> findAccountByNameExact(string keyword) {
   
    
     string searchText = '%'+keyword+'%';
        List<Account> lstAcc = [ SELECT ID, Name, Industry
                                 FROM Account
                                 WHERE Name LIKE : searchText];
        return lstAcc;
    }
 
}