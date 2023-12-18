package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddDepartmentService;
import com.weblabs.utility.DBUtil;
public class AddDepartmentImpl implements AddDepartmentService {


	@Override
		public String adddepartment(String Department)
	{	
			String status = "Department Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO departments (DepartmentName) VALUES (?)");
	            ps.setString(1, Department);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "department Added Successfully!";
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
	public String deletedepartment(String id) {
	    String status = "Department Removal Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("DELETE FROM departments WHERE DepartmentId = ?");
	        ps.setString(1, id);

	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "Department Removed Successfully!";
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
	public String editdepartment(String id, String Department) {
		// TODO Auto-generated method stub
		String status = "department Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("UPDATE departments SET DepartmentName =? WHERE DepartmentId=?");  
	        
	        ps.setString(1, Department);
	        ps.setString(2, id);
	       

	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "department Updated Successfully!";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.closeConnection(con);
	        DBUtil.closeConnection(ps);
	    }

	    return status;
	}
		
	}

