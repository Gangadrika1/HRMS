package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.beans.HolidayBean;
import com.weblabs.utility.DBUtil;

public class HolidayDAO {
    // Other methods and properties in your DAO class

    // Get a filtered list of holidays with pagination
    public static List<HolidayBean> getFilteredHolidays(String whereClause, int start, int limit) {
    	  List<HolidayBean> filteredHolidays = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<HolidayBean> holidays = new ArrayList<>();

        try {
            // Establish a database connection (you should use your connection method)
        	connection =  DBUtil.provideConnection();

            // Define the SQL query to retrieve filtered holidays with pagination
            String query = "SELECT * FROM holidays";
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT Id,Holiday_Name,Holiday_Date FROM holidays WHERE " + whereClause + " LIMIT ? , ?;";
                
           // }
            //query += " LIMIT ?, ?";
            } else {
                query = "SELECT Id,Holiday_Name,Holiday_Date FROM holidays LIMIT ? , ?;";
            }


            // Create and execute the PreparedStatement
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start); // Offset for pagination
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            // Retrieve the filtered holidays and populate the list
            while (resultSet.next()) {
                HolidayBean holiday = new HolidayBean();
                holiday.setId(resultSet.getString("id"));
                holiday.setHoliday_Name(resultSet.getString("Holiday_Name"));
                holiday.setHoliday_Date(resultSet.getString("Holiday_Date"));
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

  

	/*
	 * public int getRecordCount() { Connection connection = null; PreparedStatement
	 * preparedStatement = null; ResultSet resultSet = null; int recordCount = 0;
	 * 
	 * try { // Establish a database connection (you should use your connection
	 * method) connection = DBUtil.provideConnection();
	 * 
	 * // Define the SQL query to count the records String query =
	 * "SELECT COUNT(*)as count  FROM holidays";
	 * 
	 * // Create and execute the PreparedStatement preparedStatement =
	 * connection.prepareStatement(query); resultSet =
	 * preparedStatement.executeQuery();
	 * 
	 * // Retrieve the record count if (resultSet.next()) { recordCount =
	 * resultSet.getInt(1); } } catch (SQLException e) { e.printStackTrace(); //
	 * Handle the exception as needed } finally { // Close resources (e.g.,
	 * resultSet, preparedStatement, connection) in a finally block // Handle
	 * exceptions in closing resources as needed }
	 * 
	 * return recordCount; }
	 */

        // Other methods in your DAO class
    

	  public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from holidays";
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

