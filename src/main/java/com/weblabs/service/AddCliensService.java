package com.weblabs.service;

public interface AddCliensService {

	 public String addClients(String FirstName, String LastName, String UserName, String Email,String Clientid,String Phone, String Company,String  Address);
     public String editClients(String FirstName, String LastName, String UserName, String Email,String Clientid,String Phone, String Company,String  Address);
     public String deleteClients(String Clientid);
}
