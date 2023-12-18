package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddOverTimeService;
import com.weblabs.utility.DBUtil;


public class AddOverTimeImpl implements AddOverTimeService{
@Override
	public String addovertime(String Employee_Id, String OverTime_Date, String Hours, String Type,  String Description) {	
		String status = "overview Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
        	ps = con.prepareStatement("INSERT INTO overtime (Employee_Id,OverTime_Date,Hours,Type,Description) VALUES (?,?,?,?,?)");
            ps.setString(1, Employee_Id);
            ps.setString(2, OverTime_Date);
            ps.setString(3, Hours);
            ps.setString(4, Type);
            ps.setString(5, Description);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Employee Added Successfully!";
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
public String deleteovertime(String id) {
	String status = "overtime Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM overtime WHERE id = ?");
        ps.setString(1, id);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "overtime Removed Successfully!";
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
public String editovertime(String id, String Employee_Id, String OverTime_Date, String Hours, String Type,
		String Description) {
	String status = "overtime Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE overtime SET Employee_Id =?, OverTime_Date =?, Hours =?, Type =?, Description =? WHERE id=?");  
        ps.setString(1, Employee_Id);
        ps.setString(2, OverTime_Date);
        ps.setString(3,  Hours);
        ps.setString(4, Type);
        ps.setString(5, Description);
        ps.setString(6, id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "overtime Updated Successfully!";
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

