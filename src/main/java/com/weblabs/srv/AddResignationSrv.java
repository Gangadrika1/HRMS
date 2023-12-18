package com.weblabs.srv;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddResignationServiceImpl;

@WebServlet("/AddResignationSrv")
public class AddResignationSrv extends HttpServlet{

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

        String status = "Add resigantion Failed!";
        String id = request.getParameter("id");
        String resigingemp = request.getParameter("resigingemp");
        String noticedate = request.getParameter("noticedate");
        String resignationdate = request.getParameter("termationdate");
        String reason = request.getParameter("reason");
       
        
     
        AddResignationServiceImpl reg =new AddResignationServiceImpl();
        status=reg.addresignation(id,resigingemp,noticedate,resignationdate,reason);
        
    		  
    		   RequestDispatcher rd = request.getRequestDispatcher("add_resignation.jsp?message=" + status);
       rd.forward(request, response);
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
	


