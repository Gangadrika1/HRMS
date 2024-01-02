package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.weblabs.utility.DBUtil;

public class PayrollServiceimp {
	public String editExpenses(String payroll_id, String year, String month, String isopen,
			String ranby, String lastime) {
		
		 Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;
	       String  Status3 = "Updating fail!";
	        try {
            // Insert data into payroll_addition
	       ps = con.prepareStatement("UPDATE payroll 	SET   year = ?,  Month = ?,  Is_opened = ?,Ranby = ?,last_modified_time = ?WHERE payroll_id = ?");
	        ps.setString(1, year);
	        ps.setString(2, month);
	        ps.setString(3, isopen);
	        ps.setString(4, ranby);
	        ps.setString(5, lastime);
	        ps.setString(6, payroll_id);
    
	        int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
            	Status3 = "Updating Successfully!";
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
}
