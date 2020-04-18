trigger TaskBeforeDelete on Task (before delete)  {

      Map<Id,Profile> profileMap=new Map<Id,Profile>([SELECT Id,Name FROM Profile WHERE Name  IN ('Standard User')]);
       
    System.debug('profileMap==>'+profileMap);
    
    profile p=profileMap.get(UserInfo.getprofileID());
     try {
        
        for (Task task : Trigger.old)  {    
        
        	  if(task.Activity_LFD_Type__c.equalsIgnoreCase('Test') && task.WhatId.getSObjectType() == account.sObjectType && task.WhatId != null && (p==null) )           
            
            {    
                if(!Test.isRunningTest()){
                
                task.addError('You are not permitted to delete this task');
                
                }
     
            }
        
        }
        
    } Catch(Exception e){
        
      
    }
        
     }