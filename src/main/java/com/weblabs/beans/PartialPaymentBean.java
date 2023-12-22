package com.weblabs.beans;

public class PartialPaymentBean {
	private String 	id;
	private String amount_paid;
	private String payment_date;
	private String balance_amt;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAmount_paid() {
		return amount_paid;
	}
	public void setAmount_paid(String amount_paid) {
		this.amount_paid = amount_paid;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getBalance_amt() {
		return balance_amt;
	}
	public void setBalance_amt(String balance_amt) {
		this.balance_amt = balance_amt;
	}
	
}
