package com.weblabs.beans;

public class AddDesignation {
	
	private String Designationid;
	private String DesignationName;
	private String DepartmentId;
	
	public String getId() {
		return Designationid;
	}
	public void setId(String id) {
		this.Designationid = id;
	}
	public String getDesignationName() {
		return DesignationName;
	}
	public void setDesignationName(String designation) {
		DesignationName = designation;
	}
	public String getDepartmentName() {
		return DepartmentId;
	}
	public void setDepartmentName(String department) {
		DepartmentId = department;
	}

}
