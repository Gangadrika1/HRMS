package com.weblabs.service;

public interface AddPromotionService {

	public String addpromotion(String Id, String PromotionFor, String PromotionFrom, String PromotionTo, String PromotionDate);
	
	public String deletepromotion(String Id);

	
	public String editpromotion(String Id, String PromotionFor, String PromotionFrom, String PromotionTo, String PromotionDate);

	
}
