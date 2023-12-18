package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTax;
import com.weblabs.utility.DBUtil;

public class TaxesDAO {
	  public static List<AddTax> getFilteredAddTax(String whereClause, int start, int limit) {
	        List<AddTax> FilteredAddTax = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  TaxID,TaxName,TaxPercentage,Status FROM tax WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT  TaxID,TaxName,TaxPercentage,Status FROM tax LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddTax taxs = new AddTax();
	            	taxs.setID(resultSet.getString("TaxID"));
	            	taxs.setTaxName(resultSet.getString("taxName"));
	            	taxs.setTaxPercentage(resultSet.getString("taxPercentage"));
	            	taxs.setStatus(resultSet.getString("status"));
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
	  
	  public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from tax";
			 ps = connection.prepareStatement(query);
			 rs = ps.executeQuery();
			 while (rs.next()) {
			 count = rs.getInt("count");
			 }
			 } catch (Exception e) {
			 e.printStackTrace();
			 } finally {
			 try {
				 connection.close();
			 } catch (SQLException ex) {
			 ex.printStackTrace();
			 }
			 }
			 return count;
			 }
}