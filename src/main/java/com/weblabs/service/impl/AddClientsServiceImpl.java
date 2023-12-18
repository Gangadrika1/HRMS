
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddCliensService;
import com.weblabs.utility.DBUtil;

public class AddClientsServiceImpl implements AddCliensService{

	@Override
	public String addClients(String FirstName, String LastName, String UserName, String Email,
		    String Clientid, String Phone, String Company, String Address) {
		
		String Status1 = "Expenses Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO clients (FirstName,LastName,Username, Email,ClientID,Phone,Company,Address) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, UserName);
            ps.setString(4, Email);
            ps.setString(5, Clientid);
            ps.setString(6, Phone);
            ps.setString(7, Company);
            ps.setString(8, Address);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status1 = "Training Added Successfully!";
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
	public String editClients( String FirstName, String LastName, String UserName, String Email, 
			 String Clientid, String Phone, String Company, String Address) {
		
			String Status3 = "Updating Goals Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("UPDATE clients SET FirstName=?,LastName=?,Username=?, Email=?,Phone=?,Company=?,Address=? WHERE Clientid = ?");
	        	 ps.setString(1, FirstName);
	             ps.setString(2, LastName);
	             ps.setString(3, UserName);
	             ps.setString(4, Email);
	             ps.setString(5, Phone);
	             ps.setString(6, Company);
	             ps.setString(7, Address);
	             ps.setString(8, Clientid);
	             
	           
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
	public String deleteClients(String Clientid) {
		String Status2 = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM clients  WHERE Clientid = ?");
            ps.setString(1, Clientid);;
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = "Training deleted Successfully!";
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
