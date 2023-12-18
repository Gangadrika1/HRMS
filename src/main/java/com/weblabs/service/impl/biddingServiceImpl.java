package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.biddingService;
import com.weblabs.utility.DBUtil;

public class biddingServiceImpl implements biddingService {

	

	@Override
	public String addB(String Clientid,String is_fixed,String hourly,String pricing,String project_id,String is_approved) {
		String Status1 = " Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO bidding ( Clientid, is_fixed, hourly, pricing,project_id,is_approved) VALUES (?,?,?,?,?,?)");
            ps.setString(1, Clientid);
            ps.setString(2, is_fixed);
            ps.setString(3, hourly);
            ps.setString(4, pricing);
            ps.setString(5, project_id);
            ps.setString(6, is_approved);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status1 = "bidding Added Successfully!";
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
	public	String editB(String id,String Clientid,String is_fixed,String hourly,String pricing,String project_id,String is_approved) {
		
		String Status3 = "Updating  Failed!";

		
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE bidding SET Clientid=?,is_fixed=?, hourly=?,pricing=?,project_id=?,is_approved=? WHERE id = ?");
        	ps.setString(1, Clientid);
            ps.setString(2, is_fixed);
            ps.setString(3, hourly);
            ps.setString(4, pricing);
            ps.setString(5, project_id);
            ps.setString(6, is_approved);
             ps.setString(7, id);
            
           
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status3 = "bidding Updating Successfully!";
            }
        } catch (SQLException e) {
        	Status3 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status3;
	}

	@Override
	public String deleteB(String id) {
		String Status2 = " delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM bidding  WHERE id = ?");
            ps.setString(1, id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = "bidding deleted Successfully!";
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