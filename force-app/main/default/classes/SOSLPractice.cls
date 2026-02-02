public class SOSLPractice {
    public static List<Account> searchTechAccounts() {
        List<List<SObject>> results =
            [FIND 'tech*' IN NAME FIELDS RETURNING Account(Id, Name)];
        
        return (List<Account>)results[0];
    }
}