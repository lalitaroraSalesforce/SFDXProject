public class MapPractice {
    
    public static List<Contact> getContactsUsingMaps(Integer Count)
    {
        List<Contact> conList = new List<Contact>();
        Map<id,Contact> conMap = new Map<id,Contact>([Select id,Name from contact Limit :Count]);        
                for (Contact c: conMap.values())        
        {            
            System.debug(c.Name);
            ConList.add(c);            
        }
        System.debug('conList'+conList);
        
        //List<Sobject> listOpp= [SELECT CampaignId, AVG(Amount)FROM Opportunity GROUP BY CampaignId];
        SObject [] listOpp= [SELECT CampaignId, AVG(Amount)FROM Opportunity GROUP BY CampaignId];
        System.debug('OppList'+listOpp[0]);
        return conList;
    }
    
    String uname;
public String getUsername() {
return uname;
}
public PageReference sayHello() {
uname = UserInfo.getName();
return null;
}
public void setState(String n) {
state = n;
}
public String getState() {
return state;
}
public PageReference methodOne() {
return null;
}
private String state = 'no';
    
}