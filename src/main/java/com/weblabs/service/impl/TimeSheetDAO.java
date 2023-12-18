package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTimesheet;
import com.weblabs.utility.DBUtil;

public class TimeSheetDAO {
    public static List<AddTimesheet> getFilteredTimesheets(String whereClause, int start, int limit) {
        List<AddTimesheet> filteredTimesheets = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT TimesheetID, Employee_Id, DateWorked, project_id, task_id, HoursWorked FROM timesheet WHERE " + whereClause + " LIMIT ? , ?;";
            } else {
                query = "SELECT TimesheetID, Employee_Id, DateWorked, project_id, task_id, HoursWorked FROM timesheet LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddTimesheet timesheet = new AddTimesheet();
                timesheet.setTimesheetID(resultSet.getString("TimesheetID"));
                timesheet.setEmployee_Id(resultSet.getString("Employee_Id"));
                timesheet.setDateWorked(resultSet.getString("DateWorked"));
                timesheet.setProject_id(resultSet.getString("project_id"));
                timesheet.setTask_id(resultSet.getString("task_id"));
                timesheet.setHoursWorked(resultSet.getString("HoursWorked"));
               
                filteredTimesheets.add(timesheet);
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

        return filteredTimesheets;
    }

	
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from timesheet";
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
    
    
    
    public double getTotalHoursForPresentMonth() {
        LocalDate currentDate = LocalDate.now();
        LocalDate startDate = LocalDate.of(currentDate.getYear(), currentDate.getMonthValue(), 1);
        LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());

        return getTotalHoursForDateRange(startDate, endDate);
    }

    public double getTotalHoursForPreviousMonth() {
        LocalDate currentDate = LocalDate.now();
        LocalDate startDate = LocalDate.of(currentDate.getYear(), currentDate.getMonthValue() - 1, 1);
        LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());

        return getTotalHoursForDateRange(startDate, endDate);
    }

    public double getTotalHoursForDateRange(LocalDate startDate, LocalDate endDate) {
        double totalHours = 0.0;

        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT SUM(HoursWorked) AS totalHours FROM timesheet WHERE DateWorked BETWEEN ? AND ?;"
             )) {

            preparedStatement.setDate(1, java.sql.Date.valueOf(startDate));
            preparedStatement.setDate(2, java.sql.Date.valueOf(endDate));

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalHours = resultSet.getDouble("totalHours");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead of printing to the console
        }

        return totalHours;
    }

}
