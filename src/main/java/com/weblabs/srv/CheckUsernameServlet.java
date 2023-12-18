package com.weblabs.srv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.utility.DBUtil;


@WebServlet("/CheckUsernameServlet")
	 public class CheckUsernameServlet extends HttpServlet {
	      private static final long serialVersionUID = 1L;

	      protected void doPost(HttpServletRequest request, HttpServletResponse response)
	              throws ServletException, IOException {
	          String username = request.getParameter("username");
	          Connection conn = null;
	          PreparedStatement stmt = null;
	          ResultSet rs = null;

	          try {
	           
	              conn =DBUtil.provideConnection();

	              // Prepare the SQL statement
	              String sql = "SELECT 1 FROM clients where UserName=? ";
	              stmt = conn.prepareStatement(sql);
	              stmt.setString(1, username);

	              // Execute the query
	              rs = stmt.executeQuery();

	              // Check if the username already exists
	              if (rs.next() && rs.getInt(1) > 0) {
	                  // Username already exists
	                  response.getWriter().write("duplicate");
	              } else {
	                  // Username does not exist
	                  response.getWriter().write("not_duplicate");
	              }
	          } catch (Exception e) {
	              e.printStackTrace();
	              // Handle exceptions as needed
	          } finally {
	              // Close database resources
	              try {
	                  if (rs != null) rs.close();
	                  if (stmt != null) stmt.close();
	                  if (conn != null) conn.close();
	              } catch (Exception e) {
	                  e.printStackTrace();
	                  // Handle exceptions as needed
	              }
	          }
	      }
	  }

