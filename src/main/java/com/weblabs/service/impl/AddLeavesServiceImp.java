package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.weblabs.service.AddLeavesService;
import com.weblabs.utility.DBUtil;

public class AddLeavesServiceImp implements AddLeavesService{

	@Override
	public String addLeaves( String Employee, String Starting_At, String Ending_On,String Days, String Reason,String Employee_Id) {
		 String status = "Employee Leave Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;
	        try {
	        	ps = con.prepareStatement("INSERT INTO leaves (Employee,Starting_At,Ending_On,Days,Reason,Employee_Id) VALUES (?,?,?,?,?,?)");
	            ps.setString(1, Employee);
	            ps.setString(2, Starting_At);
	            ps.setString(3, Ending_On);
	            ps.setString(4, Days);
	            ps.setString(5, Reason);
	            ps.setString(6, Employee_Id);
	           
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "Employee Leave Added Successfully!";
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
	public String deleteLeave(String id) {
		String status = "Leave delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM leaves WHERE id = ?");
            ps.setString(1, id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Holiday deleted Successfully!";
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
	public String updateLeave(String id, String Employee, String Starting_At, String Ending_On, String Days,
			String Reason) {
		String status = "Updating Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE leaves SET Employee=?,Starting_At=?,Ending_On=?,Days=?,Reason=?   WHERE id = ?");
        	    ps.setString(1, Employee);
	            ps.setString(2, Starting_At);
	            ps.setString(3, Ending_On);
	            ps.setString(4, Days);
	            ps.setString(5, Reason);
	            ps.setString(6, id);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Updating Successfully!";
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