@IsTest
private class OtherCSVTests {
    
    @TestSetup
    static void setupTestData() {
        // Load Accounts from the CSV static resource
        // ⚠️ IMPORTANT: Match this name to the Trailhead instruction
        // Many modules use: 'otherAccountData'
        List<Account> accts = Test.loadData(
            Account.SObjectType,
            'otherAccountData'   // Change to 'otherAccountDataCopy' ONLY if Trailhead says so
        );
    }

    @IsTest
    static void testLoadOtherAccountsFromStaticResource() {
        Test.startTest();

        // Query accounts inserted by Test.loadData
        List<Account> results = [SELECT Id FROM Account];

        Test.stopTest();

        // Assert that 15 accounts were loaded
        System.assertEquals(
            15,
            results.size(),
            'Expected 15 accounts from test data'
        );
    }
}