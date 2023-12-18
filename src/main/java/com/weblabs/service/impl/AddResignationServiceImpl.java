package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddResignationService;
import com.weblabs.utility.DBUtil;

public class AddResignationServiceImpl implements AddResignationService{

@Override
public String addresignation(String Id, String ResigningEmployee, String NoticeDate, String ResignationDate,
		String Reason) {
	String status = "resignation Adding Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
    	ps = con.prepareStatement("INSERT INTO resignation (Id,ResigningEmployee,NoticeDate,ResignationDate) VALUES (?,?,?,?)");
        ps.setString(1, Id);
        ps.setString(2, ResigningEmployee);
        ps.setString(3, NoticeDate);
        ps.setString(4, ResignationDate);
            
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "resignation Added Successfully!";
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
public String deleteresignation(String Id) {
	String status = "resignation Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM resignation WHERE Id = ?");
        ps.setString(1, Id);
        

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "pf Removed Successfully!";
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
public String editresignation(String Id, String ResigningEmployee, String NoticeDate, String ResignationDate,
		String Reason) {
	String status = "resignation Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE resignation SET ResigningEmployee =?, NoticeDate =?, ResignationDate =? WHERE Id=?");  
        ps.setString(1, ResigningEmployee);
        ps.setString(2, NoticeDate);
        ps.setString(3, ResignationDate);
        ps.setString(4, Id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "resignation Updated Successfully!";
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

