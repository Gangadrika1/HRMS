package com.weblabs.beans;

public class AddExpenses {

	private String Id;
	private String ItemName;
	private String PurchaseFrom;
	private String PurchaseDate;
	private String PurchasedBy;
	private String Amount;
	private String PaidBy; 
	private String Status;
	private String Attachments;
	private String Supplierid;
	
	public String getSupplierid() {
		return Supplierid;
	}
	public void setSupplierid(String supplierid) {
		Supplierid = supplierid;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getItemName() {
		return ItemName;
	}
	public void setItemName(String itemName) {
		ItemName = itemName;
	}
	public String getPurchaseFrom() {
		return PurchaseFrom;
	}
	public void setPurchaseFrom(String purchaseFrom) {
		PurchaseFrom = purchaseFrom;
	}
	public String getPurchaseDate() {
		return PurchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		PurchaseDate = purchaseDate;
	}
	public String getPurchasedBy() {
		return PurchasedBy;
	}
	public void setPurchasedBy(String purchasedBy) {
		PurchasedBy = purchasedBy;
	}
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public String getPaidBy() {
		return PaidBy;
	}
	public void setPaidBy(String paidBy) {
		PaidBy = paidBy;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getAttachments() {
		return Attachments;
	}
	public void setAttachments(String attachments) {
		Attachments = attachments;
	}
	
	
}
