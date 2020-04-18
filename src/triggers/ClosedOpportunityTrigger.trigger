trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{    
    List<Task> taskList= new List<Task>();
    for(Opportunity opp : Trigger.new)
    {
 		if(opp.StageName=='Closed Won') 
        {
           task t = new task(whatID= opp.id,Subject='Follow Up Test Task',Priority = 'Normal', Status = 'Not Started');
           taskList.add(t);
		}
        
    }
    insert taskList;
	
}