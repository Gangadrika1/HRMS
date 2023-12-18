package com.weblabs.service;

public interface AddHolidayService {
	
	public String addHoliday(String Holiday_Name,String Holiday_Date);

	public String deleteHoliday(String id);
	
	public String update(String id,String Holiday_Name,String Holiday_Date);
}