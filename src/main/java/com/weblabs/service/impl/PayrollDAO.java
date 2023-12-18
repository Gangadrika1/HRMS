package com.weblabs.service.impl;


import java.io.IOException;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.HolidayBean;
import com.weblabs.beans.Payroll;
import com.weblabs.utility.DBUtil;

public class PayrollDAO {

	public static List<Payroll> getPayrollDetails(String employee_id, String payrollid) {
	    List<Payroll> pendingTasks = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();

	 /*       // Assuming payrollemloyeeassignment has columns 'employee_id' and 'payroll_id'
	        String assignmentQuery = "SELECT payroll_id FROM payrollemloyeeassignment WHERE employee_id=?";
	        preparedStatement = connection.prepareStatement(assignmentQuery);
	        preparedStatement.setString(1, employee_id);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {*/
	            int payrollId = Integer.parseInt(payrollid);

	            // Now, retrieve year and Month from the payroll table based on payroll_id
	            String payrollQuery = "SELECT payroll_id, year, Month, payrollemloyeeassignment.employee_id FROM payroll "
	            		+ " inner join payrollemloyeeassignment on payrollemloyeeassignment.payroll_id = payroll.payroll_id"
	            		+ "WHERE payroll.payroll_id=? and payrollemloyeeassignment.employee_id = ?";
	            preparedStatement = connection.prepareStatement(payrollQuery);
	            preparedStatement.setInt(1, payrollId);
	            preparedStatement.setString(2, employee_id);
	            ResultSet payrollResultSet = preparedStatement.executeQuery();

	            while (payrollResultSet.next()) {
	                Payroll task = new Payroll();
	                task.setPayroll_id(payrollResultSet.getString("payroll_id"));
	                task.setYear(payrollResultSet.getString("year"));
	                task.setMonth(payrollResultSet.getString("Month"));
	                //task.setEmployee_id(payrollResultSet.getString("employee_id"));
	                // Set other properties of Payroll based on your database schema

	                pendingTasks.add(task);
	            }

	            // Close the result set for the inner query
	        //    payrollResultSet.close();
			/* } */
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

	    return pendingTasks;
	}
	
	public static List<Payroll> getAllYears() {
	    List<Payroll> allEmployees = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "SELECT payroll_id,  year, Month FROM payroll";
	        preparedStatement = connection.prepareStatement(query);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            Payroll tasks = new Payroll();
	            tasks.setPayroll_id(resultSet.getString("payroll_id"));
				/* tasks.setName(resultSet.getString("Name")); */
	            tasks.setYear(resultSet.getString("year"));
	            tasks.setMonth(resultSet.getString("Month"));

	            // Add the tasks object to the list
	            allEmployees.add(tasks);
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
	
	
	
	
	public static List<Payroll> getpayrollID(String year, String month ) {
	    List<Payroll> allEmployees = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	         connection = DBUtil.provideConnection();
	        String query = "SELECT payroll_id FROM payroll where year =? and  Month=? ";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, year);
	        preparedStatement.setString(2, month);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            Payroll payroll = new Payroll();
	            payroll.setPayroll_id(resultSet.getString("payroll_id"));
	            

	            // Add the payroll object to the list
	            allEmployees.add(payroll);
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
	
	
	
	 public static List<Payroll> getFiltereddeductions(String whereClause, int start, int limit) {
		
		 List<Payroll> filteredHolidays = new ArrayList<>();
	      Connection connection = null;
	      PreparedStatement preparedStatement = null;
	      ResultSet resultSet = null;
	      List<Payroll> holidays = new ArrayList<>();
	  

	      try {
	          // Establish a database connection (you should use your connection method)
	      	connection =  DBUtil.provideConnection();
             
	          // Define the SQL query to retrieve filtered holidays with pagination
	          String query = "SELECT * FROM payroll";
	          if (whereClause != null && !whereClause.isEmpty()) {
	              query = "SELECT payroll_id, year, Month,Is_opened,Ranby,last_modified_time FROM payroll WHERE " + whereClause + " LIMIT ? , ?;";
	              
	         // }
	          //query += " LIMIT ?, ?";
	          } else {
	              query = "SELECT payroll_id,  year, Month,Is_opened,Ranby,last_modified_time FROM payroll LIMIT ? , ?;";
	          }


	          // Create and execute the PreparedStatement
	          preparedStatement = connection.prepareStatement(query);
	          preparedStatement.setInt(1, start); // Offset for pagination
	          preparedStatement.setInt(2, limit);

	          resultSet = preparedStatement.executeQuery();

	          // Retrieve the filtered holidays and populate the list
	          while (resultSet.next()) {
	        	  Payroll holiday = new Payroll();
	              holiday.setPayroll_id(resultSet.getString("payroll_id"));
					/* holiday.setName(resultSet.getString("Name")); */
	              holiday.setYear(resultSet.getString("year"));
	              holiday.setMonth(resultSet.getString("Month"));
	              holiday.setIs_opened(resultSet.getString("Is_opened"));
	              holiday.setRanby(resultSet.getString("Ranby"));
	              holiday.setLast_modified_time(resultSet.getString("last_modified_time"));
	           
	              // Set other properties as needed

	              holidays.add(holiday);
	          }
	      } catch (SQLException e) {
	          e.printStackTrace();
	          // Handle the exception as needed
	      } finally {
	          // Close resources (e.g., resultSet, preparedStatement, connection) in a finally block
	          // Handle exceptions in closing resources as needed
	      	try {
	              if (resultSet != null) resultSet.close();
	              if (preparedStatement != null) preparedStatement.close();
	              if (connection != null) connection.close();
	          } catch (Exception e) {
	              // Handle exceptions
	              e.printStackTrace();
	          }
	    }

	      return holidays;
	  }
	 public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from payroll";
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
	 
	 
	 public static List<String> getDistinctMonths(int year) {
		    List<String> months = new ArrayList<>();

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
		            String sql = "SELECT DISTINCT Month FROM payroll WHERE year = ? ";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setInt(1, year);

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    while (resultSet.next()) {
		                        // Retrieve the month as a String
		                        String month = resultSet.getString("Month");
		                        
		                        // Add the month to the list
		                        months.add(month);
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return months;
		}


	 public static List<Payroll> getFilteredHolidays(String whereClause, int start, int limit) {
   	  List<Payroll> filteredHolidays = new ArrayList<>();
       Connection connection = null;
       PreparedStatement preparedStatement = null;
       ResultSet resultSet = null;
       List<Payroll> holidays = new ArrayList<>();

       try {
           // Establish a database connection (you should use your connection method)
       	connection =  DBUtil.provideConnection();

           // Define the SQL query to retrieve filtered holidays with pagination
           String query = "SELECT * FROM holidays";
           if (whereClause != null && !whereClause.isEmpty()) {
               query = "SELECT payroll_id,  year, Month,Is_opened,Ranby,last_modified_time FROM payroll WHERE " + whereClause + " LIMIT ? , ?;";
               
          // }
           //query += " LIMIT ?, ?";
           } else {
               query = "SELECT payroll_id,  year, Month,Is_opened,Ranby,last_modified_time FROM payroll LIMIT ? , ?;";
           }


           // Create and execute the PreparedStatement
           preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1, start); // Offset for pagination
           preparedStatement.setInt(2, limit);

           resultSet = preparedStatement.executeQuery();

           // Retrieve the filtered holidays and populate the list
           while (resultSet.next()) {
        	   Payroll holiday = new Payroll();
               holiday.setPayroll_id(resultSet.getString("payroll_id"));
				/* holiday.setName(resultSet.getString("Name")); */
               holiday.setYear(resultSet.getString("year"));
               holiday.setMonth(resultSet.getString("Month"));
               holiday.setIs_opened(resultSet.getString("Is_opened"));
               holiday.setLast_modified_time(resultSet.getString("Ranby"));
               holiday.setLast_modified_time(resultSet.getString("last_modified_time"));
               // Set other properties as needed

               holidays.add(holiday);
           }
       } catch (SQLException e) {
           e.printStackTrace();
           // Handle the exception as needed
       } finally {
           // Close resources (e.g., resultSet, preparedStatement, connection) in a finally block
           // Handle exceptions in closing resources as needed
       	try {
               if (resultSet != null) resultSet.close();
               if (preparedStatement != null) preparedStatement.close();
               if (connection != null) connection.close();
           } catch (Exception e) {
               // Handle exceptions
               e.printStackTrace();
       }
     }

       return holidays;
   }

	 }

	 

