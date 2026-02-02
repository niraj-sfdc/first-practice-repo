@isTest
public class EligibleForVoteTest {
 
    @isTest
    static void personAgeEligible(){
        string r = EligibleForVote.ageOfPerson(20);
        system.assertEquals('Eligible for Vote',r);
    }
    
    @isTest
    static void personAgeNonEligible(){
        string r = EligibleForVote.ageOfPerson(10);
        system.assertEquals('No sorry you can not vote',r);
    }
}