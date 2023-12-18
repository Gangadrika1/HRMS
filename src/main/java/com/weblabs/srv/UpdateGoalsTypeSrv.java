package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddGoalsType;
import com.weblabs.service.impl.AddGoalTypeServiceImp;

@WebServlet("/UpdateGoalsTypeSrv")
public class UpdateGoalsTypeSrv extends HttpServlet{

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
         String type = request.getParameter("Type");
         String description = request.getParameter("Description");
         String status = request.getParameter("Status");
    	
  
    	AddGoalsType goal=new AddGoalsType();
    	goal.setId(id);
    	goal.setType(type);
    	goal.setDescription(description);
    	goal.setStatus(status);
        
    	AddGoalTypeServiceImp goals= new AddGoalTypeServiceImp();
    	String Statuss = goals.editgt(id, type, description, status);
		
        RequestDispatcher rd = request.getRequestDispatcher("goal-type.jsp?message=" + Statuss);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
}
}
