package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.CompanySettingsBean;
import com.weblabs.utility.DBUtil;
public class csDAO {
    
    public static List<CompanySettingsBean> getAllCS() {
        List<CompanySettingsBean> allCS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  CompanyID, CompanyName, ContactPerson, Address, Country, City, State, PostalCode,"
            		+ " Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl,logo,TelegramUrl,InstagramUrl FROM company_settings";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	CompanySettingsBean ss = new CompanySettingsBean();
                ss.setCompanyID(resultSet.getString("CompanyID"));
                ss.setCompanyName(resultSet.getString("CompanyName"));
                ss.setContactPerson(resultSet.getString("ContactPerson"));
                ss.setAddress(resultSet.getString("Address"));
                ss.setCountry(resultSet.getString("Country"));
                ss.setCity(resultSet.getString("City"));
                ss.setState(resultSet.getString("State"));
                ss.setPostalCode(resultSet.getString("PostalCode"));
                ss.setEmail(resultSet.getString("Email"));
                ss.setPhoneNumber(resultSet.getString("PhoneNumber"));
                ss.setMobileNumber(resultSet.getString("MobileNumber"));
                ss.setFax(resultSet.getString("Fax"));
                ss.setWebsiteUrl(resultSet.getString("WebsiteUrl"));
                ss.setLogo(resultSet.getString("logo"));
                ss.setTelegramUrl(resultSet.getString("TelegramUrl"));
                ss.setInstagramUrl(resultSet.getString("InstagramUrl"));
                allCS.add(ss);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            // Close database resources (connection, statement, result set)
        	 finally {
        		 try {
        			 connection.close();
        		 } catch (SQLException ex) {
        		 ex.printStackTrace();
        		 }
        	 }
     

        return allCS;
    }
    
    //-------------------------------------------------------------------
    
 
    public static void addOrUpdateCS(CompanySettingsBean cs) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.provideConnection();

            // Check if a record already exists
            if (getCompanyCount() > 0) {
                // Update existing record
                String updateQuery = "UPDATE company_settings SET CompanyName=?, ContactPerson=?, Address=?, "
                        + "Country=?, City=?, State=?, PostalCode=?, Email=?, PhoneNumber=?, "
                        + "MobileNumber=?, Fax=?, WebsiteUrl=? WHERE CompanyID=?";
                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, cs.getCompanyName());
                preparedStatement.setString(2, cs.getContactPerson());
                preparedStatement.setString(3, cs.getAddress());
                preparedStatement.setString(4, cs.getCountry());
                preparedStatement.setString(5, cs.getCity());
                preparedStatement.setString(6, cs.getState());
                preparedStatement.setString(7, cs.getPostalCode());
                preparedStatement.setString(8, cs.getEmail());
                preparedStatement.setString(9, cs.getPhoneNumber());
                preparedStatement.setString(10, cs.getMobileNumber());
                preparedStatement.setString(11, cs.getFax());
                preparedStatement.setString(12, cs.getWebsiteUrl());
                preparedStatement.setString(13, cs.getCompanyID());
            } else {
                // Insert new record
                String insertQuery = "INSERT INTO company_settings (CompanyName, ContactPerson, Address, "
                        + "Country, City, State, PostalCode, Email, PhoneNumber, "
                        + "MobileNumber, Fax, WebsiteUrl, CompanyID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, cs.getCompanyName());
                preparedStatement.setString(2, cs.getContactPerson());
                preparedStatement.setString(3, cs.getAddress());
                preparedStatement.setString(4, cs.getCountry());
                preparedStatement.setString(5, cs.getCity());
                preparedStatement.setString(6, cs.getState());
                preparedStatement.setString(7, cs.getPostalCode());
                preparedStatement.setString(8, cs.getEmail());
                preparedStatement.setString(9, cs.getPhoneNumber());
                preparedStatement.setString(10, cs.getMobileNumber());
                preparedStatement.setString(11, cs.getFax());
                preparedStatement.setString(12, cs.getWebsiteUrl());
                preparedStatement.setString(13, cs.getCompanyID());
            }

            // Execute the query
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Close database resources (connection, statement)
                preparedStatement.close();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    private static int getCompanyCount() throws SQLException {
        Connection connection = DBUtil.provideConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM company_settings");
        ResultSet resultSet = preparedStatement.executeQuery();

        int count = 0;
        if (resultSet.next()) {
            count = resultSet.getInt(1);
        }

        // Close database resources (connection, statement, result set)
        resultSet.close();
        preparedStatement.close();
        connection.close();

        return count;
    }
}