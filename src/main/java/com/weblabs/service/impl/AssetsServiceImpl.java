
package com.weblabs.service.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AssetsService;
import com.weblabs.utility.DBUtil;

public class AssetsServiceImpl implements AssetsService {
    public String addAssets(String assetName, String PurchaseDate, String supplierID,
    		String Manufacturer, String Model,
            String Status,  String AssetCondition, 
            String Warranty, String Price, String AssetUser,
            String Description) {
    	
    	
        
        String Status1 = "Trainer Adding Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(
                    "INSERT INTO assets (assetName, PurchaseDate, supplierID, Manufacturer, Model, Status,  AssetCondition, Warranty, Price, AssetUser, Description) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, assetName);
            ps.setString(2, PurchaseDate);
            ps.setString(3, supplierID);
            ps.setString(4, Manufacturer);
            ps.setString(5, Model);
            ps.setString(6, Status);
            ps.setString(7, AssetCondition);
            ps.setString(8, Warranty);
            ps.setString(9, Price);
            ps.setString(10, AssetUser);
            ps.setString(11, Description);
          
            int k = ps.executeUpdate();
            if (k > 0) {
                Status1 = "Assets Added Successfully!";
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
    public String deleteAssets(String id) {
        String status = "Asset delete Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("DELETE FROM assets WHERE id = ?");
            ps.setString(1, id);
            int k = ps.executeUpdate();
            if (k > 0) {
                status = "Asset deleted Successfully!";
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

   
    public String updateAssets(String id,String assetName, String PurchaseDate, String supplierID, String Manufacturer, String Model,
            String Status,  String AssetCondition, String Warranty, String Price, String AssetUser,
            String Description) {
        String status = "Updating Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(
                    "UPDATE assets SET  assetName = ?, PurchaseDate = ?, supplierID= ?, Manufacturer = ?, Model = ?, Status = ?,  AssetCondition = ?, Warranty = ?, Price = ?, AssetUser = ?, Description = ?  WHERE id = ?");
    
             
			  ps.setString(1, assetName); 
			  ps.setString(2, PurchaseDate);
			  ps.setString(3,supplierID);
			  ps.setString(4, Manufacturer);
			  ps.setString(5, Model);
			  ps.setString(6, Status); 
			 
			  ps.setString(7,AssetCondition);
			  ps.setString(8, Warranty);
              ps.setString(9, Price);
			  ps.setString(10, AssetUser);
			  ps.setString(11, Description); 
			  ps.setString(12, id); 
			 
			 
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
	public String addAssets(String assetName, String PurchaseDate, String supplierID, String Manufacturer, String Model,
			String Status, String Supplier, String AssetCondition, String Warranty, String Price, String AssetUser,
			String Description, String DateTime) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateAssets(String id, String assetName, String PurchaseDate, String supplierID, String Manufacturer,
			String Model, String Status, String Supplier, String AssetCondition, String Warranty, String Price,
			String AssetUser, String Description, String DateTime) {
		// TODO Auto-generated method stub
		return null;
	}
}
