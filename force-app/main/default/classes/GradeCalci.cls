public class GradeCalci {

    public static String gradeOfStudent(integer per){
        if(per >= 90){
            return 'A';
        } else if(per >= 75){
            return 'B';
        } else if(per >= 60){
            return 'C';
        } else if(per >= 40){
            return 'D';
        } else {
            return 'Fail';
        }
    }
}