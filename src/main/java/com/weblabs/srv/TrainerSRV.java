package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTrainers;
import com.weblabs.service.impl.AddTrainersDAO;

@WebServlet("/TrainerSRV")
public class TrainerSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String emailFilter = request.getParameter("email");
	        String idFilter = request.getParameter("TrainersID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddTrainers> expenses;
	        
	        

	        if (emailFilter != null && !emailFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = AddTrainersDAO.getFilteredAddTrainers("email like '%" + emailFilter + "%' or TrainersID = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = AddTrainersDAO.getFilteredAddTrainers("email like '%" + emailFilter + "%' and TrainersID = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = AddTrainersDAO.getFilteredAddTrainers("", start, limit);
	        }

	      request.setAttribute("trainers", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("trainer", expenses.size()); 
	      request.getRequestDispatcher("/trainers.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}