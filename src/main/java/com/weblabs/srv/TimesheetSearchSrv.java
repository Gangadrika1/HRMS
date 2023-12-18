package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddTimesheet;
import com.weblabs.service.impl.TimeSheetDAO;

@WebServlet("/TimesheetSearchSrv")
public class TimesheetSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String projectFilter = request.getParameter("Project");
        String dateFilter = request.getParameter("Date");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddTimesheet> timesheets;
        
        

        if (projectFilter != null && !projectFilter.isEmpty() || dateFilter != null && !dateFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (dateFilter == null || dateFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	 timesheets = TimeSheetDAO.getFilteredTimesheets("Project like '%" + projectFilter + "%' and Date = '" + dateFilter + "'", start, limit);
        	}
        	else {
        		timesheets = TimeSheetDAO.getFilteredTimesheets("Project like '%" + projectFilter + "%' and Date = '" + dateFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		timesheets = TimeSheetDAO.getFilteredTimesheets("", start, limit);
        }

      request.setAttribute("timesheets", timesheets);
      request.setAttribute("search", "true");
      request.setAttribute("timesheet", timesheets.size());
      System.out.println(timesheets.size());
      request.getRequestDispatcher("/timesheet.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}
