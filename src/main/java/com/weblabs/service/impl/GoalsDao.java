package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddGoals;
import com.weblabs.utility.DBUtil;

public class GoalsDao {

	public static List<AddGoals> getFilteredAddGoals(String whereClause, int start, int limit) {
        List<AddGoals> FilteredAddGoals = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT GoalID,GoalsType ,Subject,Target,StartDate, EndDate ,GoalsDescription ,Status,Progress FROM goals WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT GoalID,GoalsType ,Subject,Target,StartDate, EndDate ,GoalsDescription ,Status,Progress FROM goals LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddGoals  goalss=new AddGoals();
            	goalss.setId(resultSet.getString("GoalID"));
            	goalss.setType(resultSet.getString("GoalsType"));
            	goalss.setSubject(resultSet.getString("Subject"));
            	goalss.setTarget(resultSet.getString("Target"));
            	goalss.setStartDate(resultSet.getString("StartDate"));
            	goalss.setEndDate(resultSet.getString("EndDate"));
            	goalss.setDescription(resultSet.getString("GoalsDescription"));
            	goalss.setStatus(resultSet.getString("Status"));
            	goalss.setProgress(resultSet.getString("Progress"));
            	FilteredAddGoals.add(goalss);
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

        return FilteredAddGoals;
    }
	
	public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from goals";
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
	
	 public static List<AddGoals> getAllGoals() {
	        List<AddGoals> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  GoalID, GoalsType, Subject, Target, StartDate, EndDate, GoalsDescription, Status,Progress FROM goals";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddGoals employee = new AddGoals();
	               
	                employee.setId(resultSet.getString("GoalID"));
	                employee.setType(resultSet.getString("GoalsType"));
	                employee.setSubject(resultSet.getString("Subject"));
	                employee.setTarget(resultSet.getString("Target"));
	                employee.setStartDate(resultSet.getString("StartDate"));
	                employee.setEndDate(resultSet.getString("EndDate"));
	                employee.setDescription(resultSet.getString("GoalsDescription"));
	                employee.setStatus(resultSet.getString("Status"));
	                employee.setProgress(resultSet.getString("Progress"));
	                allEmployees.add(employee);
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
	    
	
}
