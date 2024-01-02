package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddDeductions;
import com.weblabs.beans.AddPayrollDeductionAssigne;
import com.weblabs.utility.DBUtil;
	
public class AddDeductionServiceImpl {
	public static List<AddDeductions> getFilteredAddDeductions(String whereClause, int start, int limit) {
        List<AddDeductions> filteredAddDeductions = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
        	connection = DBUtil.provideConnection();
            String query;
            
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT payrolldeductionid ,payroll_id, DeductionName, UnitCalculation, UnitAmount FROM payroll_deduction " +
                        "WHERE " + whereClause;
            } else {
                query = "SELECT payrolldeductionid, payroll_id, DeductionName, UnitCalculation, UnitAmount FROM payroll_deduction";
            }

            if (start > 0 && limit > 0) {
                query += " LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();
             
            while (resultSet.next()) {
            	AddDeductions addition = new AddDeductions(); 
            	addition.setPayrolldeductionid(resultSet.getString("payrolldeductionid"));
            	addition.setPayroll_id(resultSet.getString("payroll_id"));
                addition.setDeductionName(resultSet.getString("DeductionName"));
                addition.setUnitcalculation(resultSet.getString("UnitCalculation"));
                addition.setUnitAmount(resultSet.getString("UnitAmount"));
         
                filteredAddDeductions.add(addition);
            }
        } catch (SQLException e) {
            // Handle exceptions or log them properly
            e.printStackTrace();
        } finally {
           // closeResources(connection, preparedStatement, resultSet);
        	 try {
                 if (resultSet != null) resultSet.close();
                 if (preparedStatement != null) preparedStatement.close();
                 if (connection != null) connection.close();
             } catch (Exception e) {
                 // Handle exceptions
             	 e.printStackTrace();
             }
        }

        return filteredAddDeductions;
    }
	
	public static String editDeduction(String Payroll_id,String DeductionName,String  Unitcalculation,String UnitAmount ) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    String status = "Deduction Update Failed!";

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "UPDATE payroll_deduction SET UnitCalculation = ?, UnitAmount = ? ,DeductionName = ? WHERE payroll_id = ? ";

	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, Unitcalculation);
	        preparedStatement.setString(2, UnitAmount);
	        preparedStatement.setString(3, DeductionName);
	        preparedStatement.setString(4, Payroll_id);
  
	        
	        int k = preparedStatement.executeUpdate();

            if (k > 0) {
                status = "Designation Added Successfully!";
            }
        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(connection);
            DBUtil.closeConnection(preparedStatement);
        }

        return status;
}


	  public String deletededuction(String id) {
		    String status = "deduction Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM payroll_deduction WHERE payrolldeductionid = ?");
		        ps.setString(1, id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		        	 // Step 2: If deletion from payroll_addition was successful, delete corresponding rows from payrolladditionassignment
		            ps = con.prepareStatement("DELETE FROM payroll payrolldeductionassignment WHERE payroll_id = ?");
		            ps.setString(1, id);

		            int rowsDeleted = ps.executeUpdate();

		            if (rowsDeleted > 0) {
		                status = "Addition and Assignment Removed Successfully!";
		            } else {
		                status = "Addition Removed Successfully, but Assignment Removal Failed!";
		            }
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
		


	  public static List<AddPayrollDeductionAssigne> getAddPayrollDeductionAssigneBypayrolldeductionid(String payrolldeductionid) {
	        List<AddPayrollDeductionAssigne> AddPayrollDeductionAssigneBypayroll_id = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT employee_id,payrolldeductionid FROM payrolldeductionassignment WHERE payrolldeductionid = ?";
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setString(1, payrolldeductionid);

	            resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	            	AddPayrollDeductionAssigne apaa = new AddPayrollDeductionAssigne();
	            	apaa.setEmployee_id(resultSet.getString("employee_id"));
	            	apaa.setPayrolldeductionid(resultSet.getString("payrolldeductionid"));
	            	
	            	AddPayrollDeductionAssigneBypayroll_id.add(apaa);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        	 try {
	                 if (resultSet != null) resultSet.close();
	                 if (preparedStatement != null) preparedStatement.close();
	                 if (connection != null) connection.close();
	             } catch (Exception e) {
	                 // Handle exceptions
	             	 e.printStackTrace();
	             }
	        }

	        return AddPayrollDeductionAssigneBypayroll_id;
	    }

}
	
