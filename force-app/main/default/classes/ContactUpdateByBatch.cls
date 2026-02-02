/*Create a Batch Job to Update the Contact Record's Phone, Email and Fax  
for All records by dividing them to the various batches of size 10. And then Track the Status of the Batch Class.*/
global class ContactUpdateByBatch implements Database.Batchable<SObject> {
    global database.queryLocator start(Database.BatchableContext bc)
    {
        string escapedInput ='Niraj'+ '%';
        string conQuery ='SELECT Id, Email, Fax, Phone, Description, FirstName FROM Contact Where Email != Null AND Name like \''+escapedInput+'\'';
        return database.getQueryLocator(conQuery);
	 }
   global void execute(Database.BatchableContext bc, List<Contact> ContactRecordsToProcess)
                                        {
                                            list<Contact> updateContact = new  list<Contact>();
                                            for(Contact con : ContactRecordsToProcess)
                                            {
                                                con.Description='Conatct Updated by Btach Apex';
                                                updateContact.Add(con);
                                            }
                                            Update updateContact;
                                        }
                                        
                                        global void finish(Database.BatchableContext bc){
                                            AsyncApexJob jobDetails =[Select Id, Status, totalJobItems, jobItemsProcessed, NumberOfErrors, CreatedBy.Email 
                                                                     From AsyncApexJob
                                                                     where id =: bc.getJobId()];
                           
                                        }
}