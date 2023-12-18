
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.utility.DBUtil;

public class EmployeeDAO {
    public static List<EmployeeBean> getFilteredEmployees(String whereClause, int start, int limit) {
        List<EmployeeBean> filteredEmployees = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
       
        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
            	query = "SELECT FirstName, LastName, UserName, Email, Employee_Id, Phone,Joining_Date,Gender,Location,PAN,PF,pf_No,UAN,VPF,ESI,DepartmentId, Designationid FROM employees WHERE " + whereClause + " LIMIT ? , ?;";

               
            } else {
                query = "SELECT FirstName, LastName, UserName, Email, Employee_Id, Phone,Joining_Date,Gender,Location,PAN,PF,pf_No,UAN,VPF,ESI,DepartmentId, Designationid FROM employees LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit );
     
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                EmployeeBean employee = new EmployeeBean();
                employee.setFirstName(resultSet.getString("FirstName"));
                employee.setLastName(resultSet.getString("LastName"));
                employee.setUsername(resultSet.getString("Username"));
                employee.setEmail(resultSet.getString("Email"));
                employee.setEmployee_ID(resultSet.getString("Employee_Id"));
                employee.setPhone(resultSet.getString("Phone"));
                employee.setJoining_Date(resultSet.getString("Joining_Date"));
                employee.setGender(resultSet.getString("Gender"));
                employee.setLocation(resultSet.getString("Location"));
                employee.setPAN(resultSet.getString("PAN"));
                employee.setPF(resultSet.getString("PF"));
                employee.setPf_No(resultSet.getString("pf_No"));
                employee.setUAN(resultSet.getString("UAN"));
                employee.setVPF(resultSet.getString("VPF"));
                employee.setESI(resultSet.getString("ESI"));     
                employee.setDepartment(resultSet.getString("DepartmentId"));
                employee.setDesignation(resultSet.getString("Designationid"));
                filteredEmployees.add(employee);
            }
        } catch (Exception e) {
            // Handle exceptions
        	String status = "Error: " + e.getMessage();
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

        return filteredEmployees;
        
    } 
	
    
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from employees";
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

    public static List<EmployeeBean> getAllEmployees() {
        List<EmployeeBean> allEmployees = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  Employee_Id, FirstName, LastName, UserName, Email, Phone, DepartmentId, Designationid FROM employees";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EmployeeBean employee = new EmployeeBean();
               
                employee.setFirstName(resultSet.getString("FirstName"));
                employee.setLastName(resultSet.getString("LastName"));
                employee.setUsername(resultSet.getString("UserName"));
                employee.setEmail(resultSet.getString("Email"));
                employee.setEmployee_ID(resultSet.getString("Employee_Id"));
                employee.setPhone(resultSet.getString("Phone"));
                employee.setDepartment(resultSet.getString("DepartmentId"));
                employee.setDesignation(resultSet.getString("Designationid"));
                allEmployees.add(employee);
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
    
    
    public static int getNewEmployeesCountThisMonth() {
        int count = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = DBUtil.provideConnection();
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            String currentMonth = dateFormat.format(calendar.getTime());
            
            String query = "SELECT COUNT(*) AS count FROM employees WHERE DATE_FORMAT(Joining_Date, '%Y-%m') = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, currentMonth);
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return count;
    }
    
    
    
     public static List<Object> getFilteredEmployeePayroll(String whereClause, int start, int limit) {
         List<Object> filteredEmployees = new ArrayList<>();
     	//List<EmployeeBean> filteredEmployees = new ArrayList<>();
     	//List<Payroll> filteredPayrolls = new ArrayList<>();
         Map<String, Integer> columnIndices = new HashMap<>();

         // Initialize the map with column names and corresponding indices
         columnIndices.put("Employee_Id", 0);
         columnIndices.put("FirstName", 1);
         columnIndices.put("LastName", 2);
         columnIndices.put("UserName", 3);
         columnIndices.put("Email", 4);
         columnIndices.put("Phone", 5);
         columnIndices.put("Departmentid", 6);
         columnIndices.put("DesignationID", 7);
         columnIndices.put("Joining_Date", 8);
         columnIndices.put("month", 9);
         columnIndices.put("year", 10);

         Connection connection = null;
         PreparedStatement preparedStatement = null;
         ResultSet resultSet = null;


         try {
         	connection = DBUtil.provideConnection();
         	String query;
         	if (whereClause != null && !whereClause.isEmpty()) {
         	    query = "SELECT employees.employee_Id, FirstName, LastName, UserName, Email, employees.Employee_Id,"  
	           	            + "Phone, Departmentid, DesignationID, Joining_Date," 
	           	            + "payroll.month, payroll.year " 
	           	            + "FROM employees " 
	           	            + "INNER JOIN payrollemloyeeassignment ON payrollemloyeeassignment.employee_id = employees.employee_id " 
	           	            + "INNER JOIN payroll ON payrollemloyeeassignment.payroll_id = payroll.payroll_id WHERE " + whereClause + " LIMIT ?, ?;";
         	} else {
         	    query = "SELECT employees.employee_Id, FirstName, LastName, UserName, Email, employees.Employee_Id, "
         	            + "Phone, Departmentid, DesignationID, Joining_Date, "
         	            + "payroll.month, payroll.year "
         	            + "FROM employees "
         	            + "INNER JOIN payrollemloyeeassignment ON payrollemloyeeassignment.employee_id = employees.employee_id "
         	            + "INNER JOIN payroll ON payrollemloyeeassignment.payroll_id = payroll.payroll_id; ";
         	           // + "LIMIT ?, ?;";
         	}
         	preparedStatement = connection.prepareStatement(query);
         	if(whereClause != null && !whereClause.isEmpty()) {
         	preparedStatement.setInt(1, start);
         	preparedStatement.setInt(2, limit);
         	}
         	resultSet = preparedStatement.executeQuery();

         	 while (resultSet.next()) {
                  Object[] employeeData = new Object[11];

                  // Access elements using the map
                  employeeData[columnIndices.get("Employee_Id")] = resultSet.getString("Employee_Id");
                  employeeData[columnIndices.get("FirstName")] = resultSet.getString("FirstName");
                  employeeData[columnIndices.get("LastName")] = resultSet.getString("LastName");
                  employeeData[columnIndices.get("UserName")] = resultSet.getString("UserName");
                  employeeData[columnIndices.get("Email")] = resultSet.getString("Email");
                  employeeData[columnIndices.get("Phone")] = resultSet.getString("Phone");
                  employeeData[columnIndices.get("Departmentid")] = resultSet.getString("Departmentid");
                  employeeData[columnIndices.get("DesignationID")] = resultSet.getString("DesignationID");
                  employeeData[columnIndices.get("Joining_Date")] = resultSet.getString("Joining_Date");
                  employeeData[columnIndices.get("month")] = resultSet.getString("month");
                  employeeData[columnIndices.get("year")] = resultSet.getString("year");

                  filteredEmployees.add(employeeData);
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

         return filteredEmployees;
     }
     
     
     
     public static List<EmployeeBean> getempdetailsfromid(String employeeId) {
         List<EmployeeBean> employeeDetails = new ArrayList<>();
         Connection connection = null;
         PreparedStatement preparedStatement = null;
         ResultSet resultSet = null;
          System.out.println(employeeId);
         try {
             connection = DBUtil.provideConnection();
             String query = "SELECT * FROM employees WHERE UserName = ?";
             preparedStatement = connection.prepareStatement(query);
             preparedStatement.setString(1, employeeId);
             resultSet = preparedStatement.executeQuery();

             while (resultSet.next()) {
                 EmployeeBean employee = new EmployeeBean();
                 employee.setFirstName(resultSet.getString("FirstName"));
                 employee.setLastName(resultSet.getString("LastName"));
                 employee.setUsername(resultSet.getString("UserName"));
                 employee.setEmail(resultSet.getString("Email"));
                 employee.setPassword(resultSet.getString("Password"));
                 employee.setEmployee_ID(resultSet.getString("Employee_Id"));
                 employee.setPhone(resultSet.getString("Phone"));
                 employee.setPicture(resultSet.getString("Picture"));
                 employee.setGender(resultSet.getString("Gender"));
                 employee.setLocation(resultSet.getString("Location"));
                

                 employeeDetails.add(employee);
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

         return employeeDetails;
     }
}







