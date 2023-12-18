package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTraining_Type;
import com.weblabs.service.impl.AddTraining_TypeDAO;


@WebServlet("/TrainingTypeSRV")
public class TrainingTypeSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String typeFilter = request.getParameter("type");
	        String idFilter = request.getParameter("TrainingTypeID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddTraining_Type> expenses;
	        
	        

	        if (typeFilter != null && !typeFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = AddTraining_TypeDAO.getFilteredAddTrainingtype("type like '%" + typeFilter + "%' and TrainingTypeID = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = AddTraining_TypeDAO.getFilteredAddTrainingtype("type like '%" + typeFilter + "%' and TrainingTypeID = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = AddTraining_TypeDAO.getFilteredAddTrainingtype("", start, limit);
	        }

	      request.setAttribute("expenses", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("expenses", expenses.size());
	      request.getRequestDispatcher("/training-type.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}