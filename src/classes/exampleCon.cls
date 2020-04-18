/***  Controller: ***/
public class exampleCon {
     public String dateValue {get;set;}
    Integer count = 0;
                        
    public PageReference incrementCounter() {
            count++;
            return null;
    }
                    
    public Integer getCount() {
        return count;
    }
}