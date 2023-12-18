package com.weblabs.beans;

public class AddOverTime {

	
	private String id;
	private String Employee_Id;
	private String OverTime_Date;
	private String Hours;
	private String Type;
    private String Description;
    
    
	public String getEmployee_Id() {
		return Employee_Id;
	}
	public void setEmployee_Id(String employee_Id) {
		Employee_Id = employee_Id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getOverTime_Date() {
		return OverTime_Date;
	}
	public void setOverTime_Date(String overTime_Date) {
		OverTime_Date = overTime_Date;
	}
	public String getHours() {
		return Hours;
	}
	public void setHours(String hours) {
		Hours = hours;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	}
	
	

