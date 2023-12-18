package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddOverTime;
import com.weblabs.utility.DBUtil;

public class OvertimeDAO {

	 public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from overtime";
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

	 public static List<AddOverTime> getFiltereddeductions(String whereClause, int start, int limit) {
   	  List<AddOverTime> filteredHolidays = new ArrayList<>();
       Connection connection = null;
       PreparedStatement preparedStatement = null;
       ResultSet resultSet = null;
       List<AddOverTime> holidays = new ArrayList<>();

       try {
           // Establish a database connection (you should use your connection method)
       	connection =  DBUtil.provideConnection();

           // Define the SQL query to retrieve filtered holidays with pagination
           String query = "SELECT * FROM overtime";
           if (whereClause != null && !whereClause.isEmpty()) {
               query = "SELECT Employee_Id, OverTime_Date, Hours, Type,Description  FROM overtime WHERE " + whereClause + " LIMIT ? , ?; ";
               
          // }
           //query += " LIMIT ?, ?";
           } else {
               query = "SELECT Employee_Id, OverTime_Date, Hours, Type,Description  FROM overtime LIMIT ? , ?;";
           }


           // Create and execute the PreparedStatement
           preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1, start); // Offset for pagination
           preparedStatement.setInt(2, limit);

           resultSet = preparedStatement.executeQuery();

           // Retrieve the filtered holidays and populate the list
           while (resultSet.next()) {
        	   AddOverTime holiday = new AddOverTime();
               holiday.setEmployee_Id(resultSet.getString("Employee_Id"));
               holiday.setOverTime_Date(resultSet.getString("OverTime_Date"));
               holiday.setHours(resultSet.getString("Hours"));
               holiday.setType(resultSet.getString("Type"));
               holiday.setDescription(resultSet.getString("Description"));
              
            
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
