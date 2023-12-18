package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.UpdateLeaves;
import com.weblabs.service.impl.AddLeavesServiceImp;

@WebServlet("/UpdateLeave")
public class UpdateLeaveSrv extends HttpServlet{

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

    	
    	String id = request.getParameter("id");
    	String Employee = request.getParameter("Employee"); 
        String Starting_At = request.getParameter("starting_at");
        String Ending_On = request.getParameter("ends_on");
        String Days = request.getParameter("days_count");
        String Reason = request.getParameter("reason");
    	 
    	UpdateLeaves leave = new UpdateLeaves();
    	leave.setId(id);
    	leave.setEmployee(Employee);
    	leave.setStarting_At(Starting_At);
        leave.setEnding_On(Ending_On);  
        leave.setDays(Days);
        leave.setReason(Reason);    	


    	AddLeavesServiceImp leaves = new AddLeavesServiceImp();
    	String status= leaves.updateLeave(id, Employee, Starting_At, Ending_On, Days, Reason);
		
        RequestDispatcher rd = request.getRequestDispatcher("edit_leave.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
