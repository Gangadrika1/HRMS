package com.weblabs.beans;

import java.util.List;

public class AddInvoice {
	
	private String client;
	private String Project;
	private String Email;
	private String Tax;
    private String ClientAddress;
	private String BillingAddress;
	private String Invoicedate;
	private String DueDate;
	private String OtherInformation;
	private String discount;
	private String taxamount;
	private String grandtotal;
	private String invoiceid;
	private String Item;
	private String Description;
	private String UnitCost;
	private String Qty;
	private String InvoiceItemId;
	private String Total;

	
	


	public String getTotal() {
		return Total;
	}
	public void setTotal(String total) {
		Total = total;
	}

	public String getInvoiceItemId() {
		return InvoiceItemId;
	}
	public void setInvoiceItemId(String invoiceItemId) {
		InvoiceItemId = invoiceItemId;
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

	public String getOtherInformation() {
		return OtherInformation;
	}
	public void setOtherInformation(String otherInformation) {
		OtherInformation = otherInformation;
	}

	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getProject() {
		return Project;
	}
	public void setProject(String project) {
		Project = project;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTax() {
		return Tax;
	}
	public void setTax(String tax) {
		Tax = tax;
	}
	public String getClientAddress() {
		return ClientAddress;
	}
	public void setClientAddress(String clientAddress) {
		ClientAddress = clientAddress;
	}
	public String getBillingAddress() {
		return BillingAddress;
	}
	public void setBillingAddress(String billingAddress) {
		BillingAddress = billingAddress;
	}
	public String getInvoicedate() {
		return Invoicedate;
	}
	public void setInvoicedate(String invoicedate) {
		Invoicedate = invoicedate;
	}
	public String getDueDate() {
		return DueDate;
	}
	public void setDueDate(String dueDate) {
		DueDate = dueDate;
	}

	public String getGrandtotal() {
		return grandtotal;
	}
	public void setGrandtotal(String grandtotal) {
		this.grandtotal = grandtotal;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getTaxamount() {
		return taxamount;
	}
	public void setTaxamount(String taxamount) {
		this.taxamount = taxamount;
	}
	
	    private String id;
	    private List<AddInvoiceItems> invoiceItems;

	    public String getId() {
	        return id;
	    }

	    public void setId(String id) {
	        this.id = id;
	    }

	    public List<AddInvoiceItems> getInvoiceItems() {
	        return invoiceItems;
	    }

	    public void setInvoiceItems(List<AddInvoiceItems> invoiceItems) {
	        this.invoiceItems = invoiceItems;
	    }
	}

	
