package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddClient;
import com.weblabs.utility.DBUtil;

public class AddClientsDAO {

	 public static List<AddClient> getFilteredAddClient(String whereClause, int start, int limit) {
		 	System.out.println(whereClause);
	        List<AddClient> FilteredAddClients = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT Clientid,FirstName,LastName,Username, Email,Phone,Company,Address FROM clients WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT Clientid,FirstName,LastName,Username, Email,Phone,Company,Address FROM clients LIMIT ?, ?;";
	                }
	            System.out.println("in addclientsDAO "+query);
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	            
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddClient clients=new AddClient();
	            	clients.setClientID(resultSet.getString("clientid"));
	            	clients.setFirstName(resultSet.getString("FirstName"));
	            	clients.setLastName(resultSet.getString("LastName"));
	            	clients.setUsername(resultSet.getString("Username"));
	            	clients.setEmail(resultSet.getString("Email"));
	            	clients.setClientID(resultSet.getString("ClientID"));
	            	clients.setPhone(resultSet.getString("Phone"));
	            	clients.setCompany(resultSet.getString("Company"));
	            	clients.setAddress(resultSet.getString("Address"));
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
	 
	  public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from clients";
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
	  
	  public static List<AddClient> getAllClient() {
	        List<AddClient> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  Clientid,UserName FROM clients";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddClient cli = new AddClient();
	                 cli.setClientID(resultSet.getString("Clientid"));
	                 cli.setUsername(resultSet.getString("UserName"));
	                allEmployees.add(cli);
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

	        return allEmployees;
	    }
	  
	  
	  
	  public static String getClientEmail(int selectedInvoiceIDInt) {
		    String ClientEmail = null;

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
		            String sql = "SELECT Email FROM clients WHERE Clientid = ? ";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setInt(1, selectedInvoiceIDInt);

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    if (resultSet.next()) {
		                        // Retrieve the payment amount as a String
		                    	ClientEmail = resultSet.getString("Email");
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return ClientEmail;
		}

	  
}



