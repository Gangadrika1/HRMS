package com.weblabs.service;

public interface AddgoalsService {

	public String addGoal(String Type,String Subject, String Target,String StartDate, String EndDate, String Description, String Status,String Progress);
    public String deleteGoal(String id);
    public String editGoal(String id,String Type,String Subject, String Target,String StartDate, String EndDate, String Description, String Status,String Progress);
}
