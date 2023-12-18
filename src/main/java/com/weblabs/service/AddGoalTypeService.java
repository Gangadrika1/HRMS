package com.weblabs.service;

public interface AddGoalTypeService {
	public String addgt(String Type,String Descripton,String Status);
    
	 public String deletegt(String id);

	public String editgt(String id,String Type,String Descripton,String Status);

}
