package com.weblabs.beans;

public class Payroll {

	private String Id;
	private String payroll_id;
	private String year;
	private String Month;
	private String Is_opened;
	private String Ranby;	
	private String last_modified_time;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPayroll_id() {
		return payroll_id;
	}
	public void setPayroll_id(String payroll_id) {
		this.payroll_id = payroll_id;
	}
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return Month;
	}
	public void setMonth(String month) {
		Month = month;
	}
	public String getIs_opened() {
		return Is_opened;
	}
	public void setIs_opened(String is_opened) {
		Is_opened = is_opened;
	}
	public String getRanby() {
		return Ranby;
	}
	public void setRanby(String ranby) {
		Ranby = ranby;
	}
	public String getLast_modified_time() {
		return last_modified_time;
	}
	public void setLast_modified_time(String last_modified_time) {
		this.last_modified_time = last_modified_time;
	}
}
