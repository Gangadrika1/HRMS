package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddTaxServiceImpl;

@WebServlet("/AddTaxSrv")
public class AddTaxSrv extends HttpServlet {

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

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

        String status1 = "Add tax Failed!";
 
        String taxname = request.getParameter("taxname"); 
        String taxper = request.getParameter("taxper");
        String status = request.getParameter("status");
       
        AddTaxServiceImpl t = new AddTaxServiceImpl();
       status =t.addtax(taxname,taxper,status);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_tax.jsp?message=" + status1);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
}