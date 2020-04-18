@istest
private class TestVerifyDate {
    
    @isTest static  void testDateWithin30Days()
    {	     	 
        Date date1 = date.parse('1/1/2015');
     	Date date2 = date.parse('03/30/2015');
        
        Date returnDate= VerifyDate.CheckDates(date1,date2);        
        System.assertEquals(date.parse('1/31/2015'),returnDate);
    }
    
    @isTest static  void testDateSame()
    {	
        Date date1 = date.parse('1/1/2015');
     	Date date2 = date.parse('1/1/2015');        
        Date returnDate= VerifyDate.CheckDates(date1,date2);        
        System.assertEquals(date.parse('1/1/2015'),returnDate);
    }
    
      @isTest static  void testDateLess()
    {	
        Date date1 = date.parse('3/30/2015');
     	Date date2 = date.parse('1/1/2015');        
        Date returnDate= VerifyDate.CheckDates(date1,date2);        
        System.assertEquals(date.parse('3/31/2015'),returnDate);
    }
}