package com.weblabs.service;

public interface AddprojectService {

	public String addProject(String projectname,String Clientid,String startdate,String enddate,
			String rate,String hourly,String priority,String projectleader,String addteam,
			String description,String uploadfile);


	public String deleteProject(String project_id);


			
	public String editProject(String project_id,String projectname,String Clientid,String startdate,String enddate,
					String rate,String hourly,String priority,String projectleader,String addteam,
					String description,String uploadfile);
}

