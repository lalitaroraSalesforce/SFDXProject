public with sharing class GoogleMap {
	@AuraEnabled
    public static List<Account> getAccounts(){
      
        return [SELECT Id,website, Name,phone,BillingLatitude, billingLongitude, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry from Account where BillingCity !=null and BillingLatitude!=null];
    }
}