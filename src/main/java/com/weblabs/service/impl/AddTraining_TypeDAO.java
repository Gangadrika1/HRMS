package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddDepartment;
import com.weblabs.beans.AddTraining_Type;
import com.weblabs.utility.DBUtil;

public class AddTraining_TypeDAO {

	public static List<AddTraining_Type> getFilteredAddTrainingtype(String whereClause, int start, int limit) {
        List<AddTraining_Type> FilteredAddTrainingtype = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT TrainingTypeID,type,DescriptionName,status FROM trainingtype WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT TrainingTypeID,type,DescriptionName,status FROM trainingtype LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddTraining_Type trainerOne = new AddTraining_Type();
                trainerOne.setId(resultSet.getString("TrainingTypeID"));
                trainerOne.setType(resultSet.getString("type"));
                trainerOne.setDescription(resultSet.getString("DescriptionName"));
                trainerOne.setStatus(resultSet.getString("status"));
                FilteredAddTrainingtype.add(trainerOne);
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
        return FilteredAddTrainingtype;
    }
	public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from trainingtype";
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
	 public static List<AddTraining_Type> getAlltrainingtype() {
	        List<AddTraining_Type> allEmployees = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  TrainingTypeID , type from trainingtype";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddTraining_Type dept = new AddTraining_Type();
	               
	            	dept.setType(resultSet.getString("type"));
	                 dept.setId(resultSet.getString("TrainingTypeID"));
	               
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
