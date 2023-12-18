/*
 * package com.weblabs.srv;
 * 
 * import java.io.IOException; import javax.servlet.RequestDispatcher; import
 * javax.servlet.ServletException; import javax.servlet.annotation.WebServlet;
 * import javax.servlet.http.HttpServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * com.weblabs.service.impl.AddTerminationServiceImpl;
 * 
 * @WebServlet("/AddTerminationSrv") public class AddTerminationSrv extends
 * HttpServlet {
 * 
 * private static final long serialVersionUID = 1L; //private static final
 * String addteam = null;
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * // HttpSession session = request.getSession(); // String userType = (String)
 * session.getAttribute("usertype"); // String userName = (String)
 * session.getAttribute("username"); // String password = (String)
 * session.getAttribute("password"); // // if (userType == null ||
 * !userType.equals("admin")) { //
 * response.sendRedirect("login.jsp?message=Access Denied!"); // } else if
 * (userName == null || password == null) { // response.
 * sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
 * // }
 * 
 * String status = "Add termination Failed!";
 * 
 * String terminatedemp = request.getParameter("terminatedemp"); String
 * terminationtype = request.getParameter("terminationtype"); String
 * termationdate = request.getParameter("termationdate"); String reason =
 * request.getParameter("reason"); String noticedate =
 * request.getParameter("noticedate");
 * 
 * AddTerminationServiceImpl t = new AddTerminationServiceImpl(); status
 * =t.addtermination(terminatedemp,terminationtype,termationdate,reason,
 * noticedate);
 * 
 * 
 * RequestDispatcher rd =
 * request.getRequestDispatcher("add_termination.jsp?message=" + status);
 * rd.forward(request, response); } protected void doPost(HttpServletRequest
 * request, HttpServletResponse response) throws ServletException, IOException {
 * 
 * doGet(request, response); } }
 */




package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddTerminationServiceImpl;

@WebServlet("/AddTerminationSrv")
public class AddTerminationSrv extends HttpServlet {

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Add termination Failed!";
		/* String id = request.getParameter("id"); */
        String terminatedemp = request.getParameter("terminatedemp");
        String terminationtype = request.getParameter("terminationtype");
        String termationdate = request.getParameter("termationdate");
        String reason = request.getParameter("reason");
        String noticedate = request.getParameter("noticedate");
       
        AddTerminationServiceImpl t = new AddTerminationServiceImpl();
        status = t.addtermination(terminatedemp, terminationtype, termationdate, reason, noticedate, noticedate);

        RequestDispatcher rd = request.getRequestDispatcher("termination.jsp?message=" + status);
        rd.forward(request, response);
    }
}

   

    