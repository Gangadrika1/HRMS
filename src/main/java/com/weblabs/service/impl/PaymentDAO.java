
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.PaymentBean;
import com.weblabs.utility.DBUtil;

public class PaymentDAO {
    public static List<PaymentBean> getFilteredPayment(String whereClause, int start, int limit) {
        List<PaymentBean> FilteredPayment = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT payment_id, client_username, invoice_id, payment_amt, due_date FROM payment WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT payment_id, client_username, invoice_id, payment_amt, due_date FROM payment LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	PaymentBean pro = new PaymentBean();
            	
                pro.setPayment_id(resultSet.getString("payment_id"));
                pro.setClient_username(resultSet.getString("client_username"));
                pro.setInvoice_id(resultSet.getString("invoice_id"));
                pro.setPayment_amt(resultSet.getString("payment_amt"));
                pro.setDue_date(resultSet.getString("due_date"));
             
                
                
                FilteredPayment.add(pro);
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

        return FilteredPayment;
    }
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from payment";
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