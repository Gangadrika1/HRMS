package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddLeaves;
import com.weblabs.utility.DBUtil;

public class LeaveDAO {
    public static List<AddLeaves> getFilteredLeaveRequests(String whereClause, int start, int limit) {
        List<AddLeaves> filteredLeaveRequests = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id, Employee, Starting_At, Ending_On, Days, Reason, Time_Added FROM leaves WHERE " + whereClause + " LIMIT ?, ?;";
            } else {
                query = "SELECT id, Employee, Starting_At, Ending_On, Days, Reason, Time_Added FROM leaves LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddLeaves leaveRequest = new AddLeaves();
                leaveRequest.setId(resultSet.getString("id"));
                leaveRequest.setEmployee(resultSet.getString("Employee"));
                leaveRequest.setStarting_At(resultSet.getString("Starting_At"));
                leaveRequest.setEnding_On(resultSet.getString("Ending_On"));
                leaveRequest.setDays(resultSet.getString("Days"));
                leaveRequest.setReason(resultSet.getString("Reason"));
                leaveRequest.setTime_Added(resultSet);
                filteredLeaveRequests.add(leaveRequest);
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

        return filteredLeaveRequests;
    }

	/*
	 * public int getRecordCount() { Connection connection = null; PreparedStatement
	 * statement = null; ResultSet resultSet = null; int recordCount = 0;
	 * 
	 * try { connection = DBUtil.provideConnection(); // Define the SQL query to
	 * count the records String sql = "SELECT COUNT(1) FROM leave_requests";
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
		   String query = "select count(*) as count from leaves";
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
    
    
    
    public static int calculateNetSalaryWithLeaves(String employeeId, int payrollYear, int payrollMonth, int netSalary) {
        int adjustedNetSalary = netSalary;
        Connection connection = null;

        try {
            connection = DBUtil.provideConnection();
             String sql = "SELECT Days " + 
                    "FROM leaves " + 
                    "WHERE Employee_Id = ? " + 
                    "  AND (" + 
                    "    (YEAR(STR_TO_DATE(Starting_At, '%Y-%m-%d')) = ? AND MONTH(STR_TO_DATE(Starting_At, '%Y-%m-%d')) = ?) " + 
                    "    AND (YEAR(STR_TO_DATE(Ending_On, '%Y-%m-%d')) = ? AND MONTH(STR_TO_DATE(Ending_On, '%Y-%m-%d')) = ?) " + 
                    "  );";


            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, employeeId);
                preparedStatement.setInt(2, payrollYear);
                preparedStatement.setInt(3, payrollMonth);
                preparedStatement.setInt(4, payrollYear);
                preparedStatement.setInt(5, payrollMonth);
                
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int totalLeaveDays = resultSet.getInt("Days");

                        // Calculate adjusted net salary based on leave days
                        if (totalLeaveDays > 0) {
                            int totalDaysInMonth = java.time.YearMonth.of(payrollYear, payrollMonth).lengthOfMonth();
                           int  TD= totalLeaveDays-1;
							/* int remainingDays = totalDaysInMonth - (TD); */

                            adjustedNetSalary = (netSalary * TD) / totalDaysInMonth;
                            netSalary -= adjustedNetSalary;
                        }
                    }
                }
            } 
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception according to your application's needs
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return netSalary;
    }
    
    
    
    
    public static int calculateLeaves(String employeeId, int payrollYear, int payrollMonth) {
		/* int adjustedNetSalary = netSalary; */
        Connection connection = null;
        int  TD =0;
        try {
            connection = DBUtil.provideConnection();
             String sql = "SELECT Days " + 
                    "FROM leaves " + 
                    "WHERE Employee_Id = ? " + 
                    "  AND (" + 
                    "    (YEAR(STR_TO_DATE(Starting_At, '%Y-%m-%d')) = ? AND MONTH(STR_TO_DATE(Starting_At, '%Y-%m-%d')) = ?) " + 
                    "    AND (YEAR(STR_TO_DATE(Ending_On, '%Y-%m-%d')) = ? AND MONTH(STR_TO_DATE(Ending_On, '%Y-%m-%d')) = ?) " + 
                    "  );";
             


            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, employeeId);
                preparedStatement.setInt(2, payrollYear);
                preparedStatement.setInt(3, payrollMonth);
                preparedStatement.setInt(4, payrollYear);
                preparedStatement.setInt(5, payrollMonth);
                
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int totalLeaveDays = resultSet.getInt("Days");

                        // Calculate adjusted net salary based on leave days
                        if (totalLeaveDays > 0) {
							/*
							 * int totalDaysInMonth = java.time.YearMonth.of(payrollYear,
							 * payrollMonth).lengthOfMonth();
							 */
                            TD= totalLeaveDays-1;
							/* int remainingDays = totalDaysInMonth - (TD); */

							/*
							 * adjustedNetSalary = (netSalary * TD) / totalDaysInMonth; netSalary -=
							 * adjustedNetSalary;
							 */
                        }
                    }
                }
            } 
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception according to your application's needs
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return TD;
    }
    
   
    public static int OTNET(String employeeId, int payrollYear, int payrollMonth, int baseSalary) {
        int totalDaysInMonth = YearMonth.of(payrollYear, payrollMonth).lengthOfMonth();
        int PDay = baseSalary / totalDaysInMonth;
        int HourlyRate = PDay / 8;

        int overtimeHours = OvertimeHours(employeeId, payrollYear, payrollMonth);
        double overtimePay = overtimeHours * HourlyRate;
        int OT = (int) (overtimePay);
        int NETCAL = baseSalary+ OT;
    
        return NETCAL;
    }
    

    public static int OvertimeHours(String employeeId, int payrollYear, int payrollMonth) {
        Connection connection = null;
        int totalOvertimeHours = 0;

        try {
        	 connection = DBUtil.provideConnection();
            // Select overtime hours from the Overtime table
            String selectQuery = "SELECT Hours FROM Overtime WHERE Employee_Id = ? AND YEAR(OverTime_Date) = ? AND MONTH(OverTime_Date) = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, employeeId);
                preparedStatement.setInt(2, payrollYear);
                preparedStatement.setInt(3, payrollMonth);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        int hoursWorked = resultSet.getInt("Hours");
                        totalOvertimeHours += hoursWorked;
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database connection
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return totalOvertimeHours;
    }

}
