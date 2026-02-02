public class EvenOddNo{

    public static String checkNumber(Integer num) {
        if(Math.mod(num, 2) == 0) {
            return 'Even';
        } else {
            return 'Odd';
        }
    }
}