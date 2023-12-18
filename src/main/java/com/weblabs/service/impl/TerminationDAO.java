package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddTermination;
import com.weblabs.utility.DBUtil;

public class TerminationDAO {
    public static List<AddTermination> getFilteredTermination(String whereClause, int start, int limit) {
        List<AddTermination> FilteredTermination = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT Id, TerminatedEmployee, TerminationType, TerminationDate, Reason, NoticeDate FROM termination WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT Id, TerminatedEmployee, TerminationType, TerminationDate, Reason,NoticeDate FROM termination LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddTermination pro = new AddTermination();
                pro.setId(resultSet.getString("Id"));
                pro.setTerminatedEmployee(resultSet.getString("TerminatedEmployee"));
                pro.setTerminationType(resultSet.getString("TerminationType"));
                pro.setTerminationDate(resultSet.getString("TerminationDate"));
                pro.setReason(resultSet.getString("Reason"));
                pro.setNoticeDate(resultSet.getString("NoticeDate"));
                
                
                FilteredTermination.add(pro);
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

        return FilteredTermination;
    }
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from termination";
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