package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTraining;
import com.weblabs.utility.DBUtil;

public class AddTrainingDAO {

	public static List<AddTraining> getFilteredAddTrainingtype(String whereClause, int start, int limit) {
        List<AddTraining> FilteredAddTrainingtype = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT  TainingID,TrainingType,Trainer,Employees,TrainingCost,StartingDate,EndingDate,DescriptionName,Status FROM training WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT  TainingID,TrainingType,Trainer,Employees,TrainingCost,StartingDate,EndingDate,DescriptionName,Status FROM training LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddTraining training = new AddTraining();
                training.setId(resultSet.getString("TainingID"));
                training.setTrainingType(resultSet.getString("TrainingType"));
                training.setTrainer(resultSet.getString("Trainer"));
                training.setEmployees(resultSet.getString("Employees"));
                training.setTrainingCost(resultSet.getString("TrainingCost"));
                training.setStartingDate(resultSet.getString("StartingDate"));
                training.setEndingDate(resultSet.getString("EndingDate"));
                training.setDescription(resultSet.getString("DescriptionName"));
                training.setStatus(resultSet.getString("Status"));
                FilteredAddTrainingtype.add(training);
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
		   String query = "select count(*) as count from training";
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
