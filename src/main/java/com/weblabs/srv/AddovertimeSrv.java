package com.weblabs.srv;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddOverTimeImpl;

@WebServlet("/AddovertimeSrv")
public class AddovertimeSrv extends HttpServlet{

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

        String status = "Add Department Failed!";
        String Employee_Id = request.getParameter("Employee_Id");
        String OverTime_Date = request.getParameter("OverTime_Date");
        String Hours = request.getParameter("Hours");
        String Type = request.getParameter("Type");
        String Description = request.getParameter("Description");
        
     
        AddOverTimeImpl overtime =new AddOverTimeImpl();
        status=overtime.addovertime(Employee_Id,OverTime_Date,Hours,Type,Description);
        
    		  
    		   RequestDispatcher rd = request.getRequestDispatcher("add_overtime.jsp?message=" + status);
       rd.forward(request, response);
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
	


