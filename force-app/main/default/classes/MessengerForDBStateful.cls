public class MessengerForDBStateful {
    public static void SendBatchStatusNotificationEmail(AsyncApexJob jobDetails, string jobName, Decimal revenue){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] toAddress = new String[]{jobDetails.CreatedBy.Email,'nirajsabre04@gmail.com'};
            email.setToAddresses(toAddress);
        email.setReplyTo('nirajsabre.sfdc@gmail.com');
        email.setSenderDisplayName('Tachyon Technologies');
        string emailSubject= 'Remainder..!!'+jobName+'Job Status Notification alert Job Id:'+jobDetails.Id;
        email.setSubject(emailSubject);
        string emailContent = 'Dear Customer support,<br/><br/>'+
            'We have processed the Batch Job: CalculateTotalRevenueBatch Sucessfully.<br/><br/>'+
            'Here are the Batch job status details..:<br/><br/>'+
            'Batch Job Name is CalculateTotalRevenueBatch <br/>'+
            'Batch Job Id is...'+jobdetails.Id+
            '<br/>Batch Job status is...'+jobdetails.Status+
            '<br/>Total number of Batches..'+jobdetails.TotalJobItems+
            '<br/>Number of Job Items have been processed..'+jobdetails.JobItemsProcessed+
            '<br/>Failed items.....'+jobdetails.NumberOfErrors+
            '<br/>Total Revenue value'+revenue+
            '<br/><br/>Please Contact the below address, if any queries<br/><br/>'+
            'Thanks & Regards.<br/> Tachyon technologies';
        email.setHtmlBody(emailContent);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}