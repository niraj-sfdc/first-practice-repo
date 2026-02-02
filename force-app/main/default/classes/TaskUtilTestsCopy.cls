@IsTest
private class TaskUtilTestsCopy {

    @IsTest
    static void testGetTaskPriorityNormalCopy() {
        // leadState is NOT 'CA' → should return 'Normal'
        String result = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', result,
            'Expected Normal when leadState is not CA');
    }

    @IsTest
    static void testGetTaskPriorityHighCopy() {
        // leadState is 'CA' → should return 'High'
        String result = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', result,
            'Expected High when leadState is CA');
    }
}