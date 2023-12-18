package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddDepartment;
import com.weblabs.beans.AddDesignation;
import com.weblabs.utility.DBUtil;

public class DesignationDAO {
    public static List<AddDesignation> getFilteredDesignations(String whereClause, int start, int limit) {
        List<AddDesignation> filteredDesignations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT Designationid, DesignationName, DepartmentId FROM designations WHERE " + whereClause + " LIMIT ? , ?;";
            } else {
                query = "SELECT Designationid, DesignationName, DepartmentId FROM designations LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddDesignation designation = new AddDesignation ();
                designation.setId(resultSet.getString("Designationid"));
                designation.setDesignationName(resultSet.getString("DesignationName"));
                designation.setDepartmentName(resultSet.getString("DepartmentId"));
             
                
                filteredDesignations.add(designation);
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

        return filteredDesignations;
    }
	/*
	 * public int getRecordCount() { Connection connection = null; PreparedStatement
	 * statement = null; ResultSet resultSet = null; int recordCount = 0;
	 * 
	 * try { connection = DBUtil.provideConnection(); // Define the SQL query to
	 * count the records String sql = "SELECT COUNT(1) FROM designations";
	 * 
	 * // Prepare the statement statement = connection.prepareStatement(sql);
	 * 
	 * // Execute the query and retrieve the count resultSet =
	 * statement.executeQuery(); if (resultSet.next()) { recordCount =
	 * resultSet.getInt(1); } } catch (Exception e) { e.printStackTrace(); // Handle
	 * any database errors here } finally { // Close the resources try { if
	 * (resultSet != null) resultSet.close(); if (statement != null)
	 * statement.close(); if (connection != null) connection.close(); } catch
	 * (Exception e) { e.printStackTrace(); } }
	 * 
	 * return recordCount; }
	 */
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from designations";
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
    
    public static List<AddDesignation> getAllDesignation() {
        List<AddDesignation> alldesi = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  Designationid,DesignationName FROM designations";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddDesignation dept = new AddDesignation();
               
            	dept.setId(resultSet.getString("Designationid"));
            	dept.setDesignationName(resultSet.getString("DesignationName"));
               
            	alldesi.add(dept);
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

        return alldesi;
    }
    
    public static String getDesignationNameById(String designationId) {
        String designationName = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT DesignationName FROM designations WHERE Designationid=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, designationId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                designationName = resultSet.getString("DesignationName");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }
        }

        return designationName;
    }
}
