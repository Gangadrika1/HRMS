package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTax;
import com.weblabs.utility.DBUtil;

public class AddTaxDAO {
	  public static List<AddTax> getFilteredAddTax(String whereClause, int start, int limit) {
	        List<AddTax> FilteredAddTax = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  ID,TaxName,TaxPercentage,Status FROM tax WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT  ID,TaxName,TaxPercentage,Status FROM tax LIMIT ?, ?;";
	                }
	            System.out.println(query);
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddTax taxs = new AddTax();
	            	taxs.setID(resultSet.getString("ID"));
	            	taxs.setTaxName(resultSet.getString("TaxName"));
	            	taxs.setTaxPercentage(resultSet.getString("TaxPercentage"));
	            	taxs.setStatus(resultSet.getString("Status"));
	            	FilteredAddTax.add(taxs);
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

	        return FilteredAddTax;
	    }
}
