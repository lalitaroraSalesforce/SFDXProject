public class JSONParserUtil {
  
    public static wrapper parseJSONResponse(String URL) {        
        Http httpProtocol = new Http(); 
        HttpRequest request = new HttpRequest(); 
        String endpoint = URL;
        request.setEndPoint(endpoint); 
        request.setTimeout(120000);
        request.setMethod('GET'); 
        HttpResponse response = httpProtocol.send(request);
        System.debug('response'+response.getBody()); 
        wrapper responseJson;
        responseJson = (wrapper) JSON.deserialize(response.getBody(), wrapper.class); 
        System.debug('ConsumerId'+responseJson.ConsumerId);
        return responseJson;
    }
    
    public class wrapper{
        
            public String TypeString {get;set;}
            public String ConsumerId{get;set;}
            public String disclaimer{get;set;}
            public string handler{get;set;}
            public string profile{get;set;}
            public string dob{get;set;}
            public string token{get;set;}
            public string department{get;set;}
            
            public wrapper (string tp, string con,string dis, string hand,string profile,string dobirth, string tk, string depart)
            {
                TypeString = tp;
                ConsumerId =con;
                disclaimer = dis;
                handler= hand;
                profile = profile;
                dob =dobirth;
                token = tk;
                department =depart;
            }
        } 
    }