public class TriggerCarePlanHandler {
    
    set<id> allContactIDs = new set<id>();
    List<Care_Plan_Details__c> allrelatedCarePlans = new List<Care_Plan_Details__c>();
    List<Care_Plan_Details__c> updateRecords = new List<Care_Plan_Details__c>();
    
  public void  UpdateActivestatus (List<Care_Plan_Details__c> Triggernew)
    {        
        for (Care_Plan_Details__c var : Triggernew)
        {
            allContactIDs.add(var.contact__c);
        }        
   	
       allrelatedCarePlans = [select id, Active_Inactive__c,contact__c from Care_Plan_Details__c where contact__c in:allContactIDs ];
     
       
       for (Care_Plan_Details__c var : allrelatedCarePlans) 
           {
                   Care_Plan_Details__c record = new Care_Plan_Details__c();
                    record.Id = var.id;
                    Record.Active_Inactive__c = false;
               updateRecords.add(record);               
           }
        
        if (!updateRecords.isEmpty())
        { 
            update updateRecords;
        }
    }
}