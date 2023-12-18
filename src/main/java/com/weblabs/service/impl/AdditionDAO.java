package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddAddition;
import com.weblabs.utility.DBUtil;

public class AdditionDAO {

	 public static List<AddAddition> getFilteredAddClient(String whereClause, int start, int limit) {
	        List<AddAddition> FilteredAddClients = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT payrolladditionid,AdditionName,Category,Unitcalculation,UnitAmount,Payroll_id FROM payroll_addition WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT payrolladditionid,AdditionName,Category,Unitcalculation,UnitAmount,Payroll_id FROM payroll_addition LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddAddition clients=new AddAddition();
	            	clients.setPayrolladditionid(resultSet.getString("payrolladditionid"));
	            	clients.setAdditionName(resultSet.getString("AdditionName"));
	            	clients.setCategory(resultSet.getString("Category"));
	            	clients.setUnitcalculation(resultSet.getString("Unitcalculation"));
	            	clients.setUnitAmount(resultSet.getString("UnitAmount"));
	            	clients.setPayroll_id(resultSet.getString("Payroll_id"));
	            	
	            	FilteredAddClients.add(clients);
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	        	 e.printStackTrace();
	        } finally {
	            // Close database resources (connection, statement, result set)
	            try {
	                if (resultSet != null) resultSet.close();
	                if (preparedStatement != null) preparedStatement.close();
	                if (connection != null) connection.close();
	            } catch (Exception e) {
	                // Handle exceptions
	            	 e.printStackTrace();
	            }
	        }

	        return FilteredAddClients;
	    }
}
