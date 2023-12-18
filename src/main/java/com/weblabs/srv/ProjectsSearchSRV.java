
package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.CreateProject;
import com.weblabs.service.impl.ProjectDAO;

@WebServlet("/ProjectsSearchSRV")
public class ProjectsSearchSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String ProjectnameFilter = request.getParameter("projectname");
	        String idFilter = request.getParameter("project_id");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<CreateProject> expenses;
	        
	        

	        if (ProjectnameFilter != null && !ProjectnameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = ProjectDAO.getFilteredProject("projectname like '%" + ProjectnameFilter + "%' or id = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = ProjectDAO.getFilteredProject("projectname like '%" + ProjectnameFilter + "%' or id = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = ProjectDAO.getFilteredProject("", start, limit);
	        }

	      request.setAttribute("projects", expenses);
	      request.setAttribute("search", "true");
	      request.getRequestDispatcher("/projects.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}