package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddRolesBean;
import com.weblabs.utility.DBUtil;



public class RolesDAO {
    public static List<AddRolesBean> getFilteredRoles(String whereClause, int start, int limit) {
        List<AddRolesBean> filteredRoles = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT RoleID, RoleName, Description FROM roles WHERE " + whereClause + " LIMIT ?, ?;";
            } else {
                query = "SELECT RoleID, RoleName, Description FROM roles LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddRolesBean role = new AddRolesBean();
                role.setRoleID(resultSet.getString("RoleID"));
                role.setRoleName(resultSet.getString("RoleName"));
                role.setDescription(resultSet.getString("Description"));
                
                filteredRoles.add(role);
            }
        } catch (Exception e) {
            // Handle exceptions
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

        return filteredRoles;
    }

    public static int totalCount() {
        int count = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT COUNT(*) AS count FROM roles";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return count;
    }

    public static List<AddRolesBean> getAllRoles() {
        List<AddRolesBean> allRoles = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT RoleID, RoleName, Description FROM roles";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddRolesBean role = new AddRolesBean();
                role.setRoleID(resultSet.getString("RoleID"));
                role.setRoleName(resultSet.getString("RoleName"));
                role.setDescription(resultSet.getString("Description"));

                allRoles.add(role);
            }
        } catch (Exception e) {
            // Handle exceptions
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

        return allRoles;
    }
}
