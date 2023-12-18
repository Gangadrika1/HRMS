package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.CreateProject;
import com.weblabs.utility.DBUtil;

public class AppProjectDAO {
	 public static List<CreateProject> getAllproject() {
	        List<CreateProject> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  projectname from createproject";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	CreateProject cli = new CreateProject();
	             
	                 cli.setProjectname(resultSet.getString("projectname"));
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
	 
	 public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from project";
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
	 
	 public static List<CreateProject> getFilteredAddTrainers(String whereClause, int start, int limit) {
	        List<CreateProject> FilteredAddTrainers = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  project_id,projectname,Clientid,startdate,enddate,rate,hourly,priority,projectleader,addteam,description FROM project WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT  project_id,projectname,Clientid,startdate,enddate,rate,hourly,priority,projectleader,addteam,description FROM project LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	CreateProject trainerOne = new CreateProject();
	                trainerOne.setProjectname(resultSet.getString("projectname"));
	                trainerOne.setClientid(resultSet.getString("Clientid"));
	                trainerOne.setStartdate(resultSet.getString("startdate"));
	                trainerOne.setEnddate(resultSet.getString("enddate"));
	                trainerOne.setRate(resultSet.getString("rate"));
	                trainerOne.setHourly(resultSet.getString("hourly"));
	                trainerOne.setPriority(resultSet.getString("priority"));
	                trainerOne.setProjectleader(resultSet.getString("projectleader"));
	                trainerOne.setAddteam(resultSet.getString("addteam"));
	                trainerOne.setDescription(resultSet.getString("description"));
	                trainerOne.setProject_id(resultSet.getString("Project_id"));
					/* trainerOne.setCreated(resultSet.getString("Created")); */
	                
	            	FilteredAddTrainers.add(trainerOne);
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

	        return FilteredAddTrainers;
	    }
}

	 


