@RestResource(urlMapping='/BulkContactInsert/*')
Global class testbulkinsertservice {
 
    @HttpPost
    global static void doPost()
    {
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        String fileName= req.requestBody.toString().trim();  
        system.debug('--->'+fileName);
       
        List<Contact> ConList = new List<Contact>();
        
            fromJSON Recordnew = parse(fileName);
            System.debug('check-->'+parse(fileName));
            
        for (cls_Record c : Recordnew.Record )
        {
            Contact con = new Contact(); 
            con.FirstName = c.Firstname;
            con.LastName = c.Lastname;
            ConList.add(con); 
  		 }     
        System.debug('Conlist---->'+Conlist);
        insert Conlist;
    }
    
public class fromJSON{
public cls_Record[] Record;
}
    
public class cls_Record {
public String Firstname; //Testfirst
public String Lastname; //testlast
}

public static fromJSON parse(String json){
return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
} 
    
}