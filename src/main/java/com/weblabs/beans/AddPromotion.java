package com.weblabs.beans;

public class AddPromotion {

	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPromotionFor() {
		return PromotionFor;
	}
	public void setPromotionFor(String promotionFor) {
		PromotionFor = promotionFor;
	}
	public String getPromotionFrom() {
		return PromotionFrom;
	}
	public void setPromotionFrom(String promotionFrom) {
		PromotionFrom = promotionFrom;
	}
	public String getPromotionTo() {
		return PromotionTo;
	}
	public void setPromotionTo(String promotionTo) {
		PromotionTo = promotionTo;
	}
	public String getPromotionDate() {
		return PromotionDate;
	}
	public void setPromotionDate(String promotionDate) {
		PromotionDate = promotionDate;
	}
	private String Id;
	private String PromotionFor;
	private String PromotionFrom;
	private String PromotionTo;
	private String PromotionDate;
}
