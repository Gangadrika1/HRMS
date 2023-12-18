package com.weblabs.srv;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddPFImpl;

@WebServlet("/AddPFSrv")
public class AddPFSrv extends HttpServlet{

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

        String status = "Add pf Failed!";      
        String Employee_Id = request.getParameter("employeename");
        String pf = request.getParameter("pf");
        String employeesharea = request.getParameter("employeesharea");
        String organizationsharea = request.getParameter("organizationsharea");
        String employeesharep = request.getParameter("employeesharep");
        String organizationsharep = request.getParameter("organizationsharep");
        String department = request.getParameter("description");
        
     
        AddPFImpl pfu =new AddPFImpl();
        status=pfu.addpf(Employee_Id,pf,employeesharea,organizationsharea,employeesharep,organizationsharep, department);
        
    		  
    		   RequestDispatcher rd = request.getRequestDispatcher("add_pf.jsp?message=" + status);
       rd.forward(request, response);
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
	


