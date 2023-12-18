package com.weblabs.beans;



public class AddTimesheet {
	private String TimesheetID;
	private String Employee_Id;
	private String DateWorked;
	private String project_id;
	private String task_id;
	private String HoursWorked;
	public String getTimesheetID() {
		return TimesheetID;
	}
	public void setTimesheetID(String timesheetID) {
		TimesheetID = timesheetID;
	}
	public String getEmployee_Id() {
		return Employee_Id;
	}
	public void setEmployee_Id(String employee_Id) {
		Employee_Id = employee_Id;
	}
	public String getDateWorked() {
		return DateWorked;
	}
	public void setDateWorked(String dateWorked) {
		DateWorked = dateWorked;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getHoursWorked() {
		return HoursWorked;
	}
	public void setHoursWorked(String hoursWorked) {
		HoursWorked = hoursWorked;
	}


	
	}


