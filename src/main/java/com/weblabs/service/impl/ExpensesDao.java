/*
 * package com.weblabs.service.impl;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.sql.SQLException; import java.time.LocalDate;
 * import java.util.ArrayList; import java.util.List; import
 * com.weblabs.beans.AddExpenses; import com.weblabs.utility.DBUtil;
 * 
 * public class ExpensesDao {
 * 
 * public static List<AddExpenses> getFiltereExpenses(String whereClause, int
 * start, int limit) { List<AddExpenses> FiltereExpenses = new ArrayList<>();
 * Connection connection = null; PreparedStatement preparedStatement = null;
 * ResultSet resultSet = null;
 * 
 * try { connection = DBUtil.provideConnection(); String query; if (whereClause
 * != null && !whereClause.isEmpty()) { query =
 * "SELECT Id,supplierID, ItemName,  PurchaseDate, PurchasedBy, Amount, PaidBy, Status FROM expenses WHERE "
 * + whereClause + " LIMIT ?, ?;";
 * 
 * } else { query =
 * "SELECT Id,supplierID, ItemName, PurchaseDate, PurchasedBy, Amount, PaidBy, Status  FROM expenses LIMIT ?, ?;"
 * ; } preparedStatement = connection.prepareStatement(query);
 * preparedStatement.setInt(1, start); preparedStatement.setInt(2, limit);
 * 
 * resultSet = preparedStatement.executeQuery();
 * 
 * while (resultSet.next()) { AddExpenses expense=new AddExpenses();
 * expense.setId(resultSet.getString("Id"));
 * expense.setSupplierid(resultSet.getString("supplierID"));
 * expense.setItemName(resultSet.getString("ItemName"));
 * expense.setPurchaseDate(resultSet.getString("PurchaseDate"));
 * expense.setPurchasedBy(resultSet.getString("PurchasedBy"));
 * expense.setAmount(resultSet.getString("Amount"));
 * expense.setPaidBy(resultSet.getString("PaidBy"));
 * expense.setStatus(resultSet.getString("Status"));
 * FiltereExpenses.add(expense); } } catch (Exception e) { // Handle exceptions
 * e.printStackTrace(); } finally { // Close database resources (connection,
 * statement, result set) try { if (resultSet != null) resultSet.close(); if
 * (preparedStatement != null) preparedStatement.close(); if (connection !=
 * null) connection.close(); } catch (Exception e) { // Handle exceptions
 * e.printStackTrace(); } }
 * 
 * return FiltereExpenses; } public static int totalCount() { int count = 0;
 * Connection connection = null; PreparedStatement ps = null; ResultSet rs =
 * null; try { connection = DBUtil.provideConnection(); String query =
 * "select count(*) as count from expenses"; ps =
 * connection.prepareStatement(query); rs = ps.executeQuery(); while (rs.next())
 * { count = rs.getInt("count"); } } catch (Exception e) { e.printStackTrace();
 * } finally { try { connection.close(); } catch (SQLException ex) {
 * ex.printStackTrace(); } } return count; }
 * 
 * 
 * public double getTotalExpenseForPresentMonth() { LocalDate currentDate =
 * LocalDate.now(); LocalDate startDate = LocalDate.of(currentDate.getYear(),
 * currentDate.getMonthValue(), 1); LocalDate endDate =
 * startDate.withDayOfMonth(startDate.lengthOfMonth());
 * 
 * return getTotalExpenseForDateRange(startDate, endDate); }
 * 
 * public double getTotalExpenseForPreviousMonth() { LocalDate currentDate =
 * LocalDate.now(); LocalDate startDate = LocalDate.of(currentDate.getYear(),
 * currentDate.getMonthValue() - 1, 1); LocalDate endDate =
 * startDate.withDayOfMonth(startDate.lengthOfMonth());
 * 
 * return getTotalExpenseForDateRange(startDate, endDate); }
 * 
 * public double getTotalExpenseForDateRange(LocalDate startDate, LocalDate
 * endDate) { double totalExpense = 0.0;
 * 
 * try (Connection connection = DBUtil.provideConnection(); PreparedStatement
 * preparedStatement = connection.prepareStatement(
 * "SELECT SUM(Amount) AS totalExpense FROM expenses WHERE PurchaseDate BETWEEN ? AND ?;"
 * )) {
 * 
 * preparedStatement.setDate(1, java.sql.Date.valueOf(startDate));
 * preparedStatement.setDate(2, java.sql.Date.valueOf(endDate));
 * 
 * try (ResultSet resultSet = preparedStatement.executeQuery()) { if
 * (resultSet.next()) { totalExpense = resultSet.getDouble("totalExpense"); } }
 * } catch (SQLException e) { e.printStackTrace(); // Consider logging instead
 * of printing to the console }
 * 
 * return totalExpense;
 * 
 * } }
 */




package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddExpenses;
import com.weblabs.utility.DBUtil;

public class ExpensesDao {

	 public static List<AddExpenses> getFiltereExpenses(String whereClause, int start, int limit) {
	        List<AddExpenses> FiltereExpenses = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT Id,supplierID, ItemName,  PurchaseDate, PurchasedBy, Amount, PaidBy, Status FROM expenses WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT Id,supplierID, ItemName, PurchaseDate, PurchasedBy, Amount, PaidBy, Status  FROM expenses LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	                AddExpenses expense=new AddExpenses();
	                expense.setId(resultSet.getString("Id"));
	                expense.setSupplierid(resultSet.getString("supplierID"));
	                expense.setItemName(resultSet.getString("ItemName"));
	                expense.setPurchaseDate(resultSet.getString("PurchaseDate"));
	                expense.setPurchasedBy(resultSet.getString("PurchasedBy"));
	                expense.setAmount(resultSet.getString("Amount"));
	                expense.setPaidBy(resultSet.getString("PaidBy"));
	                expense.setStatus(resultSet.getString("Status"));	            
	                FiltereExpenses.add(expense);
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

	        return FiltereExpenses;
	    }
	 public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from expenses";
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
	 

			
	

			
			  
	 public double getTotalExpenseForPresentMonth() {
	        LocalDate currentDate = LocalDate.now();
	        LocalDate startDate = LocalDate.of(currentDate.getYear(), currentDate.getMonthValue(), 1);
	        LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());

	        return getTotalExpenseForDateRange(startDate, endDate);
	    }

	    public double getTotalExpenseForPreviousMonth() {
	        LocalDate currentDate = LocalDate.now();
	        LocalDate startDate = LocalDate.of(currentDate.getYear(), currentDate.getMonthValue() - 1, 1);
	        LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());

	        return getTotalExpenseForDateRange(startDate, endDate);
	    }

	    public double getTotalExpenseForDateRange(LocalDate startDate, LocalDate endDate) {
	        double totalExpense = 0.0;

	        try (Connection connection = DBUtil.provideConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "SELECT SUM(Amount) AS totalExpense FROM expenses WHERE PurchaseDate BETWEEN ? AND ?;"
	             )) {

	            preparedStatement.setDate(1, java.sql.Date.valueOf(startDate));
	            preparedStatement.setDate(2, java.sql.Date.valueOf(endDate));

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    totalExpense = resultSet.getDouble("totalExpense");
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider logging instead of printing to the console
	        }

	        return totalExpense;
	    }
			
	    
	    
	    public static double getTotalAmount() {
	        double totalAmount = 0.0;
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT SUM(Amount) AS totalAmount FROM expenses;";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            if (resultSet.next()) {
	                totalAmount = resultSet.getDouble("totalAmount");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (resultSet != null) resultSet.close();
	                if (preparedStatement != null) preparedStatement.close();
	                if (connection != null) connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }

	        return totalAmount;
	    }


	    
	    
}


		








