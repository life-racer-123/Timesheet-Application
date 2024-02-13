public with sharing class TimesheetControllerV1 {
   @AuraEnabled
    public static String updateTimesheetRecordWeekday(String startDate, String EmpId, String RACFID, Integer [] hours,String lastDate, 
                                                      String EmpName, String Project, String EntryType, String Month){
        List<Timesheet__c> timesheets = [SELECT Monday_Hours__c, Tuesday_Hours__c, Wednesday_Hours__c, Thursday_Hours__c,
                                       Friday_Hours__c FROM Timesheet__c WHERE Start_Date__c =: startDate AND Entry_Type__c =:EntryType LIMIT 1];
        System.debug(startDate);
        if(timesheets.isEmpty()){
            Timesheet__c timesheet = new Timesheet__c();
            timesheet.Start_Date__c=startDate;
            timesheet.End_Date__c=lastDate;
            timesheet.Employee_Name__c=EmpName;
            timesheet.Month__c=month;
            timesheet.Employee_ID__c = EmpId;
            timesheet.Entry_Type__c=EntryType;
            timesheet.Project__c=Project;
            timesheet.Entry_Date__c=Date.today();
            timesheet.Monday_Hours__c=hours[0];
            timesheet.Tuesday_Hours__c=hours[1];
            timesheet.Wednesday_Hours__c=hours[2];
			timesheet.Thursday_Hours__c=hours[3];
			timesheet.Friday_Hours__c= hours[4];
            system.debug(timesheet);
			insert timesheet;   
            return 'success';
        }else{
            return 'error';
        }
    }
}