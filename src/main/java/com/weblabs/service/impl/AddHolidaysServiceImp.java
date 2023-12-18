package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddHolidayService;
import com.weblabs.utility.DBUtil;

public class AddHolidaysServiceImp implements AddHolidayService{

	@Override
	public String addHoliday(String Holiday_Name, String Holiday_Date) {
		 String status = "Holiday Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO holidays (Holiday_Name,Holiday_Date) VALUES (?,?)");
	            ps.setString(1, Holiday_Name);
	            ps.setString(2, Holiday_Date);
	           
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "Holiday Added Successfully!";
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
	public String deleteHoliday(String id) {
		
		String status = "Holiday delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM holidays WHERE id = ?");
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
	public String update(String id,String Holiday_Name, String Holiday_Date) {
	
		String status = "Updating Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE holidays SET  Holiday_Name= ?,Holiday_Date=?  WHERE id = ?");
            ps.setString(1, Holiday_Name);
            ps.setString(2, Holiday_Date);
            ps.setString(3, id);
            
           
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