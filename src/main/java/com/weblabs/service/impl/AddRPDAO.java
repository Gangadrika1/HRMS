package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddRolePermissionBean;
import com.weblabs.utility.DBUtil;

public class AddRPDAO {

	 public static List<AddRolePermissionBean> getFilteredRP(String whereClause, int start, int limit) {
	        List<AddRolePermissionBean> filteredrps = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	       
	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT  RolePermissionID, RoleID, ModuleName, FormName, PermissionType FROM rolepermissions WHERE " + whereClause + " LIMIT ? , ?;";
	               
	            } else {
	                query = "SELECT  RolePermissionID, RoleID, ModuleName, FormName, PermissionType FROM rolepermissions LIMIT ? , ?;";
	            }

	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit );
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	
	            	AddRolePermissionBean rp = new AddRolePermissionBean();
	            	
	            	
	            	rp.setRolePermissionID(resultSet.getString("RolePermissionID"));
	            	rp.setRoleID(resultSet.getString("roleid"));
	            	rp.setModuleName(resultSet.getString("modulename"));
	            	rp.setFormName(resultSet.getString("formname"));
	            	rp.setPermissionType(resultSet.getString("permissiontype"));
	                filteredrps.add(rp);
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

	        return filteredrps;
	        
	    } 
	        
	
	   public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from rolepermissions";
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
