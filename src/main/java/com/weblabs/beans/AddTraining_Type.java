package com.weblabs.beans;

public class AddTraining_Type {

	private String TrainingTypeID;
	private String type;
	private String description;
	private String status;
	
	public String getId() {
		return TrainingTypeID;
	}
	public void setId(String id) {
		this.TrainingTypeID = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
