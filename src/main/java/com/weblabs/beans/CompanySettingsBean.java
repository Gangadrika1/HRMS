package com.weblabs.beans;


import javax.servlet.http.HttpServletRequest;

public class CompanySettingsBean {

    private String CompanyID;
    private String CompanyName;
    private String ContactPerson;
    private String Address;
    private String logo;
    private String Country;
	private String City;
    private String State;
    private String TelegramUrl;
    private String InstagramUrl;
    
    public String getlogoUrl(HttpServletRequest request)
    {
    	return request.getContextPath() + "/assets/profiles/" + getLogo();
    }
    
    public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getTelegramUrl() {
		return TelegramUrl;
	}
	public void setTelegramUrl(String telegramUrl) {
		TelegramUrl = telegramUrl;
	}
	public String getInstagramUrl() {
		return InstagramUrl;
	}
	public void setInstagramUrl(String instagramUrl) {
		InstagramUrl = instagramUrl;
	}
	private String PostalCode;
    private String Email;
    private String PhoneNumber;
    private String MobileNumber;
    private String Fax;
    private String WebsiteUrl;
	public String getCompanyID() {
		return CompanyID;
	}
	public void setCompanyID(String companyID) {
		CompanyID = companyID;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	public String getContactPerson() {
		return ContactPerson;
	}
	public void setContactPerson(String contactPerson) {
		ContactPerson = contactPerson;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getMobileNumber() {
		return MobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}
	public String getFax() {
		return Fax;
	}
	public void setFax(String fax) {
		Fax = fax;
	}
	public String getWebsiteUrl() {
		return WebsiteUrl;
	}
	public void setWebsiteUrl(String websiteUrl) {
		WebsiteUrl = websiteUrl;
	}



}
