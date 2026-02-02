Global class CaseRecordBactchUpdation implements Database.Batchable<sObject> {
    Global dataBase.queryLocator start(DataBase.BatchableContext cs ){
        string CaseQuery = 'SELECT Id, Status, Priority, Subject FROM Case';
        return Database.getQueryLocator(CaseQuery);
    }
    Global void Execute(DataBase.BatchableContext cs , List<Case> CaseRecordsToProcess){
        list<Case> updateCase = new list<case>();
        for(Case cas : CaseRecordsToProcess){
            cas.status = 'Closed';
            cas.priority ='Low';
            cas.Subject = 'batch programming for case';
            updateCase.add(cas);
        }
        Update updateCase;
    }
    Global void Finish(DataBase.BatchableContext cs){
        system.debug('Batch Job Id :'+cs.getJobId());
        AsyncApexJob caseDetails = [SELECT Id, status, totalJobItems, jobItemsProcessed, NumberOfErrors, Createdby.Email
                                    FROM AsyncApexJob
                                    WHERE id =: cs.getJobId()];
    }
 
}