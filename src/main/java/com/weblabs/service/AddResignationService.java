package com.weblabs.service;

public interface AddResignationService {
	
	
	public String addresignation(String Id, String ResigningEmployee,String NoticeDate, String ResignationDate, String Reason);
	 
	 public String deleteresignation(String id);
	 
	 public String editresignation(String Id, String ResigningEmployee,String NoticeDate, String ResignationDate, String Reason);
}
