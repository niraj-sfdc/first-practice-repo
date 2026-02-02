public class CharCount {
  public static Integer countChar(String text, String ch) {
        Integer count = 0;

        for(Integer i = 0; i < text.length(); i++) {
            if(text.substring(i, i+1) == ch) {
                count++;
            }
        }
        return count;
    }
}