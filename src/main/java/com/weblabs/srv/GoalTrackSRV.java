package com.weblabs.srv;

import java.io.IOException;   
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddGoals;
import com.weblabs.service.impl.GoalsDao;


@WebServlet("/GoalTrackSRV")
public class GoalTrackSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String GoalTypeFilter = request.getParameter("GoalsType");
	        String idFilter = request.getParameter("GoalID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddGoals> goal;

	        if ((GoalTypeFilter != null && !GoalTypeFilter.isEmpty()) || (idFilter != null && !idFilter.isEmpty())) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 goal = GoalsDao.getFilteredAddGoals("GoalsType like '%" + GoalTypeFilter + "%' and GoalID = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		goal = GoalsDao.getFilteredAddGoals("GoalsType like '%" + GoalTypeFilter + "%' and GoalID = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		goal = GoalsDao.getFilteredAddGoals("", start, limit);
	        }

	      request.setAttribute("goal-tracking", goal);
	      request.setAttribute("search", "true");
	      request.setAttribute("goal", goal.size());
	      request.getRequestDispatcher("/goal-tracking.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}