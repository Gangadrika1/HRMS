package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTrainig_TypeService;
import com.weblabs.utility.DBUtil;

public  class AddTraining_TypeServiveImpl implements AddTrainig_TypeService{

	@Override
	public String addTraining_Type(String type, String description, String status) {
		
		String Status = "Training_Type Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO trainingtype (type,DescriptionName,status) VALUES (?,?,?)");
            ps.setString(1, type);
            ps.setString(2, description);
            ps.setString(3, status);
           
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
	public String deleteTraining_Type(String id) {
		String status = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM trainingtype  WHERE TrainingTypeID = ?");
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

	@Override
	public String editTraining_Type(String id, String type, String description, String status) {
		
		String Status2 = "Updating Training Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE trainingtype SET type= ?,DescriptionName=?,status=?  WHERE TrainingTypeID = ?");
            ps.setString(1, type);
            ps.setString(2, description);
            ps.setString(3, status);
            ps.setString(4, id);
           
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

}
