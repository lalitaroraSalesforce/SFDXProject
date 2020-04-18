public class CalendarExample_Controller {

public integer DaysinMonth{get;set;}
Public String TableData {get;set;}
Public String MonthYear {get;Set;}


public CalendarExample_Controller ()
{
getMonthDays();

}
Public void getMonthDays()
{
  DaysinMonth  = Date.daysInMonth(Date.today().year(), Date.today().month());
  Integer value = DaysinMonth;
  List<date> Monthdates = new List<Date>();
  MonthYear =  ((datetime)Date.today()).format('MMMMM') + ' '+Date.today().year();
  Map<Datetime,String> MonthDays = new Map<DateTime, String>();
  
  for (integer i=1; i<=value; i++ )
  {
  Datetime DateVar = (Datetime)date.parse(Date.today().month()+'/'+i+'/'+Date.today().Year());
  string dayVar=   DateVar.adddays(1).format('EEEE'); 
 // TableData  =TableData  + '<tr><td>'+ Date.today().month()+'/'+i+'/'+Date.today().Year()+ '</td><td>'+ dayVar+'</td></tr>';
  MonthDays.put (DateVar,dayVar);
  }
  TableData  = '<tr style="Font-size:15px; "><td align="center">Monday</td><td align="center">Tuesday</td><td align="center">Wednesday</td><td align="center">Thursday</td><td align="center">Friday</td></tr>';
   for (Datetime DateValue: MonthDays.keySet()){
   
  if (DateValue.adddays(1).day()==1)
  {
   if( MonthDays.get(DateValue) == 'Tuesday')
  {
   TableData   = TableData  +' <td></td>';
  }
  else if (MonthDays.get(DateValue) == 'Wednesday')
  {
   TableData   = TableData  +' <td></td><td></td>';
  }
  
  else if (MonthDays.get(DateValue) == 'Thursday')
  {
   TableData   = TableData  +' <td></td><td></td><td></td>';
  }
  
  else if (MonthDays.get(DateValue) == 'Friday')
  {
   TableData   = TableData  +' <td></td><td></td><td></td><td></td>';
  }
  }
   
   if (MonthDays.get(DateValue)<>'Saturday' && MonthDays.get(DateValue)<>'Sunday'){
   if(MonthDays.get(DateValue) =='Monday')
   {
   TableData  = TableData  +'</tr><tr>';
   }
      TableData  =TableData  + '<td align="Right" bgcolor="#f2f2f2" width="150px"><div style = "color:#b3d9ff;font-size:20px">'+ DateValue.adddays(1).day() + '</div><br/>'+' <b>Total Call : 0'+'</b>';
 TableData = TableData+'</br><table bgcolor="white" Border="1" style = " margin:10px; border-collapse: collapse;"><tr><td Align="center" style = "Padding-top:8px">Priority</td><td Align="center" style = "Padding-top:8px">Recurrence</td><td Align="center">Non</br> Recurrence</td></tr><tr><td Align="center">A</td><td></td><td></td></tr><tr><td Align="center">B</td><td></td><td></td></tr><tr><td Align="center">C</td><td></td><td></td></tr></table> </td>';
 
  }
   
   }
   TableData = tabledata + '</tr>';
  
}

}