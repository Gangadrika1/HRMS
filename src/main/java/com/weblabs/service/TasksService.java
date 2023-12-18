package com.weblabs.service;

public interface TasksService {

	public String addtasks(String project_id,String description,String start_date,String end_date,String assigned_resource,String is_completed);
	public String deletetasks(String task_id);
	public String edittasks(String task_id,String project_id,String description,String start_date,String end_date,String assigned_resource,String is_completed);


}
