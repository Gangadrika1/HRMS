package com.weblabs.beans;

import java.io.Serializable;

public class AddPersonalInformation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ID;
	private String Employee_id;
	private String PassportNo;
	private String PassportExpiryDate;
	private String Tel;
	private String Nationality;
	private String Religion;
	private String MaritalStatus;
	private String EmploymentOfSpouse;
	private String NumberOfChildren;

	public String getID() {

		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getEmployee_id() {
		return Employee_id;
	}

	public void setEmployee_id(String employee_id) {
		Employee_id = employee_id;
	}

	public String getPassportNo() {
		return PassportNo;
	}

	public void setPassportNo(String passportNo) {
		PassportNo = passportNo;
	}

	public String getPassportExpiryDate() {
		return PassportExpiryDate;
	}

	public void setPassportExpiryDate(String passportExpiryDate) {
		PassportExpiryDate = passportExpiryDate;
	}

	public String getTel() {
		return Tel;
	}

	public void setTel(String tel) {
		Tel = tel;
	}

	public String getNationality() {
		return Nationality;
	}

	public void setNationality(String nationality) {
		Nationality = nationality;
	}

	public String getReligion() {
		return Religion;
	}

	public void setReligion(String religion) {
		Religion = religion;
	}

	public String getMaritalStatus() {
		return MaritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		MaritalStatus = maritalStatus;
	}

	public String getEmploymentOfSpouse() {
		return EmploymentOfSpouse;
	}

	public void setEmploymentOfSpouse(String employmentOfSpouse) {
		EmploymentOfSpouse = employmentOfSpouse;
	}

	public String getNumberOfChildren() {
		return NumberOfChildren;
	}

	public void setNumberOfChildren(String numberOfChildren) {
		NumberOfChildren = numberOfChildren;
	}

}
