package com.weblabs.beans;

import java.io.Serializable;

public class biddingBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String Clientid;
	private String is_fixed;
	private String hourly;
	private String pricing;
	private String project_id;
	private String is_approved;

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
	 * @return the clientid
	 */
	public String getClientid() {
		return Clientid;
	}

	/**
	 * @param clientid the clientid to set
	 */
	public void setClientid(String clientid) {
		Clientid = clientid;
	}

	/**
	 * @return the is_fixed
	 */
	public String getIs_fixed() {
		return is_fixed;
	}

	/**
	 * @param is_fixed the is_fixed to set
	 */
	public void setIs_fixed(String is_fixed) {
		this.is_fixed = is_fixed;
	}

	/**
	 * @return the hourly
	 */
	public String getHourly() {
		return hourly;
	}

	/**
	 * @param hourly the hourly to set
	 */
	public void setHourly(String hourly) {
		this.hourly = hourly;
	}

	/**
	 * @return the pricing
	 */
	public String getPricing() {
		return pricing;
	}

	/**
	 * @param pricing the pricing to set
	 */
	public void setPricing(String pricing) {
		this.pricing = pricing;
	}

	/**
	 * @return the project_id
	 */
	public String getProject_id() {
		return project_id;
	}

	/**
	 * @param project_id the project_id to set
	 */
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	/**
	 * @return the is_approved
	 */
	public String getIs_approved() {
		return is_approved;
	}

	/**
	 * @param is_approved the is_approved to set
	 */
	public void setIs_approved(String is_approved) {
		this.is_approved = is_approved;
	}

	@Override
	public String toString() {
		return "biddingBean [id=" + id + ", Clientid=" + Clientid + ", is_fixed=" + is_fixed + ", hourly=" + hourly
				+ ", pricing=" + pricing + ", project_id=" + project_id + ", is_approved=" + is_approved + "]";
	}

}