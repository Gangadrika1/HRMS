package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTraining;
import com.weblabs.service.impl.AddTrainingDAO;


@WebServlet("/TrainingSRV")
public class TrainingSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String itemnameFilter = request.getParameter("TrainingType");
	        String idFilter = request.getParameter("TainingID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddTraining> expenses;
	        
	        

	        if (itemnameFilter != null && !itemnameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = AddTrainingDAO.getFilteredAddTrainingtype("TrainingType like '%" + itemnameFilter + "%' and TainingID = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = AddTrainingDAO.getFilteredAddTrainingtype("TrainingType like '%" + itemnameFilter + "%' and TainingID = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = AddTrainingDAO.getFilteredAddTrainingtype("", start, limit);
	        }

	      request.setAttribute("expenses", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("expenses", expenses.size());  
	      request.getRequestDispatcher("/training.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}