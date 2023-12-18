package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTimesheetService;
import com.weblabs.utility.DBUtil;
public class AddTimeSheetImpl implements AddTimesheetService {

	@Override
		public String addTimesheet(String Employee_Id,String DateWorked,String project_id,String task_id,String HoursWorked)
	{	
			String status = "timesheet Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO timesheet ( Employee_Id, DateWorked, project_id, task_id, HoursWorked) VALUES (?,?,?,?,?)");
	            ps.setString(1, Employee_Id);
	            ps.setString(2, DateWorked);
	            ps.setString(3, project_id);
	            ps.setString(4, task_id);
	            ps.setString(5, HoursWorked);
	           
	           
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "timesheet Added Successfully!";
	            }
	        } catch (SQLException e) {
	            status = "Error: " + e.getMessage();
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }

	        return status;
	}

	@Override
	public String editTimesheet(String TimesheetID,String Employee_Id,String DateWorked,String project_id,String task_id,String HoursWorked) {
		String status = "timesheet Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("UPDATE timesheet SET Employee_Id =?,DateWorked =?,project_id =?,task_id =?,HoursWorked =? WHERE TimesheetID=?");  
	        
	       
	        ps.setString(1, Employee_Id);
            ps.setString(2, DateWorked);
            ps.setString(3, project_id);
            ps.setString(4, task_id);
            ps.setString(5, HoursWorked);
	        ps.setString(6, TimesheetID);
	       

	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "timesheet Updated Successfully!";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.closeConnection(con);
	        DBUtil.closeConnection(ps);
	    }

	    return status;
	}


	

	@Override
	public String deleteTimesheet(String TimesheetID) {
		  String status = "timesheet Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM timesheet WHERE TimesheetID = ?");
		        ps.setString(1, TimesheetID);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "timesheet Removed Successfully!";
		        }
		    } catch (SQLException e) {
		        status = "Error: " + e.getMessage();
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}

		
	}

