package com.weblabs.beans;

public class TasksBean {
	private String task_id;
	private String project_id;
	private String description;
	private String start_date;
	private String end_date;
	private String assigned_resource;
	private String is_completed;
	
	
	
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getAssigned_resource() {
		return assigned_resource;
	}
	public void setAssigned_resource(String assigned_resource) {
		this.assigned_resource = assigned_resource;
	}
	public String getIs_completed() {
		return is_completed;
	}
	public void setIs_completed(String is_completed) {
		this.is_completed = is_completed;
	}
	
	
}
