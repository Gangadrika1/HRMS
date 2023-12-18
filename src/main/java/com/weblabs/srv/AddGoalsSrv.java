package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddGoalsServiceImp;


@WebServlet("/AddGoalsSrv")
public class AddGoalsSrv extends HttpServlet{
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

        String status = "Add Training Failed!";
        String Type = request.getParameter("Type");
        String Subject = request.getParameter("Subject"); 
        String Target = request.getParameter("Target"); 
        String StartDate = request.getParameter("StartDate"); 
        String EndDate = request.getParameter("EndDate"); 
        String Description = request.getParameter("Description");
        String Status = request.getParameter("Status"); 
        String Progress=request.getParameter("Progress");
       
        AddGoalsServiceImp goals =new AddGoalsServiceImp();
        status = goals.addGoal(Type, Subject, Target, StartDate, EndDate, Description, Status, Progress);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_goals.jsp?message=" + status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
	
}
