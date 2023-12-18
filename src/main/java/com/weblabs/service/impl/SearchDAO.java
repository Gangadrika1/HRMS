
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.utility.DBUtil;

public class SearchDAO {
    public static List<Object> getFilteredData(String tablename, Class<?> ClassName, String whereClause, int start, int limit) {
        List<Object> filteredData = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
        	connection = DBUtil.provideConnection();
            
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT * FROM " + tablename + " WHERE " + whereClause + " LIMIT ? , ?;";
            } else {
                query = "SELECT * FROM " + tablename + " LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            ResultSetMetaData metaData = resultSet.getMetaData();

            while (resultSet.next()) {
                Object obj = ClassName.getDeclaredConstructor().newInstance();

                // Iterate through columns using ResultSetMetaData.
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    String columnName = metaData.getColumnName(i);
                    int columnType = metaData.getColumnType(i);

                    // Handle each column based on its data type (you can add more data types as needed).
                    if (columnType == java.sql.Types.INTEGER) {
                        int value = resultSet.getInt(i);
                        // Use reflection to set the property value in the object
                        ClassName.getMethod("set" + columnName.substring(0, 1).toUpperCase() + columnName.substring(1), int.class).invoke(obj, value);
                    } else if (columnType == java.sql.Types.VARCHAR) {
                        String value = resultSet.getString(i);
                        // Use reflection to set the property value in the object
                        ClassName.getMethod("set" + columnName.substring(0, 1).toUpperCase() + columnName.substring(1), String.class).invoke(obj, value);
					} 
                    
                    
                    
                    
                    // Add more data type checks as needed.
                }

                // Add the object to the list.
                filteredData.add(obj);
            }

            // Close the ResultSet, statement, and connection when done.
            resultSet.close();
            connection.close();
        } catch (SQLException | ReflectiveOperationException e) {
            e.printStackTrace();
        }

        return filteredData;
    }
}

