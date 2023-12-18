
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.RPService;
import com.weblabs.utility.DBUtil;

public class AddRPServiveImpl implements RPService {
	@Override
	public String addRP(String RoleID, String ModuleName, String FormName, String PermissionType) {
		String status = "RP Adding Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("INSERT INTO rolepermissions (RoleID, ModuleName, FormName, PermissionType) VALUES (?,?,?,?)");
			ps.setString(1, RoleID);
			ps.setString(2, ModuleName);
			ps.setString(3, FormName);
			ps.setString(4, PermissionType);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "RP Added Successfully!";
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
	public String deleteRP(String RolePermissionID) {
		String status = "RP delete Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("DELETE FROM rolepermissions WHERE RolePermissionID = ?");
			ps.setString(1, RolePermissionID);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "Role Permission deleted Successfully!";
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
	public String updateRP(String RolePermissionID,String RoleID, String ModuleName, String FormName, String PermissionType) {
		String status = "Updating Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(
					"UPDATE rolepermissions SET RoleID=?, ModuleName = ?, FormName = ?, PermissionType = ? WHERE RolePermissionID = ?");
			ps.setString(1, RoleID);
			ps.setString(2, ModuleName);
			ps.setString(3, FormName);
			ps.setString(4, PermissionType);
			ps.setString(5, RolePermissionID);

			

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
