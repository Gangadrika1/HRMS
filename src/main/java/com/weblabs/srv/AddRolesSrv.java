package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.rolesServiceImpl;


@WebServlet("/AddRolesSrv")
public class AddRolesSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        HttpSession session = request.getSession();
//        String userType = (String) session.getAttribute("usertype");
//        String userName = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//
//        if (userType == null || !userType.equals("admin")) {
//            response.sendRedirect("login.jsp?message=Access Denied!");
//        } else if (userName == null || password == null) {
//            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//        }

        String status = "Add Role Failed!";
        String rolename = request.getParameter("rolename");
        String description = request.getParameter("description");
        
        
       
        rolesServiceImpl role =new rolesServiceImpl();
        status=role.addRole(rolename, description);
        
    		  
    		   RequestDispatcher rd = request.getRequestDispatcher("roles.jsp?message=" + status);
       rd.forward(request, response);
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}