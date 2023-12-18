package com.weblabs.service.impl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddDesignationService;
import com.weblabs.utility.DBUtil;

public class AddDesignationImpl implements AddDesignationService {
	
		@Override
			public String adddesignation(String Designation, String Department)
		{	
				String status = "Designation Adding Failed!";

		        Connection con = DBUtil.provideConnection();
		        PreparedStatement ps = null;

		        try {
		        	ps = con.prepareStatement("INSERT INTO designations (DesignationName,DepartmentId) VALUES (?,?)");
		       
		            ps.setString(1, Designation);
		            ps.setString(2, Department);
		
		            int k = ps.executeUpdate();

		            if (k > 0) {
		                status = "Designation Added Successfully!";
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
		public String deletedesignation(String id) {
			String status = "Designation Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM designations WHERE Designationid = ?");
		        ps.setString(1, id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "Designation Removed Successfully!";
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
		public String editdesignation(String id, String Designation, String Department) {
			String status = "Designation Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE designations SET DesignationName =?, DepartmentId =? WHERE Designationid=?");  
		   
		        ps.setString(1, Designation);
		        ps.setString(2, Department);
		        ps.setString(3, id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "Designation Updated Successfully!";
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
			
