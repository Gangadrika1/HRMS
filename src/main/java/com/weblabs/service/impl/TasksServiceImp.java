

package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.TasksService;
import com.weblabs.utility.DBUtil;

public class TasksServiceImp implements TasksService{

	@Override
	public String addtasks(String project_id,String description,String start_date,String end_date,String assigned_resource,String is_completed) {
		
		String Status1 = " Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO tasks ( project_id,description, start_date, end_date, assigned_resource, is_completed) VALUES (?,?,?,?,?,?)");
        	ps.setString(1, project_id);
        	ps.setString(2, description);
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setString(5, assigned_resource);
            ps.setString(6, is_completed);
           
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status1 = " Added Successfully!";
            }
        } catch (SQLException e) {
            Status1 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status1;
	}
	
	@Override
	public String edittasks(String task_id,String project_id,String description,String start_date,String end_date,String assigned_resource,String is_completed)  {
		
			String Status3 = "Updating  Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("UPDATE tasks SET project_id=?,description=?,start_date=?, end_date=?,assigned_resource=?,is_completed=?WHERE task_id = ?");
	        	// ps.setString(1, task_id);
	        	 ps.setString(1, project_id);
	             ps.setString(2, description);
	             ps.setString(3, start_date);
	             ps.setString(4, end_date);
	             ps.setString(5, assigned_resource);
	             ps.setString(6, is_completed);
	             ps.setString(7, task_id);
	             
	           
	            int k = ps.executeUpdate();

	            if (k > 0) {
	            	Status3 = "Updating Successfully!";
	            }
	        }
	         catch (SQLException e) {
	        	Status3 = "Error: " + e.getMessage();
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }

	        return Status3 ;
	}

	@Override
	public String deletetasks(String task_id) {
		String Status2 = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM tasks  WHERE task_id = ?");
            ps.setString(1, task_id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = " deleted Successfully!";
            }
        } catch (SQLException e) {
        	Status2 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status2;
	}
}
