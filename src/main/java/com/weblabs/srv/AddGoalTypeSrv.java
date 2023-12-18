package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddGoalTypeServiceImp;


@WebServlet("/AddGoalTypeSrv")
public class AddGoalTypeSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    	String status1 = "Add Training Failed!";
    	 String type = request.getParameter("Type");
         String description = request.getParameter("Description");
         String status = request.getParameter("Status");
    	
    	
    	AddGoalTypeServiceImp goals=new AddGoalTypeServiceImp();
        status1 = goals.addgt(type, description, status);
    
    	 RequestDispatcher rd = request.getRequestDispatcher("add_goaltype.jsp?message=" + status1);
    	 rd.forward(request, response);
    	 } 
    	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	     throws ServletException, IOException {

    	 doGet(request, response);
    	 }
}
