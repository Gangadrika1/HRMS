package com.weblabs.service;

public interface AddPFService {

	
	public String addpf(String Employee_Id, String ProvidentFundType, String EmployeeShareAmount, String OrganizationShareAmount, String EmployeeSharePer, String OrganizationSharePer,String Description);

	public String deletepf(String Id);
	
	public String editpf( String Id, String Employee_Id, String ProvidentFundType, String EmployeeShareAmount, String OrganizationShareAmount,String EmployeeSharePer,String OrganizationSharePer,  String Description);

}
