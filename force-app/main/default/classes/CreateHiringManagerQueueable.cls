public class CreateHiringManagerQueueable implements System.Queueable {
     public void execute(System.QueueableContext context) {

        Hiring_Manager__c hm = new Hiring_Manager__c();
        hm.Name = 'Niraj';
        hm.Email__c  = 'Niraj@example.com';
        insert hm;


        System.enqueueJob(new PositionQueueable(hm.Id));
    }
     class PositionQueueable implements System.Queueable {
      Id hiringId;
     public PositionQueueable(Id hmId) {
        this.hiringId = hmId;
    }

    public void execute(System.QueueableContext context) {

        Position__c pos = new Position__c();
        pos.Name  = 'SalesForce';
        pos.Manager__c = hiringId;  
        insert pos;

    }
}

        
}