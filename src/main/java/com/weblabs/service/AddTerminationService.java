package com.weblabs.service;

public interface AddTerminationService {
	

	public String addtermination(String Id, String TerminatedEmployee, String TerminationType, String TerminationDate, String Reason, String NoticeDate);
	
	public String deletetermination(String Id);
	
	public String editTermination(String Id, String TerminatedEmployee, String TerminationType, String TerminationDate, String Reason, String NoticeDate);


}
