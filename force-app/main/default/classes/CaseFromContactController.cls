public with sharing class CaseFromContactController {

    @AuraEnabled
    public static Case createCaseFromContact(Id contactId) {

        Contact con = [
            SELECT Id, Description 
            FROM Contact 
            WHERE Id = :contactId
        ];

        // Split description into first 5 words
        List<String> words = con.Description.split(' ');
        String subject = '';
        Integer count = Math.min(5, words.size());

        for(Integer i = 0; i < count; i++) {
            subject += words[i] + ' ';
        }
        subject = subject.trim();

        Case cs = new Case(
            ContactId = con.Id,
            Priority = 'Working',
            Description = con.Description,
            Subject = subject
        );

        insert cs;
        return cs;
    }
}