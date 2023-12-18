package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTermination;
import com.weblabs.service.impl.TerminationDAO;

@WebServlet("/TerminationSearchSrv")
public class TerminationSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String terminatedempnameFilter = request.getParameter("terminatedemployee");
        String dateFilter = request.getParameter("terminationdate");

        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;

        List<AddTermination> terminations;

       
        if (terminatedempnameFilter != null && !terminatedempnameFilter.isEmpty() || dateFilter != null && !dateFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (dateFilter == null || dateFilter.isEmpty()) {
        		 int idFilterInt = 0;
        	 terminations = TerminationDAO.getFilteredTermination("terminatedemployee like '%" + terminatedempnameFilter + "%' and terminationdate = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        		terminations = TerminationDAO.getFilteredTermination("terminatedemployee like '%" + terminatedempnameFilter + "%' and terminationdate = '" + dateFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		terminations = TerminationDAO.getFilteredTermination("", start, limit);
        }

      request.setAttribute("terminations", terminations);
      request.setAttribute("search", "true");
      request.setAttribute("termination", terminations.size());  
      request.getRequestDispatcher("/termination.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}





















