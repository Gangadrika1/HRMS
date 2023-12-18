package com.weblabs.beans;

public class AddResignation {
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getResigningEmployee() {
		return ResigningEmployee;
	}
	public void setResigningEmployee(String resigningEmployee) {
		ResigningEmployee = resigningEmployee;
	}
	public String getNoticeDate() {
		return NoticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		NoticeDate = noticeDate;
	}
	public String getResignationDate() {
		return ResignationDate;
	}
	public void setResignationDate(String resignationDate) {
		ResignationDate = resignationDate;
	}
	public String getReason() {
		return Reason;
	}
	public void setReason(String reason) {
		Reason = reason;
	}
	private String Id;
	private String ResigningEmployee;
	private String NoticeDate;
	private String ResignationDate;
	private String Reason;

}
