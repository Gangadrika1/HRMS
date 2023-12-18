package com.weblabs.service;

public interface AddTimesheetService {

	public String addTimesheet(String Employee_Id,String DateWorked,String project_id,String task_id,String HoursWorked);
	
	
	public String editTimesheet(String TimesheetID,String Employee_Id,String DateWorked,String project_id,String task_id,String HoursWorked);
	
	public String deleteTimesheet(String TimesheetID);

}


