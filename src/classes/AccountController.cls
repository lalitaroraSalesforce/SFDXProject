public class AccountController {
    public List<multiRowContact> Contacts { get; set; }
    public String Email {get; set;}
    Public String Phone {get; set;}
    Public Boolean CheckEmail {get; set;}
    Public Decimal MultiplyNumber {get; set;}
    Public Boolean CheckMultiplyNumber {get; set;}
    Public Decimal TotalNumber1 {get; set;}
    public Decimal tempInt=0;
    
 
    public AccountController() {
        LoadData();     
		//check me here..see I am updated:P
       
    }
 
  
    public PageReference Save() {
    System.debug('--BeforeCall1111');
        for (multiRowContact MRC : Contacts) {
        System.debug('--BeforeCall');
            MRC.Save();
        }
        LoadData();
        return null;
    }
    public void LoadData() {
        Contacts = new List<multiRowContact>();
        for (List<Contact> cs : [SELECT c.ID,c.Birthdate, c.Name, c.Email,c.Phone,c.num1_num2_5__c,c.Number_Field1__c,c.Number_Field2__c  FROM Contact c]) {
            for (Contact c : cs) {
                multiRowContact MRC = new multiRowContact();
                MRC.ID = c.ID;
                MRC.Checked = false;
                MRC.Name = c.Name;
                MRC.Birthdate = c.Birthdate;
                if( MRC.Birthdate!=null)
                MRC.FormattedBirthDate = MRC.Birthdate.month() + '/' +  MRC.Birthdate.day() + '/' +   MRC.Birthdate.year(); 
              if(CheckEmail==true){
                    if(Email!=''&& Email!=null)
                    {
                     MRC.Email = Email;
                    }
                }
                else
                {
                MRC.Email = c.Email;
                }
              
                MRC.Phone =c.Phone;
                MRC.Number_Field1 = c.Number_Field1__c;
                
                MRC.Number_Field2 = c.Number_Field2__c;
                
                if(CheckMultiplyNumber==true){
                if(MultiplyNumber  !=null)
                {
                MRC.num1_num2_5= (c.Number_Field2__c +c.Number_Field1__c) * MultiplyNumber;
                }
                }
                else
                {
                    if (c.Number_Field2__c!=null && c.Number_Field1__c!=null){
                        MRC.num1_num2_5= (c.Number_Field1__c+   c.Number_Field2__c );
                        }
                    else if(c.Number_Field2__c!=null)
                    {
                     MRC.num1_num2_5=c.Number_Field2__c;
                    }   
                    else
                    
                    {MRC.num1_num2_5=c.Number_Field1__c;
                    
                    }     
                }
                Contacts.add(MRC);
                 TotalNumber1 =0.0;
            }
            for (multiRowContact Totalcheck: Contacts)
            {
            if (Totalcheck.Number_Field1!=null){
                 TotalNumber1 =  TotalNumber1+Totalcheck.Number_Field1;
                }
            }
             
        }
    }
 
    private class multiRowContact {
        public String ID { get; set; }
        public date Birthdate {get;set;}
        public String FormattedBirthDate {get; set;}
        public String Name { get; set; }
        public String Email { get; set; }
        public String Phone { get; set; }
        public Boolean Checked { get; set; }
        public Decimal Number_Field1 { get; set; }
        public Decimal Number_Field2 { get; set; }
        public decimal num1_num2_5 { get; set; }
        
        public void Save() {
            
                System.debug('Saving...ID: ' + ID);
                Contact c = [SELECT c.Email,c.Birthdate,c.Phone,c.Number_Field1__c,c.Number_Field2__c,c.num1_num2_5__c FROM Contact c WHERE c.ID = :ID LIMIT 1];
                System.debug('check----->'+Birthdate);
                c.Birthdate = Birthdate;
                c.Email = Email;
                c.Phone =Phone;
                c.Number_Field1__c = Number_Field1;
                c.Number_Field2__c =Number_Field2;
                c.num1_num2_5__c =num1_num2_5;
               
                update c;
                }
                
        public void UpdateUI()
        {
                Contact c = [SELECT c.Email,c.Phone,c.Number_Field1__c,c.Number_Field2__c,c.num1_num2_5__c FROM Contact c WHERE c.ID = :ID LIMIT 1];
                c.Email = Email;
                c.Phone =Phone;
                c.Number_Field1__c = Number_Field1;
                c.Number_Field2__c =Number_Field2;
                c.num1_num2_5__c =num1_num2_5;
        
        }       
      
    }
}