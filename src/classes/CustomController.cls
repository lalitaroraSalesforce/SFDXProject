public class CustomController {

    public PageReference Approve() {
        
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Your Page Open Approve Request.Thank you! '));
            return null;
    }

DateTime t1;
transient DateTime t2;
public String getT1() {
if (t1 == null) t1 = System.now();
return '' + t1;
}
public String getT2() {
if (t2 == null) t2 = System.now();
return '' + t2;
}
}