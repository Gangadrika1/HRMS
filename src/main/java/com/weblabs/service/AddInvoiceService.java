package com.weblabs.service;

public interface AddInvoiceService {
	
	public String addinvoice(String client,String Project,String Email, String Tax,String ClientAddress, String BillingAddress,String Invoicedate,String DueDate,String OtherInformation,String discount, String taxamount, String grandtotal);
 
	public String deleteinvoice(String id);
	
	public String editinvoice(String client,String Project,String Email, String Tax,String ClientAddress, String BillingAddress,String Invoicedate,String DueDate,String OtherInformation,String discount, String taxamount, String grandtotal);
	 
}
