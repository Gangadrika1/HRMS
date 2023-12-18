package com.weblabs.beans;

public class AddTermination {
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getTerminatedEmployee() {
		return TerminatedEmployee;
	}
	public void setTerminatedEmployee(String terminatedEmployee) {
		TerminatedEmployee = terminatedEmployee;
	}
	public String getTerminationType() {
		return TerminationType;
	}
	public void setTerminationType(String terminationType) {
		TerminationType = terminationType;
	}
	public String getTerminationDate() {
		return TerminationDate;
	}
	public void setTerminationDate(String terminationDate) {
		TerminationDate = terminationDate;
	}
	public String getReason() {
		return Reason;
	}
	public void setReason(String reason) {
		Reason = reason;
	}
	public String getNoticeDate() {
		return NoticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		NoticeDate = noticeDate;
	}
	
	private String Id;
	private String TerminatedEmployee;
	private String TerminationType;
	private String TerminationDate;
	private String Reason;
	private String NoticeDate;

}
