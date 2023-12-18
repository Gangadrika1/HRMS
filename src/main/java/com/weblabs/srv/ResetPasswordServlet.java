package com.weblabs.srv;

import java.io.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.weblabs.utility.DBUtil;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String newPassword = request.getParameter("newpassword");
	    String confirmPassword = request.getParameter("confirmpassword");
	    String error = "";
	    String msg = "";

	    // Validate whether the password and confirm password fields match
	    if (!newPassword.equals(confirmPassword)) {
	        error = "Passwords do not match.";
	        request.setAttribute("error", error);
	        request.getRequestDispatcher("reset_password.jsp").forward(request, response);
	    } else {
	        String status = "Updating Goals Failed!";
	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;
	        try {
	            ps = con.prepareStatement("UPDATE employees SET Password=? WHERE Email=?");
	            ps.setString(1, newPassword);
				ps.setString(2, email);
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "Password Change successful";
	            }
	        } catch (SQLException e) {
	            status = "Error: " + e.getMessage();
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }
	        // Assuming the reset is successful
	        msg = "Password reset successful.";
	        request.setAttribute("msg", msg);
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}

    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

