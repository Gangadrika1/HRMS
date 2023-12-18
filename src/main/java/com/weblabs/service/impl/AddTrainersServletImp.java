package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTrainers;
import com.weblabs.utility.DBUtil;

public class AddTrainersServletImp implements AddTrainers{

	@Override
	public String addTrainers(String firstname, String lastname, String role, String email, String phone, String status,
			String description) {

		String Status = "Trainer Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO trainers (firstname,lastname,role, email,phone,status,DescriptionName) VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, role);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, status);
            ps.setString(7, description);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status = "Training Added Successfully!";
            }
        } catch (SQLException e) {
            Status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status;
	}

	@Override
	public String edit(String id, String firstname, String lastname, String role, String email, String phone,
			String status, String description) {
	
		String Status2 = "Updating Training Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE trainers SET firstname=?,lastname=?,role=?, email=?,phone=?,status=?,DescriptionName=?  WHERE TrainersID = ?");
        	ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, role);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, status);
            ps.setString(7, description);
            ps.setString(8, id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status2 = "Updating Successfully!";
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

	
	@Override
	public String deleteTrainers(String id) {
	
		String status = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM trainers  WHERE TrainersID = ?");
            ps.setString(1, id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Training deleted Successfully!";
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
