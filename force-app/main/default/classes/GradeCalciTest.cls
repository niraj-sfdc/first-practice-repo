@isTest
public class GradeCalciTest {

   @isTest
    static void testGradeA() {
        String result = GradeCalci.gradeOfStudent(95);
        System.assertEquals('A', result);
    }

    @isTest
    static void testGradeB() {
        String result = GradeCalci.gradeOfStudent(80);
        System.assertEquals('B', result);
    }

    @isTest
    static void testGradeC() {
        String result = GradeCalci.gradeOfStudent(65);
        System.assertEquals('C', result);
    }

    @isTest
    static void testGradeD() {
        String result = GradeCalci.gradeOfStudent(45);
        System.assertEquals('D', result);
    }

    @isTest
    static void testGradeFail() {
        String result = GradeCalci.gradeOfStudent(30);
        System.assertEquals('Fail', result);
    }
}