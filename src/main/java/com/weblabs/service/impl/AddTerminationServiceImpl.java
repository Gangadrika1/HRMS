package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTerminationService;
import com.weblabs.utility.DBUtil;

public class AddTerminationServiceImpl implements AddTerminationService{


	
	public String addtermination( String TerminatedEmployee, String TerminationType, String TerminationDate,
			String Reason, String NoticeDate) {
		
	
	String status = "termination Adding Failed!";
	
    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

try {
	ps = con.prepareStatement("INSERT INTO termination (TerminatedEmployee,TerminationType,TerminationDate,Reason,NoticeDate) VALUES (?,?,?,?,?)");
   
    ps.setString(1, TerminatedEmployee);
    ps.setString(2, TerminationType);
    ps.setString(3, TerminationDate);
    ps.setString(4, Reason);
    ps.setString(5, NoticeDate);
        
    int k = ps.executeUpdate();

    if (k > 0) {
        status = "termination Added Successfully!";
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
public String deletetermination(String Id) {
	String status = "termination Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM termination WHERE Id = ?");
        ps.setString(1, Id);
        
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "termination Removed Successfully!";
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
public String editTermination(String Id, String TerminatedEmployee, String TerminationType, String TerminationDate,String Reason, String NoticeDate) {
	String status3 = "termination Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE termination SET TerminatedEmployee =?, TerminationType =?, TerminationDate =? , Reason =?, NoticeDate =? WHERE Id=?");  
        ps.setString(1, TerminatedEmployee);
        ps.setString(2, TerminationType);
        ps.setString(3, TerminationDate);
        ps.setString(4, Reason);
        ps.setString(5, NoticeDate);
        ps.setString(6, Id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status3 = "termination Updated Successfully!";
        }
    } catch (SQLException e) {
    	status3 = "Error: " + e.getMessage();
        e.printStackTrace();
    } finally {
        DBUtil.closeConnection(con);
        DBUtil.closeConnection(ps);
    }

    return status3;
}

@Override
public String addtermination(String Id, String TerminatedEmployee, String TerminationType, String TerminationDate,
		String Reason, String NoticeDate) {
	// TODO Auto-generated method stub
	return null;
}

}

