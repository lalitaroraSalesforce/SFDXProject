trigger UpdateVehicle on Car__c (after insert, after update, after delete) {

 
   List<Vehicle__c> Veh = new List<Vehicle__C>();
    for (Car__c c : trigger.new)
    { 
        System.debug(c);
        veh.add(new Vehicle__c(Name=c.Model__c,Name__c=c.Model__c,Registration_Number__c=c.Registration_Number__c));
	}
   
	insert veh;    
  
}