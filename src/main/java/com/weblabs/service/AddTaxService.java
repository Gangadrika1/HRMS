package com.weblabs.service;

public interface AddTaxService {
	
	public String addtax(String TaxName, String TaxPercentage, String Status);

	public String deletetax(String Id);
	
	public String edittax( String Id, String TaxName, String TaxPercentage, String Status);


}
