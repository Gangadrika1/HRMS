package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddgoalsService;
import com.weblabs.utility.DBUtil;

public class AddGoalsServiceImp implements AddgoalsService{

	@Override
	public String addGoal(String Type, String Subject, String Target, String StartDate, String EndDate,
			String Description, String Status, String Progress) {
		String Status1 = "Trainer Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO goals (GoalsType,Subject,Target, StartDate,EndDate,GoalsDescription,Status,Progress) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, Type);
            ps.setString(2, Subject);
            ps.setString(3, Target);
            ps.setString(4, StartDate);
            ps.setString(5, EndDate);
            ps.setString(6, Description);
            ps.setString(7, Status);
            ps.setString(8, Progress);
           
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
	public String deleteGoal(String id) {
		String Status2 = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM goals  WHERE GoalID = ?");
            ps.setString(1, id);
           
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

	@Override
	public String editGoal(String id, String Type, String Subject, String Target, String StartDate, String EndDate,
			String Description, String Status, String Progress) {
		String Status3 = "Updating Goals Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE goals SET GoalsType=?,Subject=?,Target=?, StartDate=?,EndDate=?,GoalsDescription=?,Status=?,Progress=? WHERE GoalID = ?");
        	 ps.setString(1, Type);
             ps.setString(2, Subject);
             ps.setString(3, Target);
             ps.setString(4, StartDate);
             ps.setString(5, EndDate);
             ps.setString(6, Description);
             ps.setString(7, Status);
             ps.setString(8, Progress);
            ps.setString(9, id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
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
