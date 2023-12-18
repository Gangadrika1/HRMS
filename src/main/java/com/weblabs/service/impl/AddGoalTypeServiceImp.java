package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddGoalTypeService;
import com.weblabs.utility.DBUtil;

	
public class AddGoalTypeServiceImp  implements AddGoalTypeService{
	@Override
	public String addgt(String Type, String Description, String Status) {
		String status = "goaltype Adding Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	    	ps = con.prepareStatement("INSERT INTO goaltype (GoalsType,Description,Status) VALUES (?,?,?)");
	        ps.setString(1, Type);
	        ps.setString(2, Description);
	        ps.setString(3, Status);
	       
	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "goaltype Added Successfully!";
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
	public String deletegt(String id) {
		String status = "goaltype Removal Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("DELETE FROM goaltype WHERE GoalsTypeID = ?");
	        ps.setString(1, id);

	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "goaltype Removed Successfully!";
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
	public String editgt(String id, String Type, String Description, String Status) {
		String status = "goaltype Updation Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("UPDATE goaltype SET GoalsType=?, Description =?, Status =? WHERE GoalsTypeID=?");  
	        ps.setString(1,Type );
	        ps.setString(2,Description);
	        ps.setString(3,Status);
	        ps.setString(4, id);
	       
	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "goaltype Updated Successfully!";
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

