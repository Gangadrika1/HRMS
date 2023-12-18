package com.weblabs.srv;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.utility.DBUtil;

@WebServlet("/EmpLoginSrv")
public class EmpLoginSrv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
   
        if (validate(request, username, password)) {
            
            response.sendRedirect("index.jsp");
        } else {
            String errorMessage = "Invalid username or password";
            request.setAttribute("error", errorMessage);
            request.setAttribute("wrongusername", "true"); // Set wrongusername attribute
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }

    private boolean validate(HttpServletRequest request, String username, String password)  {
    	Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;
        try {
            String sql = "SELECT employees.Email, employees.UserName, designations.RoleID, employees.Employee_Id "
            		+ "FROM hrms.employees inner join hrms.designations on employees.designationid = designations.Designationid"
            		+ " WHERE Email=? AND Password=?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
            	
            	 HttpSession session = request.getSession();
				session.setAttribute("username",  result.getString("Username")  );
                session.setAttribute("Email", result.getString("email"));
                session.setAttribute("Employee_id", result.getString("Employee_id"));
                session.setAttribute("RoleID", result.getString("RoleID"));
                
                
            	 
                con.close();
                return true;
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("wrongpassword", "true"); // Set wrongpassword attribute
        } finally {
            // Rest of your code remains unchanged
        }

        return false;
    }
}