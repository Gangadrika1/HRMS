package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.CompanySettingServices;
import com.weblabs.utility.DBUtil;

public class CompanySettingServiceImpl implements CompanySettingServices {

	/*
	 * @Override public String addCS(String CompanyName, String ContactPerson,
	 * String Address, String Country, String City, String State, String PostalCode,
	 * String Email, String PhoneNumber, String MobileNumber, String Fax, String
	 * WebsiteUrl) {
	 * 
	 * String status = "Adding Failed!";
	 * 
	 * Connection con = DBUtil.provideConnection(); PreparedStatement ps = null;
	 * 
	 * try { ps = con.prepareStatement(
	 * "INSERT INTO company_settings (CompanyName, ContactPerson, Address, Country, City, State, PostalCode, Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)"
	 * ); ps.setString(1, CompanyName); ps.setString(2, ContactPerson);
	 * ps.setString(3, Address); ps.setString(4, Country); ps.setString(5, City);
	 * ps.setString(6, State); ps.setString(7, PostalCode); ps.setString(8, Email);
	 * ps.setString(9, PhoneNumber); ps.setString(10, MobileNumber);
	 * ps.setString(11, Fax); ps.setString(12, WebsiteUrl); int k =
	 * ps.executeUpdate();
	 * 
	 * if (k > 0) { status = "Training Added Successfully!"; } } catch (SQLException
	 * e) { status = "Error: " + e.getMessage(); e.printStackTrace(); } finally {
	 * DBUtil.closeConnection(con); DBUtil.closeConnection(ps); }
	 * 
	 * return status; }
	 */
	@Override
	public String addCS(String CompanyName, String ContactPerson, String Address,String logo, String Country, String City,
	        String State, String PostalCode, String Email, String PhoneNumber, String MobileNumber, String Fax,
	        String WebsiteUrl,String InstagramUrl,String TelegramUrl) {

	    String status = "Adding Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        // Check if a record with the given CompanyName already exists
	        if (isCompanyExists(CompanyName, con)) {
	            // If it exists, perform an update
	            return editCS(CompanyName, CompanyName, ContactPerson, Address,logo, Country, City, State, PostalCode, Email,
	                    PhoneNumber, MobileNumber, Fax, WebsiteUrl,InstagramUrl, TelegramUrl);
	        }

	        // If not, perform an insert
	        ps = con.prepareStatement(
	                "INSERT INTO company_settings (CompanyName, ContactPerson, Address, Country, City, State, PostalCode, Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl,InstagramUrl, TelegramUrl) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        ps.setString(1, CompanyName);
	        ps.setString(2, ContactPerson);
	        ps.setString(3, Address);
	        ps.setString(4, Country);
	        ps.setString(5, City);
	        ps.setString(6, State);
	        ps.setString(7, PostalCode);
	        ps.setString(8, Email);
	        ps.setString(9, PhoneNumber);
	        ps.setString(10, MobileNumber);
	        ps.setString(11, Fax);
	        ps.setString(12, WebsiteUrl);
	        ps.setString(13, InstagramUrl);
	        ps.setString(14, TelegramUrl);
	        int k = ps.executeUpdate();
	        
	        
	        
	        
	        

	        if (k > 0) {
	            status = "Training Added Successfully!";
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

	private boolean isCompanyExists(String companyName, Connection con) throws SQLException {
	    PreparedStatement ps = null;
	    boolean result = false;

	    try {
	        ps = con.prepareStatement("SELECT CompanyName FROM company_settings WHERE CompanyName = ?");
	        ps.setString(1, companyName);
	        result = ps.executeQuery().next();
	    } finally {
	        DBUtil.closeConnection(ps);
	    }

	    return result;
	}


    @Override
    public String editCS(String CompanyID, String CompanyName, String ContactPerson, String Address,String Country,
            String City, String State, String PostalCode, String Email, String PhoneNumber, String MobileNumber,
            String Fax, String WebsiteUrl,String logo,String InstagramUrl,String TelegramUrl) {

        String status = "Updating Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement(
                    "UPDATE company_settings SET CompanyName=?, ContactPerson=?, Address=?, Country=?, City=?, State=?, PostalCode=?, Email=?, PhoneNumber=?, MobileNumber=?, Fax=?, WebsiteUrl=?  ,logo=?,InstagramUrl=?, TelegramUrl=? WHERE CompanyID = ?");
          
            ps.setString(1, CompanyName);
            ps.setString(2, ContactPerson);
            ps.setString(3, Address);
            ps.setString(4, Country);
            ps.setString(5, City);
            ps.setString(6, State);
            ps.setString(7, PostalCode);
            ps.setString(8, Email);
            ps.setString(9, PhoneNumber);
            ps.setString(10, MobileNumber);
            ps.setString(11, Fax);
            ps.setString(12, WebsiteUrl);
            ps.setString(13, logo);
            ps.setString(14, InstagramUrl);
            ps.setString(15, TelegramUrl);
            ps.setString(16, CompanyID);
         

            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Updating Successfully!";
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
    public String deleteCS(String CompanyID) {
        String status = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("DELETE FROM company_settings WHERE CompanyID = ?");
            ps.setString(1, CompanyID);
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Deleted Successfully!";
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