package com.weblabs.beans;

import java.io.Serializable;

public class PartialPaymentBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String amount_paid;
	private String payment_date;
	private String balance_amt;

	@Override
	public String toString() {
		return "PartialPaymentBean [id=" + id + ", amount_paid=" + amount_paid + ", payment_date=" + payment_date
				+ ", balance_amt=" + balance_amt + "]";
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the amount_paid
	 */
	public String getAmount_paid() {
		return amount_paid;
	}

	/**
	 * @param amount_paid the amount_paid to set
	 */
	public void setAmount_paid(String amount_paid) {
		this.amount_paid = amount_paid;
	}

	/**
	 * @return the payment_date
	 */
	public String getPayment_date() {
		return payment_date;
	}

	/**
	 * @param payment_date the payment_date to set
	 */
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	/**
	 * @return the balance_amt
	 */
	public String getBalance_amt() {
		return balance_amt;
	}

	/**
	 * @param balance_amt the balance_amt to set
	 */
	public void setBalance_amt(String balance_amt) {
		this.balance_amt = balance_amt;
	}

}
