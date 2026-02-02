@isTest
public class PalindromeApexTest {
 @isTest
    static void testPalindromeTrue() {
        Boolean result = PalindromeApex.checkPalindrome('madam');
        System.assertEquals(true, result);
    }

    @isTest
    static void testPalindromeFalse() {
        Boolean result = PalindromeApex.checkPalindrome('hello');
        System.assertEquals(false, result);
    }
}