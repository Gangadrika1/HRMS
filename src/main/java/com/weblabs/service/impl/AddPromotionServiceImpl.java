package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddPromotionService;
import com.weblabs.utility.DBUtil;

public class AddPromotionServiceImpl implements AddPromotionService{

@Override
public String addpromotion(String Id, String PromotionFor, String PromotionFrom, String PromotionTo,
		String PromotionDate) {
String status = "promotion Adding Failed!";
	
    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

try {
	ps = con.prepareStatement("INSERT INTO promotion (Id,PromotionFor,PromotionFrom,PromotionTo,PromotionDate) VALUES (?,?,?,?,?)");
    ps.setString(1, Id);
    ps.setString(2, PromotionFor);
    ps.setString(3, PromotionFrom);
    ps.setString(4, PromotionTo);
    ps.setString(5, PromotionDate);
   
        
    int k = ps.executeUpdate();

    if (k > 0) {
        status = "promotion Added Successfully!";
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
public String deletepromotion(String Id) {
	String status = "promotion Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM promotion WHERE Id = ?");
        ps.setString(1, Id);
        

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "promotion Removed Successfully!";
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
public String editpromotion(String Id, String PromotionFor, String PromotionFrom, String PromotionTo,
		String PromotionDate) {
	String status = "promotion Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE promotion SET PromotionFor =?, PromotionFrom =?, PromotionTo =?, PromotionDate =? WHERE Id=?");  
        ps.setString(1, PromotionFor);
        ps.setString(2, PromotionFrom);
        ps.setString(3, PromotionTo);
        ps.setString(4, PromotionDate);
        ps.setString(5, Id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "promotion Updated Successfully!";
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