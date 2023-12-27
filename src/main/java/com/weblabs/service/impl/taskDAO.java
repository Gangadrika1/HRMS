package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.beans.TasksBean;
import com.weblabs.utility.DBUtil;

public class taskDAO {


    public static List<TasksBean> getFilteredTask(String whereClause, int start, int limit) {
        List<TasksBean> FilteredTask = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<TasksBean> tasks = new ArrayList<>();
        try {
            connection = DBUtil.provideConnection();
            String query="SELECT * FROM holidays";;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT  task_id, project_id, description, start_date, end_date, assigned_resource, is_completed FROM tasks WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT  task_id, project_id, description, start_date, end_date, assigned_resource, is_completed FROM tasks LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	TasksBean tasks1 = new TasksBean();
            	tasks1.setTask_id(resultSet.getString("task_id"));
            	tasks1.setProject_id(resultSet.getString("project_id"));
            	tasks1.setDescription(resultSet.getString("description"));
            	tasks1.setStart_date(resultSet.getString("start_date"));
            	tasks1.setEnd_date(resultSet.getString("end_date"));
            	tasks1.setAssigned_resource(resultSet.getString("assigned_resource"));
            	tasks1.setIs_completed(resultSet.getString("is_completed"));
            	FilteredTask.add(tasks1);
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

        return FilteredTask;
    }
    

	  public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from tasks";
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

	  public static List<TasksBean> getAllTasks() {
	        List<TasksBean> allTasks = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  task_id, project_id, description, start_date, end_date, assigned_resource, is_completed FROM tasks";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	TasksBean tasks1 = new TasksBean();
	               
	            	tasks1.setTask_id(resultSet.getString("task_id"));
	            	tasks1.setProject_id(resultSet.getString("project_id"));
	            	tasks1.setDescription(resultSet.getString("description"));
	            	tasks1.setStart_date(resultSet.getString("start_date"));
	            	tasks1.setEnd_date(resultSet.getString("end_date"));
	            	tasks1.setAssigned_resource(resultSet.getString("assigned_resource"));
	            	tasks1.setIs_completed(resultSet.getString("is_completed"));
	            	allTasks.add(tasks1);
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

	        return allTasks;
	    }
	        

	  
	  public static Map<String, Integer> getTaskCountsForProject(int projectId) {
		    Map<String, Integer> taskCounts = new HashMap<>();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;

		    try {
		        connection = DBUtil.provideConnection();
		        String query = "SELECT " +
		                "COUNT(1) AS totalTaskCount, " +
		                "COUNT(CASE WHEN is_completed = 'Approved' THEN 1 END) AS completedCount, " +
		                "COUNT(CASE WHEN is_completed != 'Approved' THEN 1 END) AS pendingCount " +
		                "FROM tasks WHERE project_id = ?";
		        preparedStatement = connection.prepareStatement(query);
		        preparedStatement.setInt(1, projectId);
		        resultSet = preparedStatement.executeQuery();

		        if (resultSet.next()) {
		            taskCounts.put("totalTaskCount", resultSet.getInt("totalTaskCount"));
		            taskCounts.put("completedCount", resultSet.getInt("completedCount"));
		            taskCounts.put("pendingCount", resultSet.getInt("pendingCount"));
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

		    return taskCounts;
		}
	  
	  
	  public static List<TasksBean> getTasksForProject(int projectId) {
		    List<TasksBean> tasks = new ArrayList<>();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;

		    try {
		        connection = DBUtil.provideConnection();
		        String query = "SELECT * FROM tasks WHERE project_id = ?";
		        preparedStatement = connection.prepareStatement(query);
		        preparedStatement.setInt(1, projectId);
		        resultSet = preparedStatement.executeQuery();

		        while (resultSet.next()) {
		            TasksBean task = new TasksBean();
		            task.setDescription(resultSet.getString("description"));
		            // Set other properties of TasksBean based on your database schema

		            tasks.add(task);
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

		    return tasks;
		}

	  
	  public static List<TasksBean> getPendingTasks(int projectId) {
		    List<TasksBean> pendingTasks = new ArrayList<>();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
	 	    try {
		        connection = DBUtil.provideConnection();
		        String query = "SELECT description FROM tasks WHERE project_id = ? AND is_completed = 'Pending'";
		        preparedStatement = connection.prepareStatement(query);
		        preparedStatement.setInt(1, projectId);
		        resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		            TasksBean task = new TasksBean();
		            task.setDescription(resultSet.getString("description"));
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
	  
	  public static List<TasksBean> getCompletedTasks(int projectId) {
		    List<TasksBean> pendingTasks = new ArrayList<>();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;

		    try {
		        connection = DBUtil.provideConnection();
		        String query = "SELECT description FROM tasks WHERE project_id = ? AND is_completed = 'Approved'";
		        preparedStatement = connection.prepareStatement(query);
		        preparedStatement.setInt(1, projectId);
		        resultSet = preparedStatement.executeQuery();
		        while (resultSet.next()) {
		            TasksBean task = new TasksBean();
		            task.setDescription(resultSet.getString("description"));
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


	      
}


