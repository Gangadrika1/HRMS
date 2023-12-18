package com.weblabs.beans;

public class biddingBean {

	
	private String id;
    private String Clientid;
    private String is_fixed;
    private String hourly;
    private String pricing;
    private String project_id;
    private String is_approved;
    
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClientid() {
		return Clientid;
	}
	public void setClientid(String clientid) {
		Clientid = clientid;
	}
	public String getIs_fixed() {
		return is_fixed;
	}
	public void setIs_fixed(String is_fixed) {
		this.is_fixed = is_fixed;
	}
	public String getHourly() {
		return hourly;
	}
	public void setHourly(String hourly) {
		this.hourly = hourly;
	}
	public String getPricing() {
		return pricing;
	}
	public void setPricing(String pricing) {
		this.pricing = pricing;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(String is_approved) {
		this.is_approved = is_approved;
	}
    
}