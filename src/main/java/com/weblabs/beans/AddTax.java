package com.weblabs.beans;

public class AddTax {
	
	private String TaxID;
	private String TaxName;
	private String TaxPercentage;
	private String Status;
	public String getID() {
		return TaxID;
	}
	public void setID(String iD) {
		TaxID = iD;
	}
	public String getTaxName() {
		return TaxName;
	}
	public void setTaxName(String taxName) {
		TaxName = taxName;
	}
	public String getTaxPercentage() {
		return TaxPercentage;
	}
	public void setTaxPercentage(String taxPercentage) {
		TaxPercentage = taxPercentage;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	

}
