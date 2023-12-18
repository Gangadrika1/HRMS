package com.weblabs.service;

public interface AddLeavesService {
	
	public String addLeaves(String Employee,String Starting_At,String Ending_On,String Days,String Reason,String Employee_Id);
	public String deleteLeave(String id);
	public String updateLeave(String id,String Employee,String Starting_At,String Ending_On,String Days,String Reason);
	
}
