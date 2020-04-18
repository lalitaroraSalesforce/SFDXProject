trigger AccountAddressTrigger on Account (before insert, before update) 
{
	List<Account> accList = new List<Account>();
    for (Account a : Trigger.new)
    {
      if(a.Match_Billing_Address__c)
      {
        System.debug('Check box is true');
		if(a.BillingPostalCode!=null && a.BillingPostalCode!='')
      {
          a.ShippingPostalCode = a.BillingPostalCode;
      } 
    }
  }
}