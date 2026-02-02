@isTest
public class CharCountTest {

    @isTest
    static void testCharacterFound() {
        Integer result = CharCount.countChar('banana', 'a');
        System.assertEquals(3, result);
    }

    @isTest
    static void testCharacterNotFound() {
        Integer result = CharCount.countChar('apple', 'z');
        System.assertEquals(0, result);
    }

    @isTest
    static void testSingleCharacter() {
        Integer result = CharCount.countChar('aaaa', 'a');
        System.assertEquals(4, result);
    }
}