package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddRolesBean;
import com.weblabs.utility.DBUtil;

public class AddRolesDAO {

	    public static List<AddRolesBean> getFilteredEmployees(String whereClause, int start, int limit) {
	        List<AddRolesBean> filteredroles = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	       
	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  RoleID, RoleName ,Description FROM roles WHERE " + whereClause + " LIMIT ? , ?;";
	               
	            } else {
	                query = "SELECT  RoleID, RoleName ,Description FROM roles LIMIT ? , ?;";
	            }

	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit );
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddRolesBean role = new AddRolesBean();
	            	role.setRoleID(resultSet.getString("roleID"));
                	role.setRoleName(resultSet.getString("roleName"));
                	role.setDescription(resultSet.getString("description"));
	                filteredroles.add(role);
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

	        return filteredroles;
	        
	    } 
	        
	        public int getRecordCount() {
	            Connection connection = null;
	            PreparedStatement statement = null;
	            ResultSet resultSet = null;
	            int recordCount = 0;

	            try {
	                // Establish a database connection (you should configure your database URL, username, and password)
	                connection =  DBUtil.provideConnection();
	                // Define the SQL query to count the records
	                String sql = "SELECT COUNT(1) FROM roles";

	                // Prepare the statement
	                statement = connection.prepareStatement(sql);

	                // Execute the query and retrieve the count
	                resultSet = statement.executeQuery();
	                if (resultSet.next()) {
	                    recordCount = resultSet.getInt(1);
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	                // Handle any database errors here
	            } finally {
	                // Close the resources
	                try {
	                    if (resultSet != null) resultSet.close();
	                    if (statement != null) statement.close();
	                    if (connection != null) connection.close();
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }

	            return recordCount;
	        }
	        
	        public static List<AddRolesBean> getAllRoles() {
	            List<AddRolesBean> allEmployees = new ArrayList<>();
	            Connection connection = null;
	            PreparedStatement preparedStatement = null;
	            ResultSet resultSet = null;

	            try {
	                connection = DBUtil.provideConnection();
	                String query = "SELECT  RoleID, RoleName ,Description FROM roles";
	                preparedStatement = connection.prepareStatement(query);
	                resultSet = preparedStatement.executeQuery();

	                while (resultSet.next()) {
	                	AddRolesBean role = new AddRolesBean();
	                   
	                	role.setRoleID(resultSet.getString("roleID"));
	                	role.setRoleName(resultSet.getString("roleName"));
	                	role.setDescription(resultSet.getString("description"));
	                    
	                    allEmployees.add(role);
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

