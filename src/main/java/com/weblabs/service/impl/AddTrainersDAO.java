package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTrainers;
import com.weblabs.utility.DBUtil;

public class AddTrainersDAO {

	  public static List<AddTrainers> getFilteredAddTrainers(String whereClause, int start, int limit) {
	        List<AddTrainers> FilteredAddTrainers = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  TrainersID,firstname,lastname,role,email,phone,status,DescriptionName FROM trainers WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT TrainersID,firstname,lastname,role,email,phone,status,DescriptionName FROM trainers LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddTrainers trainerOne = new AddTrainers();
	                trainerOne.setId(resultSet.getString("TrainersID"));
	                trainerOne.setFirstname(resultSet.getString("firstname"));
	                trainerOne.setLastname(resultSet.getString("lastname"));
	                trainerOne.setRole(resultSet.getString("role"));
	                trainerOne.setEmail(resultSet.getString("email"));
	                trainerOne.setPhone(resultSet.getString("phone"));
	                trainerOne.setStatus(resultSet.getString("status"));
	                trainerOne.setDescription(resultSet.getString("DescriptionName"));
	            

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
	  public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from trainers";
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
	  public static List<AddTrainers> getAlltrainer() {
	        List<AddTrainers> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  TrainersID,firstname from trainers";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddTrainers dept = new AddTrainers();
	            	dept.setId(resultSet.getString("TrainersID"));
	            	dept.setFirstname(resultSet.getString("firstname"));
	            
	                 
	               
	                allEmployees.add(dept);
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
