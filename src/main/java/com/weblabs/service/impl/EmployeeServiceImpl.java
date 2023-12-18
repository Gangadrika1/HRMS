package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.service.EmployeeService;
import com.weblabs.utility.DBUtil;


public class EmployeeServiceImpl implements EmployeeService{
@Override
	public String addEmployee(String FirstName, String LastName, String Username, String Email, String Password,  String Employee_Id, String Phone,String Department,String Designation,String Picture ,String Joining_Date,String Gender,String Location,String PAN, String PF,String pf_No,String UAN, String VPF , String ESI) {	
		String status = "Employee Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO employees (FirstName,LastName,Username,Email,Password,Employee_Id,Phone,DepartmentId,Designationid,Picture,Joining_Date,Gender,Location,PAN,PF,pf_No,UAN,VPF,ESI) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, Username);
            ps.setString(4, Email);
            ps.setString(5, Password);
            ps.setString(6, Employee_Id);
            ps.setString(7, Phone);
            ps.setString(8, Department);
            ps.setString(9, Designation);
            ps.setString(10, Picture);
            ps.setString(11, Joining_Date);
            ps.setString(12,Gender);
            ps.setString(13,Location);
            ps.setString(14,PAN);
            ps.setString(15,PF);
            ps.setString(16,pf_No);
            ps.setString(17,UAN);
            ps.setString(18,VPF);
            ps.setString(19,ESI);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Employee Added Successfully!";
         
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
public String deleteEmployee(String id) {
    String status = "Employee Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM employees WHERE Employee_Id = ?");
        ps.setString(1, id);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "Employee Removed Successfully!";
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
public String editEmployee(String EmployeeID,String firstname, String lastname, String username, String email, String phone,
		String department, String designation,String Joining_Date,String Gender,String Location,String PAN, String PF,String pf_No,String UAN, String VPF , String ESI) {
	// TODO Auto-generated method stub
	String status = "Employee Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE employees SET FirstName =?, LastName =?, UserName =?, Email =?, Phone =?, Joining_Date =?,Gender=?,Location=?,PAN=?,PF=?,pf_No=?,UAN=?,VPF=?,ESI=?,DepartmentId =?, Designationid =? WHERE Employee_Id=?");  
        ps.setString(1, firstname);
        ps.setString(2, lastname);
        ps.setString(3, username);
        ps.setString(4,  email);
        ps.setString(5, phone);
        ps.setString(6, Joining_Date);
        ps.setString(7,Gender);
        ps.setString(8,Location);
        ps.setString(9,PAN);
        ps.setString(10,PF);
        ps.setString(11,pf_No);
        ps.setString(12,UAN);
        ps.setString(13,VPF);
        ps.setString(14,ESI);
        ps.setString(15, department);
        ps.setString(16, designation);
        ps.setString(17,EmployeeID);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "Employee Position Updated Successfully!";
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        DBUtil.closeConnection(con);
        DBUtil.closeConnection(ps);
    }

    return status;
}
	

public static List<EmployeeBean> getAddPayrollAdditionAssigneByPayrolladditionid(String payroll_id) {
    List<EmployeeBean> AddrollidinempByrollID = new ArrayList<>();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = DBUtil.provideConnection();
        String query = "SELECT Employee_Id,Payrolladditionid FROM payrolladditionassignment WHERE Payrolladditionid = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, payroll_id);
        

        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
        	EmployeeBean apaa = new EmployeeBean();
        	apaa.setEmployee_ID(resultSet.getString("Employee_Id"));
        	apaa.setRollID(resultSet.getString("rollID"));
        	
        	AddrollidinempByrollID.add(apaa);
        }
        
    } 
    catch (SQLException e)
    {
        e.printStackTrace();
    }
    finally 
    {
    	 try {
             if (resultSet != null) resultSet.close();
             if (preparedStatement != null) preparedStatement.close();
             if (connection != null) connection.close();
         } catch (Exception e) {
             // Handle exceptions
         	 e.printStackTrace();
         }
    }

    return AddrollidinempByrollID;
}

}





	


