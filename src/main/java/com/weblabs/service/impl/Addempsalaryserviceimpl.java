package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddempsalaryService;
import com.weblabs.utility.DBUtil;

public class Addempsalaryserviceimpl implements AddempsalaryService{

@Override     
public String addempsalary(String employee_id, String Basic,String DA,String HRA,String CONVEYANCE, String ALLOWANCE, String MEDICAL, String TDS, String ESI, String PF,String PROF_TAX,String LABOUR_WELFAR)

{	
		String status = "Employee Adding Failed!";

        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	double conveyanceValue = Double.parseDouble(CONVEYANCE);
            double allowanceValue = Double.parseDouble(ALLOWANCE);
            double medicalValue = Double.parseDouble(MEDICAL);
        	double basicValue = Double.parseDouble(Basic);
            double daValue = Double.parseDouble(DA);
            double hraValue = Double.parseDouble(HRA);
            double othersValue =conveyanceValue + allowanceValue + medicalValue + basicValue + daValue + hraValue;
            String Grose = String.valueOf(othersValue);
            //netsalary 
            System.out.println(Grose);
            
            double tdsValue = Double.parseDouble(TDS);
            double esiValue = Double.parseDouble(ESI);
            double pfValue = Double.parseDouble(PF);
            double profTaxValue = Double.parseDouble(PROF_TAX);
            double labourWelfareValue = Double.parseDouble(LABOUR_WELFAR);
            double deduction = tdsValue + esiValue + pfValue + profTaxValue + labourWelfareValue;
            String CalculateDEDUCTIONTOTAL = String.valueOf(deduction);
            //duduction total
        	System.out.println(CalculateDEDUCTIONTOTAL);
            
        	double Grosesal = Double.parseDouble(Grose);
            double CalculateDEDUCTIONTOTALValue = Double.parseDouble(CalculateDEDUCTIONTOTAL);

            double Netsal = Grosesal - CalculateDEDUCTIONTOTALValue;
            String calculatedNetSal = String.valueOf(Netsal);
            
            ps = conn.prepareStatement("INSERT INTO salary (employee_id, Basic, DA, HRA, CONVEYANCE, ALLOWANCE, MEDICAL, TDS, PF, PROF_TAX, LABOUR_WELFARE, GroseSal ,DeducationTotal,NetSal,ESI) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, employee_id);
            ps.setString(2, Basic);
            ps.setString(3, DA);
            ps.setString(4, HRA);
            ps.setString(5, CONVEYANCE);
            ps.setString(6, ALLOWANCE);
            ps.setString(7, MEDICAL);
            ps.setString(8, TDS);
            ps.setString(9, PF);
            ps.setString(10, PROF_TAX);
            ps.setString(11, LABOUR_WELFAR);
            ps.setString(12, Grose);
            ps.setString(13, CalculateDEDUCTIONTOTAL);
            ps.setString(14, calculatedNetSal);
            ps.setString(15, ESI);
          
            
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Emp Salary Added Successfully!";
            }
        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
            DBUtil.closeConnection(ps);
        }

        return status;
}

@Override
public String deleteEmpSalary(String empid) {
	// TODO Auto-generated method stub
	String status = "Emp salary Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM salary WHERE employee_id = ?");
        ps.setString(1, empid);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "Emp salary Removed Successfully!";
        }
    } catch (SQLException e) {
        status = "Error: " + e.getMessage();
        e.printStackTrace();
    } finally {
        DBUtil.closeConnection(con);
        DBUtil.closeConnection(ps);
    }

    return status;
}

@Override
public String editempsalary(String employee_id, String Basic, String DA, String HRA, String CONVEYANCE,
		String ALLOWANCE, String MEDICAL, String TDS, String ESI, String PF, String LEAVE, String PROF_TAX,
		String LABOUR_WELFARE) {
	// TODO Auto-generated method stub
	String status = "Emp salary Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
    	double conveyanceValue = Double.parseDouble(CONVEYANCE);
        double allowanceValue = Double.parseDouble(ALLOWANCE);
        double medicalValue = Double.parseDouble(MEDICAL);
    	double basicValue = Double.parseDouble(Basic);
        double daValue = Double.parseDouble(DA);
        double hraValue = Double.parseDouble(HRA);
        double othersValue =conveyanceValue + allowanceValue + medicalValue + basicValue + daValue + hraValue;
        String calculatedNet = String.valueOf(othersValue);
        //netsalary 
        System.out.println(calculatedNet);
        
        double tdsValue = Double.parseDouble(TDS);
        double esiValue = Double.parseDouble(ESI);
        double pfValue = Double.parseDouble(PF);
        double profTaxValue = Double.parseDouble(PROF_TAX);
        double labourWelfareValue = Double.parseDouble(LABOUR_WELFARE);
        double groseSalary = tdsValue + esiValue + pfValue + profTaxValue + labourWelfareValue;
        String CalculateDEDUCTIONTOTAL = String.valueOf(groseSalary);
        //duduction total
    	System.out.println(CalculateDEDUCTIONTOTAL);
        
    	double calculatedNetValue = Double.parseDouble(calculatedNet);
        double CalculateDEDUCTIONTOTALValue = Double.parseDouble(CalculateDEDUCTIONTOTAL);

        double groseSalaryValue = calculatedNetValue - CalculateDEDUCTIONTOTALValue;
        String calculatedGroseSalary = String.valueOf(groseSalaryValue);
        ps = con.prepareStatement("UPDATE salary SET Basic =?,DA =?,HRA =?,CONVEYANCE =?,ALLOWANCE =?,MEDICAL =?,TDS =?,PF =?,PROF_TAX =?,LABOUR_WELFARE =?,GroseSal=? ,DeducationTotal=?,NetSal=?,ESI=? WHERE  employee_id =?");  
        
        ps.setString(1, Basic);
        ps.setString(2, DA);
        ps.setString(3, HRA);
        ps.setString(4, CONVEYANCE);
        ps.setString(5, ALLOWANCE);
        ps.setString(6, MEDICAL);
        ps.setString(7, TDS);
        ps.setString(8, PF);
        ps.setString(9, PROF_TAX);
        ps.setString(10, LABOUR_WELFARE);
        ps.setString(11, calculatedGroseSalary);
        ps.setString(12, CalculateDEDUCTIONTOTAL);
        ps.setString(13, calculatedNet);
        ps.setString(14, ESI);
        ps.setString(15, employee_id);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "salary Updated Successfully!";
        }
    } catch (SQLException e) {
    	 status = "Error: " + e.getMessage();
        e.printStackTrace();
    } finally {
        DBUtil.closeConnection(con);
        DBUtil.closeConnection(ps);
    }

    return status;
}
}

