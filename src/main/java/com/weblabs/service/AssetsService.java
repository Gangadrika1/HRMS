package com.weblabs.service;

public interface AssetsService {
	public String addAssets(String assetName,String PurchaseDate,String supplierID,String Manufacturer,String Model,String Status,String Supplier,String AssetCondition,String Warranty,String Price,String AssetUser,String Description,String DateTime);

	public String deleteAssets(String id);
	
	
	public String updateAssets(String id,String assetName,String PurchaseDate,String supplierID,String Manufacturer,String Model,String Status,String Supplier,String AssetCondition,String Warranty,String Price,String AssetUser,String Description,String DateTime);

}

