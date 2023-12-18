package com.weblabs.beans;

public class AddTraining {

	private String TainingID;
	private String TrainingType;
	private String Trainer;
	private String Employees;
	private String TrainingCost;
	private String StartingDate;
	private String EndingDate;
	private String DescriptionName;
	private String Status;
	
	public String getId() {
		return TainingID;
	}
	public void setId(String id) {
		this.TainingID = id;
	}
	public String getTrainingType() {
		return TrainingType;
	}
	public void setTrainingType(String trainingType) {
		TrainingType = trainingType;
	}
	public String getTrainer() {
		return Trainer;
	}
	public void setTrainer(String trainer) {
		Trainer = trainer;
	}
	public String getEmployees() {
		return Employees;
	}
	public void setEmployees(String employees) {
		Employees = employees;
	}
	public String getTrainingCost() {
		return TrainingCost;
	}
	public void setTrainingCost(String trainingCost) {
		TrainingCost = trainingCost;
	}
	public String getStartingDate() {
		return StartingDate;
	}
	public void setStartingDate(String startingDate) {
		StartingDate = startingDate;
	}
	public String getEndingDate() {
		return EndingDate;
	}
	public void setEndingDate(String endingDate) {
		EndingDate = endingDate;
	}
	public String getDescription() {
		return DescriptionName;
	}
	public void setDescription(String description) {
		DescriptionName = description;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
	
	
}
