package com.weblabs.beans;

public class AddsalaryBean {
	
	private String employee_id;
	private String Basic;
	private String DA;
	private String HRA;
	private String CONVEYANCE;
    private String ALLOWANCE;
	private String MEDICAL;
	private String TDS;
	private String ESI;
	private String PF;
    private String LEAVE;
    private String PROF_TAX;
    private String LABOUR_WELFARE;
    private String GroseSal;
    private String DeducationTotal;
    private String NetSal;
	
    public String getNetSal() {
		return NetSal;
	}
	public void setNetSal(String netSal) {
		NetSal = netSal;
	}
	public String getDeducationTotal() {
		return DeducationTotal;
	}
	public void setDeducationTotal(String deducationTotal) {
		DeducationTotal = deducationTotal;
	}

	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getBasic() {
		return Basic;
	}
	public void setBasic(String basic) {
		Basic = basic;
	}
	public String getDA() {
		return DA;
	}
	public void setDA(String dA) {
		DA = dA;
	}
	public String getHRA() {
		return HRA;
	}
	public void setHRA(String hRA) {
		HRA = hRA;
	}
	public String getCONVEYANCE() {
		return CONVEYANCE;
	}
	public void setCONVEYANCE(String cONVEYANCE) {
		CONVEYANCE = cONVEYANCE;
	}
	public String getALLOWANCE() {
		return ALLOWANCE;
	}
	public void setALLOWANCE(String aLLOWANCE) {
		ALLOWANCE = aLLOWANCE;
	}
	public String getMEDICAL() {
		return MEDICAL;
	}
	public void setMEDICAL(String mEDICAL) {
		MEDICAL = mEDICAL;
	}
	public String getTDS() {
		return TDS;
	}
	public void setTDS(String tDS) {
		TDS = tDS;
	}
	public String getESI() {
		return ESI;
	}
	public void setESI(String eSI) {
		ESI = eSI;
	}
	public String getPF() {
		return PF;
	}
	public void setPF(String pF) {
		PF = pF;
	}
	public String getLEAVE() {
		return LEAVE;
	}
	public void setLEAVE(String lEAVE) {
		LEAVE = lEAVE;
	}
	public String getPROF_TAX() {
		return PROF_TAX;
	}
	public void setPROF_TAX(String pROF_TAX) {
		PROF_TAX = pROF_TAX;
	}
	public String getLABOUR_WELFARE() {
		return LABOUR_WELFARE;
	}
	public void setLABOUR_WELFARE(String lABOUR_WELFARE) {
		LABOUR_WELFARE = lABOUR_WELFARE;
	}
	public String getOTHERS() {
		return GroseSal;
	}
	public void setOTHERS(String oTHERS) {
		GroseSal = oTHERS;
	}
	

}