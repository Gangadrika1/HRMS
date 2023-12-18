package com.weblabs.service;

public interface AddOverTimeService {
	public String addovertime(String Employee_Id, String OverTime_Date, String Hours, String Type,  String Description);

	public String deleteovertime(String id);
	
	public String editovertime( String id, String Employee_Id, String OverTime_Date, String Hours, String Type,  String Description);

}
