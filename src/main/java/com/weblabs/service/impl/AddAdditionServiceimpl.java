package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddAddition;
import com.weblabs.beans.AddPayrollAdditionAssigne;
import com.weblabs.utility.DBUtil;

public class AddAdditionServiceimpl {
	public static List<AddAddition> getFilteredAddAddition(String whereClause, int start, int limit) {
        List<AddAddition> filteredAddAddition = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT  payrolladditionid,payroll_id,AdditionName, Category, UnitCalculation, UnitAmount FROM payroll_addition " +
                        "WHERE " + whereClause;
            } else {
                query = "SELECT payrolladditionid,payroll_id,AdditionName, Category, UnitCalculation, UnitAmount FROM payroll_addition";
            }

            if (start > 0 && limit > 0) {
                query += " LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddAddition addition = new AddAddition(); 
            	addition.setPayrolladditionid(resultSet.getString("payrolladditionid"));
            	 addition.setPayroll_id(resultSet.getString("payroll_id"));
                addition.setAdditionName(resultSet.getString("AdditionName"));
                addition.setCategory(resultSet.getString("Category"));
                addition.setUnitcalculation(resultSet.getString("UnitCalculation"));
                addition.setUnitAmount(resultSet.getString("UnitAmount"));
         
                filteredAddAddition.add(addition);
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

        return filteredAddAddition;
    }
	
	
	public String editaddition(String Payrolladditionid,String AdditionName,String Category,String Unitcalculation,String UnitAmount) {
	
		String status = "addition Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("UPDATE payroll_addition SET AdditionName =? ,Category =?,Unitcalculation =? ,UnitAmount =? WHERE Payrolladditionid=?");  
	        
	        ps.setString(1, AdditionName);
	        ps.setString(2, Category);
	        ps.setString(3, Unitcalculation);
	        ps.setString(4, UnitAmount);
	        ps.setString(5, Payrolladditionid);
	       
	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "addition Updated Successfully!";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.closeConnection(con);
	        DBUtil.closeConnection(ps);
	    }

	    return status;
	}
	
	
	
	public String deleteaddition(String additionName) {
	    String status = "addition Removal Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement( "DELETE FROM payroll_addition WHERE Payroll_id = ?");
	        ps.setString(1, additionName);

	        int k = ps.executeUpdate();
	        
	        if (k > 0) {
	            // Step 2: If deletion from payroll_addition was successful, delete corresponding rows from payrolladditionassignment
	            ps = con.prepareStatement("DELETE FROM payrolladditionassignment WHERE payroll_id = ?");
	            ps.setString(1, additionName);

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
	 
	
	
	  public static List<AddPayrollAdditionAssigne> getAddPayrollAdditionAssigneByPayrolladditionid(String payroll_id) {
	        List<AddPayrollAdditionAssigne> AddPayrollAdditionAssigneByPayrolladditionid = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT employee_id,Payrolladditionid FROM payrolladditionassignment WHERE Payrolladditionid = ?";
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setString(1, payroll_id);
	            

	            resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	            	AddPayrollAdditionAssigne apaa = new AddPayrollAdditionAssigne();
	            	apaa.setEmployee_id(resultSet.getString("employee_id"));
	            	apaa.setPayrolladditionid(resultSet.getString("Payrolladditionid"));
	            	
	                AddPayrollAdditionAssigneByPayrolladditionid.add(apaa);
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

	        return AddPayrollAdditionAssigneByPayrolladditionid;
	    }
}