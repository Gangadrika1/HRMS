package com.weblabs.service;

public interface AddInvoiceItemsService {
	
	public String addinvoiceitems(String invoiceid,String Item,String Description,String UnitCost, String Qty,String Amount, String TaxDiscount,String total,String grand_total);
 
	public String deleteinvoiceitems(String invoiceid);
	
	public String editinvoiceitems(String invoiceid,String Item,String Description,String UnitCost, String Qty,String Amount, String TaxDiscount,String total,String grand_total);

}
