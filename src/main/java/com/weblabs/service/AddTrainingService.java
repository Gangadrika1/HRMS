package com.weblabs.service;

public interface AddTrainingService {

	public String addTraining(String TrainingType,String Trainer, String Employees,String TrainingCost, String StartingDate,String EndingDate,String Description, String Status);
	public String editTraining(String id,String TrainingType,String Trainer, String Employees,String TrainingCost, String StartingDate,String EndingDate,String Description, String Status);
	public String deleteTraining(String id);
}
