package com.weblabs.beans;

public class AddInvoiceItems {
	
	private String invoiceid;
	private String Item;
	private String Description;
	private String UnitCost;
	private String Qty;
	private String Amount;
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}

	public String getInvoiceid() {
		return invoiceid;
	}
	public void setInvoiceid(String invoiceid) {
		this.invoiceid = invoiceid;
	}
	public String getItem() {
		return Item;
	}
	public void setItem(String item) {
		Item = item;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getUnitCost() {
		return UnitCost;
	}
	public void setUnitCost(String unitCost) {
		UnitCost = unitCost;
	}
	public String getQty() {
		return Qty;
	}
	public void setQty(String qty) {
		Qty = qty;
	}
	
}
