@istest

    public class TaskBeforeDelete_Test{
        
    
    public static testMethod void BeforeDelete(){ 
        
        String uniqueName ='myname1';
    
           Profile pId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        
         User testUser = new User(Email='test@email.com',Phone='555-555-5555',
                                 FirstName='Test',LastName='User', ProfileId=pId.Id,UserName=uniqueName + '@test'  + '.com',
                                 Alias='tesUse',TimeZoneSidKey='America/New_York',
                                 LocaleSIdKey='en_US',EmailEncodingKey='UTF-8',
                                 LanguageLocaleKey='en_US'); 
                                 
        
        system.runAs(testUser){
        
        account acc= new account();
        acc.name='test';
        acc.Site='testsite';
        insert acc;
        
        
       task task=new task();
       task.Activity_LFD_Type__c='Test';
       task.whatid=acc.id;
       
       insert task;
       
       delete task;
       
       }
    }
}