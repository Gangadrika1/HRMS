package com.weblabs.beans;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

public class CompanySettingsBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	private String PostalCode;
	private String Email;
	private String PhoneNumber;
	private String MobileNumber;
	private String Fax;
	private String WebsiteUrl;

	public String getlogoUrl(HttpServletRequest request) {
		return request.getContextPath() + "/assets/profiles/" + getLogo();
	}

	/**
	 * @return the companyID
	 */
	public String getCompanyID() {
		return CompanyID;
	}

	/**
	 * @param companyID the companyID to set
	 */
	public void setCompanyID(String companyID) {
		CompanyID = companyID;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return CompanyName;
	}

	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}

	/**
	 * @return the contactPerson
	 */
	public String getContactPerson() {
		return ContactPerson;
	}

	/**
	 * @param contactPerson the contactPerson to set
	 */
	public void setContactPerson(String contactPerson) {
		ContactPerson = contactPerson;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return Address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		Address = address;
	}

	/**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}

	/**
	 * @param logo the logo to set
	 */
	public void setLogo(String logo) {
		this.logo = logo;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return Country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		Country = country;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return City;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		City = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return State;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		State = state;
	}

	/**
	 * @return the telegramUrl
	 */
	public String getTelegramUrl() {
		return TelegramUrl;
	}

	/**
	 * @param telegramUrl the telegramUrl to set
	 */
	public void setTelegramUrl(String telegramUrl) {
		TelegramUrl = telegramUrl;
	}

	/**
	 * @return the instagramUrl
	 */
	public String getInstagramUrl() {
		return InstagramUrl;
	}

	/**
	 * @param instagramUrl the instagramUrl to set
	 */
	public void setInstagramUrl(String instagramUrl) {
		InstagramUrl = instagramUrl;
	}

	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return PostalCode;
	}

	/**
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return PhoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	/**
	 * @return the mobileNumber
	 */
	public String getMobileNumber() {
		return MobileNumber;
	}

	/**
	 * @param mobileNumber the mobileNumber to set
	 */
	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}

	/**
	 * @return the fax
	 */
	public String getFax() {
		return Fax;
	}

	/**
	 * @param fax the fax to set
	 */
	public void setFax(String fax) {
		Fax = fax;
	}

	/**
	 * @return the websiteUrl
	 */
	public String getWebsiteUrl() {
		return WebsiteUrl;
	}

	/**
	 * @param websiteUrl the websiteUrl to set
	 */
	public void setWebsiteUrl(String websiteUrl) {
		WebsiteUrl = websiteUrl;
	}

	@Override
	public String toString() {
		return "CompanySettingsBean [CompanyID=" + CompanyID + ", CompanyName=" + CompanyName + ", ContactPerson="
				+ ContactPerson + ", Address=" + Address + ", logo=" + logo + ", Country=" + Country + ", City=" + City
				+ ", State=" + State + ", TelegramUrl=" + TelegramUrl + ", InstagramUrl=" + InstagramUrl
				+ ", PostalCode=" + PostalCode + ", Email=" + Email + ", PhoneNumber=" + PhoneNumber + ", MobileNumber="
				+ MobileNumber + ", Fax=" + Fax + ", WebsiteUrl=" + WebsiteUrl + "]";
	}

}
