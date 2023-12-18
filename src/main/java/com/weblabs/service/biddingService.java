package com.weblabs.service;

public interface biddingService {
 
	public String addB(String Clientid,String is_fixed,String hourly,String pricing,String project_id,String is_approved);
	public String deleteB(String id);
	public String editB(String id,String Clientid,String is_fixed,String hourly,String pricing,String project_id,String is_approved);
	
	
}