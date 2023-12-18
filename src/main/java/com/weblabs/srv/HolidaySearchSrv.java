package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.HolidayBean;
import com.weblabs.service.impl.HolidayDAO;

@WebServlet("/HolidaySearchSrv")
public class HolidaySearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String holidaynameFilter = request.getParameter("holiday_name");
        String idFilter = request.getParameter("id");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<HolidayBean> holidays;
        
        

        if (holidaynameFilter != null && !holidaynameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	  holidays = HolidayDAO.getFilteredHolidays("username like '%" + holidaynameFilter + "%' and Id = '" + idFilter + "'", start, limit);
        	}
        	else {
        holidays = HolidayDAO.getFilteredHolidays("username like '%" + holidaynameFilter + "%' and Id = '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
         holidays = HolidayDAO.getFilteredHolidays("", start, limit);
        }

      request.setAttribute("holidays", holidays);
      request.setAttribute("search", "true");
      request.setAttribute("holiday", holidays.size());   
      
      // request.getRequestDispatcher("/employee.jsp").forward(request, response);
      RequestDispatcher rd = request.getRequestDispatcher("holidays.jsp");
      rd.forward(request, response);
    }
}
