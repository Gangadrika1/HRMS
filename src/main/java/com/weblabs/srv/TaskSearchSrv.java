package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.TasksBean;
import com.weblabs.service.impl.InvoiceDAO;
import com.weblabs.service.impl.taskDAO;

@WebServlet("/TaskSearchSrv")
public class TaskSearchSrv extends HttpServlet{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		 
	        String idFilter = request.getParameter("task_id");
	  
	     
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");

			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	      
		
	      List<TasksBean> tasks;
	        
	  
	        if ( idFilter != null && !idFilter.isEmpty()) {

	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 tasks = taskDAO.getFilteredTask("task_id = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		tasks = taskDAO.getFilteredTask("task_id = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	        
	        		tasks = taskDAO.getFilteredTask("", start, limit);
	        }

	      request.setAttribute("tasks", tasks);
	      request.setAttribute("search", "true");
	      request.getRequestDispatcher("/tasks.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}