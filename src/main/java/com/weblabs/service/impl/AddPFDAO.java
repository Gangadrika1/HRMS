package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddPF;
import com.weblabs.utility.DBUtil;

public class AddPFDAO {

	  public static List<AddPF> getFilteredAddPF(String whereClause, int start, int limit) {
	        List<AddPF> FilteredAddPF = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query;
	            if (whereClause != null && !whereClause.isEmpty()) {
	                query = "SELECT ID, ProvidentFundType, EmployeeShareAmount, OrganizationShareAmount, EmployeeSharePer, OrganizationSharePer, Description,Employee_Id FROM pf WHERE " + whereClause + " LIMIT ?, ?;";
	               
	            } else {
	                query = "SELECT ID,ProvidentFundType, EmployeeShareAmount, OrganizationShareAmount, EmployeeSharePer, OrganizationSharePer, Description,Employee_Id FROM pf LIMIT ?, ?;";
	                }
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, start);
	            preparedStatement.setInt(2, limit);
	     
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddPF pf=new AddPF();
	            	pf.setId(resultSet.getString("ID"));
	            	pf.setEmployee_Id(resultSet.getString("Employee_Id"));
	            	pf.setProvidentFundType(resultSet.getString("ProvidentFundType"));
	            	pf.setEmployeeShareAmount(resultSet.getString("EmployeeShareAmount"));
	            	pf.setOrganizationShareAmount(resultSet.getString("OrganizationShareAmount"));
	            	pf.setEmployeeSharePer(resultSet.getString("EmployeeSharePer"));
	            	pf.setOrganizationSharePer(resultSet.getString("OrganizationSharePer"));
	            	pf.setDescription(resultSet.getString("Description"));

	            	FilteredAddPF.add(pf);
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

	        return FilteredAddPF;
	    }
	  public static int totalCount() {
			 int count = 0;
			 Connection connection = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
			 try {
				 connection = DBUtil.provideConnection();
			   String query = "select count(*) as count from pf";
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
