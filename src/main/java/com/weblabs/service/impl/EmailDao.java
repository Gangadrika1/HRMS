package com.weblabs.service.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.weblabs.utility.DBUtil;

public class EmailDao {
	public static int getFilteredEmail(String email) {
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (email != null && !email.isEmpty()) {
                query = "SELECT Email FROM employees WHERE Email='" + email +"'";
            } else {
                return 0;
            }

            preparedStatement = connection.prepareStatement(query);
            
            

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
            	return 1;
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

        return 0;
    }

public static void storeOTP(String email,String username,int otp) {
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query=null;
            if (username != null && !username.isEmpty()) {
//            	insert into hrms1.otpdetails (username,time,otp) values ("chintu",CURRENT_TIMESTAMP,"854796");
                query = "insert into  hrms1.otpdetails  (email,username,time,otp) values (?,?,CURRENT_TIMESTAMP,?)"  ;
            } 

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, username);
            preparedStatement.setInt(3, otp);
            

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("OTP details inserted successfully.");
            } else {
                System.out.println("Failed to insert OTP details.");
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

        
    }
public static boolean TimeOfOTP(int otp,String username) {
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = DBUtil.provideConnection();
        String query=null;
        if (username != null && !username.isEmpty()) {

            query = "select time from otpdetails where username= ? and otp= ?"  ;
        } 

        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setInt(2, otp);
        resultSet= preparedStatement.executeQuery();
        String dbTime=null;
        if (resultSet.next()) {
        	dbTime=resultSet.getString("time");
        }
        
     // Get the current time
        LocalDateTime currentTime = LocalDateTime.now();
        
        // Define the date-time formatter
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // Format the current time using the formatter
        String formattedTime = currentTime.format(formatter);
        LocalDateTime startTime = LocalDateTime.parse(dbTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        LocalDateTime endTime = LocalDateTime.parse(formattedTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // Calculate the duration between the two times
        Duration duration = Duration.between(startTime, endTime);

        // Check if the duration is less than or equal to 10 minutes (600 seconds)
        boolean isWithin10Minutes = duration.getSeconds() <= 600;

        // Print the result
        if (isWithin10Minutes) {
            
            return true;
        } else {
            
            return false;
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

    return false;
}
    
}
