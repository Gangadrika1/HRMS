package com.weblabs.service.impl;

import java.sql.Connection; 

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans. AddAddition ;
import com.weblabs.beans.AddHoliday;
import com.weblabs.utility.DBUtil;

public class PayrollAdditionDAO {

	public static List< AddAddition > getPayrollDetails(int payrollId) {
	    List< AddAddition > pendingTasks = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();

	        // Your existing code to retrieve payroll details based on employee_id
	        // ...

	        // Now, retrieve data from payrolladdition table using payrollId
	        String additionQuery = "SELECT payrolladditionid, AdditionName, Category, Unitcalculation, UnitAmount, Payroll_id FROM payroll_addition WHERE Payroll_id=?";
	        preparedStatement = connection.prepareStatement(additionQuery);
	        preparedStatement.setInt(1, payrollId);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	        	 AddAddition  addition = new  AddAddition ();
	            addition.setPayroll_id(resultSet.getString("payrolladditionid"));
	            addition.setAdditionName(resultSet.getString("AdditionName"));
	            addition.setCategory(resultSet.getString("Category"));
	            addition.setUnitcalculation(resultSet.getString("Unitcalculation"));
	            addition.setUnitAmount(resultSet.getString("UnitAmount"));
	            addition.setPayroll_id(resultSet.getString("payroll_id"));
	            // Set other properties of Payroll Addition based on your database schema

	            pendingTasks.add(addition);
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

	    return pendingTasks;
	}
	 public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from payroll_addition";
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

	 public static List<AddAddition> getFilteredadditions(String whereClause, int start, int limit) {
   	  List<AddAddition> filteredHolidays = new ArrayList<>();
       Connection connection = null;
       PreparedStatement preparedStatement = null;
       ResultSet resultSet = null;
       List<AddAddition> holidays = new ArrayList<>();

       try {
           // Establish a database connection (you should use your connection method)
       	connection =  DBUtil.provideConnection();

           // Define the SQL query to retrieve filtered holidays with pagination
           String query = "SELECT * FROM payroll_addition";
           if (whereClause != null && !whereClause.isEmpty()) {
               query = "SELECT payrolladditionid, AdditionName, Category, Unitcalculation, UnitAmount, Payroll_id FROM payroll_addition WHERE " + whereClause + " LIMIT ? , ?;";
               
          // }
           //query += " LIMIT ?, ?";
           } else {
               query = "SELECT payrolladditionid, AdditionName, Category, Unitcalculation, UnitAmount, Payroll_id FROM payroll_addition LIMIT ? , ?;";
           }


           // Create and execute the PreparedStatement
           preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1, start); // Offset for pagination
           preparedStatement.setInt(2, limit);

           resultSet = preparedStatement.executeQuery();

           // Retrieve the filtered holidays and populate the list
           while (resultSet.next()) {
        	   AddAddition holiday = new AddAddition();
               holiday.setPayrolladditionid(resultSet.getString("payrolladditionid"));
               holiday.setAdditionName(resultSet.getString("AdditionName"));
               holiday.setCategory(resultSet.getString("Category"));
               holiday.setUnitcalculation(resultSet.getString("Unitcalculation"));
               holiday.setUnitAmount(resultSet.getString("UnitAmount"));
               holiday.setPayroll_id(resultSet.getString("Payroll_id"));
            
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
