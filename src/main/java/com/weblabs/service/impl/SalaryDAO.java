package com.weblabs.service.impl;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddsalaryBean;
import com.weblabs.utility.DBUtil;

public class SalaryDAO {
    public static List<AddsalaryBean> getFilteredSalary(String whereClause, int start, int limit) {
        List<AddsalaryBean> FilteredSalary = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT employee_id,Basic,DA,HRA,CONVEYANCE,ALLOWANCE,MEDICAL,TDS, PF,PROF_TAX,LABOUR_WELFARE,GroseSal,NetSal,ESI FROM salary WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT employee_id,Basic,DA,HRA,CONVEYANCE,ALLOWANCE,MEDICAL,TDS, PF,PROF_TAX,LABOUR_WELFARE,GroseSal,NetSal,ESI FROM salary LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddsalaryBean pro = new AddsalaryBean();
                pro.setEmployee_id(resultSet.getString("employee_id"));
                pro.setBasic(resultSet.getString("Basic"));
                pro.setDA(resultSet.getString("DA"));
                pro.setHRA(resultSet.getString("HRA"));
                pro.setCONVEYANCE(resultSet.getString("CONVEYANCE"));
                pro.setALLOWANCE(resultSet.getString("ALLOWANCE"));
                pro.setMEDICAL(resultSet.getString("MEDICAL"));
                pro.setTDS(resultSet.getString("TDS"));
                pro.setPF(resultSet.getString("PF"));
                pro.setPROF_TAX(resultSet.getString("PROF_TAX"));
                pro.setLABOUR_WELFARE(resultSet.getString("LABOUR_WELFARE"));
                pro.setOTHERS(resultSet.getString("GroseSal"));
                pro.setNetSal(resultSet.getString("NetSal"));
                pro.setESI(resultSet.getString("ESI"));
                
                FilteredSalary.add(pro);
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

        return FilteredSalary;
    }
    
    public static List<AddsalaryBean> getSalaryDetails(String employee_id) {
    	 List<AddsalaryBean> pendingTasks = new ArrayList<>();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;

		    try {
		        connection = DBUtil.provideConnection();
		        String query = "SELECT Basic,DA,HRA,CONVEYANCE,ALLOWANCE,MEDICAL,TDS, PF,PROF_TAX,LABOUR_WELFARE,GroseSal,DeducationTotal,NetSal,ESI FROM salary WHERE employee_id=?";
		        preparedStatement = connection.prepareStatement(query);
		        preparedStatement.setString(1, employee_id);
		        resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		        	AddsalaryBean task = new AddsalaryBean();
		            task.setBasic(resultSet.getString("Basic"));
		            task.setDA(resultSet.getString("DA"));
		            task.setHRA(resultSet.getString("HRA"));
		            task.setCONVEYANCE(resultSet.getString("CONVEYANCE"));
		            task.setALLOWANCE(resultSet.getString("ALLOWANCE"));
		            task.setMEDICAL(resultSet.getString("MEDICAL"));
		            task.setTDS(resultSet.getString("TDS"));
		            task.setPF(resultSet.getString("PF"));
		            task.setPROF_TAX(resultSet.getString("PROF_TAX"));
		            task.setLABOUR_WELFARE(resultSet.getString("LABOUR_WELFARE"));
		            task.setOTHERS(resultSet.getString("GroseSal"));
		            task.setDeducationTotal(resultSet.getString("DeducationTotal"));
		            task.setNetSal(resultSet.getString("NetSal"));
		            task.setESI(resultSet.getString("ESI"));
		            // Set other properties of TasksBean based on your database schema

		            pendingTasks.add(task);
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

		    return pendingTasks;
		}
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from salary";
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