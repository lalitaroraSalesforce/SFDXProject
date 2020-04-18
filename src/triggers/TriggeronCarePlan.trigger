trigger TriggeronCarePlan on Care_Plan_Details__c (before insert, before update) {
    
    TriggerCarePlanHandler handler =  new TriggerCarePlanHandler();
    
   if(trigger.isUpdate || trigger.isInsert)
   {
       handler.UpdateActivestatus(Trigger.new);
       
   }
}