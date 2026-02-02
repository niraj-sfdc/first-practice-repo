public class AccountHandler {
    // Public static method with Integer parameter, returns void
    public static void insertAccount(Integer numOfAccounts) {
        
        // Create a list of Account records
        List<Account> addAccounts = new List<Account>();
        
        Integer i = 1;
        
        // Loop to create given number of accounts
        while (i <= numOfAccounts) {
            Account acc = new Account(
                Name = 'Acme Inc ' + i,
                AccountNumber = 'A000' + i
            );
            addAccounts.add(acc);
            i++;
        }
        
        // One DML statement to insert all
        insert addAccounts;
        
        System.debug('Inserted ' + addAccounts.size() + ' Accounts.');
    }
}