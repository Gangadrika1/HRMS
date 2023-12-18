
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AssetsBean;
import com.weblabs.utility.DBUtil;

public class AssetDAO {
    public static List<AssetsBean> getFilteredAssets(String whereClause, int start, int limit) {
        List<AssetsBean> filteredassets = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
       
        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT Id, assetName, PurchaseDate, supplierID, Manufacturer, Model, Status,  AssetCondition, Warranty, Price, AssetUser, Description  from assets WHERE " + whereClause + " LIMIT ? , ?;";
               
            } else {
                query = "SELECT Id,assetName, PurchaseDate, supplierID, Manufacturer, Model, Status,  AssetCondition, Warranty, Price, AssetUser, Description FROM assets LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit );
     
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
            	AssetsBean assets = new AssetsBean();
            	assets.setId(resultSet.getString("Id"));
                
            	assets.setAssetName(resultSet.getString("assetName"));
            	assets.setPurchaseDate(resultSet.getString("PurchaseDate"));
            	assets.setSupplierID(resultSet.getString("supplierID"));
            	assets.setManufacturer(resultSet.getString("Manufacturer"));
            	assets.setModel(resultSet.getString("Model"));
            	assets.setStatus(resultSet.getString("Status"));
            	
            	assets.setAssetCondition(resultSet.getString("AssetCondition"));
            	assets.setWarranty(resultSet.getString("Warranty"));
            	assets.setPrice(resultSet.getString("Price"));
            	assets.setAssetUser(resultSet.getString("AssetUser"));
            	assets.setDescription(resultSet.getString("Description"));
            
            	filteredassets.add(assets);
            }
        } catch (Exception e) {
            // Handle exceptions
        	String status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            // Close database resources (connection, statement, result set)
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                // Handle exceptions
                e.printStackTrace();
            }
        }

        return filteredassets;
        
    } 
	
    
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from assets";
		 ps = connection.prepareStatement(query);
		 rs = ps.executeQuery();
		 while (rs.next()) {
		 count = rs.getInt("count");
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 } finally {
		 try {
			 connection.close();
		 } catch (SQLException ex) {
		 ex.printStackTrace();
		 }
		 }
		 return count;
		 }



   
}
