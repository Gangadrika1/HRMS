package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddGoals;
import com.weblabs.beans.AddTrainers;
import com.weblabs.service.impl.AddGoalsServiceImp;

@WebServlet("/EditGoalsSrv")
public class EditGoalsSrv extends HttpServlet{

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
    	String Type = request.getParameter("Type");
    	String Subject = request.getParameter("Subject");
    	String Target = request.getParameter("Target");
    	String StartDate = request.getParameter("StartDate");
    	String EndDate = request.getParameter("EndDate");
    	String Description =request.getParameter("Description");
    	String Status = request.getParameter("Status");
    	String Progress = request.getParameter("Progress");
    	
  
    	AddGoals goals = new AddGoals();
    	goals.setType(Type);
        goals.setSubject(Subject);
        goals.setTarget(Target);
        goals.setStartDate(StartDate);
        goals.setEndDate(EndDate);
        goals.setDescription(Description);
        goals.setStatus(Status);
        goals.setProgress(Progress);
        
    	AddGoalsServiceImp goal=new AddGoalsServiceImp();
    	String Statuss = goal.editGoal(id, Type, Subject, Target, StartDate, EndDate, Description, Status, Progress);
		
        RequestDispatcher rd = request.getRequestDispatcher("edit_goals.jsp?message=" + Statuss);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
}
}
