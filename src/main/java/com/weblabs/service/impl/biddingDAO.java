package com.weblabs.service.impl;

import java.math.BigDecimal;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.biddingBean;
import com.weblabs.utility.DBUtil;

public class biddingDAO {

	 public static List<biddingBean> getFilteredAddBidding(String whereClause, int start, int limit) {
	        List<biddingBean> FilteredAddBidding = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT id, Clientid, is_fixed, hourly, pricing,project_id ,is_approved FROM bidding WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT id, Clientid, is_fixed, hourly, pricing,project_id,is_approved FROM bidding LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	biddingBean clients=new biddingBean();
	            	clients.setId(resultSet.getString("id"));
	            	clients.setClientid(resultSet.getString("Clientid"));
	            	clients.setIs_fixed(resultSet.getString("is_fixed"));
	            	clients.setHourly(resultSet.getString("hourly"));
	            	clients.setPricing(resultSet.getString("pricing"));
	            	clients.setProject_id(resultSet.getString("project_id"));
	            	clients.setIs_approved(resultSet.getString("is_approved"));
	            	
	            	FilteredAddBidding.add(clients);
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

	        return FilteredAddBidding;
	    }
	 
	  public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from bidding";
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
	  
	  public static List<biddingBean> getAllBidding() {
	        List<biddingBean> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  id, Clientid FROM bidding";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	biddingBean cli = new biddingBean();
	                 cli.setId(resultSet.getString("id"));
	                 cli.setClientid(resultSet.getString("Clientid"));
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
	  
	  
	  public static BigDecimal getTotalPricingForProject() {
		    BigDecimal totalPricing = null;

		    try (Connection connection = DBUtil.provideConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(pricing) AS total_pricing FROM bidding WHERE is_approved = 'yes'");
		         ResultSet resultSet = preparedStatement.executeQuery()) {

		        if (resultSet.next()) {
		            totalPricing = resultSet.getBigDecimal("total_pricing");
		        }

		    } catch (Exception e) {
		        
		        e.printStackTrace();
		    }

		    return totalPricing;
		}
	  
	  
	  public static BigDecimal getTotalPricingForApprovedProjects() {
		    BigDecimal totalApprovedPricing = null;

		    try (Connection connection = DBUtil.provideConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(pricing) AS total_approved_pricing FROM bidding WHERE is_approved = 'yes'");
		         ResultSet resultSet = preparedStatement.executeQuery()) {

		        if (resultSet.next()) {
		            totalApprovedPricing = resultSet.getBigDecimal("total_approved_pricing");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return totalApprovedPricing;
		}
	  
	  
	  //previous month profit
	  public static BigDecimal getTotalPricingForPreviousMonthApprovedProjects() {
		    BigDecimal totalPreviousMonthApprovedPricing = null;

		    try (Connection connection = DBUtil.provideConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(
		                 "SELECT SUM(b.pricing) AS total_previous_month_approved_pricing " +
		                         "FROM bidding b " +
		                         "JOIN project p ON b.project_id = p.project_id " +
		                         "WHERE DATE_FORMAT(p.enddate, '%Y-%m') = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 MONTH), '%Y-%m') " +
		                         "AND b.is_approved = 'yes'"
		         );
		         ResultSet resultSet = preparedStatement.executeQuery()) {

		        if (resultSet.next()) {
		            totalPreviousMonthApprovedPricing = resultSet.getBigDecimal("total_previous_month_approved_pricing");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return totalPreviousMonthApprovedPricing;
		}

	  
	  
	  
		/*
		 * //previous month earnings public static BigDecimal
		 * getTotalPricingForPreviousMonthProjects() { BigDecimal
		 * totalPreviousMonthPricing = null;
		 * 
		 * try (Connection connection = DBUtil.provideConnection(); PreparedStatement
		 * preparedStatement = connection.prepareStatement(
		 * "SELECT SUM(b.pricing) AS total_previous_month_pricing " + "FROM bidding b "
		 * + "JOIN project p ON b.project_id = p.project_id " +
		 * "WHERE DATE_FORMAT(p.enddate, '%Y-%m') = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 MONTH), '%Y-%m')"
		 * ); ResultSet resultSet = preparedStatement.executeQuery()) {
		 * 
		 * if (resultSet.next()) { totalPreviousMonthPricing =
		 * resultSet.getBigDecimal("total_previous_month_pricing"); }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 * 
		 * return totalPreviousMonthPricing; }
		 */

}