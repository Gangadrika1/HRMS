package com.weblabs.service;

public interface SupplierService {
	public String addsup(String supplierName,String productDetails);
	public String deletesup(String supplierID);
	public String editsup(String supplierID,String supplierName,String productDetails);
	
	
}
