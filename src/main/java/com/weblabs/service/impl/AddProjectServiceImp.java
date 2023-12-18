
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddprojectService;
import com.weblabs.utility.DBUtil;

public class AddProjectServiceImp implements AddprojectService{

	@Override
	public String addProject(String projectname, String Clientid, String startdate, String enddate, String rate,
			String hourly, String priority, String projectleader, String addteam, String description,
			String uploadfile) {
		
		      String status = "Project Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO project (projectname,Clientid,startdate,enddate,rate,hourly,priority,projectleader,addteam,description,uploadfile) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, projectname);
            ps.setString(2, Clientid);
            ps.setString(3, startdate);
            ps.setString(4, enddate);
            ps.setString(5, rate);
            ps.setString(6, hourly);
            ps.setString(7, priority);
            ps.setString(8, projectleader);
            ps.setString(9, addteam);
            ps.setString(10, description);
            ps.setString(11, uploadfile);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Project Added Successfully!";
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
	public String deleteProject(String project_id) {
		String Status2 = " delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM project  WHERE project_id = ?");
            ps.setString(1, project_id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = " deleted Successfully!";
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
	public String editProject(String project_id,String projectname,String Clientid,String startdate,String enddate,
			String rate,String hourly,String priority,String projectleader,String addteam,
			String description,String uploadfile) {
		String Status3 = "Updating  Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE project SET projectname=?,Clientid=?, startdate=?,enddate=?,"
        			+ "rate=?,hourly=?,priority=? , projectleader=? ,addteam=?,description=?, uploadfile=? WHERE project_id = ?");
        	 ps.setString(1, projectname);
        	 ps.setString(2, Clientid);
             ps.setString(3, startdate);
             ps.setString(4, enddate);
             ps.setString(5, rate);
             ps.setString(6, hourly);
             ps.setString(7, priority);
             ps.setString(8, projectleader);
             ps.setString(9, addteam);
             ps.setString(10, description);
             ps.setString(11, uploadfile);
            ps.setString(12, project_id);
           
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
