package com.weblabs.srv;

import java.io.IOException; 
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddGoalsType;
import com.weblabs.service.impl.GoalsTypeDAO;


@WebServlet("/GoalTypeSRV")
public class GoalTypeSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String itemnameFilter = request.getParameter("GoalsType");
	        String idFilter = request.getParameter("GoalsTypeID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddGoalsType> expenses;
	        
	        

	        if (itemnameFilter != null && !itemnameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
		        	if (idFilter == null || idFilter.isEmpty()) {
		        	 int idFilterInt = 0;
		        	 expenses = GoalsTypeDAO.getFilteredAddGoalstype("GoalsType like '%" + itemnameFilter + "%' and GoalsTypeID = '" + idFilterInt + "'", start, limit);
		        	}
		        	else {
		        		expenses = GoalsTypeDAO.getFilteredAddGoalstype("GoalsType like '%" + itemnameFilter + "%' and GoalsTypeID = '" + idFilter + "'", start, limit);
		        	}
	        	} else {
	            // Retrieve all data
	        		expenses = GoalsTypeDAO.getFilteredAddGoalstype("", start, limit);
	        }

	      request.setAttribute("goal-type", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("expenses", expenses.size()); 
	      request.getRequestDispatcher("/goal-type.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	  
}
}