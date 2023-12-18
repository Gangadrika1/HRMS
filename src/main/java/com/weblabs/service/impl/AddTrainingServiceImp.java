package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTrainingService;
import com.weblabs.utility.DBUtil;

public class AddTrainingServiceImp implements AddTrainingService{

	@Override
	public String addTraining(String TrainingType, String Trainer, String Employees, String TrainingCost,
			String StartingDate, String EndingDate, String Description, String Status) {
		
		String status = "Training Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO training (TrainingType,Trainer,Employees,TrainingCost,StartingDate,EndingDate,DescriptionName,Status) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, TrainingType);
            ps.setString(2, Trainer);
            ps.setString(3, Employees);
            ps.setString(4, TrainingCost);
            ps.setString(5, StartingDate);
            ps.setString(6, EndingDate);
            ps.setString(7, Description);
            ps.setString(8, Status);
           
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

        return status;
	}

	@Override
	public String editTraining(String id, String TrainingType, String Trainer, String Employees, String TrainingCost,
			String StartingDate, String EndingDate, String Description, String Status) {
		
		String Status2 = "Updating Training Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE training SET TrainingType=?,Trainer=?,Employees=?,TrainingCost=?,StartingDate=?,EndingDate=?,DescriptionName=?,Status=?   WHERE TainingID = ?");
        	ps.setString(1, TrainingType);
            ps.setString(2, Trainer);
            ps.setString(3, Employees);
            ps.setString(4, TrainingCost);
            ps.setString(5, StartingDate);
            ps.setString(6, EndingDate);
            ps.setString(7, Description);
            ps.setString(8, Status);
            ps.setString(9, id);
           
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
	public String deleteTraining(String id) {
		
		String status = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM training  WHERE TainingID = ?");
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
