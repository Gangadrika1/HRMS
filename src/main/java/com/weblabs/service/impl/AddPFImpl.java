package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddPFService;
import com.weblabs.utility.DBUtil;


public class AddPFImpl implements AddPFService{
@Override
	public String addpf(String Employee_Id, String ProvidentFundType, String EmployeeShareAmount, String OrganizationShareAmount, String EmployeeSharePer, String OrganizationSharePer,String Description) {	
		String status = "pf Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO pf (ProvidentFundType,EmployeeShareAmount,OrganizationShareAmount,EmployeeSharePer,OrganizationSharePer,Description,Employee_Id) VALUES (?,?,?,?,?,?,?)");
           
            ps.setString(1, ProvidentFundType);
            ps.setString(2, EmployeeShareAmount);
            ps.setString(3, OrganizationShareAmount);
            ps.setString(4, EmployeeSharePer);
            ps.setString(5, OrganizationSharePer);
            ps.setString(6, Description);
            ps.setString(7, Employee_Id);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "pf Added Successfully!";
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
public String deletepf(String Id) {
	String status = "pf Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM pf WHERE ID = ?");
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
public String editpf(String Id, String Employee_Id, String ProvidentFundType, String EmployeeShareAmount,
		String OrganizationShareAmount, String EmployeeSharePer, String OrganizationSharePer, String Description) {
	String status = "pf Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE pf SET ProvidentFundType =?, EmployeeShareAmount =?, OrganizationShareAmount =?,EmployeeSharePer =?,OrganizationSharePer =?, Description =?,Employee_Id=? WHERE ID=?");  
 
        ps.setString(1, ProvidentFundType);
        ps.setString(2, EmployeeShareAmount);
        ps.setString(3, OrganizationShareAmount);
        ps.setString(4, EmployeeSharePer);
        ps.setString(5, OrganizationSharePer);
        ps.setString(6, Description);
        ps.setString(7, Employee_Id);
        ps.setString(8, Id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "pf Updated Successfully!";
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

