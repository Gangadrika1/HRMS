package com.weblabs.service;

public interface AddempsalaryService {
	public String addempsalary( String employee_id, String Basic, String DA, String HRA, String CONVEYANCE,  String ALLOWANCE,String MEDICAL,
			 String TDS,String ESI,String PF,
		    String PROF_TAX, String LABOUR_WELFARE);

	public String deleteEmpSalary(String empid);
	
	public String editempsalary( String employee_id, String Basic, String DA, String HRA, String CONVEYANCE,  String ALLOWANCE,String MEDICAL,
			 String TDS,String ESI,String PF,
		     String LEAVE,String PROF_TAX, String LABOUR_WELFARE);

}
