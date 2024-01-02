package com.weblabs.beans;

import java.io.Serializable;

public class AddGoals implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String GoalID;
	private String GoalsType;
	private String Subject;
	private String Target;
	private String StartDate;
	private String EndDate;
	private String Description;
	private String Status;
	private String Progress;

	public String getId() {
		return GoalID;
	}

	public void setId(String id) {
		this.GoalID = id;
	}

	public String getType() {
		return GoalsType;
	}

	public void setType(String type) {
		GoalsType = type;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getTarget() {
		return Target;
	}

	public void setTarget(String target) {
		Target = target;
	}

	public String getStartDate() {
		return StartDate;
	}

	public void setStartDate(String startDate) {
		StartDate = startDate;
	}

	public String getEndDate() {
		return EndDate;
	}

	public void setEndDate(String endDate) {
		EndDate = endDate;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getProgress() {
		return Progress;
	}

	public void setProgress(String progress) {
		Progress = progress;
	}
}
