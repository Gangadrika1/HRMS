
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.PaymentBean;
import com.weblabs.beans.PartialPaymentBean;
import com.weblabs.utility.DBUtil;

public class PartialPaymentDAO {
    public static List<PartialPaymentBean> getFilteredPartialPayment(String whereClause, int start, int limit) {
        List<PartialPaymentBean> FilteredPartialPayment = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id, amount_paid, payment_date, balance_amt FROM partial_payments WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT id, amount_paid, payment_date, balance_amt FROM partial_payments LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	PartialPaymentBean pro = new PartialPaymentBean();
            	
                pro.setId(resultSet.getString("id"));
                pro.setAmount_paid(resultSet.getString("amount_paid"));
                pro.setPayment_date(resultSet.getString("payment_date"));
                pro.setBalance_amt(resultSet.getString("balance_amt"));
             
             
                
                
                FilteredPartialPayment.add(pro);
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

        return FilteredPartialPayment;
    }
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from partial_payments";
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
    
    public static List<PartialPaymentBean> getPartialPaymentByPayment(String PaymentId) {
	    List<PartialPaymentBean> PartialPaymentByPayment = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "SELECT id, amount_paid, payment_date, balance_amt FROM partial_payments WHERE id = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, PaymentId);

	        resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            PartialPaymentBean invoiceItem = new PartialPaymentBean();
	            invoiceItem.setId(resultSet.getString("id"));
	            invoiceItem.setAmount_paid(resultSet.getString("amount_paid"));
	            invoiceItem.setPayment_date(resultSet.getString("payment_date"));
	            invoiceItem.setBalance_amt(resultSet.getString("balance_amt"));
	         
	            PartialPaymentByPayment.add(invoiceItem);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	            e.printStackTrace();
	        }
	    }

	    return PartialPaymentByPayment;
	}

}