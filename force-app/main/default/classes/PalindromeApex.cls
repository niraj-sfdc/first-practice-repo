public class PalindromeApex {
 public static Boolean checkPalindrome(String word) {
      
        if(word == word.reverse()) {
            return true;
        } else {
            return false;
        }
    }
}