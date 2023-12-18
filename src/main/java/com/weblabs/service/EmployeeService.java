package com.weblabs.service;
public interface EmployeeService {

	 public String addEmployee(String FirstName, String LastName, String Username, String Email, String Password,  String Employee_Id, String Phone,String Department,String Designation,String Picture ,String Joining_Date,String Gender,String Location,String PAN, String PF,String pf_No,String UAN, String VPF , String ESI);

	 public String deleteEmployee(String EmployeeID);

	
	public String editEmployee(String EmployeeID,String firstname, String lastname, String username, String email, String phone,
			String department, String designation,String Joining_Date,String Gender,String Location,String PAN, String PF,String pf_No,String UAN, String VPF , String ESI);
	 
}
