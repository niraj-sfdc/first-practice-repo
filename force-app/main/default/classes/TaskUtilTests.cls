@IsTest
private class TaskUtilTests {

    @IsTest
    static void testGetTaskPriorityNormal() {
        Test.startTest();

        // State not CA → should return 'Normal'
        String result = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', result, 'Expected Normal for non-CA state');
        
        // Extra: invalid input branch for coverage
        String nullResult = TaskUtil.getTaskPriority('');
        System.assertEquals(null, nullResult, 'Expected null for blank state');

        Test.stopTest();
    }

    @IsTest
    static void testGetTaskPriorityHigh() {
        Test.startTest();

        // State CA → should return 'High'
        String result = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', result, 'Expected High for CA state');

        Test.stopTest();
    }
}