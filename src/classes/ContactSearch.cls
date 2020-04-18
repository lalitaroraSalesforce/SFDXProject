public class ContactSearch {

    public static list<Contact> searchForContacts(String LastName, String MailingPostalCode){
        
	List<Contact> con = new List<contact>();
        
    for (Contact con1 : [Select id, Name from contact where Lastname =:LastName and MailingPostalCode =:MailingPostalCode ])
    {
        Con.add(con1);
	} 
      System.debug(con);  
     return con;   
    }
}