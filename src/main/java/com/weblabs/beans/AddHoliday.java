package com.weblabs.beans;

public class AddHoliday {

	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String Holiday_Name;
	private String Holiday_Date;
	
	public String getHoliday_Name() {
		return Holiday_Name;
	}
	public void setHoliday_Name(String holiday_Name) {
		Holiday_Name = holiday_Name;
	}
	public String getHoliday_Date() {
		return Holiday_Date;
	}
	public void setHoliday_Date(String holiday_Date) {
		Holiday_Date = holiday_Date;
	}
}

