

package com.weblabs.service.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.SupplierService;
import com.weblabs.utility.DBUtil;

public class SupplierServiceImpl implements SupplierService {
    @Override
    public String addsup(String supplierName,String productDetails) {
        String Status1 = " Adding Supplier Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(
                    "INSERT INTO supplier (supplierName, productDetails) VALUES (?,?)");
            ps.setString(1, supplierName);
            ps.setString(2, productDetails);
          
          
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
    public String deletesup(String supplierID) {
        String status = " delete Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("DELETE FROM supplier WHERE supplierID = ?");
            ps.setString(1, supplierID);
            int k = ps.executeUpdate();
            if (k > 0) {
                status = " deleted Successfully!";
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
    public String editsup(String supplierID,String supplierName,String productDetails) {
        String status = "Updating Failed!";
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(
                    "UPDATE supplier SET  supplierName = ?, productDetails = ?  WHERE supplierID = ?");
    

			  ps.setString(1, supplierName); 
			  ps.setString(2, productDetails);
			  ps.setString(3,supplierID);
			 
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
}
