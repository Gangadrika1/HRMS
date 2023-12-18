package com.weblabs.service;

public interface CompanySettingServices {

	
	public String addCS(String CompanyName,String ContactPerson,String Address,String logo,String Country,String City,String State,String PostalCode,String Email,String PhoneNumber,String MobileNumber,String Fax,String WebsiteUrl,String InstagramUrl,String TelegramUrl);
	public String editCS(String CompanyID, String CompanyName,String logo,String ContactPerson,String Address,String Country,String City,String State,String PostalCode,String Email,String PhoneNumber,String MobileNumber,String Fax,String WebsiteUrl,String InstagramUrl,String TelegramUrl);
	public String deleteCS(String CompanyID);
}