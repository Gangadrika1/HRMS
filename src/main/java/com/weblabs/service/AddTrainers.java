package com.weblabs.service;

public interface AddTrainers {

	public String addTrainers(String firstname,String lastname,String role,String email,String phone,String status,String description);
    public String edit(String id,String firstname,String lastname,String role,String email,String phone,String status,String description);
    public String deleteTrainers(String id);
}
