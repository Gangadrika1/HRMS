package com.weblabs.beans;

public class PaymentBean {
	
	private String payment_id;
	private String client_username;
	private String invoice_id;
	private String payment_amt;
	private String due_date;
	
	
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getClient_username() {
		return client_username;
	}
	public void setClient_username(String client_username) {
		this.client_username = client_username;
	}
	public String getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}
	public String getPayment_amt() {
		return payment_amt;
	}
	public void setPayment_amt(String payment_amt) {
		this.payment_amt = payment_amt;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	
	
	
	
	
}
