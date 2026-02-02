@isTest
public class EvenOddAssigment_Test {

    @isTest
    static void testEvenNumber() {
        String result = EvenOddAssigment.checkNumber(10);
        System.assertEquals('Even', result);
    }
    @isTest
    static void testOddNumber() {
        String result = EvenOddAssigment.checkNumber(5);
        System.assertEquals('Odd', result);
    }
    
}