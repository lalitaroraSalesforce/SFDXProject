trigger OrderEventTrigger on Order_Event__e (after insert) {
  
    List<Task> Tasks = new List<Task>();
    
    // Get queue Id for case owner
    User myUser = [SELECT Id FROM User WHERE Name='Lalit Arora' LIMIT 1];
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task taskVar= new Task();
            taskVar.Priority = 'Medium';
            taskVar.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            taskVar.OwnerId = myUser.Id;
            Tasks.add(taskVar);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert Tasks;

}