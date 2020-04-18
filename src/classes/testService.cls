@RestResource(urlMapping='/ContactCreateKaro/*')
global with sharing class testService {

   @HttpPost
    global static String doPost(String firstname,
        String lastname) {
        Contact contactObj = new Contact();
        contactObj.FirstName = firstname;
        contactObj.LastName = lastname;
        
        insert contactObj;
        return 'all done'+contactObj.Id;
    }
}